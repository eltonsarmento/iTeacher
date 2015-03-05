<?php
// ===================================================================
class Coordenadores extends AdminModules {
	protected $mostrar = 2;
	// ===============================================================
	public function __construct() {
		parent::__construct();
		$this->system->load->dao('coordenadores');
		$this->system->load->dao('paginas');
		$this->system->load->model('email_model');
	}
	// ===============================================================
	public function autoRun() {
    	switch($this->system->input['do']) {
			case 'listar':
			case 'buscar':						$this->doListar(); 	break;
			case 'novo':
			case 'editar': 						$this->doEdicao(); 	break;
			case 'apagar': 						$this->doDeletar(); break;
			case 'visualizar': 					$this->doVisualizar(); break;
			case 'alunos':						$this->doVisualizarAlunosByCurso(); break;
			case 'editarnavisualizacao': 		$this->doEditarNaVisualizacao(); break;
			default: 							$this->pagina404(); break;
		}
	}
	// ===============================================================
	protected function doListar($view = 'instituicao/listar_coordenadores.tpl') {		
		$this->listagem();
		$this->system->admin->topo('coordenadores', 'coordenadores-listar');
		$this->system->view->display($view);
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function listagem() {
		$coordenadores = $this->system->coordenadores->getCoordenadores($palavra, 'padrao');
		foreach ($coordenadores as $key => $coordenador) {
			$coordenadores[$key]['cep'] = $this->system->coordenadores->getValorExtra($coordenador['id'], 'cep');
			$coordenadores[$key]['endereco'] = $this->system->coordenadores->getValorExtra($coordenador['id'], 'endereco');
			$coordenadores[$key]['bairro'] = $this->system->coordenadores->getValorExtra($coordenador['id'], 'bairro');
			$coordenadores[$key]['cidade'] = $this->system->coordenadores->getValorExtra($coordenador['id'], 'cidade');
			$coordenadores[$key]['estado'] = $this->system->coordenadores->getValorExtra($coordenador['id'], 'estado');
			$coordenadores[$key]['cpf'] = $this->system->coordenadores->getValorExtra($coordenador['id'], 'cpf');
			$coordenadores[$key]['telefone'] = $this->system->coordenadores->getValorExtra($coordenador['id'], 'telefone');
		}
		$this->system->view->assign('coordenadores', $coordenadores);
		$this->system->view->assign('paginacao', $paginacao);
		$this->system->view->assign('palavra_busca', $palavra);
		$this->system->view->assign('url_site', $this->system->getUrlSite());
	}
	// ===============================================================
	protected function doEdicao() {
		$id = intval($this->system->input['id']);
		$editarDados = intval($this->system->input['editarDados']);
		$editarSenhaFoto = intval($this->system->input['editarFotoSenha']);
		$salvar = intval($this->system->input['salvar']);
		if($id){
			if ($editarDados) {
				$this->system->coordenadores->atualizarDados($this->system->input);
				$this->system->view->assign('msg_alert', 'Coordenador atualizado com sucesso!');
			} 
			elseif ($editarSenhaFoto) {
				if ($_FILES['avatar']) {
					if (is_uploaded_file($_FILES['avatar']['tmp_name'])) {
						$extensao = end(explode('.', $_FILES['avatar']['name']));
						$nomearquivo = 'avatar_' . $id . '.' . $extensao;
						if (file_exists($this->system->getUploadPath() . '/avatar/' . $nomearquivo))
							unlink($this->system->getUploadPath() . '/avatar/' . $nomearquivo);
						copy($_FILES['avatar']['tmp_name'], $this->system->getUploadPath() . '/avatar/' . $nomearquivo);
						$this->system->coordenadores->atualizarImagem($id, $nomearquivo);
					}
				}					
				$this->system->coordenadores->atualizarSenha($id, $this->system->input['senha']);
				$this->system->view->assign('msg_alert', 'Coordenador atualizado com sucesso!');
			}		
			$this->system->view->assign('coordenador', $this->system->coordenadores->getCoordenador($id, true));
			$this->system->admin->topo('coordenadores');
			$this->system->view->display('instituicao/editar_coordenador.tpl');
			$this->system->admin->rodape();
			
		}
		else {
			if ($salvar) {
				$erro_msg = $this->validarDados();
				if ($erro_msg) {
					$this->system->view->assign('msg_alert', $erro_msg['msg']);
					$this->system->view->assign('coordenador', $this->system->input);
				} else {
					$id = $this->system->coordenadores->cadastrar($this->system->input);
					$this->system->view->assign('msg_alert', 'Coordenador cadastrado com sucesso!');

					//Email
					//$this->system->email_model->cadastroAluno($this->system->input['email'], $this->system->input['nome'], $this->system->input['senha']);
					//Img avatar
					if (is_uploaded_file($_FILES['avatar']['tmp_name'])) {
						$extensao = end(explode('.', $_FILES['avatar']['name']));
						$nomearquivo = 'avatar_' . $id . '.' . $extensao;

						if (file_exists($this->system->getUploadPath() . '/avatar/' . $nomearquivo))
							unlink($this->system->getUploadPath() . '/avatar/' . $nomearquivo);
						copy($_FILES['avatar']['tmp_name'], $this->system->getUploadPath() . '/avatar/' . $nomearquivo);
						$this->system->coordenadores->atualizarImagem($id, $nomearquivo);
					}
					if ($this->system->input['nova'])
						$this->system->func->redirecionar('/coordenadores/novo');
					else
						$this->system->func->redirecionar('/coordenadores/listar');
					$this->doListar();
					die;
				}
			} else {
				if ($id) 
					$this->system->view->assign('coordenador', $this->system->coordenadores->getCoordenador($id, true));
			}
			$this->system->admin->topo('coordenadores','coordenadores-novo');
			$this->system->view->display('instituicao/novo_coordenador.tpl');
			$this->system->admin->rodape();
		}
	}
	// ===============================================================
	protected function validarDados() {
		$retorno = array();
        //Nome
        if($this->system->input['nome'] == '') 
            $retorno['msg'][] = "O campo nome está vázio.";
        //Email
        if ($this->system->input['email'] == '')
        	$retorno['msg'][] = "O campo E-mail está vázio";
        elseif (!$this->system->func->checkEmail($this->system->input['email']))
        	$retorno['msg'][] = "O campo E-mail é inválido";
        elseif ($this->system->alunos->checkEmailCadastrado($this->system->input['id'], $this->system->input['email'], $this->system->getSistemaID()))
        	$retorno['msg'][] = "Já existe um usuário cadastrado com esse e-mail";	
       //CPF
        if ($this->system->input['cpf'] != '' && !$this->system->func->validaCPF($this->system->input['cpf']))
        	$retorno['msg'][] = "O campo CPF é inválido.";
        //CEP
        if ($this->system->input['cep'] == '')
        	$retorno['msg'][] = "O campo CEP está vázio";
        //Endereço
        if ($this->system->input['endereco'] == '')
        	$retorno['msg'][] = "O campo Endereço está vázio";
        //Bairro
        if ($this->system->input['bairro'] == '')
        	$retorno['msg'][] = "O campo Bairro está vázio";	
        //Cidade
        if ($this->system->input['cidade'] == '')
        	$retorno['msg'][] = "O campo Cidade está vázio";
        //Estado
        if ($this->system->input['estado'] == '')
        	$retorno['msg'][] = "O campo Estado está vázio";
        //Senha
        if ($this->system->input['id'] == '') {        	
	        if ($this->system->input['senha'] == '')
	        	$retorno['msg'][] = "O campo Senha está vázio";
	        elseif (strlen($this->system->input['senha']) < 5)
	        	$retorno['msg'][] = "O campo Senha deve ter pelo menos 5 digitos.";
			if ($this->system->input['senha2'] == '')
	        	$retorno['msg'][] = "O campo Confirme a Senha está vázio";
	        elseif (strlen($this->system->input['senha2']) < 5)
	        	$retorno['msg'][] = "O campo Confirme a Senha deve ter pelo menos 5 digitos.";
	        if($this->system->input['senha'] != $this->system->input['senha2'])
	        	$retorno['msg'][] = "Os campos Senha e Confirme a Senha não estão iguais.";
	    }
	    //Senha Atualizar
        if ($this->system->input['id'] != '') {
        	if (($this->system->input['senha'] != '') && ($this->system->input['senha2'] != '')) {
	        	if (strlen($this->system->input['senha']) < 5)
	        		$retorno['msg'][] = "O campo Senha deve ter pelo menos 5 digitos.";
	        	if (strlen($this->system->input['senha2']) < 5)
	        		$retorno['msg'][] = "O campo Confirme a Senha deve ter pelo menos 5 digitos.";	      	
	        	if($this->system->input['senha'] != $this->system->input['senha2'])
	        		$retorno['msg'][] = "Os campos Senha e Confirme a Senha não estão iguais.";
	    	}
		}
		//Arquivo destaque
		if (is_uploaded_file($_FILES['avatar']['tmp_name'])) {
			$extensao = end(explode('.', $_FILES['avatar']['name']));
			if (in_array($extensao, array('jpg', 'gif', 'png'))) {
				//ainda não existe esses campos abaixo no banco de dados
				/*$configPerfil = $this->system->configuracoesgerais->getImagensPerfil();
				if (($_FILES['avatar']['size'] / 1024) > $configPerfil['imagem_perfil_tamanho']) {
					$retorno['msg'][] = 'A Imagem do destaque está com mais de ' . $configPerfil['imagem_perfil_tamanho'] . 'kb';
				}*/
			}
			else {
				$retorno['msg'][] = 'Formato de Imagem do destaque inválido';
			}
		}
		if (count($retorno) > 0)
			$retorno['msg'] = implode("<br/>",$retorno['msg']);
        return $retorno;
	}
	// ===============================================================
	protected function doDeletar() {
		$id = intval($this->system->input['id']);
		if ($id) {
			$coordenador = $this->system->coordenadores->getCoordenador($id);
			if($coordenador['nivel'] == 6) {
				$this->system->coordenadores->deletar($id);
				$this->system->view->assign('msg_alert', 'Coordenador excluído com sucesso!');
			} 
			else {
				$this->system->view->assign('msg_alert', 'Não foi possível excluir esse coordenador!');	
			}
		}
		$this->doListar();
	}
	// ===============================================================
	protected function doVisualizar() {
		$id = intval($this->system->input['id']);
		if ($id)
			$this->system->view->assign('coordenador', $this->system->coordenadores->getCoordenador($id, true));
		else
			header('location: ' . $this->system->admin->categoria . '/coordenadores/listar');

		$this->system->admin->topo('coordenadores');
		$this->system->view->display('instituicao/coordenador_visualizar.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================

	protected function doEditarNaVisualizacao() {
		$id = intval($this->system->input['id']);
		$editar = intval($this->system->input['editar']);
		if ($editar) {
			$erro_msg = $this->validarDados();
			if ($erro_msg) {
				$this->system->view->assign('msg_alert', $erro_msg['msg']);
				$this->system->view->assign('aluno', $this->system->input);
			} 
			else {
				if ($id) {
					$this->system->alunos->atualizar($this->system->input);
					$this->system->view->assign('msg_alert', 'Aluno atualizado com sucesso!');
				} 
				else {
					$id = $this->system->alunos->cadastrar($this->system->input);
					$this->system->view->assign('msg_alert', 'Aluno cadastrado com sucesso!');
				}
				$this->doVisualizar();
				exit;
			}
		} 
		else {
			if ($id) 
				$this->system->view->assign('aluno', $this->system->alunos->getAluno($id, true));
			else
				header('location: ' . $this->system->admin->categoria . '/alunos/visualizar');
		}
		
		$this->system->admin->topo(2);
		$this->system->view->display('global/alunos_editar_perfil.tpl');
		$this->system->admin->rodape();
	}
// ====================================================================================
	protected function doVisualizarAlunosByCurso() {
		$id_curso = $this->system->input['id'];
		$alunos = $this->system->alunos->getAlunosByCurso($id_curso);
		echo json_encode($alunos);
	}
// ====================================================================================

}
// ===================================================================