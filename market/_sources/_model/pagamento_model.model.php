<?php
//require_once(dirname(__FILE__).'/../libraries/moip/autoload.inc.php');
require_once(dirname(__FILE__).'/../libraries/pagseguro/PagSeguroLibrary.php');
require_once(dirname(__FILE__).'/../libraries/pagarme/Pagarme.php');

// ===================================================================
class Pagamento_modelMODEL {
	// ===============================================================
	protected $system = null;
	//private $moip = null;
	private $pagSeguro = null;
	private $valor = 0;
	private $produtos = array();
	private $transacaoID = false;
	private $razao = 'iTeacher - Compra de Curso Online - Pedido Nº ';
	private $emailUsuario = '';
	private $nomeUsuario = '';
	private $erro = '';
	private $notificationURLPagSeguro = '';
	private $notificationURLPagarMe = '';
	private $parcelas = '';	
	private $card_hash = '';
	private $formaPagamento = '';
	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();	
		//$this->moip =  new Moip();
		$this->system->load->dao('configuracoesgerais');		
		$this->notificationURLPagSeguro = $this->system->getUrlSite() . 'nasp/' . $this->system->session->getItem('session_cod_empresa') . '/pagseguro.php';
		$this->notificationURLPagarMe = $this->system->getUrlSite() . 'nasp/' . $this->system->session->getItem('session_cod_empresa') . '/pagarme.php';
	}
	//================================================================
	//                            MOIP                              //
	// ===============================================================
	private function iniciarMoip() {
		$moip = $this->system->configuracoesgerais->getMoip();
		// $this->moip->setEnvironment('test');
		//$moip['moip_key'] = 'O4SJ40MXEHCGTKLIUFNNRYOUTJEU531NOYEYJGXA';
		//$moip['moip_token'] = 'SCKULTGPUHWAIRZOVPLFR4RLU4MAZKMI';
		$this->moip->setCredential(array(
			'key' 	=> $moip['moip_key'],
			'token' => $moip['moip_token']
		));
	}
	// ===============================================================
	public function getTokenTransacaoMoip() {
		$this->iniciarMoip();
		$this->moip->setUniqueID($this->transacaoID);
		$this->moip->setValue($this->valor);
		$this->moip->setReason($this->razao . $this->transacaoID);
		$this->moip->setPayer(array(
				'name' 	=> $this->nomeUsuario,
				'email' => $this->emailUsuario
		));
					
		$this->moip->validate('Basic');
		$this->moip->send();
		if ($this->moip->getAnswer()->error)
			$error = $this->moip->getAnswer()->error;
		elseif($this->moip->getAnswer() == 'Authentication failed')
			$error = 'Falha na autenticação';
		elseif($this->moip->getAnswer() == 'Error: credential invalid')
			$error = 'credenciais invalidas';
		if ($error)
			$this->erro = $error;

		return $this->moip->getAnswer()->token;
	}
	//================================================================
	//                          Pagarme                           	//
	//================================================================
	private function obterCredenciaisPagarme($sistema_id = 0) {
		$pagarme = $this->system->configuracoesgerais->getPagarme(($sistema_id ? $sistema_id : $this->system->session->getItem('session_cod_empresa')));		
		return $pagarme;
	}
	// ===============================================================
	public function iniciaPagamentoPagarme() {
		$pagarme = $this->obterCredenciaisPagarme();
		Pagarme::setApiKey($pagarme['pagarme_key_api']);

		$transaction = new PagarMe_Transaction(array(
			"amount" 			=> $this->valor,            
			"card_hash" 		=> $this->card_hash,
			"payment_method" 	=> $this->formaPagamento,
			'postback_url'	 	=> $this->notificationURLPagarMe,
			"installments" 		=> $this->parcelas,
			"email" 			=> $this->emailUsuario,
			'metadata' 			=> array(
				'id_pedido' 	=> $this->transacaoID                    
			),
			"customer" 	=> array(
				"name" 	=> $this->nomeUsuario,
				"email" => $this->emailUsuario                
			)
		));
		
		try {
			$transaction->charge();                
			$retorno['status'] 	 = true;
			$retorno['conteudo'] = $transaction;
			return $retorno;
		} catch (PagarMe_Exception $e) {
			$msg = str_replace('consulte nossa documentação em https://pagar.me/docs.', 'consulte nosso FAQ.', $e->getMessage());
			$retorno['status'] 	 = false;
			$retorno['conteudo'] = '<br> Erro : '.$msg;
			return $retorno;
		}
	}
	//================================================================
	//                          PagSeguro                           //
	//================================================================
	private function obterCredenciaisPagSeguro($sistema_id = 0) {
		$pagSeguro = $this->system->configuracoesgerais->getPagseguro(($sistema_id ? $sistema_id : $this->system->session->getItem('session_cod_empresa')));
		$credentials = new PagSeguroAccountCredentials($pagSeguro['pagseguro_email'], $pagSeguro['pagseguro_token']);
		return $credentials;
	}
	// ================================================================
	public function iniciaPagamentoPagSeguro() {
		$paymentRequest = new PagSeguroPaymentRequest();

		$paymentRequest->setCurrency("BRL");
		$this->razao = $this->razao . $this->transacaoID;
		//Itens compra | Não posso colocar o dinheiro por partes por conta do cupom
		$paymentRequest->addItem('0001', $this->razao, 1, $this->valor);
		$paymentRequest->setReference($this->transacaoID);

		$nomeUsuario = preg_replace('/\d/', '', $this->nomeUsuario);
		$nomeUsuario = preg_replace('/[\n\t\r]/', ' ', $nomeUsuario);
		$nomeUsuario = preg_replace('/\s(?=\s)/', '', $nomeUsuario);
		$nomeUsuario = trim($nomeUsuario);
		$nomeUsuario = explode(' ', $nomeUsuario);
		 
		if (count($nomeUsuario) == 1) {
		    $nomeUsuario[] = ' sem Sobrenome';
		}
		$nomeUsuario = implode(' ', $nomeUsuario);

		// Dados do usuario
		$paymentRequest->setSender(
			$nomeUsuario,
			trim($this->emailUsuario)
		);
		
		// Url de retorno após pagamento
		$paymentRequest->setRedirectUrl($this->system->getUrlSite());

		// Url de notificação de modificação de status
		$paymentRequest->addParameter('notificationURL', $this->notificationURLPagSeguro);
		$paymentRequest->addParameter('sistemaID', $this->system->session->getItem('session_cod_empresa'));
		
		try {
			$credentials = $this->obterCredenciaisPagSeguro();
			$url = $paymentRequest->register($credentials);
			return $url;
		} catch (PagSeguroServiceException $e) {        	
			$erros = array();
			foreach($e->getErrors() as $erro)
				$erros[] = $erro->getMessage();
			echo '<script>alert("' . implode('<br/>', $erros) . '")</script>';
			die;
		}   
	}
	// ===============================================================
	public function obterTransacao($sistema_id, $fields) {
		$code = (isset($fields['notificationCode']) && trim($fields['notificationCode']) !== "" ?
			trim($fields['notificationCode']) : null);
		$type = (isset($fields['notificationType']) && trim($fields['notificationType']) !== "" ?
			trim($fields['notificationType']) : null);

		if ($code && $type) {
			$notificationType = new PagSeguroNotificationType($type);
			$strType = $notificationType->getTypeFromValue();

			switch ($strType) {
				case 'TRANSACTION':
					$transaction = $this->transactionNotification($sistema_id, $code);
					break;
			}
			return $transaction;
		}
	}
	// ===============================================================
	private function transactionNotification($sistema_id, $notificationCode) {
		$credentials = $this->obterCredenciaisPagSeguro($sistema_id);
		try {
			$transaction = PagSeguroNotificationService::checkTransaction($credentials, $notificationCode);
		} catch (PagSeguroServiceException $e) {
			die($e->getMessage());
		}
		return $transaction;
	}
	//================================================================
	//                           Get e Set                          //
	//================================================================
	public function getValor() { 
		return $this->valor;
	}
	//================================================================
	public function setValor($valor) {
		return $this->valor = $valor;
	}
	//================================================================
	public function getTransacaoID() {
		return $this->transacaoID;
	}
	//===============================================================
	public function setTransacaoID($transacaoID) {
		return $this->transacaoID = $transacaoID;
	}
	//===============================================================
	public function getRazao() {
		return $this->razao;
	}
	//=============================================================== 
	public function setRazao($razao) {
		return $this->razao = $razao;
	}
	//===============================================================
	public function getEmailUsuario() {
		return $this->emailUsuario;
	}
	//===============================================================
	public function setEmailUsuario($emailUsuario) {
		return $this->emailUsuario = $emailUsuario;
	}
	//===============================================================
	public function getNomeUsuario() {
		return $this->nomeUsuario;
	}
	//===============================================================
	public function setNomeUsuario($nomeUsuario) {
		return $this->nomeUsuario = $nomeUsuario;
	}
	//===============================================================
	public function getParcelas() {
		return $this->parcelas;
	}
	//===============================================================
	public function setParcelas($parcelas) {
		return $this->parcelas = $parcelas;
	}
	//===============================================================
	public function getCard_Hash() {
		return $this->card_hash;
	}
	//===============================================================
	public function setCard_Hash($card_hash) {
		return $this->card_hash = $card_hash;
	}
	// ==============================================================
	public function getErro() {
		return $this->erro;
	}
	// ==============================================================
	public function setErro($erro) {
		return $this->erro = $erro;
	}
	// ==============================================================
	public function getProdutos() {
		return $this->produtos;
	}
	// ==============================================================
	public function setProdutos($produtos) {
		return $this->produtos = $produtos;
	}
	// ==============================================================
	public function getNotificationURL() {
		return $this->notificationURL;
	}
	// ==============================================================
	public function setNotificationURL($notificationURL) {
		return $this->notificationURL = $notificationURL;
	}
	// ==============================================================
	public function getFormaPagamento() {
		return $this->formaPagamento;
	}
	// ==============================================================
	public function setFormaPagamento($formaPagamento) {
		return $this->formaPagamento = $formaPagamento;
	}
}
// ===================================================================