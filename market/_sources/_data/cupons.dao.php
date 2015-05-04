<?php
// ===================================================================
class CuponsDAO {
	// ===============================================================
	private $system = null;
	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();		
	}
	// ===============================================================
	public function cadastrar($input) {
		$this->system->sql->insert('cupons', array(
        	'usuario_id'	=> $this->system->session->getItem('session_cod_usuario'),
			'sistema_id'	=> $this->system->getSistemaID(),
        	'nome'			=> trim($input['nome']),
        	'tipo'			=> trim($input['tipo']),
			'tempo_de'		=> (trim($input['tempo_de']) ? trim($this->system->func->converteData($input['tempo_de'])) :'0000-00-00 00:00:00'),
			'tempo_ate'		=> (trim($input['tempo_ate']) ? trim($this->system->func->converteData($input['tempo_ate'])):'0000-00-00 00:00:00'),
			'quantidade'	=> trim($input['quantidade']),
			'tipo_desconto' => (int)$input['tipo_desconto'],
			'ativo'			=> (int)$input['ativo'],
			'valor'			=> trim(number_format($input['valor'], 2, '.', ',')),
			'data_cadastro' => date('Y-m-d H:i:s'),
			'excluido'		=> 0
        ));

        $id = $this->system->sql->nextid();
		
		foreach($input['cursos'] as $curso)
			if ($curso != 0)
				$this->system->sql->insert('cupons_cursos', array('cupom_id' => $id, 'curso_id' => $curso));
			
        return $id;

		
	}
	// ===============================================================
	public function atualizar($input) {		
		$this->system->sql->update('cupons', array(
        	'nome'			=> trim($input['nome']),
        	'tipo'			=> trim($input['tipo']),
			'tempo_de'		=> (trim($input['tempo_de']) ? trim($this->system->func->converteData($input['tempo_de'])) :'0000-00-00 00:00:00'),
			'tempo_ate'		=> (trim($input['tempo_ate']) ? trim($this->system->func->converteData($input['tempo_ate'])):'0000-00-00 00:00:00'),
			'quantidade'	=> trim($input['quantidade']),
			'tipo_desconto' => (int)$input['tipo_desconto'],
			'ativo'			=> (int)$input['ativo'],
			'valor'			=> trim(number_format($input['valor'], 2, '.', ',')),
        ),
		"id='" . (int)$input['id'] . "' and sistema_id='" . $this->system->getSistemaID() . "'");
		$id = (int)$input['id'];

		foreach($input['cursos'] as $curso)
			if ($curso != 0)
				$this->system->sql->insert('cupons_cursos', array('cupom_id' => $id, 'curso_id' => $curso));

		return $id;
	}
	// ===============================================================
	public function getCupons($palavraChave, $order = 'nome', $campos = " t1.excluido='0' and", $palavra = "") {
		
		$cupom = $this->system->sql->fetchrowset($this->system->sql->select('t1.*, t2.nome as usuario', 'cupons as t1 left join usuarios as t2 on (t1.usuario_id=t2.id)', "". $campos ." t1.sistema_id='" . $this->system->getSistemaID() . "' and t2.sistema_id='" . $this->system->getSistemaID() . "'" .  ($palavraChave ? " and t1.nome like '%" . $palavraChave . "%'" : '')), 0, $order);

		return $cupom;
	}
	// ===============================================================
	public function getCupom($id,$sistema_id = '') {
		if($sistema_id =='') $sistema_id = $this->system->getSistemaID();
		$query = $this->system->sql->select('*', 'cupons', "excluido='0' and id= '" . $id . "' and sistema_id='" . $this->system->getSistemaID() . "'");
		$cupom = end($this->system->sql->fetchrowset($query));

		$query = $this->system->sql->select('curso_id', 'cupons_cursos', " cupom_id= '" . $id . "'");
		$cursos = $this->system->sql->fetchrowset($query);

		foreach ($cursos as $key => $curso) {
			$cupom['cursos'][] = $curso['curso_id'];
		}
		
		return $cupom;
	}
	// =============================================================
	public function getCupomCondicao($condicao,$sistema_id = '') {
		//if($sistema_id == '') $sistema_id = $this->system->getSistemaID();
		$query = $this->system->sql->select('*', 'cupons', "excluido='0' ".($sistema_id ? "and sistema_id='" . $sistema_id . "'" : "" ) . $condicao);
		$cupom = $this->system->sql->fetchrowset($query);
		return $cupom[0];
	}
	// ===============================================================
	public function deletar($id) {
		$this->system->sql->update('cupons', array('excluido' => 1), "id='" . $id . "' and sistema_id='" . $this->system->getSistemaID() . "'");
	}
	// ===============================================================
	public function getTotalPedidosComCupom($campos) {
		$query = $this->system->sql->select('COUNT(1)', 'vendas', "excluido = 0 and cupom_id != 0 and sistema_id='" . $this->system->getSistemaID() . "'" . $campos);
		return $this->system->sql->querycountunit($query);
	}
	// ===============================================================
	public function getTotalCupons($campos) {
		$query = $this->system->sql->select('COUNT(1)', 'cupons', "excluido = 0 and sistema_id='" . $this->system->getSistemaID() . "'" . $campos);
		return $this->system->sql->querycountunit($query);
	}
	// ===============================================================
	public function getCuponsMaisUsados($campos) {
		return $this->system->sql->fetchrowset($this->system->sql->select('DISTINCT(t1.cupom_id), t2.nome, COUNT(t1.cupom_id) as total', 'vendas AS t1 LEFT JOIN cupons AS t2 ON (t1.cupom_id=t2.id)', "t1.excluido = 0 AND t2.excluido = 0 and t1.sistema_id='" . $this->system->getSistemaID() . "' ".$campos." GROUP BY t1.cupom_id"));
	}
	// ===============================================================
	public function alterarStatus($id, $status) {
		$this->system->sql->update('cupons', array('ativo' => intval($status)), "id='" . intval($id) . "' and sistema_id='" . $this->system->getSistemaID() . "'");
	}
	// ===============================================================
	public function vezesUsada($id) {
		$query = $this->system->sql->select('COUNT(1)', 'vendas', "excluido = 0 AND cupom_id = '" . $id . "' and sistema_id='" . $this->system->getSistemaID() . "'");
		return $this->system->sql->querycountunit($query);	
	}
	// ===============================================================
	public function relatorioUso($limit = '') {
		$query = $this->system->sql->select('cupom_id, COUNT(id) as total, data_cadastro', 'vendas', "excluido = '0' and cupom_id != '0' and sistema_id='" . $this->system->getSistemaID() . "' GROUP BY cupom_id", $limit, 'data_cadastro');
		$cupons = $this->system->sql->fetchrowset($query);
		foreach($cupons as $key => $cupom) {
			$query = $this->system->sql->select('*', 'cupons', "excluido = '0' AND id = '" . $cupom['cupom_id'] . "' and sistema_id='" . $this->system->getSistemaID() . "'");
			$cupom = end($this->system->sql->fetchrowset($query));
			if ($cupom['id']) {
				$cupons[$key]['nome'] 	= $cupom['nome'];
				$cupons[$key]['ativo'] 	= $cupom['ativo'];
				$cupons[$key]['tipo'] 	= $cupom['tipo'];
			}
		}
		return $cupons;
	}
	// ===============================================================	
	public function consultaUsoCupom($cupom_id) {
		$query = $this->system->sql->select('u.id, u.email', 'vendas v INNER JOIN vendas_cursos vc ON (vc.venda_id = v.id) INNER JOIN cupons c ON (vc.cupom_id = c.id)  
			INNER JOIN usuarios u ON (v.usuario_id = u.id)',"c.id = '".$cupom_id."' AND u.sistema_id='" . $this->system->getSistemaID() . "'");				
		$lista = $this->system->sql->fetchrowset($query);
		foreach ($lista as $key => $item) {
			$consulta[$key]['codigo'] = $item['id'];
			$consulta[$key]['email'] = $item['email'];

		}
		return $consulta;
	}
	// ===============================================================
}
// ===================================================================