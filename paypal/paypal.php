<?php 

class Paypal {

	private $sandbox = true;
	private $apiEndpoint = '';
	private $paypalURL = ''; 

	private $user = '';
	private $pwd = '';
	private $signature = '';

	private $completeURL = '';
	private $cancelURL = '';

	private $reference = '';
	private $produtos = array(); //nome, descricao, preco, quantidade
	private $total = 0.00;

	private $descricaoAssinatura = 'Assinatura IAG';
	private $tipoAssinatura = '';
	private $frequenciaAssinatura = 0;
	private $valorAssinatura = 0;
	// =================================================================
	public function __construct() {
		if ($this->sandbox)	 {
			$this->apiEndpoint = 'https://api-3t.sandbox.paypal.com/nvp'; //Para assinaturas, se fosse certificado seria https://api.sandbox.paypal.com/nvp
			$this->paypalURL = 'https://www.sandbox.paypal.com/cgi-bin/webscr';
		} else {
			$this->apiEndpoint = 'https://api-3t.paypal.com/nvp'; //Para assinaturas, se fosse certificado seria https://api.paypal.com/nvp
			$this->paypalURL = 'https://www.paypal.com/cgi-bin/webscr';
		}
	}
	// =================================================================
	public function gerarSolitacao() {
		//Para mais detalhes do SetExpressCheckout:
		//https://developer.paypal.com/docs/classic/api/merchant/SetExpressCheckout_API_Operation_NVP/

		//Setando os valores
		$dados = array(
  		  	'USER'		 					=> $this->user,
    		'PWD' 							=> $this->pwd,
    		'SIGNATURE'					 	=> $this->signature,
 
    		'VERSION' 						=> '108.0',
    		'METHOD'						=> 'SetExpressCheckout',
 
    		'PAYMENTREQUEST_0_PAYMENTACTION'=> 'SALE',
    		'PAYMENTREQUEST_0_AMT' 			=> $this->total,
    		'PAYMENTREQUEST_0_CURRENCYCODE' => 'BRL',
    		'PAYMENTREQUEST_0_ITEMAMT' 		=> $this->total,
    		'PAYMENTREQUEST_0_INVNUM' 		=> $this->reference,

    		'RETURNURL' 					=> $this->completeURL,
    		'CANCELURL' 					=> $this->cancelURL,
    		'BUTTONSOURCE' 					=> 'BR_EC_EMPRESA'
		);

		foreach ($this->produtos as $key => $produto) {
			$dados['L_PAYMENTREQUEST_0_NAME' . $key] = $produto['nome'];
			$dados['L_PAYMENTREQUEST_0_DESC' . $key] = $produto['descricao'];
		    $dados['L_PAYMENTREQUEST_0_AMT' . $key] = number_format($produto['preco'], 2, '.', '');
		    $dados['L_PAYMENTREQUEST_0_QTY' . $key] = intval($produto['quantidade']);
		}

		//Executando a operação
    	$curl = curl_init();
 		
    	curl_setopt($curl, CURLOPT_URL, $this->apiEndpoint);
    	curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
    	curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    	curl_setopt($curl, CURLOPT_POST, true);
    	curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($dados));

    	$response = urldecode(curl_exec($curl));
 
    	curl_close($curl);

    	//Tratando a resposta
    	$respostaPayPal = array();
 
    	if (preg_match_all('/(?<name>[^\=]+)\=(?<value>[^&]+)&?/', $response, $matches)) {
        	foreach ($matches['name'] as $offset => $name) {
	            $respostaPayPal[$name] = $matches['value'][$offset];
    	    }
    	}
 
