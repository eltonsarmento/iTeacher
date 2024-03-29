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
        	'sistema_id' => $this->system->getSistemaID(),
        	'plano' 	 => $input['plano'],
        	'meses'		 => ($input['meses'] ? $input['meses'] : 0),
        	'qtd_alunos' => ($input['qtd_alunos'] ? $input['qtd_alunos'] : 0),
        	'valor'		 => $input['valor'],
        	'descricao'	 => $input['descricao'],
        	'status'	 => $input['status'],
        	'codigoPlanoPagarme' => ($input['codigoPlanoPagarme'] ? $input['codigoPlanoPagarme'] : 0),
        	'imagem_arquivo' 	=> "",
        	'excluido'	=> 0
        ));
        return $this->system->sql->nextid();
		
	}
	// ===============================================================
	public function atualizar($input) {
		$this->system->sql->update('planos', array(
        	'plano' 	=> $input['plano'],
        	'meses'		 => ($input['meses'] ? $input['meses'] : 0),
        	'qtd_alunos' => ($input['qtd_alunos'] ? $input['qtd_alunos'] : 0),
        	'valor'		=> $input['valor'],
        	'descricao'	=> $input['descricao'],
        	'status'	=> $input['status'],
        	'imagem_arquivo' 	=> "",
        	'excluido'	=> 0
        ),
		"id='" . $input['id'] . "'");
	}
	// ===============================================================
	public function getPlanos($palavra = '', $limit = '', $order = 'plano') {

		$query = $this->system->sql->select('*', 'planos', "excluido='0' and sistema_id = '".$this->system->getSistemaID()."' " . ($palavra ? " and plano like '%" . $palavra . "%'" : ''), $limit, $order);
		$planos =  $this->system->sql->fetchrowset($query);
		return $planos;
	}
	// ===============================================================
	public function getPlanosCondicao($where = '', $limit = '', $order = 'plano', $campos = '*') {
		$query = $this->system->sql->select($campos, 'planos', "excluido='0' " . $where, $limit, $order);
		$planos =  $this->system->sql->fetchrowset($query);
		return $planos;
	}
	// ===============================================================
	public function getPlanosRelatorio($sqlExtra) {
		$query = $this->system->sql->select('p.id, p.plano, COUNT(u.id) AS "quantidade",  COUNT(u.id) * p.valor AS "total"',
		'planos p INNER JOIN planos_alunos pa ON  (p.id = pa.plano_id) INNER JOIN usuarios u ON  (pa.usuario_id = u.id)',
		 "p.excluido = 0 AND p.sistema_id = '".$this->system->getSistemaID()."' ".($sqlExtra ? $sqlExtra : ''), $limit, "p.plano");
		$planos =  $this->system->sql->fetchrowset($query);
		if($planos[0]['id'] == ""){
			return array();
		}else{
			foreach ($planos as $key => $plano) {			
				if($plano['id']){
					$usuarios =  $this->getUsuariosByPlano($plano['id']);
					$planos[$key]['usuarios'] = $usuarios;	
				}
				
			}	
		}
		return $planos;
	}
	// ===============================================================
	public function getUsuariosByPlano($plano_id) {
		$query = $this->system->sql->select('u.nome,u.email',
				'planos p INNER JOIN planos_alunos pa ON  (p.id = pa.plano_id) INNER JOIN usuarios u ON  (pa.usuario_id = u.id)',
	 			"p.excluido = 0 AND p.sistema_id ='".$this->system->getSistemaID()."' and p.id = ".$plano_id, $limit, "u.nome");
		$usuarios =  $this->system->sql->fetchrowset($query);		

		return $usuarios;
	}

	// ===============================================================
	public function getPlano($id) {
		$query = $this->system->sql->select('*', 'planos', "excluido='0' and id= '" . $id . "'");
		$plano =  $this->system->sql->fetchrowset($query);
		return $plano[0];
	}
	// ===============================================================
	public function deletar($id) {
	 	$this->system->sql->update('planos', array(
             'excluido' 	=> 1),
	 	"id='" . $id . "'");
	}
	// ===============================================================
	public function atualizarImagem($id, $imagem) {
		$this->system->sql->update('planos', array(
             'imagem_arquivo' 	=> $imagem
        ),	"id='" . $id . "'");
	}
	// ===============================================================
    public function verificaAssinaturaAtiva($campos) {
        return $this->system->sql->fetchrowset($this->system->sql->select('*', 'planos_alunos', "excluido = 0 and data_expiracao >= '" . date('Y-m-d') . "' " . $campos));
    }
    // ===============================================================
    public function verficaAssinaturaPremium($campos) {
    	return end($this->system->sql->fetchrowset($this->system->sql->select('count(1) qtd', 'planos_alunos', "plano_id = 20 and excluido = 0 " . $campos)));
    }
    //===============================================================
	public function cadastrarPlanoAluno($plano, $usuario_id, $assinatura_id, $expiracao) {
		$this->system->sql->insert('planos_alunos', array(
				'usuario_id' 	=> $usuario_id,
				'plano_id' 		=> $plano,
				'assinatura_id' => $assinatura_id,
				'data_expiracao'=> $expiracao,				
				'data_cadastro'	=> date('Y-m-d'),
				'data_periodo'	=> date('Y-m-d'),
				'excluido' 		=> 0
		));
		return true;
	}
	public function atualizarPlanoAluno($id, $campos) {
		$this->system->sql->update('planos_alunos', $campos, 'id = ' . $id);
	}
	// ===============================================================
	public function buscarPlanosRenovar() {
		return $this->system->sql->fetchrowset($this->system->sql->select('*', 'planos_alunos', "excluido = 0 and data_expiracao < '" . date('Y-m-d') . "' and renovar = 1"));	
	}
	// ===============================================================
	public function desativarAssinatura($id) {
		$this->system->sql->update('planos_alunos', array(
             'excluido' 	=> 1),
	 	"id='" . $id . "'");
	}
	// ===============================================================
	public function renovarAssinatura($id, $data_expiracao) {
		$this->system->sql->update('planos_alunos', array(
             'data_expiracao' 	=> $data_expiracao,
             'data_periodo'	=> date('Y-m-d'),
             'excluido' 		=> 0
        ),
	 	"id='" . $id . "'");
	}
	// ===============================================================
	public function renovarCursoPlano($id, $data_expiracao) {
		$this->system->sql->update('cursos_alunos', array(
             'expira' 		=> $data_expiracao,
        ),
	 	"id='" . $id . "'");
	}
	// ===============================================================
	public function getCursoPlano($usuario_id, $dataExpiracao = true) {
		return end($this->system->sql->fetchrowset($this->system->sql->select('c.*', 'planos_alunos p, cursos_alunos c', "p.excluido = 0 and c.id = p.curso_id " . ($dataExpiracao ? " and p.data_expiracao >= '" . date('Y-m-d') . "' " : ""))));
	}
	// ===============================================================
	public function alterarCurso($id, $curso_id) {
		$this->system->sql->update('planos_alunos', array(
             'curso_id' 	=> $curso_id),
	 	"id='" . $id . "'");
	}
	// ===============================================================
	public function getPlanoAluno($campo = '') {
		return end($this->system->sql->fetchrowset($this->system->sql->select('*', 'planos_alunos', "excluido = 0 " . $campo)));	
	}
	// ===============================================================
	public function getPlanosAluno($campo = '') {
		return $this->system->sql->fetchrowset($this->system->sql->select('*', 'planos_alunos', $campo));	
	}
	// ===============================================================
	public function getCodePagSeguro($assinaturaID) {
		$venda = end($this->system->sql->fetchrowset($this->system->sql->select('codePagSeguro', 'vendas', "id IN (SELECT assinatura_id FROM planos_alunos WHERE id = '" . $assinaturaID . "')")));	
		return ($venda['codePagSeguro'] ? $venda['codePagSeguro'] : null);
	}
	// ===============================================================
	public function getCodePagarme($assinaturaID) {
		$venda = end($this->system->sql->fetchrowset($this->system->sql->select('codePagarme', 'vendas', "id IN (SELECT assinatura_id FROM planos_alunos WHERE id = '" . $assinaturaID . "')")));	
		return ($venda['codePagarme'] ? $venda['codePagarme'] : null);
	}
	// ===============================================================
	public function getProximoPlanoByQuantidade($sistema_id,$quantidade) {
		$planos = $this->system->sql->fetchrowset($this->system->sql->select('*', 'planos', "sistema_id = '".$sistema_id."'  AND qtd_alunos > '".$quantidade."'",0," qtd_alunos"));	
		return $planos[0];
	}
	// ===============================================================
	public function getPlanoInstituicao($sistema_id) {
		$plano = end($this->system->sql->fetchrowset($this->system->sql->select('*', 'planos_instituicoes', "sistema_instituicao = '".$sistema_id."'")));	
		return $plano;
	}
	// ===============================================================
	public function cadastrarNovoPlanoInstituicao($sistema_id, $sistema_instituicao, $plano_id) {
		$this->system->sql->insert('planos_instituicoes', array(
				'sistema_id' 		  => $sistema_id,
				'sistema_instituicao' => $sistema_instituicao,
				'plano_id'		      => $plano_id,				
				'data_cadastro'	      => date('Y-m-d'),				
				'excluido' 			  => 0
		));
	}
	// ===============================================================
	public function trancaPlanoInstituicao($id) {
		$this->system->sql->update('planos_instituicoes', array(
				'data_termino'	      => date('Y-m-d'),				
				'excluido' 			  => 1),
		"id='" . $id . "'");
	}
	// ===============================================================
	public function adicionaAlunoExedente($quantidade,$id) {
		$this->system->sql->update('planos_instituicoes', array(
				'alunos_excedentes'	=> $quantidade),							
		"id='" . $id . "'");
	}
}
// ===================================================================