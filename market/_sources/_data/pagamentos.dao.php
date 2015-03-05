<?php

// ===================================================================
class PagamentosDAO {
	// ===============================================================
	protected $system = null;
	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();
		$this->system->load->model('email_model');		
	}
	// ===============================================================
	public function cadastrar($input) {
		$this->system->sql->insert('professores_pagamentos', array(
			'professor_id'		=> intval($input['professor_id']),
			'mes_faturado'		=> trim($input['mes_faturado']),
			'sistema_id'		=> $this->system->getSistemaID(),
			'valor'				=> $input['valor'],
			'data_pagamento'	=> '0000-00-00',
			'status'			=> '0',
			'observacoes'		=> '',
			'comprovante'		=> '',
			'data_cadastro'		=> date('Y-m-d H:i:s'),
			'excluido'			=> 0
		));
	}
	// ===============================================================
	public function atualizar($campos, $where) {
		$this->system->sql->update('professores_pagamentos', $campos, $where);
	}
	// ===============================================================
	public function getPagamentos($campos = '') {
		return $this->system->sql->fetchrowset($this->system->sql->select('t1.*, t2.nome, t2.email', 'professores_pagamentos as t1 left join usuarios as t2 on (t1.professor_id=t2.id)', "t1.excluido='0' and t1.sistema_id = '" . $this->system->getSistemaID() . "' " . $campos, 0, 't2.nome ASC'));
	}
	// ===============================================================
	public function getPagamento($campos) {
		return end($this->getPagamentos($campos));
	}
	// ===============================================================
	public function atualizaObservacao($id, $observacao) {
		$this->system->sql->update('professores_pagamentos', array('observacoes' => $observacao), "id='" . $id . "'");
	}
	// ===============================================================
	public function atualizaComprovante($id, $comprovante) {
		$dados = $this->getPagamento(' and t1.id = ' . $id);
		$this->system->sql->update('professores_pagamentos', array('comprovante' => $comprovante, 'data_pagamento' => date('Y-m-d'), 'status' => 1), "id='" . $id . "'");
		$this->system->email_model->pagamentoRealizadoProfessor($dados['nome'], $dados['email']);
	}
	// ===============================================================
}
// ===================================================================