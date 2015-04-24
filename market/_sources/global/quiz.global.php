<?php
// ===================================================================
class QuizGlobal extends AdminModules{
	// ===============================================================
	public function __construct(&$system) {
		$this->system = $system;
		$this->system->load->dao('cursos');
		$this->system->load->dao('quiz');
		$this->system->load->dao('aulas');
		$this->system->load->dao('professores');
		$this->system->load->dao('areas');
	}
	// ===============================================================
	public function autoRun() {
		$this->system->view->assign('categoria', $this->system->admin->getCategoria());
		switch($this->system->input['do']) {
			case 'novo': 		 		$this->doNovo(); break;
			case 'editar': 		 		$this->doEdicao(); break;
			case 'aulas': 		 		$this->doBuscarAulas(); break;
			case 'listar': 		 		$this->doListar(); break;
			case 'apagar':  	 		$this->doDeletar(); break;
			case 'listarCursos': 		$this->doListarCursos(); break;
			case 'detalhar': 	 		$this->doDetalhar(); break;
			default: 					$this->pagina404(); break;
		}
		
	}
	// ===============================================================
	protected function doNovo() {
		$this->system->input['curso_id'] = $this->system->input['id'];
		$this->system->input['id'] = 0;
		$this->doEdicao();
	}
	// ===============================================================
	protected function doEdicao() {
		$id = intval($this->system->input['id']);
		$curso_id = intval($this->system->input['curso_id']);
		if (!$curso_id && !$id) 
			$this->system->func->redirecionar('/cursos/listar');
		$editar = intval($this->system->input['editar']);
		if ($editar) {
			//Verifica
			$erro_msg = $this->validarDados();
			if ($erro_msg) {
				$quiz = $this->system->input;
				$this->system->view->assign('msg_alert', $erro_msg['msg']);
				$this->system->view->assign('quiz', $quiz);
			}
			else {
				//Salvar
				if ($id) {
					$this->system->quiz->atualizar($this->system->input);
					$this->system->view->assign('msg_alert', 'Quiz atualizado com sucesso!');
				}
				else {
					$id = $this->system->quiz->cadastrar($this->system->input);
					$this->system->view->assign('msg_alert', 'Quiz cadastrado com sucesso!');
				}
				if ($this->system->input['nova']) 
					$this->system->func->redirecionar('/quiz/novo/' . $curso_id);
				else 
					$this->system->func->redirecionar('/quiz/listar/' . $curso_id);
			}
		} 
		else {
			//Carregar conteudo
			if ($id) {
				$quiz = $this->system->quiz->getQuiz($id);
				$curso_id = $quiz['curso_id'];
			    $this->system->view->assign('quiz', $quiz);
			} 
			else {
				$this->system->view->assign('quiz', array('curso_id' => $curso_id ));
			}
		}
		$curso = $this->system->cursos->getCurso($curso_id);
		//Chega acesso do parceiro
		if ($this->system->session->getItem('session_nivel') == 7 && $curso['id']) 
			$this->acessoParceiro($curso['id']);
		$this->system->view->assign('curso', strtoupper ($curso['curso']));
		$this->system->view->assign('capitulos', $this->system->cursos->getCapitulos($curso_id));
		if ($quiz['capitulo_id'])
			$this->system->view->assign('aulas', $this->system->aulas->getAulasByCapitulo($quiz['capitulo_id']));
		$this->system->admin->topo();
		$this->system->view->display('global/quiz_edicao.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	public function validarDados() {
		$retorno = array();
        if (!$this->system->input['pergunta']) 
            $retorno['msg'][] = "O campo de pergunta está vazio.";
        if (!$this->system->input['alternativa_correta']) 
        	$retorno['msg'][] = "É necessário uma alternativa correta.";
        else {
        	if(empty($this->system->input['alternativa'][$this->system->input['alternativa_correta']]))
        		$retorno['msg'][] = "Alternativa correta selecionada está vazia.";
        }
        if (!$this->system->input['curso_id']) 
        	$retorno['msg'][] = "É necessário existe um curso vinculado.";
		if (!$this->system->input['capitulo_id'])
			$retorno['msg'][] = "É necessário selecionar um capítulo.";
        if (!$this->system->input['aula_id'])
        	$retorno['msg'][] = "É necessário selecionar uma aula.";		
		if(count($retorno)>0){
		   $retorno['msg'] = implode("<br/>",$retorno['msg']);
		}
        return $retorno;
	}
	// ===============================================================
	protected function doBuscarAulas() {
		$capitulo_id = $this->system->input['capitulo_id'];
		if ($capitulo_id) {
			$aulas = $this->system->aulas->getAulasByCapitulo($capitulo_id);
			echo '<option value="0" selected>Selecione a aula</option>';
			foreach ($aulas as $aula) 
				echo '<option value="' . $aula['aula_id'] . '">Aula ' . $aula['posicao'] . ' - ' . $aula['nome'] . '</option>';
			
		}
	}
	// ===============================================================
	protected function doListar() {
		$id_curso = intval($this->system->input['id']);
		if ($this->system->session->getItem('session_nivel') == 7 && $id_curso) 
			$this->acessoParceiro($id_curso);
		$quizzes = $this->system->quiz->getQuizzes($id_curso);
		$curso = $this->system->cursos->getCurso($id_curso);
		$this->system->view->assign('curso', $curso);
		$this->system->view->assign('quizzes', $quizzes);
		$this->system->view->assign('url_site', $this->system->getUrlSite());
		$this->system->admin->topo();
		$this->system->view->display('global/quizzes_gerenciar.tpl');
		$this->system->admin->rodape();
	}
	// ==============================================================
	protected function doDetalhar() {
		$id = $this->system->input['id'];
		//$quizzes = $this->system->quiz->getDetalheQuizzes($id);
		$quizzes = $this->system->quiz->getQuiz($id);
		echo "[".json_encode($quizzes)."]";
	}
	// ===============================================================
	protected function doDeletar() {
		$id = intval($this->system->input['id']);
		if ($id) {
			$quiz = $this->system->quiz->getQuiz($id);
			if ($this->system->session->getItem('session_nivel') == 7 && $quiz['curso_id']) 
				$this->acessoParceiro($quiz['curso_id']);
			$this->system->input['id'] = $quiz['curso_id'];
			$this->system->quiz->deletar($id);
		}
		$this->system->view->assign('msg_alert','Excluído com sucesso!');
		$this->doListar();
	}
	// ===============================================================
	protected function doListarCursos() {}
	// ==============================================================
	protected function acessoParceiro($cursoID) {
		// Parceiro
		if ($this->system->session->getItem('session_nivel') == 7) {
			$curso = $this->system->cursos->getCurso($cursoID);
			//Curso não cadastrado pelo parceiro OU curso liberado para exibir na home 
			if ($curso['usuario_id'] != $this->system->session->getItem('session_cod_usuario')) {
				$this->system->func->redirecionar('/cursos/listar');
				exit();
			}	
		}
	}
}
// ===================================================================