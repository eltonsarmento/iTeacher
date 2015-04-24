<?php
// ===================================================================
class Clientes {
	// ===============================================================
	protected $system = null;
	private $limit = '';
	// ===============================================================
	public function __construct(&$system) {
		$this->system = $system;
	}
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			case 'index': 	$this->doClientes(); break;
			default: 		$this->pagina404(); break;
		}	
	}
	// ===============================================================
	protected function doClientes() {
		$this->system->site->topo();
		$this->system->view->display('site/clientes.tpl');
		$this->system->site->rodape();
	}
	
	// ===============================================================
	protected function pagina404() {
		$url = end(explode($this->system->getUrlSite(), $_SERVER['REQUEST_URI']));
		$this->system->view->assign('url', $url);
		$this->system->site->topo(0);
		$this->system->view->display('site/pagina404.tpl');
		$this->system->site->rodape();
	}
}
// ===================================================================