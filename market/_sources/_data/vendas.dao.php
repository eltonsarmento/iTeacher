<?php
// ===================================================================
class VendasDAO {
	// ===============================================================
	protected $system = null;
	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();		
	}
	// ===============================================================
	public function cadastrar($input) {
		$numero = end($this->system->sql->fetchrowset($this->system->sql->select('numero', 'vendas', 'sistema_id = ' . $this->system->getSistemaID(), '1', 'id desc')));
		$numero = (intval($numero['numero']) + 1);

		$this->system->sql->insert('vendas', array(
			'sistema_id'		=> $this->system->getSistemaID(),
			'usuario_id'		=> ($input['usuario_id'] ? $input['usuario_id'] : $this->system->session->getItem('session_cod_usuario')),
			'aluno_id'			=> (int)$input['aluno_id'],
			'renovacao_id'	 	=> ($input['renovacao_id'] ? $input['renovacao_id'] : NULL),		
			'numero'			=> $numero,
			'forma_pagamento'	=> (int)$input['forma_pagamento'],
			'status'			=> (int)$input['status'],			
			'valor_taxas'		=> trim(number_format(($input['valor_taxas'] ? $input['valor_taxas'] : 0), 2, '.', '')),
			'valor_desconto'	=> trim(number_format(($input['valor_desconto'] ? $input['valor_desconto'] : 0), 2, '.', '')),
			'valor_liquido'		=> trim(number_format(($input['valor_liquido'] ? $input['valor_liquido'] : 0), 2, '.', '')),
			'valor_total'		=> trim(number_format(($input['valor_total'] ? $input['valor_total'] : 0), 2, '.', '')),
			'data_expiracao'	=> trim($input['data_expiracao']),
			'data_cadastro'		=> date('Y-m-d H:i:s'),
			'excluido'			=> 0,
			'comprovante'		=> "",
			'codigo_rastreamento' => "",
			'observacoes'		=> $input['observacoes']	
		));
		$id = $this->system->sql->nextid();
		
		foreach($input['cursos'] as $curso) {
			$this->system->sql->insert('vendas_cursos', array(
				'venda_id' 		=> $id, 
				'curso_id'		=> $curso['id'], 
				'certificado' 	=> $curso['certificado'], 
				'suporte' 		=> $curso['suporte'], 
				'preco_total' 	=> $curso['preco_total'], 
				'preco_desconto'=> $curso['preco_desconto'], 
				'cupom_id'		=> ($curso['cupom_id'] ? $curso['cupom_id'] : NULL),
				'tipo_cupom'	=> intval($curso['tipo_cupom']),
				'professor_id' 	=> $curso['professor_id']
			));
		}

		foreach($input['planos'] as $plano_id)
			$this->system->sql->insert('vendas_planos', array('venda_id' => $id, 'plano_id' => $plano_id));

		return $id;
	}
	// ===============================================================
	public function atualizar($id, $campos) {
		$this->system->sql->update('vendas', $campos, "id = '" . $id . "'");
	}
	// ===============================================================
	public function getVenda($id) {
		return end($this->system->sql->fetchrowset($this->system->sql->select('*', 'vendas', 'excluido = 0 and sistema_id = ' . $this->system->getSistemaID() . ' and id = ' . $id)));
	}	
	// ===============================================================
	public function getVendas($campos = '', $limit = '', $apenasTotal = false) {				
		if ($apenasTotal) 
			return $this->system->sql->querycountunit($this->system->sql->select('count(1) as total', 'vendas', "excluido='0' and sistema_id = '" . $this->system->getSistemaID()."'"));
		
		return $this->system->sql->fetchrowset($this->system->sql->select('*', 'vendas', "excluido = 0 and sistema_id = '" . $this->system->getSistemaID()."' " . $campos, $limit, ' data_cadastro desc'));
	}
	// ===============================================================
	public function getVendasMesCorrente(){
		$queryVendas = $this->system->sql->select('SUM(v.valor_total) vendas_professores','vendas v, sistemas s', "v.sistema_id = s.id AND v.status = 1 AND s.tipo_sistema = 1 AND data_venda >= '".date('Y-m-01')."'");
		$vendas = end($this->system->sql->fetchrowset($queryVendas));
		return $vendas['vendas_professores'];
	}
	// ===============================================================
	public function getSaldoProfessoresMesCorrente(){
		$querySaldo = $this->system->sql->select('SUM(disponivel) saldo_professores','professor_saldo',"ultima_atualizacao >= '".date('Y-m-01')."'");
		$saldo = end($this->system->sql->fetchrowset($querySaldo));
		return $saldo['saldo_professores'];
	}
	public function alterarObservacoes($id, $observacoes) {
		$this->system->sql->update('vendas', array('observacoes' => $observacoes), "id='" . $id . "'and sistema_id = '" . $this->system->getSistemaID()."'");
	}
	// ===============================================================
	public function getVendasGerenciar($temData, $inicial, $mostrar, $palavra = "", $usuario_id = "") {
		if($temData){
			$data = date('Y-m');	
		}

		$limit = '';
		if ($inicial && $mostrar) $limit =  $inicial . ',' . $mostrar;

		if($palavra){
			if ($usuario_id) {
				$vendas = $this->system->sql->fetchrowset($this->system->sql->select('v.*', 'vendas v, usuarios u', "v.excluido = 0 and v.sistema_id = '" . $this->system->getSistemaID() ."' and v.aluno_id = u.id and u.nome LIKE '%".$palavra."%' and data_venda LIKE  '%".$data."%' and u.id=".$usuario_id."", $limit));		
			}

			
		} else{
			if ($usuario_id) {
				$vendas = $this->system->sql->fetchrowset($this->system->sql->select('*', 'vendas', "excluido = 0 and sistema_id = '" . $this->system->getSistemaID() ."' and data_venda LIKE  '%".$data."%' and usuario_id =".$usuario_id."", $limit));				
			}else{
				$vendas = $this->system->sql->fetchrowset($this->system->sql->select('*', 'vendas', "excluido = 0 and sistema_id = '" . $this->system->getSistemaID() ."' and data_venda LIKE  '%".$data."%'", $limit));								
			}	
		}

		
		foreach ($vendas as $key => $venda) {	

			//convertendo a data de 0000-00-00 para 00/00/0000
			$data = strtotime(substr($vendas[$key]['data_venda'], 2,8));
			$vendas[$key]['data_convertida'] = date('d/m/Y',$data);
			//nome aluno
			$aluno = end($this->system->sql->fetchrowset($this->system->sql->select('nome', 'usuarios', "excluido = 0 and id = ".$venda['aluno_id']." and sistema_id = '" . $this->system->getSistemaID()."'")));
			$vendas[$key]['aluno'] =  $aluno['nome'];
			//forma de pagamento
			$formaPagamento = end($this->system->sql->fetchrowset($this->system->sql->select('*','configuracoes_api_pagamentos', "sistema_id = '" . $this->system->getSistemaID()."'")));
			if(($formaPagamento['pagseguro_status'] == 1) && ($formaPagamento['paypal_status'] == 0)){
				$vendas[$key]['forma_pagamento_id'] = 1;
			} elseif (($formaPagamento['paypal_status'] == 1) && ($formaPagamento['pagseguro_status'] == 1)) {
				$vendas[$key]['forma_pagamento_id'] = 2;	
			}

			$nivel_usuario = $this->system->session->getItem('session_nivel');
			if($nivel_usuario == 8){
				$sql = "and c.professor_id = '".$this->system->session->getItem('session_cod_usuario')."'";
				$cursosVenda = $this->system->vendas->getCursosByVendas($venda['id'], $sql);
				if(!$cursosVenda){
					unset($vendas[$key]);
				}
			}			
		}
		
		return $vendas;
	}
	//=================================================================
	public function getCursosByVendas($id_venda, $campos_professor = ""){
		//cursos por venda
		$vendas = $this->system->sql->fetchrowset($this->system->sql->select("*", "cursos c, vendas_cursos vc", "c.id = vc.curso_id and vc.venda_id='".$id_venda."' ".$campos_professor.""));		
		return $vendas;
	}
	// ===============================================================
	public function getCursosByVenda($id) {
		return $this->system->sql->fetchrowset($this->system->sql->select('*', 'vendas_cursos', "venda_id = " . $id));
	}
	//=================================================================
	public function getVendasByCursos($id_curso, $dataInicio = '', $dataFim = ''){				
		//vendas por curso
		if($dataInicio != '' && $dataFim != ''){
			$sqlExtra = "and data_venda BETWEEN date(".$dataInicio.") AND date(".$dataFim.")";
		}else{
			$sqlExtra = "";
		}
		$vendas  = $this->system->sql->fetchrowset($this->system->sql->select("*", "vendas v, vendas_cursos vc", "v.id = vc.venda_id and vc.curso_id='".$id_curso."' " . $sqlExtra));		
		return $vendas ;
	}
	public function getCursosMaisVendidos($dataInicio = '', $dataFim = ''){	
		// Cursos mais vendidos			
		if($dataInicio != '' && $dataFim != ''){
			$sqlExtra = "and data_venda BETWEEN date(".$dataInicio.") AND date(".$dataFim.")";
		}else{
			$sqlExtra = "";
		}
		$cursos  = $this->system->sql->fetchrowset($this->system->sql->select("c.curso, SUM(vc.preco_total) AS valor,  COUNT(*) AS quantidade", 
																		"vendas_cursos vc, cursos c", 
																		"c.id = vc.curso_id" . $sqlExtra . " GROUP BY c.curso", $limite, " quantidade DESC"));		
		return $cursos ;
		
	}
	//=================================================================
	public function getAlunoByVendas($id_venda){
		//alunos por venda
		$aluno = end($this->system->sql->fetchrowset($this->system->sql->select("u.nome,u.email", "vendas v, usuarios u", "u.id = v.aluno_id and nivel='2' and v.id='".$id_venda."' and v.sistema_id = '" . $this->system->getSistemaID()."'")));
		return $aluno;	
	}

	//=================================================================
	public function getNumeroVendaById($id_venda){
		//numero da venda
		$numero = end($this->system->sql->fetchrowset($this->system->sql->select("numero", "vendas", "id='".$id_venda."' and sistema_id = '" . $this->system->getSistemaID()."'")));
		return $numero;
	}
	//=================================================================
	public function getVendasAlunoById($id_aluno){
		$vendas = $this->system->sql->fetchrowset($this->system->sql->select("*", "vendas", "aluno_id='".$id_aluno."' and sistema_id = '" . $this->system->getSistemaID()."'"));
		foreach ($vendas as $key => $venda) {
			//convertendo a data de 0000-00-00 para 00/00/0000
			$data = strtotime(substr($vendas[$key]['data_venda'], 2,8));
			$vendas[$key]['data_convertida'] = date('d/m/Y',$data);
			
		}
		return $vendas;
	}

	//=================================================================
	public function alterarPagamento($id, $status) {
		$fields = array('status' => $status);
		if ($status == 1) 
			$fields['data_venda'] = date('Y-m-d');
		$this->system->sql->update('vendas', $fields, "id='" . $id . "'");
	}

	// ================================================================
	public function verificaCompraCursoAberta($usuario_id, $curso_id) {
		$query = $this->system->sql->select('id', 'vendas', "excluido = 0 and sistema_id = '" . $this->system->getSistemaID() . "' and status = 0 and usuario_id = '" . $usuario_id . "' and id in (SELECT venda_id from vendas_cursos where curso_id = '" . $curso_id . "')");
		$result = end($this->system->sql->fetchrowset($query));
		return ($result['id'] ? true : false);
	}
	// ===============================================================
	public function getSaldoReceber($tipo_saldo){
		if($tipo_saldo){
			if ($tipo_saldo == "receber") {
				$query = $this->system->sql->select("SUM(receber) saldo_receber", "professor_saldo", "sistema_id = '" . $this->system->getSistemaID() . "'");
				$result = end($this->system->sql->fetchrowset($query));
				return $result['saldo_receber'];		
			} elseif ($tipo_saldo == "disponivel") {
				$query = $this->system->sql->select("SUM(disponivel) saldo_disponivel", "professor_saldo", "sistema_id = '" . $this->system->getSistemaID() . "'");
				$result = end($this->system->sql->fetchrowset($query));
				return $result['saldo_disponivel'];
			} elseif ($tipo_saldo == "bloqueado") {
				$query = $this->system->sql->select("SUM(bloqueado) saldo_bloqueado", "professor_saldo", "sistema_id = '" . $this->system->getSistemaID() . "'");
				$result = end($this->system->sql->fetchrowset($query));
				return $result['saldo_bloqueado'];
			}
		}	
	}

	// ===============================================================
	public function countVendas($sistema_id = ""){
		if($sistema_id){
			$query = $this->system->sql->select("COUNT(1) qtd", "vendas", "sistema_id = '" . $sistema_id . "'");
		}else{
			$query = $this->system->sql->select("COUNT(1) qtd", "vendas", "sistema_id = '" . $this->system->getSistemaID() . "'");
		}
		
		$result = end($this->system->sql->fetchrowset($query));
		return $result['qtd'];
	}
	// ===============================================================

	public function countVendasPorCurso($curso_id){
		$query = $this->system->sql->select("COUNT(1) qtd", "vendas_cursos", "curso_id = '" . $curso_id . "'");
		$result = end($this->system->sql->fetchrowset($query));
		return $result['qtd'];
	}

	// ===============================================================
	public function getValorTotalVendasPorCurso($curso_id){
		$query = $this->system->sql->select("SUM(preco_desconto) valor_total", "vendas_cursos", "curso_id = '" . $curso_id . "'");
		$result = end($this->system->sql->fetchrowset($query));
		return $result['valor_total'];
	}

	// ===============================================================
	public function getTotalCursoByCursoId($id) {
		$query = $this->system->sql->select('COUNT(1)', 'vendas_cursos', "venda_id = " . $id);
		return $this->system->sql->querycountunit($query);
	}
	// ===============================================================
	public function getVendasPorAreas($id, $data) {
		return $this->system->sql->fetchrowset($this->system->sql->select('t1.*', 'vendas AS t1 LEFT JOIN vendas_cursos AS t2
ON (t1.id = t2.venda_id)', "t1.excluido = 0 ".$data." AND t2.curso_id IN (SELECT t3.curso_id FROM cursos_areas AS t3 WHERE t3.curso_id = t2.curso_id AND t3.area_id = '".$id."' AND t3.curso_id IN (SELECT t4.id FROM cursos AS t4 WHERE t3.curso_id = t4.id AND t4.excluido = 0)) GROUP BY t1.id"));
	}
	// ===============================================================
	public function getVendasCursoMaisVendido($campos = '', $limit = '') {
		return $this->system->sql->fetchrowset($this->system->sql->select('COUNT(t1.curso_id) as total, t1.curso_id', 'vendas_cursos AS t1 LEFT JOIN
vendas AS t2 ON (t1.venda_id=t2.id)', "t2.excluido = 0" . $campos . ' GROUP BY t1.curso_id ORDER BY total DESC', '', $limit));
	}
	// ===============================================================
	public function getVendasTopConsumidores($campos = '', $limit = '') {
		return $this->system->sql->fetchrowset($this->system->sql->select('COUNT(t1.aluno_id) AS compras, SUM(t1.valor_total) AS total, t2.id, t2.nome', 'vendas AS t1 LEFT JOIN usuarios AS t2 ON (t1.aluno_id=t2.id)', "t2.excluido = 0 and t1.excluido = 0 " . $campos . ' GROUP BY aluno_id ORDER BY total DESC', '', $limit));
	}
	// ===============================================================
	public function getTotalPedidos($campos = '') {
		$query = $this->system->sql->select('COUNT(1)', 'vendas', "excluido = 0 " . $campos);
		return $this->system->sql->querycountunit($query);
	}
	// ===============================================================
	public function getTotalVendas($campos = '') {
		$query = $this->system->sql->select('SUM(valor_liquido) as total', 'vendas', "excluido = 0 " . $campos);
		return $this->system->sql->querycountunit($query);
	}
	// ===============================================================
	public function getTotalItensPedidos($campos = '') {
		$query = $this->system->sql->select('COUNT(t2.venda_id)', 'vendas as t1, vendas_cursos as t2', 't1.id = t2.venda_id  and t1.excluido = 0 ' . $campos);
		$cursos = $this->system->sql->querycountunit($query);

		$query = $this->system->sql->select('COUNT(t2.venda_id)', 'vendas as t1, vendas_planos as t2', 't1.id = t2.venda_id  and t1.excluido = 0 ' .  $campos);
		$planos = $this->system->sql->querycountunit($query);

		// $query = $this->system->sql->select('COUNT(t2.venda_id)', 'vendas as t1, vendas_certificados as t2','t1.id = t2.venda_id  and t1.excluido = 0 ' . $campos);
		// $certificados = $this->system->sql->querycountunit($query);

		return ($cursos + $planos + $certificados);
	}
	// ===============================================================
	public function getTotalDescontosUsados($campos = '') {
		$query = $this->system->sql->select('SUM(valor_desconto) as total', 'vendas', "excluido = 0 " . $campos);
		return $this->system->sql->querycountunit($query);
	}
	// ===============================================================
	public function getPedidosVendas($limit = '') {
		$sql_extra = '';

		//Parceiro
		if ($this->system->session->getItem('session_nivel') == 5) 
            $sql_extra .= " and parceiro_id = '" . $this->system->session->getItem('session_cod_usuario') . "'";

		$query = $this->system->sql->select('*', 'vendas', "excluido = 0 " . $sql_extra  , $limit);
		$vendas = $this->system->sql->fetchrowset($query);
		foreach($vendas as $key => $venda) {
			//Cliente
			$query = $this->system->sql->select('*', 'usuarios', "id = '" . $venda['aluno_id'] . "'");
			$cliente = end($this->system->sql->fetchrowset($query));

			$vendas[$key]['aluno'] = $cliente;

			//Curso
			$query = $this->system->sql->select('*', 'cursos', "id IN (SELECT curso_id FROM vendas_cursos WHERE venda_id = '" . $venda['id'] . "')");
			$cursos = $this->system->sql->fetchrowset($query);

			$vendas[$key]['cursos'] = $cursos;

			//Planos
			$query = $this->system->sql->select('*', 'planos', "id IN (SELECT plano_id FROM vendas_planos WHERE venda_id = '" . $venda['id'] . "')");
			$planos = $this->system->sql->fetchrowset($query);

			$vendas[$key]['planos'] = $planos;

			//Certificados
			$vendas[$key]['certificados'] = $this->getCertificadosVenda($venda['id']);
			

			$desconto = 0;
			//Cupons
			if ($vendas[$key]['cupom_id']) {
				$query = $this->system->sql->select('*', 'cupons', "id = '" . $venda['cupom_id'] . "'");
				$cupom = end($this->system->sql->fetchrowset($query));

				if ($cupom['id']) {
					$vendas[$key]['cupom'] = $cupom;	
					$desconto = $cupom['valor'];
				}
			}

			//Desconto da venda
			$desconto+= $vendas[$key]['valor_desconto'];
			

			//Removido Cupons e Descontos dados
			$vendas[$key]['valor_total_bruto'] = number_format($vendas[$key]['valor_total'] + $desconto, 2, ',', '.');
		}

		return $vendas;
	}
	// ===============================================================
	public function getPlanoVenda($vendaID) {
		$query = $this->system->sql->select('plano_id', 'vendas_planos', "venda_id = '" . $vendaID . "'");
		$plano = end($this->system->sql->fetchrowset($query));
		if (!$plano['plano_id'])
			return array();
		$query = $this->system->sql->select('*', 'planos', "id = '" . $plano['plano_id'] . "'");
		return end($this->system->sql->fetchrowset($query));
	}
	// ===============================================================
	public function getTotalClientes($campos = '') {
		$query = $this->system->sql->select('COUNT(1)', 'usuarios', "excluido = 0 and nivel = 4 and ativo = 1" . $campos);
		return $this->system->sql->querycountunit($query);
	}
	// ===============================================================
	public function getTotalClientesVendas($campos = '') {
		$query = $this->system->sql->select('COUNT(t1.id)', 'usuarios AS t1', "id IN (SELECT t2.aluno_id FROM vendas AS t2 WHERE t2.aluno_id = t1.id) AND t1.excluido = 0 AND t1.ativo = 1 AND t1.nivel = 4" . $campos);
		return $this->system->sql->querycountunit($query);
	}

	// ===============================================================
	public function getVendasPorCurso($curso_id, $campos = '', $limit = '') {
		return $this->system->sql->fetchrowset($this->system->sql->select('DISTINCT(t1.venda_id), t2.data_cadastro, t2.valor_total', 'vendas_cursos AS t1 LEFT JOIN vendas AS t2 ON (t1.venda_id=t2.id)', "t2.excluido = 0 and t1.curso_id = '" . $curso_id . "'" . $campos, '', $limit));
	}
	// ===============================================================
	public function getVendasPorCursos($campos, $limit = '') {
		return $this->system->sql->fetchrowset($this->system->sql->select('DISTINCT(t1.venda_id), t2.data_cadastro, t2.valor_liquido', 'vendas_cursos AS t1 LEFT JOIN vendas AS t2 ON (t1.venda_id=t2.id)', "t2.excluido = 0 " . $campos, $limit, 'data_cadastro desc'));
	}
	// ===============================================================
	public function getUtilizacaoCupom($cupom_id){
		$query = $this->system->sql->select('COUNT(1)', 'vendas_cursos', "cupom_id = '".$cupom_id."'");
		return $this->system->sql->querycountunit($query);
	}	
	// ===============================================================
	public function getCursosVenda($vendaID) {
		$query = $this->system->sql->select('curso_id as id, certificado, suporte, preco_total', 'vendas_cursos', "venda_id = '" . $vendaID . "'");
		return $this->system->sql->fetchrowset($query);
	}
	// ====================Ranking pelo numero de vendas de um curso=============
	public function getRankingCurso($where, $limit = '', $order = 'vendas'){
		$queryCurso = $this->system->sql->select('id,curso','cursos',$where,$limit);
		$cursos = ($this->system->sql->fetchrowset($queryCurso));
		$contadorPosicao = 0;
		foreach ($cursos as $key => $id) {
			$contadorPosicao++;
			//contando as vendas
			$queryRanking = $this->system->sql->select('count(curso_id) vendas','vendas_cursos',"curso_id='".$id['id']."'",$limit,$order);
			$vendas_cursos = end($this->system->sql->fetchrowset($queryRanking));
			$cursos[$key]['vendas_cursos'] = $vendas_cursos['vendas'];
			$cursos[$key]['nome'] = $cursos[$key]['curso'];
			//definindo as posições
			$cursos[$key]['posicao_ranking'] = $contadorPosicao;
		}
		return $cursos;
	}
	// ==================Ranking pelo numero de vendas de um professor===========
	public function getRankingProfessor($where, $limit = '', $order = 'vendas'){
		$where = 'nivel = 3';
		$queryProfessor = $this->system->sql->select('id, nome','usuarios',$where,$limit);
		$professores = $this->system->sql->fetchrowset($queryProfessor);
		$contadorPosicao = 0;
		foreach ($professores as $key => $id) {
			$contadorPosicao++;
			$queryRanking = $this->system->sql->select('count(curso_id) vendas','vendas_cursos',"professor_id='".$id['id']."'",$limit,$order);
			$vendas_professores = end($this->system->sql->fetchrowset($queryRanking));
			$professores[$key]['vendas_professores'] = $vendas_professores['vendas'];
			$professores[$key]['posicao_ranking'] = $contadorPosicao;
		}

		return $professores;
	}

	// ====================Ranking pelo valor total das compras de um aluno R$=======
	public function getRankingAluno($where, $limit = '', $order = 'valor_liquido DESC'){
		$where = "STATUS = 1 GROUP BY aluno_id";
		$queryAlunoCompra = $this->system->sql->select('SUM(valor_liquido) valor_liquido, aluno_id', 'vendas', $where,$limit,$order);
		$alunos = $this->system->sql->fetchrowset($queryAlunoCompra);
		$contadorPosicao = 0;
		foreach ($alunos as $key => $aluno) {
			$contadorPosicao++;
			$queryNomeAluno = $this->system->sql->select('nome', 'usuarios',"id='".$aluno['aluno_id']."'");
			$nome = end($this->system->sql->fetchrowset($queryNomeAluno));
			$alunos[$key]['nome'] = $nome['nome'];
			$alunos[$key]['posicao_ranking'] = $contadorPosicao;
		}
		return $alunos;

	}
	// ==============================================================================
	public function cadastrarComprovante($parceiro_id, $sistema_id, $total, $mes, $ano) {
		$this->system->sql->insert('vendas_parceiros_comissao', array(
			'parceiro_id'		=> $parceiro_id,
			'sistema_id'		=> $sistema_id,
			'total'				=> $total,
			'mes'				=> (int)$mes,
			'ano'				=> (int)$ano,
			'enviado'			=> 0,
			'data_cadastro'		=> date('Y-m-d H:i:s'),
			'data_envio'		=> '0000-00-00 00:00:00',
			'excluido'			=> 0
		));
	}
	//================================================================
	public function getComprovantes($campo = '', $filtrarSistema = true) {
		if ($filtrarSistema)
			$campo .= ' and sistema_id = ' . $this->system->getSistemaID();
		$query = $this->system->sql->select('*', 'vendas_parceiros_comissao', "excluido = 0 " . $campo, '', 'data_cadastro desc');
		return $this->system->sql->fetchrowset($query);
	}
	// ================================================================
	public function getComprovante($campo, $filtrarSistema = true) {
		if ($filtrarSistema)
			$campo .= ' and sistema_id = ' . $this->system->getSistemaID();
		$query = $this->system->sql->select('*', 'vendas_parceiros_comissao', "excluido = 0 " . $campo, 1, 'data_cadastro desc');
		return end($this->system->sql->fetchrowset($query));
	}

}
// ===================================================================