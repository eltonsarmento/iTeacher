<?php
// ===================================================================
class ContasDAO {
	// ===============================================================
	protected $system = null;
	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();		
	}
	// ===============================================================
	public function cadastrar($input) {
		$this->system->sql->insert('contas_bancarias', array(
			'sistema_id'			=> $this->system->getSistemaID(),
        	'nome' 					=> $input['nome'],
        	'agencia'				=> $input['agencia'],
        	'conta'					=> $input['conta'],
        	'tipo'					=> $input['tipo'],
        	'data_cadastro'			=> date('Y-m-d H:i:s'),
        	'excluido'		=> 0
        ));
        return $this->system->sql->nextid();
	}
	// ===============================================================
	public function atualizar($input) {
		$this->system->sql->update('planos', array(
        	'plano' 	=> $input['plano'],
        	'meses'		=> $input['meses'],
        	'valor'		=> $input['valor'],
        	'descricao'	=> $input['descricao'],
        	'status'	=> $input['status'],
        	'excluido'	=> 0
        ),
		"id='" . $input['id'] . "' and sistema_id='" . $this->system->getSistemaID() . "'");
		return $input['id'];
	}
	// ===============================================================
	public function getContas($palavra = '', $limit = '', $order = 'nome') {
		$query = $this->system->sql->select('*', 'contas_bancarias', "excluido='0' " . ($palavra ? " and plano like '%" . $palavra . "%'" : '') . " and sistema_id='" . $this->system->getSistemaID() . "'", $limit, $order);
		return $this->system->sql->fetchrowset($query);
	}
	
	// ===============================================================
	public function getConta($id) {
		$query = $this->system->sql->select('*', 'contas_bancarias', "excluido='0' and id= '" . $id . "' and sistema_id='" . $this->system->getSistemaID() . "'");
		$plano = $this->system->sql->fetchrowset($query);
		return $plano[0];
	}
	// ===============================================================
	public function deletar($id) {
	 	$this->system->sql->update('contas_bancarias', array('excluido' => 1), "id='" . $id . "' and sistema_id='" . $this->system->getSistemaID() . "'");
	}
	// ===============================================================
	public function atualizarDocumento($id, $documento, $campo) {
		$this->system->sql->update('contas_bancarias', array($campo => $documento), "id='" . $id . "' and sistema_id='" . $this->system->getSistemaID() . "'");
	}
	// ===============================================================
	public function atualizaObservacao($id, $observacao) {
		$this->system->sql->update('contas_bancarias', array('observacao' => $observacao), "id='" . $id . "' and sistema_id='" . $this->system->getSistemaID() . "'");
	}
}
// ===================================================================