    	//Verificando se aconteceu algum erro
    	if (isset($respostaPayPal['ACK']) && $respostaPayPal['ACK'] != 'Success') {
        	for ($i = 0; isset($respostaPayPal['L_ERRORCODE' . $i]); ++$i) {
	            $erros[] = sprintf("PayPal NVP %s[%d]: %s\n",
                       $respostaPayPal['L_SEVERITYCODE' . $i],
                       $respostaPayPal['L_ERRORCODE' . $i],
                       $respostaPayPal['L_LONGMESSAGE' . $i]);
        	}
        	if (count($erros)) 
        		throw new Exception(implode("\n", $erros));
        		

    	}
 
 		//Se não teve erro, recupera a url
    	if (isset($respostaPayPal['ACK']) && $respostaPayPal['ACK'] == 'Success') {
		    $query = array(
		        'cmd'    => '_express-checkout',
		        'token'  => $respostaPayPal['TOKEN']
		    );

		    $redirectURL = sprintf('%s?%s', $this->paypalURL, http_build_query($query));
		 
		    return $redirectURL;
		}
	}
	// =================================================================
	public function getDadosPagamento($token) {

		//para mais detalhes do GetExpressCheckoutDetails:
		//https://developer.paypal.com/docs/classic/api/merchant/GetExpressCheckoutDetails_API_Operation_NVP/

		$curl = curl_init();
  		
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
		curl_setopt($curl, CURLOPT_POST, true);
		curl_setopt($curl, CURLOPT_URL, $this->apiEndpoint);
		curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query(array(
		    'USER' 			=> $this->user,
		    'PWD' 			=> $this->pwd,
		    'SIGNATURE' 	=> $this->signature,
		  
		    'METHOD' 		=> 'GetExpressCheckoutDetails',
		    'VERSION' 		=> '108',
		  
		    'TOKEN' 		=> $token
		)));
		  
		$response =    curl_exec($curl);
		  
		curl_close($curl);
		  
		$nvp = array();
		  
		if (preg_match_all('/(?<name>[^\=]+)\=(?<value>[^&]+)&?/', $response, $matches)) {
		    foreach ($matches['name'] as $offset => $name) {
		        $nvp[$name] = urldecode($matches['value'][$offset]);
		    }
		}
		  
		return $nvp;
	}
	// =================================================================
	public function concluirPagamento($pagamento) {
		//Setando os valores

		//para mais detalhes do DoExpressCheckoutPayment :
		//https://developer.paypal.com/docs/classic/api/merchant/DoExpressCheckoutPayment_API_Operation_NVP/

		$dados = array(
  		  	'USER'		 					=> $this->user,
    		'PWD' 							=> $this->pwd,
    		'SIGNATURE'					 	=> $this->signature,
 
    		'VERSION' 						=> '108.0',
    		'METHOD'						=> 'DoExpressCheckoutPayment',

    		'TOKEN' 						=> $pagamento['TOKEN'],
    		'PAYERID' 						=> $pagamento['PAYERID'],
 
    		'PAYMENTREQUEST_0_PAYMENTACTION'=> 'SALE',
    		'PAYMENTREQUEST_0_AMT' 			=> $pagamento['PAYMENTREQUEST_0_AMT'],
    		'PAYMENTREQUEST_0_CURRENCYCODE' => 'BRL',
    		'PAYMENTREQUEST_0_ITEMAMT' 		=> $pagamento['PAYMENTREQUEST_0_ITEMAMT'],
    		'PAYMENTREQUEST_0_INVNUM' 		=> $pagamento['PAYMENTREQUEST_0_INVNUM'],
		);

    	$curl = curl_init();
 		
    	curl_setopt($curl, CURLOPT_URL, $this->apiEndpoint);
    	curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
    	curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    	curl_setopt($curl, CURLOPT_POST, true);
    	curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($dados));
 
    	$response = urldecode(curl_exec($curl));
 
    	curl_close($curl);

    	//Tratando a resposta
    	$respostaPayPal = array();
 
    	if (preg_match_all('/(?<name>[^\=]+)\=(?<value>[^&]+)&?/', $response, $matches)) {
        	foreach ($matches['name'] as $offset => $name) {
	            $respostaPayPal[$name] = $matches['value'][$offset];
    	    }
    	}
 
    	//Verificando se aconteceu algum erro
    	if (isset($respostaPayPal['ACK']) && $respostaPayPal['ACK'] != 'Success') {
        	for ($i = 0; isset($respostaPayPal['L_ERRORCODE' . $i]); ++$i) {
	            $erros[] = sprintf("PayPal NVP %s[%d]: %s\n",
                       $respostaPayPal['L_SEVERITYCODE' . $i],
                       $respostaPayPal['L_ERRORCODE' . $i],
                       $respostaPayPal['L_LONGMESSAGE' . $i]);
        	}
        	if (count($erros)) 
        		throw new Exception(implode("\n", $erros));
        		

    	}
 
 		return $respostaPayPal;
	}
	// =================================================================
	public function criandoPerfilRecorrente($token, $payerID) {

		$curl = curl_init();
  
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
		curl_setopt($curl, CURLOPT_POST, true);
		curl_setopt($curl, CURLOPT_URL, $this->apiEndpoint);
		curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query(array(
		    'USER' 				=> $this->user,
		    'PWD' 				=> $this->pwd,
		    'SIGNATURE' 		=> $this->signature,
		  
		    'METHOD' 			=> 'CreateRecurringPaymentsProfile',
		    'VERSION' 			=> '108',
		    'LOCALECODE' 		=> 'pt_BR',
		  
		    'TOKEN' 			=> $token,
		    'PayerID' 			=> $payerID,
		  
		    'PROFILESTARTDATE' 	=> date("Y-m-d\TH:i:s\Z"),
		    'DESC' 				=> $this->descricaoAssinatura,
		    'BILLINGPERIOD' 	=> $this->tipoAssinatura,
		    'BILLINGFREQUENCY' 	=> $this->frequenciaAssinatura,
		    'AMT' 				=> $this->valorAssinatura,
		    'CURRENCYCODE' 		=> 'BRL',
		    'COUNTRYCODE' 		=> 'BR',
		    'MAXFAILEDPAYMENTS' => 3
		)));
		  
		$response =    curl_exec($curl);
		  
		curl_close($curl);
		  
		$nvp = array();
		  
		if (preg_match_all('/(?<name>[^\=]+)\=(?<value>[^&]+)&?/', $response, $matches)) {
		    foreach ($matches['name'] as $offset => $name) {
		        $nvp[$name] = urldecode($matches['value'][$offset]);
		    }
		}
		return $nvp;
	}
	// =================================================================
	public function getTransacao($transacaoID) {

		$dados = array(
  		  	'USER'		 					=> $this->user,
    		'PWD' 							=> $this->pwd,
    		'SIGNATURE'					 	=> $this->signature,
 
    		'VERSION' 						=> '108.0',
    		'METHOD'						=> 'GetTransactionDetails',

    		'TRANSACTIONID' 				=> $transacaoID,
		);

    	$curl = curl_init();
 		
    	curl_setopt($curl, CURLOPT_URL, $this->apiEndpoint);
    	curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
    	curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    	curl_setopt($curl, CURLOPT_POST, true);
    	curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($dados));
 
    	$response = urldecode(curl_exec($curl));
 
    	curl_close($curl);

    	//Tratando a resposta
    	$respostaPayPal = array();
 
    	if (preg_match_all('/(?<name>[^\=]+)\=(?<value>[^&]+)&?/', $response, $matches)) {
        	foreach ($matches['name'] as $offset => $name) {
	            $respostaPayPal[$name] = $matches['value'][$offset];
    	    }
    	}
 
    	//Verificando se aconteceu algum erro
    	if (isset($respostaPayPal['ACK']) && $respostaPayPal['ACK'] != 'Success') {
        	for ($i = 0; isset($respostaPayPal['L_ERRORCODE' . $i]); ++$i) {
	            $erros[] = sprintf("PayPal NVP %s[%d]: %s\n",
                       $respostaPayPal['L_SEVERITYCODE' . $i],
                       $respostaPayPal['L_ERRORCODE' . $i],
                       $respostaPayPal['L_LONGMESSAGE' . $i]);
        	}
        	if (count($erros)) 
        		throw new Exception(implode("\n", $erros));
        		

    	}
 
 		return $respostaPayPal;
	}
	// =================================================================
	// GET e SET
	// =================================================================
	public function getSandbox() {
	    return $this->sandbox;
	}
	 
	public function setSandbox($sandbox) {
	    $this->sandbox = $sandbox;

	    if ($this->sandbox)	 {
			$this->apiEndpoint = 'https://api-3t.sandbox.paypal.com/nvp'; //Para assinaturas, se fosse certificado seria https://api.sandbox.paypal.com/nvp
			$this->paypalURL = 'https://www.sandbox.paypal.com/cgi-bin/webscr';
		} else {
			$this->apiEndpoint = 'https://api-3t.paypal.com/nvp'; //Para assinaturas, se fosse certificado seria https://api.paypal.com/nvp
			$this->paypalURL = 'https://www.paypal.com/cgi-bin/webscr';
		}
	}
	// =================================================================
	public function getUser() {
	    return $this->user;
	}
	 
	public function setUser($user) {
	    return $this->user = $user;
	}
	// =================================================================
	public function getPwd() {
	    return $this->pwd;
	}
	 
	public function setPwd($pwd) {
	    return $this->pwd = $pwd;
	}
	// =================================================================
	public function getSignature() {
	    return $this->signature;
	}
	 
	public function setSignature($signature) {
	    return $this->signature = $signature;
	}
	// =================================================================
	public function getCompleteURL() {
	    return $this->completeURL;
	}
	 
	public function setCompleteURL($completeURL) {
	    return $this->completeURL = $completeURL;
	}
	// =================================================================
	public function getCancelURL() {
	    return $this->cancelURL;
	}
	 
	public function setCancelURL($cancelURL) {
	    return $this->cancelURL = $cancelURL;
	}
	// =================================================================
	public function getReference() {
	    return $this->reference;
	}
	 
	public function setReference($reference) {
	    return $this->reference = $reference;
	}	
	// =================================================================
	public function getProdutos() {
	    return $this->produtos;
	}
	 
	public function setProdutos($produtos) {
	    return $this->produtos = $produtos;
	}
	// =================================================================
	public function getTotal() {
	    return $this->total;
	}
	 
	public function setTotal($total) {
	    return $this->total = $total;
	}
	// =================================================================
	public function getDescricaoAssinatura() {
		return $this->descricaoAssinatura;
	}
	
	public function setDescricaoAssinatura($descricaoAssinatura) {
	    $this->descricaoAssinatura = $descricaoAssinatura;
	}
	// ===============================================================
	public function setFrequenciaAssinatura($frequenciaAssinatura) {
		switch ($frequenciaAssinatura) {
			case '1':
				$this->tipoAssinatura = 'Month'; //Day, Week, Month, Year
				$this->frequenciaAssinatura = 1;
				break;
			
			case '3':
				$this->tipoAssinatura = 'Month';
				$this->frequenciaAssinatura = 3;

			case '6':
				$this->tipoAssinatura = 'Month';
				$this->frequenciaAssinatura = 6;

			case '12':
				$this->tipoAssinatura = 'Year';
				$this->frequenciaAssinatura = 1;

			case '24':
				$this->tipoAssinatura = 'Year';
				$this->frequenciaAssinatura = 2;
		}
	}
	// ===============================================================
	public function getValorAssinatura() {
		return $this->valorAssinatura;
	}
	
	public function setValorAssinatura($valorAssinatura) {
	    $this->valorAssinatura = $valorAssinatura;
	}
	
	

}
