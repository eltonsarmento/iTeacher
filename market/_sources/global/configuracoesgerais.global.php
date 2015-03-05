<?php
// ===================================================================
class ConfiguracoesGeraisGlobal extends AdminModules{
	// ===============================================================
	public function __construct(&$system) {
		$this->system = $system;
		$this->system->load->dao('configuracoesgerais');
	}
	// ===============================================================
	public function autoRun() {		
		switch($this->system->input['do']) {
			case 'pagamentos'				:$this->doEdicaoPagamentos(); break;
			case 'listarPagamentos'			:$this->doEdicaoTokensDePagamentos(); break;
			case 'pagamentosMudarStatus'	:$this->doAlterarStatusPagamento(); break;
			case 'certificados'				:$this->doEdicaoCertificados(); break;
			case 'servidores'				:$this->doEdicaoServidores(); break;
			case 'pdf'						:$this->doPdf(); break;
			case 'jpg'						:$this->doJpg(); break;
			default 						:$this->pagina404(); break;
		}
	}
	// ======================= PAGAMENTOS ============================
	protected function doEdicaoPagamentos() {
		$editarPagseguro = intval($this->system->input['editarPagseguro']);
		$editarPaypal = intval($this->system->input['editarPaypal']);
		//Pagseguro
		if ($editarPagseguro) {
			$erro_msg = $this->validarDadosPagamentos();
			
			if ($erro_msg) {
				$this->system->view->assign('msg_alert', $erro_msg['msg']);
				$this->system->view->assign('pagseguro', $this->system->input);
			} 
			else {
				$this->system->configuracoesgerais->atualizarPagamentos($this->system->input);
				$this->system->view->assign('msg_alert', 'Pagseguro atualizado com sucesso!');
				$this->system->view->assign('pagseguro', $this->system->input);
			}
		} 
		else {
		    $this->system->view->assign('pagseguro', $this->system->configuracoesgerais->getPagseguro());
		}
		//Paypal
		if ($editarPaypal) {
			$erro_msg = $this->validarDadosPagamentos();			
			if ($erro_msg) {
				$this->system->view->assign('msg_alert', $erro_msg['msg']);
				$this->system->view->assign('paypal', $this->system->input);
			} 
			else {
				$this->system->configuracoesgerais->atualizarPagamentos($this->system->input);
				$this->system->view->assign('msg_alert', 'PayPal atualizado com sucesso!');
				$this->system->view->assign('paypal', $this->system->input);
			}
		} 
		else {
		    $this->system->view->assign('paypal', $this->system->configuracoesgerais->getPayPal());
		}
		$this->system->admin->topo('configuracoes', 'configuracoesgerais-pagamentos');
		$this->system->view->display('instituicao/configuracao_pagamento.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================

	protected function doEdicaoTokensDePagamentos() {
		$editar = $this->system->input['editar'];
		if ($editar) {
			$this->system->configuracoesgerais->atualizarTokenDePagamento($this->system->input);
			$this->system->view->assign('msg_alert', 'Token de pagamento atualizado com sucesso!');
			$this->system->view->assign('pagamento', $this->system->configuracoesgerais->getConfiguracaoDePagamento());
		} 
		else {
			$this->system->view->assign('pagamento', $this->system->configuracoesgerais->getConfiguracaoDePagamento());
		} 
		$this->system->admin->topo('configuracoes','configuracoesgerais-pagamentos');
		$this->system->view->display('professor/configuracoes_pagamentos.tpl');
		$this->system->admin->rodape();
	}

	// ================================================================
	private function validarDadosPagamentos() {
		//Pagseguro
		if ($this->system->input['editarPagseguro']) {
	        if ($this->system->input['pagseguro_email'] == '')
	        	$retorno['msg'][] = "O campo E-mail de Cadastro deve ser preenchido";
	        elseif(!$this->system->func->checkEmail($this->system->input['pagseguro_email']))
        		$retorno['msg'][] = "O campo E-mail é inválido";
	       	if ($this->system->input['pagseguro_token'] == '')
	        	$retorno['msg'][] = "O campo Token de Segurança deve ser preenchido";
	    }
	    //Paypal
	    if ($this->system->input['editarPaypal']) {
	        if ($this->system->input['paypal_usuario'] == '')
	        	$retorno['msg'][] = "O campo Usuário deve ser preenchido";
	        if ($this->system->input['paypal_assinatura'] == '')
	        	$retorno['msg'][] = "O campo Assinatura deve ser preenchido";
	    }
		if (count($retorno) > 0)
		   $retorno['msg'] = implode("<br/>",$retorno['msg']);
        return $retorno;
	}
	// ===============================================================
	private function doAlterarStatusPagamento() {
		$this->system->configuracoesgerais->atualizarStatusPagamentos($this->system->input);
		echo "<script>location.reload();</script>";
	}
	// ======================= CERTIFICADOS ==========================
	private function doEdicaoCertificados() {
		$editarPorcentagem = intval($this->system->input['editarPorcentagem']);
		$editarModelo = intval($this->system->input['editarModelo']);
		//Porcentagem
		if ($editarPorcentagem) {
			$erro_msg = $this->validarDadosCertificados();	
			if ($erro_msg) {
				$this->system->view->assign('msg_alert', $erro_msg['msg']);
				$this->system->view->assign('porcentagem', $this->system->input);
			} 
			else {
				$this->system->configuracoesgerais->atualizarCertificados($this->system->input);
				$this->system->view->assign('msg_alert', 'Porcentagem atualizada com sucesso!');
				$this->system->view->assign('porcentagem', $this->system->input);
			}
		} 
		else {
		    $this->system->view->assign('porcentagem', $this->system->configuracoesgerais->getCertificadoPorcentagem());
		}
		//Modelo
		if ($editarModelo) {
			$erro_msg = $this->validarDadosCertificados();	
			if ($erro_msg) {
				$this->system->view->assign('msg_alert', $erro_msg['msg']);
				$this->system->view->assign('modelo', $this->system->input);
			} 
			else {
				//IMG Modelo
				if (is_uploaded_file($_FILES['imagem']['tmp_name'])) {
					$extensao = end(explode('.', $_FILES['imagem']['name']));
					$nomearquivo = 'certificado_modelo.' . $extensao;
					if (file_exists($this->system->getUploadPath() . '/certificados/' . $nomearquivo))
						unlink($this->system->getUploadPath() . '/certificados/' . $nomearquivo);
					copy($_FILES['imagem']['tmp_name'], $this->system->getUploadPath() . '/certificados/' . $nomearquivo);
					$this->system->configuracoesgerais->atualizarCertificados(array('certificado_modelo' => $nomearquivo));
				}
				$this->system->view->assign('msg_alert', 'Modelo atualizado com sucesso!');
				$this->system->view->assign('modelo', array('certificado_modelo' => $nomearquivo));
			}
		} 
		else {
		    $this->system->view->assign('modelo', $this->system->configuracoesgerais->getCertificadoModelo());
		}
		$this->system->admin->topo(12);
		$this->system->view->display('administrador-geral/configuracoes_certificado.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	private function validarDadosCertificados() {
		//Porcentagem
		if ($this->system->input['editarPorcentagem']) {
	        if ($this->system->input['certificado_porcentagem'] == '')
	        	$retorno['msg'][] = "O campo porcetagem deve ser preenchido";
	        elseif (intval($this->system->input['certificado_porcentagem']) == 0) 
	        	$retorno['msg'][] = "O campo porcetagem deve ser um número maior que 0";
	    }
	    //Modelo
		if ($this->system->input['editarModelo']) {
			if ($_FILES['imagem']['size'] == 0)
				$retorno['msg'][] = 'Selecione uma imagem';
	        elseif (is_uploaded_file($_FILES['imagem']['tmp_name'])) {
				$extensao = end(explode('.', $_FILES['imagem']['name']));
				if (in_array($extensao, array('jpg', 'jpeg', 'gif', 'png'))) {
					if ($_FILES['imagem']['size'] > 2097152) {
						$retorno['msg'][] = 'A Imagem do destaque está com mais de 2mb';
					}
				} 
				else {
					$retorno['msg'][] = 'Formato de Imagem do destaque inválido';
				}
			} 
	    }
		if (count($retorno) > 0)
		   $retorno['msg'] = implode("<br/>",$retorno['msg']);
        return $retorno;
	}
	// ======================= SERVIDORES ==========================
	protected function doEdicaoServidores() {
		$editar = intval($this->system->input['editar']);
		//Servidor
		if ($editar) {
			$this->system->configuracoesgerais->atualizarServidor($this->system->input);
			$this->system->view->assign('msg_alert', 'Servidor atualizado com sucesso!');
			$this->system->view->assign('servidor', $this->system->input);
		} 
		else {
			$this->system->view->assign('servidor', $this->system->configuracoesgerais->getServidor());
		}
		$this->system->admin->topo('configuracoes','configuracoesgerais-servidores');
		$this->system->view->display('global/configuracoes_servidores.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	private function doPdf() {
		$this->system->func->htmlToPdf($this->getHtml());
	}
	// ===============================================================
	private function doJpg() {
		$this->system->func->htmlToJpg($this->getHtml());
	}
	// ===============================================================
	private function getHtml() {
		$html = "<html>
					<body>Teste</body>
				</html>";
		return $html;
	}
}
// ===================================================================
