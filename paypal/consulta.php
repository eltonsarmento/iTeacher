<?php
require_once(dirname(__FILE__).'/paypal.php');

$paypal = new Paypal;

//Dados do usuário
$paypal->setUser('carloswgama-vendedor_api1.gmail.com');
$paypal->setPwd('1397158118');
$paypal->setSignature('An5ns1Kso7MWUdW4ErQKJJJ4qi4-AiHOHL-9dhRvnwRWackKSMatFWBp');

//$paypal->setSandbox(false); //NA vera vocês usam a versão normal, senão deixa a sandbox (testes)

$dados = $paypal->getTransacao('7U772317F0558950Y');
print_r($dados);die;