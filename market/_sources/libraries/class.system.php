<?php
// ===================================================================
class System {
	// ===============================================================
	//============= ***** Diretorios ***** ============= //
	private static $root_path = 'D:/projetos/market_place/market';				
	private static $upload_path = 'D:/projetos/market_place/market/uploads'; 	
	private static $url_site  = 'http://localmarket.com/'; 				
	private static $url_portal  = 'http://localmarket.com/'; 	
	private static $email = 'carlos@kmf.com.br'; 
	private static $reg_key = 'c63953cf5b64e7cbdd56ecaa3f3ee24fded436a4';						
	private static $chaveCript = 15;
	private static $instance;
	private static $categoria;
	
	//============= ***** DADOS BANCO ***** ============= //
	const DB_SERVIDOR = '192.168.25.120';
	const DB_USUARIO = 'root';
	const DB_SENHA = '123456';
	const DB_NOME = 'marketplace';
	
	//========= ***** Variáveis do sistema ***** ========= //
	public $view 			= null;
	public $sql 			= null;
	public $emailer			= null;
	public $func 			= null;
	public $input 			= null;
	public $admin 			= null;
	public $session 		= null;
	public $sessionPortal	= null;
	public $load			= null;
	public $pagination		= null;
	public $arrays			= null;
	public $log				= null;
	private $loginRequerido = true;
	private $loadAdmin 		= true;
	private $loadPortal 	= true;
	private $defaultSistema = 0;

	// ===============================================================
	public function __construct($loadAdmin = true, $loadPortal = true, $loginRequerido = true) {
		self::$instance =& $this;
		$this->loginRequerido = $loginRequerido;
		$this->loadAdmin = $loadAdmin;
		$this->loadPortal = $loadPortal;
		$this->loadSystem();
		
	}
	// ===============================================================
	//Iniciando as classes / Levantando o sistema
	private function loadSystem() {
		ini_set('error_reporting', E_ERROR | E_WARNING | E_PARSE);
		//ini_set('error_reporting', E_ERROR);
		//ini_set('error_reporting', E_ALL);
		
		ini_set('mysql.connect_timeout', 120);
		ini_set('default_socket_timeout', 120);
		
		define(LIBS_DIR, self::$root_path . '/_sources/libraries');
		define(SMARTY_DIR, LIBS_DIR . '/smarty/');
		
		define('DATA1', '%d/%m/%Y &agrave;s %H:%M');
		define('DATA2', '%d/%m/%Y');
		define('DATA3', '%d/%m');
		define('DATA4', '%d/%m &agrave;s %H:%M');
		
		require(LIBS_DIR . '/class.mysql.php');
		require(LIBS_DIR . '/class.functions.php');
		require(LIBS_DIR . '/smarty/SmartyBC.class.php');
		require(LIBS_DIR . '/class.input.php');
		require(LIBS_DIR . '/class.log.php');
		require(LIBS_DIR . '/class.loader.php');
		require(LIBS_DIR . '/class.session.php');
		require(LIBS_DIR . '/class.arrays.php');
		
		$this->loadSmarty();
		
		$this->loadDataBase();
		
		$this->session = new Session();
		//$this->session->endSession();
		$this->load = new Loader();
		$this->arrays = new Arrays();
		$this->log = new Log();
		
		$this->input = Input::parse_incoming();
		$this->func  = new Functions();

		if ($this->loadAdmin) {
			require(LIBS_DIR . '/class.admin.php');
			require(LIBS_DIR . '/../global/admin.global.php');
			$this->admin = new Admin();
			

			//recupera  o cliente pela sessao e seta na url_portal para os links.
			$dominioCliente = $this->session->getItem('session_empresa_cliente');

			if(!empty($dominioCliente))
				self::$url_portal = self::$url_site . $dominioCliente . '/';			
							
			if ($this->loginRequerido) {
				require(LIBS_DIR . '/class.admin.checklogin.php');
				$adminchecklogin = new AdminCheckLogin();
				$adminchecklogin->checkLoginAdmin();	
			}
		} elseif ($this->loadPortal) {
			require(LIBS_DIR . '/class.portal.php');
			$this->site = new Portal();
		
			//recupera  o cliente pela sessao e seta na url_portal para os links.
			$dominioCliente = $this->session->getItem('session_empresa_cliente');
			if (!empty($dominioCliente))
				self::$url_portal = self::$url_site . $dominioCliente . '/';
		} else {
			require(LIBS_DIR . '/class.site.php');			
			//$this->session->deleteItem('session_empresa_cliente');
			$this->site = new Site();
		}
	}
	// ===============================================================
	// Configurações do Smarty
	private function loadSmarty() {
		$this->view = new SmartyBC();
		$this->view->template_dir  = self::$root_path.'/_sources/_views/';
		$this->view->compile_dir   = self::$root_path.'/_sources/_views/compiled/';
		$this->view->cache_dir     = self::$root_path.'/_sources/_views/cache/';
		$this->view->compile_check = true;
		$this->view->debugging     = false;
		
		$my_security_policy = new Smarty_Security($this->view);
		$my_security_policy->allow_php_tag = true;
		$my_security_policy->php_functions = array();
		$my_security_policy->php_modifiers  = array();
		$my_security_policy->php_handling = Smarty::PHP_PASSTHRU;
		$my_security_policy->modifiers = array();
		$this->view->enableSecurity($my_security_policy);
	}
	// ===============================================================
	//Class do BANCO
	private function loadDataBase() {
		$this->sql = new SqlDB(self::DB_SERVIDOR, self::DB_USUARIO, self::DB_SENHA, self::DB_NOME);
	}
	// ===============================================================
	public function getRootPath() {
		return self::$root_path;
	}
	// ===============================================================
	public function getUrlSite() {
		return self::$url_site;
	}
	// ===============================================================
	public function setUrlPortal($dominio) {
		self::$url_portal = self::$url_site . $dominio . "/";
	}
	// ===============================================================
	public function getUrlPortal() {
		return self::$url_portal;
	}
	// ===============================================================
	public function getEmail() {
		return self::$email;
	}
	// ===============================================================
	public function getChaveCript() {
		return self::$chaveCript;
	}
	// ===============================================================
	public function getUploadPath() {
		return self::$upload_path;
	}
	// ===============================================================
	public function getSistemaID() {
		//Área administrativa
		if (!is_null($this->admin)) {
			if ($this->admin->getSistemaID())
				return $this->admin->getSistemaID();
		}
		
		//Site
		if (!is_null($this->site)) {
			if ($this->site->getSistemaID())
				return $this->site->getSistemaID();
		}

		//Portal
		if (!is_null($this->portal)) {
			if ($this->portal->getSistemaID())
				return $this->portal->getSistemaID();
		}
		
		//Default
		return $this->defaultSistema;
	}
	public function setSistemaID($sistema) {
		$this->defaultSistema = $sistema;
	}
	// ===============================================================
	public static function &getInstancia() {
		return self::$instance;
	}
	// ===============================================================
	public function getKeySite() {
		return self::$reg_key;
	}
}
// ===================================================================
function &getInstancia() {
	return System::getInstancia();
}
// ===================================================================