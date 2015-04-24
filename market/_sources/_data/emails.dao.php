<?php

// ===================================================================
class EmailsDAO {
	// ===============================================================
	protected $system = null;
	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();		
	}
	// ===============================================================
	public function getValorPorId($id) {
		return $this->system->sql->querycountunit($this->system->sql->select('valor', 'configuracoes_emails', "tipo_id= '" . $id . "' and sistema_id = '" . $this->system->getSistemaID() . "'"));
	}
	// ===============================================================
	public function salvarValorPorId($id, $valor) {
		if (!$this->system->sql->querycountunit($this->system->sql->select('tipo_id', 'configuracoes_emails', "tipo_id= '" . $id . "' and sistema_id = '" . $this->system->getSistemaID() . "'")))
			$this->system->sql->insert('configuracoes_emails', array('tipo_id' => $id, 'valor' => $valor, 'sistema_id' => $this->system->getSistemaID()));
		$this->system->sql->update('configuracoes_emails', array('valor' => $valor), "tipo_id='" . $id . "' and sistema_id = '" . $this->system->getSistemaID() . "'");
	}
	// ===============================================================
}
// ===================================================================