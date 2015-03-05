<?php
// ===================================================================
class Pagina {
	// ===============================================================
	protected $system = null;
	private $limit = '';
	
	// ===============================================================
	public function __construct(&$system) {
		$this->system = $system;
		$this->system->load->dao('paginas');
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
		$titulo = str_replace('-',' ',$this->system->input['parametro']);
		
		$pagina = $this->system->paginas->getPaginaByName($titulo);
		$pagina['conteudo'] = nl2br($pagina['conteudo']);
		
		$this->system->view->assign('pagina', $pagina);				
		$this->system->site->topo();
		$this->system->view->display('portal/pagina.tpl');
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