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
		$this->system->sql->insert('sistemas', array(
			'nome' 			=> $input['nome'],
			'tipo_sistema'	=> $input['tipo_sistema'],
			'data_cadastro'     => date('Y-m-d H:i:s'),
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
			'servidor_padrao' 		=> 2,
			'sistema_id'			=> $sistemaID
		));

		//Configurações de Email
		$this->system->sql->insert('configuracoes_gerais_email', array(
			'sistema_id'			=> $sistemaID
		));
	
		//Professor
		if ($input['tipo_sistema']) {
			$this->system->sql->insert('professor_saldo', array(
				'sistema_id'			=> $sistemaID,
				'disponivel'			=> 0,
				'receber'				=> 0,
				'bloqueado'				=> 0,
			));
		}

		return $sistemaID;
	}
	// ===============================================================
	public function getResponsavelSistema($sistemaID) {
		$sistema = end($this->system->sql->fetchrowset($this->system->sql->select('*', 'sistemas', 'id = ' . $sistemaID)));
		
		if ($sistema['id']) {
			if ($sistema['tipo_sistema'] == 1) //professor autonomo
				return end($this->system->sql->fetchrowset($this->system->sql->select('*', 'usuarios', 'sistema_id = ' . $sistemaID . ' and nivel = 3')));
			else //Instituição
				return end($this->system->sql->fetchrowset($this->system->sql->select('*', 'usuarios', 'sistema_id = ' . $sistemaID . ' and nivel = 5')));
		
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
}
// ===================================================================