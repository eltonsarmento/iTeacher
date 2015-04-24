<?php
// ===================================================================
class LoginGlobal extends AdminModules {
	// ===============================================================
	public function __construct() {
		parent::__construct();
	}
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			case 'logout': $this->doLogout(); break;
			case 'logoutPortal': $this->doLogoutPortal(); break;
		}
	}
	// ===============================================================
	private function doLogout() {
		$this->system->load->dao('login');
		$this->system->login->deslogar($this->system->session->getItem('session_cod_usuario'));
		$this->system->session->deleteItem('session_logged_in');
		$this->system->session->endSession();
		header('Location:' . $this->system->getUrlSite() . 'market/') ;
		die;
	}
	// ===============================================================
	private function doLogoutPortal() {		
		$this->system->load->dao('login');
		$this->system->login->deslogar($this->system->session->getItem('session_cod_usuario'));
		$this->system->session->deleteItem('session_logged_in');
		$this->system->session->endSession();
		header('Location: '. $this->system->getUrlPortal());
		die;
	}
	// ===============================================================
}
// ===================================================================