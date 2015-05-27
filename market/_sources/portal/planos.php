<?php
// ===================================================================
class Planos {
	// ===============================================================
	protected $system = null;
	private $limit = '';
	
	// ===============================================================
	public function __construct(&$system) {
		$this->system = $system;
		$this->system->load->dao('planos');
	}
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			case 'index': 	$this->doIndex(); break;
			default: 		$this->doIndex(); break;
		}	
	}
	// ===============================================================
	protected function doIndex() {
		
		$planos = $this->system->planos->getPlanos($palavra, 5, '');

		foreach ($planos as $key => $plano) {
			$planos[$key]['descricao'] = nl2br($plano['descricao']);
		}		
		
		$this->system->view->assign('planos', $planos);		
		$this->system->site->topo();
		$this->system->view->display("portal/planos.tpl");
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