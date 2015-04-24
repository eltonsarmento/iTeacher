<?php
// ===================================================================
class ConfiguracoesEmailGlobal extends AdminModules{
	// ===============================================================
	public function __construct() {
		parent::__construct();
		$this->system->load->dao('configuracoesemail');
		$this->system->load->model('email_model');
	}
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			case 'listar':
			case 'buscar':	$this->doListar(); break;
			case 'novo':
			case 'editar': 	$this->doEdicao(); break;
			case 'apagar': 	$this->doDeletar(); break;
			default: 		$this->pagina404(); break;
		}	
	}
	// ===============================================================
	private function doEdicao() {
		$id = intval($this->system->input['sistema_id']);
		$editarHost = intval($this->system->input['editar_host']);
		$editarRemetente = intval($this->system->input['editar_remetente']);
		$editarModelo = intval($this->system->input['editar_modelo']);
		//verificando se já tem cadastro com esse sistema		
		$id_sistema = $this->system->getSistemaID();
		if ($id_sistema) {
			$configuracoesgerais = $this->system->configuracoesemail->getConfiguracoesGeraisEmail($id_sistema);
			if ($configuracoesgerais){
				$this->system->view->assign('configuracoes_email', $configuracoesgerais);
			}else{
				$this->system->configuracoesemail->cadastrarServidor($this->system->input);
				/*$configuracoesgerais = $this->system->configuracoesemail->getConfiguracoesGeraisEmail($id_sistema);				
				$this->system->view->assign('configuracoes_email', $configuracoesgerais);*/
			}
		}
		//editando o host
		if ($editarHost) {
			
			$erro_msg = $this->validarDadosHost();
			if ($erro_msg) {
				$this->system->view->assign('msg_alert', $erro_msg['msg']);
				$this->system->view->assign('configuracoes_email', $this->system->input);
			} else {
				//Salvar
				if ($id) {					
					$this->system->configuracoesemail->atualizarServidor($this->system->input);
					//$this->system->view->assign('configuracoes_email', $this->system->input);
					$this->system->view->assign('msg_alert', 'Host atualizado com sucesso!');

					if ($this->system->input['testarEmail']){
						$dados['email'] = "elton@kmf.com.br";
						$dados['titulo'] = "email de teste Iteacher";
						$dados['mensagem'] = "Olá, esse é só um e-mail de teste";
						$this->system->email_model->testarEmail($dados);
					}
				}
			}
		} 
		//editando o remetente
		elseif ($editarRemetente) {			
			$erro_msg = $this->validarDadosRemetente();
			if ($erro_msg) {
				$this->system->view->assign('msg_alert', $erro_msg['msg']);
				$this->system->view->assign('configuracoes_email', $this->system->input);
			} 
			else {
				if ($id) {
					$this->system->configuracoesemail->atualizarRemetente($this->system->input);
					//$this->system->view->assign('configuracoes_email', $this->system->input);
					$this->system->view->assign('msg_alert','Remetente atualizado com sucesso!');
				}	
			}
		} 
		//editando o modelo de email
		elseif ($editarModelo) {
			$erro_msg = $this->validarDadosModeloEmail();
			if ($erro_msg) {
			 	$this->system->view->assign('msg_alert', $erro_msg['msg']);
				$this->system->view->assign('configuracoes_email', $this->system->input);
			} 
			else {
				if ($id) {
					$this->system->configuracoesemail->atualizarModelo($this->system->input);
					//$this->system->view->assign('configuracoes_email', $this->system->input);
					$this->system->view->assign('msg_alert','Modelo do email atualizado com sucesso!');
				}
				//Img cabeçalho
				if (is_uploaded_file($_FILES['imagem_cabecalho']['tmp_name'])) {
					$extensao = end(explode('.', $_FILES['imagem_cabecalho']['name']));
					$nomearquivo = 'imagem_cabecalho'.$id . '.' . $extensao;
					if (file_exists($this->system->getUploadPath() . '/configuracoes_email/' . $nomearquivo))
						unlink($this->system->getUploadPath() . '/configuracoes_email/' . $nomearquivo);
					copy($_FILES['imagem_cabecalho']['tmp_name'], $this->system->getUploadPath() . '/configuracoes_email/' . $nomearquivo);
					$this->system->configuracoesemail->atualizarImagem($id, $nomearquivo);
				}
			}
		}
		else {			
			if ($id) 			    
				$this->system->view->assign('configuracoes_email', $this->system->configuracoesemail->getConfiguracoesGeraisEmail($id_sistema));
			//$this->system->view->assign('plano', $this->system->configuracoesemail->getPlano($id));			
		}
		$this->system->admin->topo('configuracoes','configuracoesemails-novo');
		$this->system->view->display('global/configuracao_geral_email_edicao.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	private function validarDadosHost() {
		$retorno = array();
		
    	//host
    	if($this->system->input['host'] == '') 
            $retorno['msg'][] = "O campo Host está vázio.";

        if($this->system->input['SMTPSecure'] == '') 
            $retorno['msg'][] = "O campo SMTP Secure está vázio.";
        //porta
        if($this->system->input['porta'] == '') 
            $retorno['msg'][] = "O campo Porta está vázio.";		
        //senha
        if($this->system->input['senha'] == '') 
            $retorno['msg'][] = "O campo Senha está vázio.";
		if (count($retorno))
		   $retorno['msg'] = implode('<br/>', $retorno['msg']);
        return $retorno;
	}
	//====================================================================

	private function validarDadosRemetente() {
		$retorno = array();
		//nome
		if($this->system->input['nome'] == '')
			$retorno['msg'][] = "O campo Nome está vazio.";
		//email
		if($this->system->input['email'] == '')
			$retorno['msg'][] = "O campo email está vazio.";
		if(count($retorno))
			$retorno['msg'] = implode('<br/>', $retorno['msg']);
		return $retorno;
	}

	//======================================================================
	private function validarDadosModeloEmail() {
		$retorno = array();
		if($this->system->input['texto_rodape'] == '')
			$retorno['msg'][] = "O campo Texto do Rodapé está vazio.";
		//Arquivo destaque
		if (is_uploaded_file($_FILES['imagem_cabecalho']['tmp_name'])) {
			$extensao = end(explode('.', $_FILES['imagem_cabecalho']['name']));
			if (!in_array($extensao, array('jpg', 'gif', 'png'))) {
				$retorno['msg'][] = 'Formato de Imagem do destaque inválido';
			}
		}
	}
	// ===============================================================
	private function doListar() {
		$this->listagem();
		$this->system->admin->topo(8);
		$this->system->view->display('professor/planos_gerenciar.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	private function listagem() {
		$palavra = $this->system->session->getItem('palavra_busca');
		if ($palavra) $this->system->session->deleteItem('palavra_busca');
		$this->system->view->assign('planos', $planos);
		$this->system->view->assign('url_site', $this->system->getUrlSite());
	}
	// ===============================================================
	private function doDeletar() {
		$id = intval($this->system->input['id']);
		if ($plano['id']) {
			$this->system->planos->deletar($plano['id']);
			$this->system->view->assign('msg_alert', 'Plano "' . $plano['plano'] . '" excluído com sucesso!');
		} 
		else {
			$this->system->view->assign('msg_alert', 'Não foi possível excluir esse plano!');	
		}
		$this->doListar();
	}
	// ===============================================================
}
// ===================================================================