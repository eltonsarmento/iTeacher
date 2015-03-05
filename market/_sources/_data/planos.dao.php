<?php
// ===================================================================
class PlanosDAO {
	// ===============================================================
	protected $system = null;
	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();		
	}
	// ===============================================================
	public function cadastrar($input) {
		$this->system->sql->insert('planos', array(
			'sistema_id'	=> $this->system->getSistemaID(),
        	'plano' 		=> $input['plano'],
        	'meses'			=> ($input['meses'] != "" ? $input['meses'] : 0),
        	'valor'			=> $input['valor'],
        	'descricao'		=> $input['descricao'],
        	'status'		=> $input['status'],
        	'qtd_alunos'	=> $input['qtd_alunos'],
        	'tipo'			=> $input['tipo'],
        	'imagem_arquivo'=> "",
        	'excluido'		=> 0
        ));
        return $this->system->sql->nextid();
	}
	// ===============================================================
	public function atualizar($input) {
		$this->system->sql->update('planos', array(
        	'plano' 		=> $input['plano'],
        	'meses'			=> $input['meses'],
        	'valor'			=> $input['valor'],
        	'descricao'		=> $input['descricao'],
        	'status'		=> $input['status'],
        	'qtd_alunos'	=> $input['qtd_alunos'],
        	'tipo'			=> $input['tipo'],
        	'imagem_arquivo'=> "",
        	'excluido'	=> 0
        ),
		"id='" . $input['id'] . "' and sistema_id='" . $this->system->getSistemaID() . "'");
		return $input['id'];
	}
	// ===============================================================
	public function getPlanos($palavra = '', $limit = '', $order = 'plano', $tipo = '') {
		$query = $this->system->sql->select('*', 'planos', "excluido='0' and tipo = '" . $tipo . "' " . ($palavra ? " and plano like '%" . $palavra . "%'" : '') . " and sistema_id='" . $this->system->getSistemaID() . "'", $limit, $order);
		return $this->system->sql->fetchrowset($query);
	}
	// ===============================================================
	public function getPlanosCondicao($where = '', $limit = '', $order = 'plano', $campos = '*') {
		$query = $this->system->sql->select($campos, 'planos', "excluido='0' " . $where . " and sistema_id='" . $this->system->getSistemaID() . "'", $limit, $order);
		return $this->system->sql->fetchrowset($query);
	}
	// ===============================================================
	public function getPlano($id) {
		$query = $this->system->sql->select('*', 'planos', "excluido='0' and id= '" . $id . "' and sistema_id='" . $this->system->getSistemaID() . "'");
		$plano = $this->system->sql->fetchrowset($query);
		return $plano[0];
	}
	// ===============================================================
	public function deletar($id) {
	 	$this->system->sql->update('planos', array('excluido' => 1), "id='" . $id . "' and sistema_id='" . $this->system->getSistemaID() . "'");
	}
	// ===============================================================
	public function atualizarImagem($id, $imagem) {
		$this->system->sql->update('planos', array('imagem_arquivo' => $imagem), "id='" . $id . "' and sistema_id='" . $this->system->getSistemaID() . "'");
	}
	// ===============================================================
    public function verificaAssinaturaAtiva($campos) {
        return $this->system->sql->fetchrowset($this->system->sql->select('*', 'planos_alunos', "excluido = 0 and data_expiracao >= '" . date('Y-m-d') . "' and sistema_id='" . $this->system->getSistemaID() . "' " . $campos));
    }
    //===============================================================
	public function cadastrarPlanoAluno($plano, $usuario_id, $assinatura_id, $expiracao) {
		$this->system->sql->insert('planos_alunos', array(
				'sistema_id=' 	=> $this->system->getSistemaID(),
				'usuario_id' 	=> $usuario_id,
				'plano_id' 		=> $plano,
				'assinatura_id' => $assinatura_id,
				'data_expiracao'=> $expiracao,
				'data_cadastro'	=> date('Y-m-d'),
				'data_periodo'	=> date('Y-m-d'),
				'excluido' 		=> 0
		));
		return $this->system->sql->nextid();
	}
	//===============================================================
	public function atualizarPlanoAluno($id, $campos) {
		$this->system->sql->update('planos_alunos', $campos, 'id = ' . $id . ' and sistema_id = ' . $this->system->getSistemaID());
	}
	// ===============================================================
	public function buscarPlanosRenovar() {
		return $this->system->sql->fetchrowset($this->system->sql->select('*', 'planos_alunos', "excluido = 0 and data_expiracao < '" . date('Y-m-d') . "' and renovar = 1 and sistema_id='" . $this->system->getSistemaID() . "'"));
	}
	// ===============================================================
	public function desativarAssinatura($id) {
		$this->system->sql->update('planos_alunos', array('excluido' => 1), "id='" . $id . "' and sistema_id='" . $this->system->getSistemaID() . "'");
	}
	// ===============================================================
	public function renovarAssinatura($id, $data_expiracao) {
		$this->system->sql->update('planos_alunos', array(
            'data_expiracao' 	=> $data_expiracao,
            'data_periodo'		=> date('Y-m-d')),
			"id='" . $id . "' and sistema_id='" . $this->system->getSistemaID() . "'");
	}
	// ===============================================================
	public function renovarCursoPlano($id, $data_expiracao) {
		$this->system->sql->update('cursos_alunos', array('expira' => $data_expiracao), "id='" . $id . "' and sistema_id='" . $this->system->getSistemaID() . "'");
	}
	// ===============================================================
	public function getCursoPlano($usuario_id, $dataExpiracao = true) {
		return end($this->system->sql->fetchrowset($this->system->sql->select('c.*', 'planos_alunos p, cursos_alunos c', "p.excluido = 0 and c.id = p.curso_id " . ($dataExpiracao ? " and p.data_expiracao >= '" . date('Y-m-d') . "' " : "") . ' and sistema_id=' . $this->system->getSistemaID())));
	}
	// ===============================================================
	public function alterarCurso($id, $curso_id) {
		$this->system->sql->update('planos_alunos', array('curso_id' => $curso_id), "id='" . $id . "' and sistema_id='" . $this->system->getSistemaID() . "'");
	}
	// ===============================================================
	public function getPlanoAluno($campo = '') {
		return end($this->system->sql->fetchrowset($this->system->sql->select('*', 'planos_alunos', "excluido = 0 " . $campo . " and sistema_id='" . $this->system->getSistemaID() . "'")));	
	}
	// ===============================================================
	public function getPlanosAluno($campo = '') {
		return $this->system->sql->fetchrowset($this->system->sql->select('*', 'planos_alunos', $campo . "and sistema_id='" . $this->system->getSistemaID() . "'"));	
	}
	// ===============================================================
	public function getCodePagSeguro($assinaturaID) {
		$venda = end($this->system->sql->fetchrowset($this->system->sql->select('codePagSeguro', 'vendas', "id IN (SELECT assinatura_id FROM planos_alunos WHERE id = '" . $assinaturaID . "' and sistema_id='" . $this->system->getSistemaID() . "')")));	
		return ($venda['codePagSeguro'] ? $venda['codePagSeguro'] : null);
	}
	// ===============================================================
}
// ===================================================================