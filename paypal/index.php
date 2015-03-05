<?php
require_once(dirname(__FILE__).'/paypal.php');


$paypal = new Paypal;


//Dados do usuário
$paypal->setUser('carloswgama-vendedor_api1.gmail.com');
$paypal->setPwd('1397158118');
$paypal->setSignature('An5ns1Kso7MWUdW4ErQKJJJ4qi4-AiHOHL-9dhRvnwRWackKSMatFWBp');

//$paypal->setSandbox(false); //NA vera vocês usam a versão normal, senão deixa a sandbox (testes)

//Dados da venda
$paypal->setTotal(10.00);				//Esse valor que tem bater com o valor dos produtos do carrinho
$paypal->setReference('venda_ida_07');
$paypal->setCancelURL('http://google.com.br'); //Link para onde envia o usuário caso ele cancele a venda
$paypal->setCompleteURL('http://localhost/paypal/confirmacao.php'); //Link para onde envia ao concluir a compra (Verifica se ela foi aprovada ou não, a verificação é na hora)

$produtos = array (
	0 => array (
			'nome'		=> 'Curso Adobe bla bla bla',
			'descricao'	=> 'Bla bla bla, duração 2 anos',
			'preco'		=> '05.00',
			'quantidade'=> 1,
		),
	1 => array (
			'nome'		=> 'Curso Adobe 2 bla bla bla',
			'descricao'	=> 'Bla bla bla, duração 2 anos',
			'preco'		=> '05.00',
			'quantidade'=> 1,
		),
);

$paypal->setProdutos($produtos);


//Gera o url
try {
	$url = $paypal->gerarSolitacao();	
	echo "<a href='" . $url . "'>Ir para o PayPal</a>";
} catch (Exception $e) {
	echo nl2br($e->getMessage());
}


/*
Sandbox: 
https://developer.paypal.com/webapps/developer/applications/accounts (Criar as contas e pegar Username, password, signature)
https://www.sandbox.paypal.com/br/webapps/mpp/home (Simular ambiente)

Na real:
Minha Conta >> Perfil >> Outras Opções >> Ferramentas de Desenvolvedor >> API Acess


Documentação basica da API:
https://developer.paypal.com/docs/classic/api/NVPAPIOverview/

Documentação dos erros:
https://developer.paypal.com/docs/classic/api/errorcodes/


Documentação do código no PayPal Brasil:
https://www.paypal-brasil.com.br/desenvolvedores/tutorial/integracao-com-a-api-de-pagamentos-recorrentes-paypal/
https://github.com/br-paypaldev/code-sample-express-checkout-order-auth-capture

Para mais detalhes:
https://developer.paypal.com/docs/classic/api/

Para mais detalhes do SetExpressCheckout:
https://developer.paypal.com/docs/classic/api/merchant/SetExpressCheckout_API_Operation_NVP/

para mais detalhes do GetExpressCheckoutDetails:
https://developer.paypal.com/docs/classic/api/merchant/GetExpressCheckoutDetails_API_Operation_NVP/

para mais detalhes do DoExpressCheckoutPayment :
https://developer.paypal.com/docs/classic/api/merchant/DoExpressCheckoutPayment_API_Operation_NVP/


*/