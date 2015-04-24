<?php
// ===================================================================
require(dirname(__FILE__) . '/../_sources/libraries/class.system.php');
$system = new System(true, false);


//daos
$dia = date('d');
$mes = date('m', mktime(0, 0, 0, (date('m')-1), 1, date('Y')));
$ano = date('Y', mktime(0, 0, 0, (date('m')-1), 1, date('Y')));

//if ($dia == 1) {
	$system->load->dao('pagamentos');
	$system->load->dao('professores');
	$system->load->dao('vendas');
	$system->load->dao('cursos');
	$system->load->dao('cupons');
	$system->load->dao('parceiros');

	$professores = $system->professores->getUsuariosByNivel(8);	
	//$professores = array(array('id' => 3));
	
	foreach ($professores as $key => $professor) {
		$system->setSistemaID($professor['sistema_id']);

		$totalReceber = 0;
		$percentualComissao = 0;

		$where = " and t2.status = 1 and t1.professor_id = '" . $professor['id'] . "' and t2.data_venda >= '" . $ano ."-". $mes . "-01 00:00:00' and t2.data_venda < '" . date('Y') . "-" . date('m') . "-01 23:59:59'";
		$vendas = $system->vendas->getVendasPorCursos($where);
		
		$percentualComissao = $system->professores->getValorExtra($professor['id'], 'comissao');
		
		foreach($vendas as $key => $venda) {
			
			$venda = $system->vendas->getVenda($venda['venda_id']);

		 	//CURSOS
		 	$totalPreco = 0;
		 	$totalPrecoProfessor = 0;
		 	$cursos = array();
			foreach($system->vendas->getCursosByVenda($venda['id']) as $curso) {
		 		//$curso_dados = end($system->cursos->getCurso($curso['curso_id'], false));
		 		$totalPreco += ($curso['preco_total'] - $curso['preco_desconto']);
		 		if ($curso['professor_id'] == $professor['id']) 
		 			$totalPrecoProfessor += ($curso['preco_total'] - $curso['preco_desconto']);
		 	}

		 	////// TAXA //////
		 	//PagSeguro e MoIP
		 	$valorTaxas = divisaoCustos($venda['valor_taxas']);
		 	
		 	////// COMISSÃO PARCEIRO (DESCONTO) /////
		 	$valorComissaoParceiro = 0;
		 	if ($venda['usuario_id']) {
		 		$comissaoParceiro = $system->parceiros->getValorExtra($venda['usuario_id'], 'comissao');
		 		$valorComissaoParceiro = divisaoCustos(($comissaoParceiro * $venda['valor_liquido'])/100);		 		
		 	}

		 	////// BRUTO //////
	 		$valorBruto = ($totalPrecoProfessor - $valorComissaoParceiro - $valorTaxas);	 		
		 	
		 	////// LÍQUIDO //////
		 	$valorLiquido = (($percentualComissao * $valorBruto)/100);

		 
		 	$totalReceber += $valorLiquido;

		 	//print_r($venda['id'] . ' - ' . $professor['id'] . ' - ' . $totalPreco . ' - ' . $totalPrecoProfessor . '-' . $valorLiquido .  '-' . $totalReceber . '<br/>');
		 	//continue;
		}
		// if ($professor['id'] == 86) {
		// 	print_r($totalReceber);die;		
		// }
		$pagamento = $system->pagamentos->getPagamento(" and t1.professor_id = '" . $professor['id'] . "' and t1.mes_faturado = '" . $ano ."-". $mes . "-01'");
		
		if (!$pagamento['id']) {
			$system->pagamentos->cadastrar(array(
				'professor_id' 		=> $professor['id'],
				'mes_faturado'		=> $ano ."-". $mes . "-01",
				'valor'				=> number_format($totalReceber, 2, '.', ''),
			));
		} else {
			$system->pagamentos->atualizar(array(
				'valor'				=> number_format($totalReceber, 2, '.', ''),
				'data_cadastro'		=> date('Y-m-d H:i:s'),
				),
				"id = '" . $pagamento['id'] . "'"
			);
		}
	}

//}

function divisaoCustos($custo) {
	global $totalPreco, $totalPrecoProfessor;
	$porcentagem = ((100 * $totalPrecoProfessor) / $totalPreco);
	return (($custo * $porcentagem) / 100);
}


echo 'Finalizado';
die;
// ===================================================================