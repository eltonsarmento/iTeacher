<?php
// ===================================================================
class CursosGlobal extends AdminModules {
	// ===============================================================
	public function __construct() {
		parent::__construct();
		$this->system->load->dao('cursos');
		$this->system->load->dao('configuracoesgerais');
		$this->system->load->dao('quiz');
		$this->system->load->dao('areas');
		$this->system->load->dao('professores');
		$this->system->load->dao('aulas');
		$this->system->load->dao('duvidas');
		$this->system->load->model('certificados_model');
	}
	// ===============================================================
	public function autoRun() {
		$this->system->view->assign('categorias', $this->system->admin->getCategoria());
		switch($this->system->input['do']) {
			case 'listar':
			case 'buscar': 			$this->doListar(); break;
			case 'novo':
			case 'editar': 			$this->doEdicao(); break;
			case 'apagar': 			$this->doDeletar(); break;
			case 'salvarServidor': 	$this->doSalvarServidor(); break;
			default: 				$this->pagina404(); break;
		}
	}
	// ===============================================================
	protected function doEdicao() {
		$id = intval($this->system->input['id']);
		$editar = intval($this->system->input['editar']);
		if ($this->system->session->getItem('session_nivel') == 3) 
			$this->system->input['professor_id'] = $this->system->session->getItem('session_cod_usuario');
		if ($editar) {
			$this->system->input['url'] = $this->system->func->stringToUrl($this->system->input['curso']);
			$erro_msg = $this->validarDados();
			if ($erro_msg) {				
				$this->system->view->assign('msg_alert', $erro_msg['msg']);
				$this->system->input['destaque_arquivo'] = $this->system->input['visualizar_destaque_arquivo'];
				$this->system->input['banner_arquivo'] = $this->system->input['visualizar_banner_arquivo'];
				$this->system->view->assign('curso', $this->system->input);
			} else {

				//Salvar
				if ($id) {
					$this->system->cursos->atualizar($this->system->input);
					$this->system->view->assign('msg_alert', 'Curso "' . $this->system->input['curso'] . '" editado com sucesso!');
				}else {
					$usuario = $this->system->usuarios->getUsuario($this->system->session->getItem('session_cod_usuario'));
					if($usuario['nivel'] == '7'){						
						$responsavel = $this->system->sistemas->getResponsavelSistema($this->system->getSistemaID());
						$this->system->email_model->cursoCadastradoParceiro($responsavel['email'],$this->system->input);						
					}
					$id = $this->system->cursos->cadastrar($this->system->input);
					$this->system->view->assign('msg_alert', 'Curso "' . $this->system->input['curso'] . '" cadastrado com sucesso!');
				}
				$this->system->cursos->cadastrarCapitulos($id, $this->system->input['qt_capitulos']);			
				//Img banner
				if (is_uploaded_file($_FILES['banner_arquivo']['tmp_name'])) {					
					$extensao = end(explode('.', $_FILES['banner_arquivo']['name']));
					$nomearquivo = 'curso_banner_' . $id . '.' . $extensao;
					if (file_exists($this->system->getUploadPath() . '/imagens/' . $nomearquivo))
						unlink($this->system->getUploadPath() . '/imagens/' . $nomearquivo);
					copy($_FILES['banner_arquivo']['tmp_name'], $this->system->getUploadPath() . '/imagens/' . $nomearquivo);
					$this->system->cursos->atualizarImagemBanner($id, $nomearquivo);
				}				
				//Img destaque
				if (is_uploaded_file($_FILES['destaque_arquivo']['tmp_name'])) {
					$extensao = end(explode('.', $_FILES['destaque_arquivo']['name']));
					$nomearquivo = 'curso_destaque_' . $id . '.' . $extensao;
					if (file_exists($this->system->getUploadPath() . '/imagens/' . $nomearquivo))
						unlink($this->system->getUploadPath() . '/imagens/' . $nomearquivo);
					copy($_FILES['destaque_arquivo']['tmp_name'], $this->system->getUploadPath() . '/imagens/' . $nomearquivo);
					$this->system->cursos->atualizarImagemDestaque($id, $nomearquivo);
				}
				$this->doListar();
				die;
			}
		}else {
			//Carregar conteudo
			if ($id) 
			    $this->system->view->assign('curso', $this->system->cursos->getCurso($id));
		}
		$areas = $this->system->areas->getAreasNiveis();
		if ($this->system->session->getItem('session_nivel') != 3)
			
		$professores = $this->system->professores->getProfessores();
		$this->system->view->assign('areas', $areas);
		$areasDoCurso = $this->system->cursos->getAreasByCurso($id);
		foreach ($areasDoCurso as $key => $areaItem) {
			$arrayIdAreasDoCurso[] = $areaItem['id'];
		}

		$this->system->view->assign('areas_opcoes', $this->areas($areas, $arrayIdAreasDoCurso));
		$this->system->view->assign('cursos', $this->system->cursos->getCursos());
		$this->system->view->assign('usuario_nivel', $this->system->session->getItem('session_nivel'));
		$this->system->view->assign('professores', $this->system->professores->getProfessores());
		$this->system->admin->topo('cursos','cursos-novo');
		$this->system->view->display('global/cursos_edicao.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	public function validarDados() {
		$retorno = array();
        if (!$this->system->input['curso']) 
            $retorno['msg'][] = "O campo de curso está vazio.";
        elseif (!$this->system->func->isUnique('cursos', 'url', $this->system->input['url'],  "and sistema_id = '".$this->system->getSistemaID() ."' and excluido = 0 " . ($this->system->input['id'] ? ' and id != ' . $this->system->input['id'] : '')))
        	$retorno['msg'][] = "Já existe um curso com esse nome, por favor usar outro, pois as urls são os nomes dos cursos.";
        if (!$this->system->input['tags']) 
            $retorno['msg'][] = "O campo de tags está vazio.";			
		// comentado, html não passa as areas
        if (count($this->system->input['areas']) == 0)
        		$retorno['msg'][] = "Escolha uma categoria.";
        if (!$this->system->input['gratuito'] && !$this->system->input['valor']) 
            $retorno['msg'][] = "Escolha um preço para o curso.";
        if ($this->system->input['dvd']  != '' && !isset($this->system->input['frete'])) 
            $retorno['msg'][] = "Escolha um tipo de frete.";
        if (!$this->system->input['descricao']) 
            $retorno['msg'][] = "O campo descrição precisa ser preenchido.";

        
		//if (!$this->system->input['requisito']) 
        //    $retorno['msg'][] = "O campo pré-requisito precisa ser preenchido.";
		
		//if (!$this->system->input['publico']) 
        //    $retorno['msg'][] = "O campo público alvo precisa ser preenchido.";
		
		//if (!$this->system->input['perfil']) 
        //    $retorno['msg'][] = "O campo perfil do aluno precisa ser preenchido.";
			
        if ($this->system->input['professor_id'] == 0) 
            $retorno['msg'][] = "O campo professor precisa ser preenchido.";
			
        if(!$this->system->input['qt_capitulos']) 
			$this->system->input['qt_capitulos'] = 1;
		if (!$this->system->func->isInt($this->system->input['carga_horaria']))
			$retorno['msg'][] = "O campo carga horária deve ser inteiro.";
		if ($this->system->input['id']) {
			if (!$this->system->cursos->validarMudancaCapitulos($this->system->input['id'], $this->system->input['qt_capitulos']))
				$retorno['msg'][] = "Não é possivel reduzir o numero de capítulos. Existe capitulos com aula.";
		}
		if ($this->system->input['frete'] == 2 && !$this->system->input['valor_frete']) 
			$retorno['msg'][] = "Escolha um preço para o frete.";

		//Banner
		if (is_uploaded_file($_FILES['banner_arquivo']['tmp_name'])) {
			$extensao = end(explode('.', $_FILES['banner_arquivo']['name']));
			if (!in_array($extensao, array('jpg', 'gif', 'png'))) {				
				$retorno['msg'][] = 'Formato de Imagem do Banner inválido';
			}
		}
		//Arquivo destaque
		if (is_uploaded_file($_FILES['destaque_arquivo']['tmp_name'])) {
			$extensao = end(explode('.', $_FILES['destaque_arquivo']['name']));
			if (!in_array($extensao, array('jpg', 'gif', 'png'))) {				
				$retorno['msg'][] = 'Formato de Imagem de Destaque inválido';
			}
		}

		if (count($retorno))
			$retorno['msg'] = implode("<br/>",$retorno['msg']);
        return $retorno;
	}
	// ===============================================================
	protected function doListar() {
		$palavra = $this->system->input['palavra_busca'];
		if ($palavra)
			$sql = " AND curso like '".$palavra."%' ";
		$cursos = $this->system->cursos->getCursosCondicao($sistema_id,$sql);

		foreach ($cursos as $key => $curso) {
			//Professor
			$professor = $this->system->professores->getProfessor($curso['professor_id']);
			$cursos[$key]['professor'] = $professor['nome'];	
			//Categorias
			$categorias = $this->system->cursos->getAreasByCurso($curso['id']);
			$cursos[$key]['categorias'] = $categorias;
			//Alunos
			$cursos[$key]['alunos'] = $this->system->cursos->getTotalAlunos($curso['id']);
			//Quiz
			$cursos[$key]['qt_quiz'] = $this->system->quiz->getTotalQuiz($curso['id']);
		}
		$this->system->view->assign('usuario_nivel', $this->system->session->getItem('session_nivel'));
		$this->system->view->assign('cursos', $cursos);
		$this->system->view->assign('url_site', $this->system->getUrlSite());
		$this->system->admin->topo('cursos','cursos-listar');
		$this->system->view->display('global/cursos_gerenciar.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function doDeletar() {
		$id = intval($this->system->input['id']);
		//Checa acesso do parceiro
		if ($this->system->session->getItem('session_nivel') == 7 && $id) 
			$this->acessoParceiro($id);
		if ($id) {
			$curso = $this->system->cursos->getCurso($id);
			$alunos = $this->system->cursos->getTotalAlunos($curso['id']);
			if($curso['id'] && in_array($this->system->session->getItem('session_nivel'), array(1, 2, 7)) && $alunos['total'] == 0) {
				$this->system->cursos->deletar($id);
				$this->system->view->assign('msg_alert', 'Curso "' . $curso['curso'] . '" excluído com sucesso!');
			} 
			else {
				$this->system->view->assign('msg_alert', 'Não foi possível excluir esse curso!');	
			}
		}
		$this->doListar();
	}
	//===============================================================
	protected function doSalvarServidor() {
		$curso_id = $this->system->input['curso_id'];
		$servidor = $this->system->input['servidor'];
		$posicao = $this->system->input['posicao'];
		$editar = $this->system->input['editar'];
		if ($editar && $curso_id) {
			$this->system->cursos->salvarServidor($curso_id, $servidor);
			echo "Servidor atualizado com sucesso";
			echo "<script type='text/javascript'>jQuery('#servidor_" . $posicao . "').val('" . $servidor . "')</script>";
		}
	}
	// ==============================================================
	protected function acessoParceiro($cursoID) {
		// Parceiro
		if ($this->system->session->getItem('session_nivel') == 7) {
			$curso = $this->system->curso->getCurso($cursoID);
			//Curso não cadastrado pelo parceiro OU curso liberado para exibir na home 
			if ($curso['usuario_id'] != $this->system->session->getItem('session_cod_usuario') || $curso['home'] == 1) {
				$this->system->func->redirecionar('/curso/listar');
				exit();
			}	
		}
	}
	// ===============================================================
	private function areas($areas, $areasDoCurso) {
		$html = '';
		foreach ($areas as $area) {
	    	    $html .= '<label class="label_check"  id_secundario="'. $area['id'] .'"  id="label-' . $area['id'] . '" for="checkbox-' . $area['id'] . '"><input class="checkbox-area"  type="checkbox" id="checkbox-' . $area['id'] . '" name="areas[]" value="' . $area['id'] . '" ' . ($areasDoCurso ? (in_array($area['id'], $areasDoCurso) ? 'checked="checked"' : '') : '' ). '/> ' . $area['area'] . '</label>';
	    	    $html .= $this->areasFilhas($area['filhas'], $areasDoCurso);
		}
	        	return $html;
        //onclick="mudaStatus('.$area['id'].');"
	}

	private function areasFilhas($areas, $areasDoCurso) {
		$html = '';
		foreach ($areas as $area) {
	    	    $html .= '<label class="label_check" id_secundario="'. $area['id'] .'" id="label_sub" for="checkbox-' . $area['id'] . '"><input class="checkbox-area"  type="checkbox" id="checkbox-' . $area['id'] . '" name="areas[]" value="' . $area['id'] . '" ' . ($areasDoCurso ? (in_array($area['id'], $areasDoCurso) ? 'checked="checked"' : '') : '' ). '/> ' . $area['area'] . '</label>';
	    	    $html .= $this->areasNetas($area['filhas'], $areasDoCurso);
		}		
	        	return $html;
	}

	private function areasNetas($areas, $areasDoCurso) {
		$html = '';
		foreach ($areas as $area) {
	    	    $html .= '<label class="label_check" id_secundario="'. $area['id'] .'" id="label_neto" for="checkbox-' . $area['id'] . '"><input class="checkbox-area"  type="checkbox" id="checkbox-' . $area['id'] . '" name="areas[]" value="' . $area['id'] . '" ' . ($areasDoCurso ?  (in_array($area['id'], $areasDoCurso) ? 'checked="checked"' : '')  : '' ). '/> ' . $area['area'] . '</label>';
	    	    $html .= $this->areas($area['filhas'], $areasDoCurso);
		}
		
	        	return $html;
	}
}
// ===================================================================