<?php
// ===================================================================
class ConfiguracoesgeraisDAO {
	// ===============================================================
	private $system = null;
	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();		
	}
	// Pagamentos
	// ===============================================================
	public function atualizarPagamentos($input) {
		$fields = array();
		if (isset($input['pagseguro_status'])) $fields['pagseguro_status'] = $input['pagseguro_status'];
		if (isset($input['pagseguro_email'])) $fields['pagseguro_email'] = $input['pagseguro_email'];
		if (isset($input['pagseguro_token'])) $fields['pagseguro_token'] = $input['pagseguro_token'];
		if (isset($input['paypal_status'])) $fields['paypal_status'] = $input['paypal_status'];
		if (isset($input['paypal_usuario'])) $fields['paypal_usuario'] = $input['paypal_usuario'];
		if (isset($input['paypal_senha']) && $input['paypal_senha'] != '') $fields['paypal_senha'] = $input['paypal_senha'];
		if (isset($input['paypal_assinatura'])) $fields['paypal_assinatura'] = $input['paypal_assinatura'];
		
		$this->system->sql->update('configuracoes_api_pagamentos', $fields);
	}
	// ===============================================================
	public function atualizarStatusPagamentos($input) {
		$fields = array();
		if (isset($input['pagseguro_status'])) $fields['pagseguro_status'] = ($input['pagseguro_status'] ? 0 : 1);
		if (isset($input['paypal_status'])) $fields['paypal_status'] = ($input['paypal_status'] ? 0 : 1);
		
		$this->system->sql->update('configuracoes_api_pagamentos', $fields);
	}
	// ===============================================================
	public function getPagseguro() {
		$query = $this->system->sql->select('pagseguro_status, pagseguro_email, pagseguro_token', 'configuracoes_api_pagamentos', 'sistema_id = ' . $this->system->getSistemaID());	
		return end($this->system->sql->fetchrowset($query));
	}
	// ===============================================================
	public function getPayPal() {
		$query = $this->system->sql->select('paypal_status, paypal_usuario, paypal_senha, paypal_assinatura', 'configuracoes_api_pagamentos',  'sistema_id = ' . $this->system->getSistemaID());	
		return end($this->system->sql->fetchrowset($query));
	}
	// Certificados
	// ===============================================================
	public function atualizarCertificado($input) {
		$this->system->sql->update('configuracoes_certificados', array(
        	'titulo' 				=> $input['titulo'],
            'texto'					=> $input['texto'],
            'autenticacao'			=> $input['autenticacao'],
            'percentual_conclusao'	=> $input['percentual_conclusao']
        ),
		"id='" . $input['id'] . "' and sistema_id = '".$this->system->getSistemaID()."'");
	}
	// ===============================================================
	public function cadastrarCertificado($input){
		$this->system->sql->insert('configuracoes_certificados', array(
            'sistema_id'			=> $this->system->getSistemaID(),
			'titulo' 				=> $input['titulo'],
            'texto'					=> $input['texto'],
            'autenticacao'			=> $input['autenticacao'],
            'percentual_conclusao'	=> $input['percentual_conclusao']
		));
        return $this->system->sql->nextid();
	}

	// ===============================================================
	public function getCertificadoCompleto(){
		$query = $this->system->sql->select('*', 'configuracoes_certificados', 'sistema_id = '.$this->system->getSistemaID().'');	
		return end($this->system->sql->fetchrowset($query));
	}

	// ===============================================================
	public function atualizarAssinatura($id, $imagem) {
		$this->system->sql->update('configuracoes_certificados', array('img_assinatura' => $imagem), "id='" . $id . "' and sistema_id = '".$this->system->getSistemaID()."'");
	}
	// ===============================================================
	public function atualizarModelo($id, $imagem) {
		$this->system->sql->update('configuracoes_certificados', array('modelo' => $imagem), "id='" . $id . "' and sistema_id = '".$this->system->getSistemaID()."'");
	}
	
	// ===============================================================
	public function getCertificadoPorcentagem() {
		$query = $this->system->sql->select('percentual_conclusao', 'configuracoes_certificados', " sistema_id = '".$this->system->getSistemaID()."'");	
		return end($this->system->sql->fetchrowset($query));
	}
	// ===============================================================
	public function getCertificadoModelo() {
		$query = $this->system->sql->select('certificado_modelo', 'configuracoes_gerais');	
		return end($this->system->sql->fetchrowset($query));
	}
	// Servidor
	// ===============================================================
	public function atualizarServidor($input) {
		$query = $this->system->sql->select('sistema_id', 'configuracoes_gerais', "sistema_id = '" . $this->system->getSistemaID() . "'");	
		$sistema_id =  end($this->system->sql->fetchrowset($query));
		if(empty($sistema_id)){
			$this->system->sql->insert('configuracoes_gerais', array(
	            'sistema_id'			=> $this->system->getSistemaID(),
				'servidor_padrao' 		=> $input['servidor_padrao']
			));
		}else{
			$fields = array();
			if (isset($input['servidor_padrao'])) $fields['servidor_padrao'] = intval($input['servidor_padrao']);
		
			$this->system->sql->update('configuracoes_gerais', $fields,"sistema_id = '".$this->system->getSistemaID()."'");
		}
	}
	// ===============================================================
	public function getServidor($sistemaID = '',$portal = false) {		
		if($sistemaID == ''){
			$sistemaID = $this->system->getSistemaID();
		}
		$query = $this->system->sql->select('servidor_padrao', 'configuracoes_gerais', "sistema_id = '" . $sistemaID. "'");	
		return end($this->system->sql->fetchrowset($query));
		
	}	

	//================================================================

	public function getConfiguracaoDePagamento(){
		$query = $this->system->sql->select('pagseguro_status, paypal_status', 'configuracoes_api_pagamentos', "sistema_id = '" . $this->system->getSistemaID() . "'");	
		return current($this->system->sql->fetchrowset($query));	
	}

	//==================================================================
	public function atualizarTokenDePagamento($input){
		 $this->system->sql->update('configuracoes_api_pagamentos', array(
            'pagseguro_status'  => trim($input['pagamento_pagseguro']),
            'paypal_status' => trim($input['pagamento_paypal'])
            
        ),
        "sistema_id='" . $this->system->getSistemaID() . "'");

	}

	//==================================================================
}
// ===================================================================