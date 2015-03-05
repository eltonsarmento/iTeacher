<?php
// ===================================================================
class Administrador extends AdminModules {
	protected $mostrar = 10;
	// ===============================================================
	public function __construct() {
		parent::__construct();
		$this->system->load->dao('administradores');
		$this->system->load->dao('paginas');
		$this->system->load->model('email_model');
	}
	// ===============================================================
	public function autoRun() {
    	switch($this->system->input['do']) {
			case 'listar':		
			case 'buscar':							$this->doListar(); 	break;
			case 'novo':
			case 'editar': 							$this->doEdicao(); 	break;
			case 'apagar': 							$this->doDeletar(); break;
			case 'visualizar': 						$this->doVisualizar(); break;			
			case 'editarnavisualizacao': 			$this->doEditarNaVisualizacao(); break;
			case 'deletarAdministrador': 			$this->doDeletarAdministrador(); break;
			default: 								$this->pagina404(); break;
		}
	}
	// ===============================================================
	protected function doListar() {		
		$this->listagem();
		$this->system->admin->topo('administrador', 'administrador-listar');
		$this->system->view->display('administrador/administrador_gerenciar.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function listagem() {
		$palavra = $this->system->input['palavra_busca'];
		$base_url = ($palavra ? $this->system->func->baseurl('/administrador/buscar&palavra_busca=' . $palavra) : $this->system->func->baseurl('/administrador/listar'));
		$total = $this->system->administradores->getAdministradores($palavra, 'padrao', 0, '', true);
		$paginacao = $this->system->func->paginacao($this->pagina, $this->mostrar, $total, $base_url);
		$administradores = $this->system->administradores->getAdministradores($palavra, 'padrao', $this->inicial . ',' . $this->mostrar);
		foreach ($administradores as $key => $administrador) {
			$administradores[$key]['cep'] = $this->system->administradores->getValorExtra($administrador['id'], 'cep');
			$administradores[$key]['endereco'] = $this->system->administradores->getValorExtra($administrador['id'], 'endereco');
			$administradores[$key]['bairro'] = $this->system->administradores->getValorExtra($administrador['id'], 'bairro');
			$administradores[$key]['cidade'] = $this->system->administradores->getValorExtra($administrador['id'], 'cidade');
			$administradores[$key]['estado'] = $this->system->administradores->getValorExtra($administrador['id'], 'estado');
			$administradores[$key]['cpf'] = $this->system->administradores->getValorExtra($administrador['id'], 'cpf');
			$administradores[$key]['telefone'] = $this->system->administradores->getValorExtra($administrador['id'], 'telefone');
		}
		$this->system->view->assign('administradores', $administradores);
		$this->system->view->assign('paginacao', $paginacao);
		$this->system->view->assign('palavra_busca', $palavra);
		$this->system->view->assign('url_site', $this->system->getUrlSite());
	}
	// ===============================================================
	protected function doEdicao() {
		$id = intval($this->system->input['id']);
		$editar = intval($this->system->input['editar']);
		if ($editar) {
			$erro_msg = $this->validarDados();
			if ($erro_msg) {
				$this->system->view->assign('msg_alert_error', $erro_msg['msg']);
				$this->system->view->assign('Administrador', $this->system->input);
			} else {
				if ($id) {
					$this->system->administradores->atualizar($this->system->input);										
					if (is_uploaded_file($_FILES['avatar']['tmp_name'])) {
						$extensao = end(explode('.', $_FILES['avatar']['name']));
						$nomearquivo = 'avatar_' . $id . '.' . $extensao;
						if (file_exists($this->system->getUploadPath() . '/avatar/' . $nomearquivo))
							unlink($this->system->getUploadPath() . '/avatar/' . $nomearquivo);
						copy($_FILES['avatar']['tmp_name'], $this->system->getUploadPath() . '/avatar/' . $nomearquivo);
						$this->system->usuarios->atualizarImagem($id, $nomearquivo);
					}
					$this->system->view->assign('msg_alert_sucesso', 'Administrador atualizado com sucesso!');
				} else {								
					$id = $this->system->administradores->cadastrar($this->system->input);
					if (is_uploaded_file($_FILES['avatar']['tmp_name'])) {
						$extensao = end(explode('.', $_FILES['avatar']['name']));
						$nomearquivo = 'avatar_' . $id . '.' . $extensao;
						if (file_exists($this->system->getUploadPath() . '/avatar/' . $nomearquivo))
							unlink($this->system->getUploadPath(). '/avatar/' . $nomearquivo);
						copy($_FILES['avatar']['tmp_name'], $this->system->getUploadPath() . '/avatar/' . $nomearquivo);
						$this->system->usuarios->atualizarImagem($id, $nomearquivo);
					}	
					$this->system->view->assign('msg_alert', 'Administrador cadastrado com sucesso!');
					//Email
					//$this->system->email_model->cadastroProfessor($this->system->input['email'], $this->system->input['nome'], $this->system->input['senha']);


				}

				if ($this->system->input['nova'])
					$this->system->func->redirecionar('/administrador/novo');
				else
					$this->system->func->redirecionar('/administrador/listar');
				$this->doListar();
				die;
			}
		} else {		
			if ($this->system->session->getItem('session_nivel_categoria') == 'administrador') {				
				if ($id) $this->system->view->assign('administrador', $this->system->administradores->getAdministrador($id, true));
			}		
		}
		$this->system->admin->topo('administrador','administrador-novo');
		$this->system->view->display('administrador/administrador_edicao.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function validarDados() {
		$retorno = array();
        //Nome
        if ($this->system->input['nome'] == '') 
            $retorno['msg'][] = "O campo nome está vázio.";
        //Email
        if ($this->system->input['email'] == '')
        	$retorno['msg'][] = "O campo E-mail está vázio";
        elseif (!$this->system->func->checkEmail($this->system->input['email']))
        	$retorno['msg'][] = "O campo E-mail é inválido";
        elseif ($this->system->administradores->checkEmailCadastrado($this->system->input['id'], $this->system->input['email'], $this->system->getSistemaID()))
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
	        if ($this->system->input['senha'] == '') {
	        	$retorno['msg'][] = "O campo Senha está vázio";
	        } elseif (strlen($this->system->input['senha']) < 5) {
	        	$retorno['msg'][] = "O campo Senha deve ter pelo menos 5 digitos.";
	        }
			if ($this->system->input['senha2'] == '')
	        	$retorno['msg'][] = "O campo Confirme a Senha está vázio";
	        elseif (strlen($this->system->input['senha2']) < 5)
	        	$retorno['msg'][] = "O campo Confirme a Senha deve ter pelo menos 5 digitos.";

	        if ($this->system->input['senha'] != $this->system->input['senha2'])
	        	$retorno['msg'][] = "Os campos Senha e Confirme a Senha não estão iguais.";
	    }
	    
	    //Senha Atualizar
        if ($this->system->input['id'] != '') {
        	if (($this->system->input['senha'] != '') && ($this->system->input['senha2'] != '')) {
	        	if (strlen($this->system->input['senha']) < 5)
	        		$retorno['msg'][] = "O campo Senha deve ter pelo menos 5 digitos.";
	        	if (strlen($this->system->input['senha2']) < 5)
	        		$retorno['msg'][] = "O campo Confirme a Senha deve ter pelo menos 5 digitos.";
	        	if ($this->system->input['senha'] != $this->system->input['senha2'])
	        		$retorno['msg'][] = "Os campos Senha e Confirme a Senha não estão iguais.";
	    	}
		}

		//Arquivo Imagem
		if (is_uploaded_file($_FILES['avatar']['tmp_name'])) {
			$extensao = end(explode('.', $_FILES['avatar']['name']));
			if (!in_array($extensao, array('jpg', 'gif', 'png'))) {				
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
			$administrador = $this->system->administradores->getAdministrador($id);
			if ($administrador['nivel'] == 1) {
				$this->system->administradores->deletar($id);
				$this->system->view->assign('msg_alert_sucesso', 'Administrador excluído com sucesso!');
			} else {
				$this->system->view->assign('msg_alert_error', 'Não foi possível excluir esse usuário!');	
			}
		}
		$this->doListar();
	}
	// ===============================================================
	protected function doVisualizar() {
		$id = intval($this->system->input['id']);
		if ($id)
			$this->system->view->assign('administrador', $this->system->administradores->getAdministrador($id, true));
		else
			header('location: ' . $this->system->admin->categoria . '/administrador/listar');
		$this->system->admin->topo('administrador','administrador-listar');
		$this->system->view->display('administrador/administrador_visualizar.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================

	protected function doEditarNaVisualizacao(){
		$id = intval($this->system->input['id']);
		$editar = intval($this->system->input['editar']);
		if ($editar) {
			$erro_msg = $this->validarDados();
			
			if ($erro_msg) {
				$this->system->view->assign('msg_alert_error', $erro_msg['msg']);
				$this->system->view->assign('administrador', $this->system->input);
			} else {
				if ($id) {
					$this->system->administradores->atualizar($this->system->input);
					$this->system->view->assign('msg_alert_sucesso', 'Administrador atualizado com sucesso!');
				} else {
					$id = $this->system->administradores->cadastrar($this->system->input);
					$this->system->view->assign('msg_alert_sucesso', 'Administrador cadastrado com sucesso!');
				}

				$this->doVisualizar();
				exit;
			}
		} else {
			if ($id) 
				$this->system->view->assign('administrador', $this->system->administradores->getAdministrador($id, true));
			else
				header('location: ' . $this->system->admin->categoria . '/administrador/visualizar');
		}
		$this->system->admin->topo('administrador','administrador-listar');
		$this->system->view->display('administrador/administrador_editar_perfil.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function doDeletarAdministrador() {
		$id = $this->system->input['id'];	

		if ($id)$this->system->administradores->deletaAdministrador($id);					
		$this->doListar();		
	}
// ====================================================================================

}
// ===================================================================