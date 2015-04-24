<?php
// ===================================================================
class Sobre {
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
			case 'index': 	$this->doSobre(); break;
			default: 		$this->pagina404(); break;
		}	
	}
	// ===============================================================
	protected function doSobre() {
		$this->system->site->topo();
		$this->system->view->display('site/sobre.tpl');
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