<?php
/*
STATUS 
0 - CANCELADA
1 - PAGA
2 - VENCIMENTO PRÓXIMO
3 - VENCIDA
4 - BLOQUEADA
5 - TRIAL
*/
// ===================================================================
require(dirname(__FILE__) . '/../_sources/libraries/class.system.php');
$system = new System(false);
$system->load->dao('financeiro');
$dataAtual = new DateTime(date("Y-m-d"));

/*======================================================================================================================================================================*/
/*1° FASE (BUSCAR TODAS TRIAL ONDE EXCLUIDO = 0)*/
/*======================================================================================================================================================================*/
$registrosTRIAL = $system->financeiro->getInstituicoesTrias();
if(!empty($$registrosTRIAL)){
	foreach ($$registrosTRIAL as $key => $itemPagamento) {
		$dataPagamento = new DateTime($itemPagamento['data_pagamento']);
		$intervalo = $dataAtual->diff($dataPagamento);	
		
		if($intervalo->days <= 5){ // verifica se faltam 5 dias para lança a fatura  
			echo "REGISTRO TRIAL ID: ".$itemPagamento['id'] ."\n";
			echo "cadastraNovaFatura E atualizaFatura anterior \n\n\n";
			$dataProximoPagamento =  date('Y-m-d', strtotime('+30 days', strtotime($itemPagamento['data_pagamento']))); // soma 1 mês a antiga data de pagamento.
			$system->financeiro->cadastraNovaFatura($itemPagamento['sistema_id'],$dataProximoPagamento,2,0); // lança novo vencimento com status vencimento próximo
			$system->financeiro->atualizaFatura($itemPagamento['id'],array('excluido' => 1));
		}		
	}
}
/*======================================================================================================================================================================*/
/* FIM 1° FASE (BUSCAR TODAS TRIAL ONDE EXCLUIDO = 0) */
/*======================================================================================================================================================================*/



/*======================================================================================================================================================================*/
/* 2° FASE (BUSCA ULTIMO REGISTRO DO SISTEMA ONDE EXCLUIDO = 0) */
/*======================================================================================================================================================================*/
$registrosNormal = $system->financeiro->getInstituicoesNormais();
if(!empty($registrosNormal)){
	foreach ($registrosNormal as $key => $itemPagamento) {

		$dataPagamento = new DateTime($itemPagamento['data_pagamento']);
		$intervalo = $dataAtual->diff($dataPagamento);	
		

		echo "REGISTRO NORMAL ID: ".$itemPagamento['id'] ."\n";
		echo "INTERVALO  =  ".$intervalo->days ." dias\n";

		if($itemPagamento['status'] == 2){ // STATUS IGUAL A VENCIMENTO PROXIMO
			if(date("Y-m-d") >  date($itemPagamento['data_pagamento'])){		
				$system->financeiro->atualizaFatura($itemPagamento['id'],array('status' => 3));				
			}
		}elseif ($itemPagamento['status'] == 3) { // SE STATUS IGUAL A VENCIDO
			if($intervalo->days > 10){				
				$system->financeiro->atualizaFatura($itemPagamento['id'],array('status' => 4));
			}					
		}elseif ($itemPagamento['status'] == 4) { //STATUS IGUAL A BLOQUEADO
			if($intervalo->days > 20){				
				$system->financeiro->atualizaFatura($itemPagamento['id'],array('status' => 0, 'excluido' => 1));
			}								 
		}elseif ($itemPagamento['status'] == 1) { // STATUS IGUAL A PAGO
			if($intervalo->days <= 5){
				$dataProximoPagamento =  date('Y-m-d', strtotime('+30 days', strtotime($itemPagamento['data_pagamento']))); // soma 1 mês a antiga data de pagamento.			
				$system->financeiro->cadastraNovaFatura($itemPagamento['sistema_id'],$dataProximoPagamento,2,0); // lança novo vencimento com status vencimento próximo
				$system->financeiro->atualizaFatura($itemPagamento['id'],array('excluido' => 1));
			}
			
		}
	}
}
/*======================================================================================================================================================================*/
/* FIM - 2° FASE (BUSCA ULTIMO REGISTRO DO SISTEMA ONDE EXCLUIDO = 0) */
/*======================================================================================================================================================================*/
die();
// ===================================================================