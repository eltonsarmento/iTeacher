<?php
// ===================================================================
class ContasGlobal extends AdminModules {
	// ===============================================================
	public function __construct(&$system) {
		$this->system = $system;
		$this->system->load->dao('contas');
		$this->system->load->dao('configuracoesgerais');
	}
	// ===============================================================
	public function autoRun() {		
		switch($this->system->input['do']) {
			case 'novo': 				$this->doSalvarDados();break;
			case 'editar': 				$this->doEditar(); break;
			case 'visualizar': 			$this->doVisualizar(); break;
			case 'buscarCampos': 		$this->doBuscarCampos(); break;
			case 'trocarSenha': 		$this->doAlterarSenha(); break;
			case 'enviarDocumentos': 	$this->doEnviarDocumentos(); break;
			case 'apagar': 				$this->doDeletar();break;
			default: 					$this->doEditar(); break;
		}
	}
	//================================================================
	protected function doVisualizar() {
		$id = intval($this->system->getSistemaID());
		if ($id)
			$this->system->view->assign('contas', $this->system->contas->getContas());
		else
			$this->system->func->redirecionar();		
		$this->system->admin->topo();
		$this->system->view->display('professor/contas_bancarias_gerenciar.tpl');
		$this->system->admin->rodape();
	}


	// ===============================================================
	protected function doEditar() {
		$id = intval($this->system->input['id']);
		$editar = intval($this->system->input['editar']);
		if ($editar) {
			$erro_msg = $this->validarDados();
			if ($erro_msg) {
				$this->system->view->assign('msg_alert', $erro_msg['msg']);
				$this->system->input['avatar'] = $this->system->input['avatar_arquivo_visualizar'];
				$this->system->view->assign('usuario', $this->system->input);
			} 
			else {
				$this->system->view->assign('msg_alert', 'Ação realizada com sucesso!');
			}
		} 
		else {
			//$this->system->view->assign('usuario', $this->system->usuarios->getUsuario($id));
		}		
		$this->system->admin->topo($menu);
		$this->system->view->display('$this->system->admin->getCategoria() . ');
		$this->system->admin->rodape();
	}
	// ===============================================================
	private function doSalvarDados() {	
		$this->system->contas->cadastrar($this->system->input);
		return true;
	}
	// ===============================================================
	private function doBuscarCampos() {
		$id = $this->system->input['id'];
		$dados = array();
		$dados['conta'] = $this->system->contas->getConta($id);
		echo json_encode($dados['conta']);
	}
	protected function doEnviarDocumentos() {
		$id = intval($this->system->input['id']);
		$observacao = trim($this->system->input['observacao']);
		if ($id) {
			$msg_erro_geral = "";
			$msg_sucesso_geral = "";
			$comprovante_bancario = false;
			$comprovante_residencia = false;
			$copia_rg = false;
			$copia_cpf = false;
			if ($observacao) {
				$this->system->contas->atualizaObservacao($id, $observacao);
				$msg_sucesso_geral = "Observação atualizada com sucesso <br>";
				$retorno['observacao'] = $observacao;
			}
			else {
				$msg_sucesso_geral = "Por favor preencha a observação <br>";
			}
			
			if($_FILES['comprovante_bancario']['name'] != ""){
				//comprovante bancario
				if (is_uploaded_file($_FILES['comprovante_bancario']['tmp_name'])) {
					$extensao = $this->system->func->getExtensaoArquivo($_FILES['comprovante_bancario']['name']);		
					if (in_array($extensao, array('pdf', 'doc', 'docx', 'rar', 'zip'))) {
						$comprovante_bancario = true;
						if ($_FILES['comprovante_bancario']['size'] > 10485760) {
							$retorno['msg_bancario'][] = 'O Comprovante está com mais de 10MB';
							$comprovante_bancario = false;
						}
					} 
					else {
						$retorno['msg_bancario'][] = 'Comprovante de pagamento inválido';
						$comprovante_bancario = false;
					}
				}
				if (!count($retorno['msg_bancario'])) {
					if ($comprovante_bancario) {
						$nomearquivo = 'comprovantes_bacario_' . $id . '.' . $extensao;
						if (file_exists($this->system->getUploadPath() . '/comprovantes_bacarios/' . $nomearquivo))
							unlink($this->system->getUploadPath() . '/comprovantes_bacarios/' . $nomearquivo);
						copy($_FILES['comprovante_bancario']['tmp_name'], $this->system->getUploadPath() . '/comprovantes_bacarios/' . $nomearquivo);
						$campo = "comprovante_bancario";
						$this->system->contas->atualizarDocumento($id, $nomearquivo, $campo);
					}
					$retorno['comprovante_bancario'] = $comprovante_bancario;
					$retorno['id'] = $id;
					$retorno['sucesso_comprovante_bancario'] = 'Comprovante bancário atualizado';
					$retorno['msg_bancario'] = '';
				}
				if($retorno['msg_bancario'] == "")
					$msg_sucesso_geral = $msg_sucesso_geral. $retorno['sucesso_comprovante_bancario']. "<br>";
				else
					$msg_erro_geral = $msg_erro_geral. $retorno['msg_bancario']. "<br>";
			}

			if ($_FILES['comprovante_residencia']['name'] != "") {
				//comprovante residencia
				if (is_uploaded_file($_FILES['comprovante_residencia']['tmp_name'])) {
					$extensao = $this->system->func->getExtensaoArquivo($_FILES['comprovante_residencia']['name']);
					if (in_array($extensao, array('pdf', 'doc', 'docx', 'rar', 'zip'))) {
						$comprovante_residencia = true;
						if ($_FILES['comprovante_residencia']['size'] > 10485760) {
							$retorno['msg_residencia'][] = 'O Comprovante está com mais de 10MB';
							$comprovante_residencia = false;
						}
					}
					else {
						$retorno['msg_residencia'][] = 'Comprovante de pagamento inválido';
						$comprovante_residencia = false;
					}
				}
				if (!count($retorno['msg_residencia'])) {	
					if ($comprovante_residencia) {
						$nomearquivo = 'comprovante_residencia' . $id . '.' . $extensao;
						if (file_exists($this->system->getUploadPath() . '/comprovantes_residencia/' . $nomearquivo))
							unlink($this->system->getUploadPath() . '/comprovantes_residencia/' . $nomearquivo);
						copy($_FILES['comprovante_residencia']['tmp_name'], $this->system->getUploadPath() . '/comprovantes_residencia/' . $nomearquivo);
						$campo = "comprovante_residencia";
						$this->system->contas->atualizarDocumento($id, $nomearquivo, $campo);
					}
					$retorno['comprovante_residencia'] = $comprovante_residencia;
					$retorno['id'] = $id;
					$retorno['sucesso_comprovante_residencia'] = 'Comprovante de residencia atualizado';
					$retorno['msg_residencia'] = '';
				}
				if($retorno['msg_residencia'] == "")
					$msg_sucesso_geral = $msg_sucesso_geral. $retorno['sucesso_comprovante_residencia']. "<br>";
				else
					$msg_erro_geral = $msg_erro_geral. $retorno['msg_residencia']. "<br>";
			}

			if ($_FILES['comprovante_rg']['name']) {
				//copia rg
				if (is_uploaded_file($_FILES['comprovante_rg']['tmp_name'])) {
					$extensao = $this->system->func->getExtensaoArquivo($_FILES['comprovante_rg']['name']);
					if (in_array($extensao, array('pdf', 'doc', 'docx', 'rar', 'zip'))) {
						$copia_rg = true;
						if ($_FILES['comprovante_rg']['size'] > 10485760) {
							$retorno['msg_rg'][] = 'O Comprovante está com mais de 10MB';
							$copia_rg = false;
						}
					} 
					else {
						$retorno['msg_rg'][] = 'Comprovante de pagamento inválido';
						$copia_rg = false;
					}
				}
				if (!count($retorno['msg_rg'])) {
					if ($copia_rg) {
						$nomearquivo = 'comprovante_rg' . $id . '.' . $extensao;
						if (file_exists($this->system->getUploadPath() . '/comprovantes_rg/' . $nomearquivo))
							unlink($this->system->getUploadPath() . '/comprovantes_rg/' . $nomearquivo);
						copy($_FILES['comprovante_rg']['tmp_name'], $this->system->getUploadPath() . '/comprovantes_rg/' . $nomearquivo);
						$campo = "arquivo_rg";
						$this->system->contas->atualizarDocumento($id, $nomearquivo, $campo);
					}
					$retorno['copia_rg'] = $copia_rg;
					$retorno['id'] = $id;
					$retorno['sucesso_copia_rg'] = 'Cópia do RG atualizado';
					$retorno['msg_rg'] = '';
				}
				if($retorno['msg_rg'] == "")
					$msg_sucesso_geral = $msg_sucesso_geral. $retorno['sucesso_copia_rg']. "<br>";
				else
					$msg_erro_geral = $msg_erro_geral. $retorno['msg_rg']. "<br>";
			}

			if ($_FILES['comprovante_cpf']['name']) {
				//copia cpf
				if (is_uploaded_file($_FILES['comprovante_cpf']['tmp_name'])) {
					$extensao = $this->system->func->getExtensaoArquivo($_FILES['comprovante_cpf']['name']);
					if (in_array($extensao, array('pdf', 'doc', 'docx', 'rar', 'zip'))) {
						$copia_cpf = true;
						if ($_FILES['comprovante_cpf']['size'] > 10485760) {
							$retorno['msg_cpf'][] = 'O Comprovante está com mais de 10MB';
							$copia_cpf = false;
						}
					} 
					else {
						$retorno['msg_cpf'][] = 'Comprovante de pagamento inválido';
						$copia_cpf = false;
					}
				}
				if (!count($retorno['msg_cpf'])) {
					if ($copia_cpf) {
						$nomearquivo = 'comprovante_cpf' . $id . '.' . $extensao;
						if (file_exists($this->system->getUploadPath() . '/comprovantes_cpf/' . $nomearquivo))
							unlink($this->system->getUploadPath() . '/comprovantes_cpf/' . $nomearquivo);
						copy($_FILES['comprovante_cpf']['tmp_name'], $this->system->getUploadPath() . '/comprovantes_cpf/' . $nomearquivo);
						$campo = "arquivo_cpf";
						$this->system->contas->atualizarDocumento($id, $nomearquivo, $campo);
					}
					$retorno['copia_cpf'] = $copia_cpf;
					$retorno['id'] = $id;
					$retorno['sucesso_copia_cpf'] = 'Cópia do CPF atualizado';
					$retorno['msg_cpf'] = '';
				}
				if($retorno['msg_cpf'] == "")
					$msg_sucesso_geral = $msg_sucesso_geral. $retorno['sucesso_copia_cpf']. "<br>";
				else
					$msg_erro_geral = $msg_erro_geral. $retorno['msg_cpf']. "<br>";
			}
			$retorno['sucesso_geral'] = "<div class='alert alert-info' >".$msg_sucesso_geral."</div>";
			$retorno['erro_geral'] = "<div class='alert alert-info' >".$msg_erro_geral."</div>";
		}
		echo json_encode($retorno);
	}
	// ===============================================================
	public function validarDados() {
		$retorno = array();
        if (!$this->system->input['nome']) 
            $retorno['msg'][] = "O campo nome está vazio.";   
        if (!$this->system->input['email']) 
            $retorno['msg'][] = "O campo email está vazio.";
        elseif(!preg_match('/[a-z0-9]+@[a-z0-9]+\.com/', $this->system->input['email']))
        	$retorno['msg'][] = "Formato de e-mail inválido.";
        if (!$this->system->input['cep']) 
            $retorno['msg'][] = "O campo CEP está vazio.";
        elseif(!preg_match('/[0-9]{5}-[0-9]{3}/', $this->system->input['cep']))
        	$retorno['msg'][] = "O campo CEP está em formato invalido. Formato padrão: 12345-678.";
        if (!$this->system->input['endereco']) 
            $retorno['msg'][] = "O campo endereço está vazio.";
        if (!$this->system->input['bairro']) 
            $retorno['msg'][] = "O campo bairro está vazio.";
        if (!$this->system->input['cidade']) 
            $retorno['msg'][] = "O campo cidade está vazio.";
        if (!$this->system->input['estado']) 
            $retorno['msg'][] = "O campo estado está vazio.";	
		if(count($retorno) > 0) {
		   $retorno['msg'] = implode("<br/>",$retorno['msg']);
		}
        return $retorno;
	}
	// ===============================================================
	public function doDeletar() {
		$id = $this->system->input['id'];
		if ($id) {
			$this->system->contas->deletar($id);
			$this->system->view->assign('msg_alert', 'Conta excluída com sucesso!');
		}
		$this->doVisualizar();
	}
	// ===============================================================
	public function doMudarTheme() {
		$id = $this->system->session->getItem('session_cod_usuario');
		$theme = $this->system->input['theme'];
		if ($id && $theme) {
			$this->system->session->addItem('session_themecss', $theme);
			$this->system->usuarios->mudarTema($id, $theme);
		}
	}
	// ===============================================================
	public function doAlterarSenha() {
		$id = $this->system->session->getItem('session_cod_usuario');
		if (!$id) {
			session_write_close();
			header('Location: ' . $this->system->getUrlSite() . 'lms/'.$this->system->admin->getCategoria().'/dashboard/home/');
			exit();
		}
		$senhaAtual = $this->system->input['senha_atual'];
		$senhaNova = $this->system->input['senha_nova'];
		$senhaConfirmacao = $this->system->input['senha_confirmacao'];
		if (!$senhaAtual) 
			$erro[] = 'Necessário senha atual';
		elseif ($senhaAtual != $usuario['senha']) 
			$erro[] = 'Senha informada diferente da atual ';
		if (!$senhaNova) 
			$erro[] = 'Necessário senha nova';
		elseif(strlen($senhaNova) < 5)
			$erro[] = 'Nova senha deve ter pelo menos 5 caracteres';
		elseif(!$senhaConfirmacao)
			$erro[] = 'Necessário repetir a senha';
		elseif($senhaNova != $senhaConfirmacao)
			$erro[] = 'A nova senha não corresponde a senha repetida';
		if (count($erro) > 0) {
			echo '<p style="color:red;">' . implode('<br/>', $erro) . '</p>';
		} 
		else {
			$this->system->usuarios->atualizarSenha($id, $senhaNova);
			echo '<p style="color:green;">Senha alterada com sucesso!<p>';
		}
	}
}
// ===================================================================
