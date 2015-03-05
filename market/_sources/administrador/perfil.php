<?php
require_once(dirname(__FILE__).'/../global/perfil.global.php');

// ===================================================================
class Perfil extends PerfilGlobal {
	
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']){	
			case 'visualizar' : 		$this->doVisualizar(); break;		
			case 'trocarSenha': 		$this->doAlterarSenha(); break;
			case 'editar': 				$this->doEditarDadosUsuario();break;
			default: 					$this->doAlterarSenha(); break;
		}
	}

	//================================================================
	protected function doVisualizar() {	
		$id = intval($this->system->input['id']);
		if ($id)			
			$this->system->view->assign('administrador', $this->system->usuarios->getUsuario($id, true));	
		else
			$this->system->func->redirecionar();

		$this->system->admin->topo();
		$this->system->view->display('administrador/perfil.tpl');
		$this->system->admin->rodape();
	}

	

	//================================================================

	protected function doEditarDadosUsuario() {
		$id = intval($this->system->input['id']);
		$editar = intval($this->system->input['editar']);
		$editar_dados = intval($this->system->input['dados_comuns']);
		$editar_rede_social = intval($this->system->input['rede_social']);
		$editar_senha_foto = intval($this->system->input['senha_foto']);
		if($editar_dados) {
			if($editar) {
				$erro_msg=$this->validarDadosUsuarioProfessor(1);
				if($erro_msg) {
					$this->system->view->assign('msg_error', $erro_msg['msg']);
					$this->system->view->assign('administrador', $this->system->input);
				} 
				else {
					if ($id) {
						$this->system->usuarios->atualizar($this->system->input);
						$this->system->view->assign('msg_error', "Usuário atualizado com sucesso!");
					}
				}
			}
			else {
				if ($id)
					$this->system->view->assign('administrador', $this->system->usuarios->getUsuario($id,true));	
			}
		} 

		elseif ($editar_rede_social) {
			if ($editar) {
				$erro_msg = $this->validarDadosUsuarioProfessor(2);
				if ($erro_msg) {
					$this->system->view->assign('msg_error_redesocial', $erro_msg['msg']);
					$this->system->view->assign('administrador', $this->system->input);
				}
				else {
					if ($id) {
						$this->system->usuarios->atualizarRedeSocial($this->system->input);
						$this->system->view->assign('msg_error_redesocial', "Redes sociais atualizadas com sucesso!");
					}
				}
			}

			else {
				if ($id)
					$this->system->view->assign('administrador', $this->system->usuarios->getUsuario($id,true));
			}
		}

		elseif ($editar_senha_foto) {
			if ($editar) {
				$erro_msg = $this->validarDadosUsuarioProfessor(3);
				if ($erro_msg) {
					$this->system->view->assign('msg_error_senhafoto', $erro_msg['msg']);
					$this->system->view->assign('administrador', $this->system->input);
				}
				else {
					if ($id) {
						if (is_uploaded_file($_FILES['avatar']['tmp_name'])) {
							$extensao = end(explode('.', $_FILES['avatar']['name']));
							$nomearquivo = 'avatar_'.$id . '.' . $extensao;
							if (file_exists($this->system->getUploadPath() . '/avatar/' . $nomearquivo))
								unlink($this->system->getUploadPath() . '/avatar/' . $nomearquivo);
							copy($_FILES['avatar']['tmp_name'], $this->system->getUploadPath() . '/avatar/' . $nomearquivo);
							$this->system->usuarios->atualizarImagem($id, $nomearquivo);
						}
						if ($this->system->input['senha'] != '') {
							if (empty($mensagem)) $mensagem .= "Senha atualizada com sucesso!";
							else $mensagem .= " e Senha atualizadas com sucesso!";
							$this->system->usuarios->atualizarSenha($id,$this->system->input['senha']);
						}
						$this->system->view->assign('msg_error_senhafoto', $mensagem);					
					}
				}
			}
			else {
				if ($id)
					$this->system->view->assign('administrador', $this->system->usuarios->getUsuario($id,true));
			}
		}
		$this->system->view->assign('administrador', $this->system->usuarios->getUsuario($id,true));
		$this->system->admin->topo();
		$this->system->view->display('administrador/perfil_edicao.tpl');
		$this->system->admin->rodape();
	}
	//==================================================================
	private function validarDadosUsuarioProfessor($tipo_de_validacao){
		$retorno = array();
		if($tipo_de_validacao == 1) {
	       	//CPF
	        if ($this->system->input['cpf'] != '' && !$this->system->func->validaCPF($this->system->input['cpf']))
	        	$retorno['msg'][] = "O campo CPF é inválido.";	        
		}
		elseif($tipo_de_validacao == 2){

		}
		elseif ($tipo_de_validacao == 3) {
			if (($this->system->input['senha'] != '') && ($this->system->input['senha2'] != '')) {	        	
	        	if (strlen($this->system->input['senha']) < 5)
	        		$retorno['msg'][] = "O campo Senha deve ter pelo menos 5 digitos.";
	        	if (strlen($this->system->input['senha2']) < 5)
	        		$retorno['msg'][] = "O campo Confirme a Senha deve ter pelo menos 5 digitos.";
	        	if ($this->system->input['senha'] != $this->system->input['senha2'])
	        		$retorno['msg'][] = "Os campos Senha e Confirme a Senha não estão iguais.";
	        	
	    	}
			//Arquivo destaque
			if (is_uploaded_file($_FILES['avatar']['tmp_name'])) {
				$extensao = end(explode('.', $_FILES['avatar']['name']));
				if (!in_array($extensao, array('jpg', 'gif', 'png')))					
					$retorno['msg'][] = 'Formato de Imagem do destaque inválido';
			}	
		}
        if (count($retorno) > 0)
			$retorno['msg'] = implode("<br/>",$retorno['msg']);
        return $retorno;
	}
	
}
// ===================================================================
