<?php
// ===================================================================
class EmailGlobal extends AdminModules {
	// ===============================================================
	public function __construct(&$system) {
		$this->system = $system;
		$this->system->load->dao('emails');
	}
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			case 'listar': 				$this->doListar();			    break;
			case 'salvarDados':			$this->doSalvarDados(); 		break;
			case 'buscarCampos':		$this->doBuscarCampos();		break;
			case 'configurarEmail':		$this->doConfigurarEmail();		break;
			default: 					$this->pagina404();				break;
		}
	}
	// ===============================================================
	protected function doSalvarDadosEmail() {
		$ids = $this->system->input['id'];
		$arquivo_id = $this->system->input['arquivo_id'];
		foreach($ids as $id => $valor) {
			$this->system->emails->salvarValorPorId($id, $valor);
		}
		if (is_uploaded_file($_FILES['arquivo']['tmp_name'])) {
			$extensao = $this->system->func->getExtensaoArquivo($_FILES['arquivo']['name']);
			if (in_array($extensao, array('jpg', 'jpeg', 'png'))) {
				$imagem = true;
				if ($_FILES['arquivo']['size'] > 2485760) {
					$retorno['msg'][] = 'Imagem do Cabeçalho está com mais de 2MB';
					$imagem = false;
				}
			} else {
				$retorno['msg'][] = 'Imagem do Cabeçalho inválida';
				$imagem = false;
			}
		}
		if (!count($retorno['msg'])) {
			if ($imagem) {
				$nomearquivo = 'email_cabecalho' . $arquivo_id . '.' . $extensao;
				if (file_exists($this->system->getUploadPath() . '/imagens/' . $nomearquivo))
					unlink($this->system->getUploadPath() . '/imagens/' . $nomearquivo);
				copy($_FILES['arquivo']['tmp_name'], $this->system->getUploadPath() . '/imagens/' . $nomearquivo);
				$this->system->emails->salvarValorPorId($arquivo_id, $nomearquivo);
				$retorno['imagem'] = $this->system->getUrlSite() . 'lms/uploads/imagens/' . $nomearquivo;
			}
			$retorno['sucesso'] = 'Ação realizada com sucesso!';
			$retorno['msg'] = '';
		}
		echo json_encode($retorno);
	}
	// ===============================================================
	protected function doConfigurarEmail() {
		$id = intval($this->system->input['id']);
		$editar = intval($this->system->input['editar']);
		$form   = intval($this->system->input['form']);
		if ($editar) {
			$erro_msg = $this->validarDados();
			if ($erro_msg) {
				$this->system->view->assign('msg_alert', $erro_msg['msg']);
				$this->system->view->assign('email', $this->system->input);
			} 
			else {
				if($form === "servidor"){
					if ($id) {
						$this->system->emails->atualizarServidor($this->system->input);
						$this->system->view->assign('msg_alert', 'Email-Remetente atualizado com sucesso!');
					} 
					else {
						$id = $this->system->emails->cadastrarServidor($this->system->input);
						$this->system->view->assign('msg_alert', 'Email-Servidor cadastrado com sucesso!');
											
					}
				} 
				elseif ($form === "remetente") {
					if ($id) {
						$this->system->emails->atualizarRemetente($this->system->input);
						$this->system->view->assign('msg_alert', 'Email-Remetente atualizado com sucesso!');
					} 
					else {
						$id = $this->system->emails->cadastrar($this->system->input);
						$this->system->view->assign('msg_alert', 'Email-Remetente cadastrado com sucesso!');
											
					}
				}
				else {
					if ($id) {
						$this->system->emails->atualizarModelo($this->system->input);
						$this->system->view->assign('msg_alert', 'Email-Modelo atualizado com sucesso!');
					} 
					else {
						$id = $this->system->emails->cadastrarModelo($this->system->input);
						$this->system->view->assign('msg_alert', 'Email-Modelo cadastrado com sucesso!');
											
					}
					//Img cabecalho
					if (is_uploaded_file($_FILES['imagem_cabecalho']['tmp_name'])) {
						$extensao = end(explode('.', $_FILES['imagem_cabecalho']['name']));
						$nomearquivo = 'imagem_cabecalho_' . $id . '.' . $extensao;
						if (file_exists($this->system->getUploadPath() . '/imagem_cabecalho/' . $nomearquivo))
							unlink($this->system->getUploadPath() . '/imagem_cabecalho/' . $nomearquivo);
						copy($_FILES['imagem_cabecalho']['tmp_name'], $this->system->getUploadPath() . '/imagem_cabecalho/' . $nomearquivo);
						$this->system->emails->atualizarImagem($id, $nomearquivo);
					}
				}
				if ($this->system->input['nova'])
					$this->system->func->redirecionar('/emails/novo');
				else
					$this->system->func->redirecionar('/emails/listar');
				$this->doListar();
				die;
			}
		} 
		else {
			if ($id) $this->system->view->assign('email', $this->system->emails->getConfiguracoesGeraisEmail($id));
		}
		$this->system->admin->topo(12);
		$this->system->view->display('global/configuracao_geral_email_edicao.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function doSalvarDados() {
		$titulo_id = $this->system->input['titulo_id'];
		$texto_id = $this->system->input['texto_id'];
		$titulo = $this->system->input['titulo'];
		$texto = $this->system->input['texto'];
		if ($titulo_id)
			$this->system->emails->salvarValorPorId($titulo_id, $titulo);
		if ($texto_id)
			$this->system->emails->salvarValorPorId($texto_id, $texto);
		return true;
	}
	// ===============================================================
	protected function doListar($view = '') {		
		$this->system->admin->topo('configuracoes','emails-listar');
		$this->system->view->display($view);
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function doBuscarCampos() {
		$titulo_id = $this->system->input['titulo'];
		$texto_id = $this->system->input['texto'];
		$dados = array();
		$dados['titulo'] = $this->system->emails->getValorPorId($titulo_id);
		$dados['texto'] = $this->system->emails->getValorPorId($texto_id);
		echo json_encode($dados);
	}
}
// ===================================================================