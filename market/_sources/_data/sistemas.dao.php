<?php
// ===================================================================
class SistemasDAO {
	// ===============================================================
	protected $system = null;
	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();		
	}
	// ===============================================================
	public function cadastrar($input) {	

		$dominio = ($input['dominio'] ? trim(str_replace(' ','_',$this->system->func->removeAcentos($input['dominio']))) : trim(str_replace(' ','_',$this->system->func->removeAcentos($input['nome']))));
		$this->system->sql->insert('sistemas', array(
			'nome'              => "Sistema - ". trim($input['nome']),
			'tipo_sistema'	=> $input['tipo_sistema'],
			'dominio'       => $dominio,
			'data_cadastro' => date('Y-m-d H:i:s'),
			'excluido'          => 0
		));
		$sistemaID = $this->system->sql->nextid();

		//Formas de Pagamento
		$this->system->sql->insert('configuracoes_api_pagamentos', array(
			'pagseguro_status' 		=> 0,			
			'paypal_status'			=> 0,
			'sistema_id'			=> $sistemaID
		));

		//Servidor Padrão
		$this->system->sql->insert('configuracoes_gerais', array(
			'servidor_padrao' 			=> 2,
			'certificado_porcentagem' 	=> 0,
			'sistema_id'				=> $sistemaID
		));

		//Configurações de Email
		$this->system->sql->insert('configuracoes_gerais_email', array(
			'sistema_id'			=> $sistemaID
		));
		

		//Professor
		if ($input['tipo_sistema'] == 1) {
			$this->system->sql->insert('professor_saldo', array(
				'sistema_id'			=> $sistemaID,
				'disponivel'			=> 0,
				'receber'				=> 0,
				'bloqueado'				=> 0,
			));

			$this->system->sql->insert('configuracoes_pagamentos_professor', array(
				'sistema_id'			=> $sistemaID
			));
		}elseif ($input['tipo_sistema'] == 2) {
			$this->system->sql->insert('instituicoes_pagamentos', array(
	            'sistema_id'        => $sistemaID,
	            'data_pagamento'    => date('Y-m-d', strtotime('+30 days', strtotime(date('Y-m-d')))),
	            'status'            => 5,
	            'excluido'          => 0
        	));
		}

		return $sistemaID;
	}
	// ===============================================================
	public function getResponsavelSistema($sistemaID) {		
		$sistema = end($this->system->sql->fetchrowset($this->system->sql->select('*', 'sistemas', 'id = ' . $sistemaID)));			
		if ($sistema['id']) {	
			if ($sistema['tipo_sistema'] == 1) //professor autonomo
				return end($this->system->sql->fetchrowset($this->system->sql->select('*', 'usuarios', 'sistema_id = ' . $sistema['id'] . ' and nivel = 3')));
			else //Instituição
				return end($this->system->sql->fetchrowset($this->system->sql->select('*', 'usuarios', 'sistema_id = ' . $sistema['id'] . ' and nivel = 5')));
		
		}
		return array();
	}
	// ===============================================================
	public function getSistema($sistemaID) {
		return end($this->system->sql->fetchrowset($this->system->sql->select('*', 'sistemas', 'id = ' . $sistemaID)));
	}
	// ===============================================================
	public function getSistemaByDominio($dominio) {
		return end($this->system->sql->fetchrowset($this->system->sql->select('*', 'sistemas', 'dominio = "' . $dominio . '"')));
	}
	// ===============================================================
	public function getSistemaAdmin() {
		return end($this->system->sql->fetchrowset($this->system->sql->select('*', 'sistemas', 'tipo_sistema = 3')));
	}	
}
// ===================================================================