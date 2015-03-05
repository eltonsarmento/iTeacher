<?php
// ===================================================================
class AdministrativosGlobal  extends AdminModules{
	// ===============================================================
	public function __construct(&$system) {
		$this->system = $system;
		$this->system->load->dao('administrativos');
		$this->system->load->dao('configuracoesgerais');
		$this->system->load->model('email_model');
	}
	// ===============================================================
	public function autoRun() {
    	switch($this->system->input['do']) {
			case 'listar': 					$this->doListar(); break;
			case 'novo': 					$this->doEdicao(); break;
			case 'editar': 					$this->doEdicao(); break;
			case 'apagar': 					$this->doDeletar(); break;
			case 'buscar':					$this->doListar(); break;
			case 'visualizar': 				$this->doVisualizar(); break;
			case 'editarnavisualizacao': 	$this->doEditarNaVisualizacao(); break;
			default: 						$this->pagina404(); break;
		}	
	}
	// ===============================================================
	protected function doEdicao() {
		$id = intval($this->system->input['id']);
		$editar = intval($this->system->input['editar']);
		
		if ($editar) {
			$erro_msg = $this->validarDados();
			if ($erro_msg) {
				$this->system->view->assign('msg_alert', $erro_msg['msg']);
				$this->system->input['avatar'] = $this->system->input['visualizar_avatar'];

				$this->system->view->assign('administrativo', $this->system->input);
			} 
			else {
				//Salvar
				if ($id) {
					$this->system->administrativos->atualizar($this->system->input);
					$this->system->view->assign('msg_alert', 'Administrativo atualizado com sucesso!');
				}
				else {
					$id = $this->system->administrativos->cadastrar($this->system->input);
					$this->system->view->assign('msg_alert', 'Administrativo cadastrado com sucesso!');
				}
				
				//Img avatar
				if (is_uploaded_file($_FILES['avatar']['tmp_name'])) {
					$extensao = end(explode('.', $_FILES['avatar']['name']));
					$nomearquivo = 'avatar_' . $id . '.' . $extensao;
					if (file_exists($this->system->getUploadPath() . '/avatar/' . $nomearquivo))
						unlink($this->system->getUploadPath() . '/avatar/' . $nomearquivo);
					copy($_FILES['avatar']['tmp_name'], $this->system->getUploadPath() . '/avatar/' . $nomearquivo);
					$this->system->administrativos->atualizarImagem($id, $nomearquivo);
				}

				if($this->system->input['nova']) {
					$this->system->func->redirecionar('/administrativos/novo/');
				} 
				else {
					$this->doListar();
					exit();	
				}				
			}
		} 
		else {
			//Carregar conteudo
			if ($id) 
			    $this->system->view->assign('administrativo', $this->system->administrativos->getAdministrativo($id, true));
		}
		//Listar conteudo cadastrado
		$this->limit = 10;
		$this->listagem();	
		$this->system->admin->topo('administrativos','administrativos-novo');
		$this->system->view->display('global/administrativos_edicao.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	private function validarDados() {
		$retorno = array();
        //Nome
        if ($this->system->input['nome'] == '') 
            $retorno['msg'][] = "O campo Nome está vázio.";
        //Email
        if ($this->system->input['email'] == '')
        	$retorno['msg'][] = "O campo E-mail esta vázio";
        elseif(!$this->system->func->checkEmail($this->system->input['email']))
        	$retorno['msg'][] = "O campo E-mail é inválido";
        elseif($this->system->administrativos->checkEmailCadastrado($this->system->input['id'], $this->system->input['email'], $this->system->getSistemaID()))        	
        		$retorno['msg'][] = "Já existe um usuário cadastrado com esse e-mail";	  
        //Senha
        if ($this->system->input['id'] == '') {
	        if ($this->system->input['senha'] == '')
	        	$retorno['msg'][] = "O campo Senha esta vázio";
	        elseif (strlen($this->system->input['senha']) < 5)
	        	$retorno['msg'][] = "O campo Senha deve ter pelo menos 5 digitos.";
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
			} else {
				$retorno['msg'][] = 'Formato de Imagem do destaque inválido';
			}
		}		
		if (count($retorno) > 0)
		   $retorno['msg'] = implode('<br/>', $retorno['msg']);
        return $retorno;
	}
	// ===============================================================
	protected function doListar() {
		$this->listagem();
		$this->system->admin->topo('administrativos', 'administrativos-listar');
		$this->system->view->display('global/administrativos_gerenciar.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	private function listagem() {
		$palavra = $this->system->input['palavra_busca'];
		if ($palavra) $this->system->session->deleteItem('palavra_busca');
		$administrativos = $this->system->administrativos->getAdministrativos($palavra, $this->limit);
		foreach ($administrativos as $key => $professor)
			$administrativos[$key]['cpf'] = $this->system->administrativos->getValorExtra($professor['id'], 'cpf');
		$this->system->view->assign('administrativos', $administrativos);
		$this->system->view->assign('url_site', $this->system->getUrlSite());
	}
	// ===============================================================
	protected function doDeletar() {
		$id = intval($this->system->input['id']);
		if ($id) {
			$administrativo = $this->system->administrativos->getAdministrativo($id);
			if($administrativo['nivel'] == 4) {
				$this->system->administrativos->deletar($id);
				$this->system->view->assign('msg_alert', 'Administrativo excluído com sucesso!');
			}
			else {
				$this->system->view->assign('msg_alert', 'Não foi possível excluir esse usuário!');	
			}
		}
		$this->doListar();
	}
	// ===============================================================
	protected function doVisualizar() {
		$id = intval($this->system->input['id']);
		$administrativo = $this->system->administrativos->getAdministrativo($id);
		if ($id)
			$this->system->view->assign('administrativo', $administrativo);
		else
			header('location: ' . $this->system->admin->categoria . '/administrativos/listar');
		$this->system->view->assign('categoria', $this->system->admin->categoria);
		$this->system->admin->topo(4);
		$this->system->view->display('global/administrativo_visualizar.tpl');
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
				$this->system->input['avatar'] = $this->system->input['visualizar_avatar'];
				$this->system->view->assign('administrativo', $this->system->input);
			} 
			else {
				//Salvar
				if ($id) {
					$this->system->administrativos->atualizar($this->system->input);
					$this->system->view->assign('msg_alert', 'Administrativo atualizado com sucesso!');
				}
				else {
					$id = $this->system->administrativos->cadastrar($this->system->input);
					$this->system->view->assign('msg_alert', 'Administrativo cadastrado com sucesso!');
				}
				//Img banner
				if (is_uploaded_file($_FILES['avatar']['tmp_name'])) {
					$extensao = end(explode('.', $_FILES['avatar']['name']));
					$nomearquivo = 'avatar_'.$id.'.'.$extensao;
					if (file_exists($this->system->getUploadPath() . '/avatar/' . $nomearquivo))
						unlink($this->system->getUploadPath() . '/avatar/' . $nomearquivo);
					copy($_FILES['avatar']['tmp_name'], $this->system->getUploadPath() . '/avatar/' . $nomearquivo);
					$this->system->administrativos->atualizarImagem($id, $nomearquivo);
				}
				$this->doVisualizar();
				exit();	
			  }
		}
		$administrativo = $this->system->administrativos->getAdministrativo($id);
		if ($id)
			$this->system->view->assign('administrativo', $administrativo);
		else
			header('location:'. $this->system->admin->categoria.'/administrativos/visualizar');
		$this->system->admin->topo(4);
		$this->system->view->display('global/editar_administrativo.tpl');
		$this->system->admin->rodape();
	}
}
// ===================================================================