<?php
require_once(dirname(__FILE__).'/../global/perfil.global.php');

// ===================================================================
class Perfil extends PerfilGlobal {
	
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']){	
			case 'visualizar': 			$this->doVisualizar(); break;		
			case 'editar': 				$this->doEditarDadosUsuario();break;
			default: 					$this->doVisualizar(); break;
		}
	}
	//================================================================
	protected function doVisualizar() {	
		$id = intval($this->system->input['id']);
		if ($id) $this->system->view->assign('parceiro', $this->system->usuarios->getUsuario($id, true));
		else $this->system->func->redirecionar();		
		$this->system->admin->topo();
		$this->system->view->display('instituicao-parceiro/perfil_parceiro.tpl');
		$this->system->admin->rodape();
	}
	//================================================================
	protected function doEditarDadosUsuario() {
		$id = intval($this->system->input['id']);
		$editar = intval($this->system->input['editar']);
		$editar_dados = intval($this->system->input['dados_comuns']);
		$editar_senha_foto = intval($this->system->input['senha_foto']);
		if ($editar_dados) {
			if ($editar) {
				$erro_msg=$this->validarDadosUsuarioParceiro(1);
				if ($erro_msg) {
					$this->system->view->assign('msg_error', $erro_msg['msg']);
					$this->system->view->assign('parceiro', $this->system->input);
				}
				else {
					if ($id) {
						$this->system->usuarios->atualizar($this->system->input);
						$this->system->view->assign('msg_error', "Usuário atualizado com sucesso!");
					}
				}
			}
			else {
				if ($id) {
					$this->system->view->assign('parceiro', $this->system->usuarios->getUsuario($id,true));
				}	
			}
		} 
		elseif ($editar_senha_foto) {
			if ($editar) {
				$erro_msg = $this->validarDadosUsuarioParceiro(2);
				if ($erro_msg) {
					$this->system->view->assign('msg_error_senhafoto', $erro_msg['msg']);
					$this->system->view->assign('parceiro', $this->system->input);
				}
				else {
					if ($id) {
						if (is_uploaded_file($_FILES['avatar']['tmp_name'])) {
							$extensao = end(explode('.', $_FILES['avatar']['name']));
							$nomearquivo = 'avatar_' . $id . '.' . $extensao;
							if (file_exists($this->system->getUploadPath() . '/avatar/' . $nomearquivo))
								unlink($this->system->getUploadPath() . '/avatar/' . $nomearquivo);
							copy($_FILES['avatar']['tmp_name'], $this->system->getUploadPath() . '/avatar/' . $nomearquivo);
							$this->system->usuarios->atualizarImagem($id, $nomearquivo);
						}
						$this->system->usuarios->atualizarSenha($id,$this->system->input['senha']);
						$this->system->view->assign('msg_error_senhafoto', "Senha e foto atualizadas com sucesso!");
					}
				}
			}
			else {
				if ($id) {
					$this->system->view->assign('parceiro', $this->system->usuarios->getUsuario($id,true));
				}
			}
		}
		$this->system->view->assign('parceiro', $this->system->usuarios->getUsuario($id,true));
		$this->system->admin->topo();
		$this->system->view->display('instituicao-parceiro/editar_perfil_parceiro.tpl');
		$this->system->admin->rodape();
	}
	//==================================================================
	private function validarDadosUsuarioParceiro($tipo_de_validacao) {
		$retorno = array();
		if($tipo_de_validacao == 1) {
			 //Nome
	        if($this->system->input['nome'] == '') 
	            $retorno['msg'][] = "O campo nome está vázio.";
	        //Email
	        if ($this->system->input['email'] == '')
	        	$retorno['msg'][] = "O campo E-mail está vázio";
	        //Email Responsável
	        if($this->system->input['email'] == '') 
	            $retorno['msg'][] = "O campo Email Responsável está vázio.";
	        elseif(!$this->system->func->checkEmail($this->system->input['email']))
	        	$retorno['msg'][] = "O campo E-mail é inválido";
	        elseif($this->system->usuarios->checkEmailCadastrado($this->system->input['id'], $this->system->input['email'], $this->system->getSistemaID()))
	        	$retorno['msg'][] = "Já existe um usuário cadastrado com esse e-mail";

	        if($this->system->input['email'] != '')
	        	$this->system->input['email_responsavel'] = $this->system->input['email'];
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
	        //Telefone
	        if($this->system->input['telefone'] == '')
	        	$retorno['msg'][] = "O campo Telefone está vázio";       
		}
		elseif ($tipo_de_validacao == 2) {
			if (($this->system->input['senha'] != '') && ($this->system->input['senha2'] != '')){	        	
	        	if (strlen($this->system->input['senha']) < 5)
	        		$retorno['msg'][] = "O campo Senha deve ter pelo menos 5 digitos.";
	        	if (strlen($this->system->input['senha2']) < 5)
	        		$retorno['msg'][] = "O campo Confirme a Senha deve ter pelo menos 5 digitos.";	      	
	        	if($this->system->input['senha'] != $this->system->input['senha2'])
	        		$retorno['msg'][] = "Os campos Senha e Confirme a Senha não estão iguais.";   	
	    	}
	    	//Arquivo destaque
			if (is_uploaded_file($_FILES['avatar']['tmp_name'])) {
				$extensao = end(explode('.', $_FILES['avatar']['name']));
				if (in_array($extensao, array('jpg', 'gif', 'png'))) {
					/*
					//$configPerfil = $this->system->configuracoesgerais->getImagensPerfil();
					if (($_FILES['avatar']['size'] / 1024) > $configPerfil['imagem_perfil_tamanho']) {
						$retorno['msg'][] = 'A Imagem do destaque está com mais de ' . $configPerfil['imagem_perfil_tamanho'] . 'kb';
					}*/
				} else {
					$retorno['msg'][] = 'Formato de Imagem do destaque inválido';
				}
			}			
		}
        if (count($retorno) > 0)
			$retorno['msg'] = implode("<br/>",$retorno['msg']);
        return $retorno;
	}
}
// ===================================================================
