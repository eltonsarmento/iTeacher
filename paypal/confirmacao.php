<?php
require(dirname(__FILE__).'/paypal.php');

//$_GET = array('token' => 'EC-2M651053MK447892W');

$paypal = new Paypal;

//Dados do usuário
$paypal->setUser('carloswgama-vendedor_api1.gmail.com');
$paypal->setPwd('1397158118');
$paypal->setSignature('An5ns1Kso7MWUdW4ErQKJJJ4qi4-AiHOHL-9dhRvnwRWackKSMatFWBp');

//$paypal->setSandbox(false); //NA vera vocês usam a versão normal, senão deixa a sandbox (testes)

//Recupera os dados do pagamento
$pagamento = $paypal->getDadosPagamento($_GET['token']);

print_r($pagamento);
echo "<br/><hr/>";



if ($assinatura) {
	//Se for uma assinatura, tem que criar o perfil
	$paypal->setValorAssinatura($pagamento['AMT']); //Valor total da assinatura
	$paypal->setFrequenciaAssinatura(1); //Mensal

	$recorrencia = $paypal->criandoPerfilRecorrente($pagamento['TOKEN'], $pagamento['PAYERID']); //É preciso guarda esses dois dados.
	print_r($recorrencia);die;
} else {
	$finalizado = $paypal->concluirPagamento($pagamento);

	echo 'ID da Transação: ' . $finalizado['PAYMENTINFO_0_TRANSACTIONID'] . '<br/>';
	if ($finalizado['PAYMENTINFO_0_PAYMENTSTATUS'] == 'Completed')
		echo 'Pagamento Concluido com sucesso';
	else 	
		echo 'Pagamento não aprovado';

}


/*

para mais detalhes do GetExpressCheckoutDetails:
https://developer.paypal.com/docs/classic/api/merchant/GetExpressCheckoutDetails_API_Operation_NVP/

para mais detalhes do DoExpressCheckoutPayment :
https://developer.paypal.com/docs/classic/api/merchant/DoExpressCheckoutPayment_API_Operation_NVP/

*/