<?php
// ===================================================================
class Certificado {
	// ===============================================================
	protected $system = null;
	private $limit = '';
	
	// ===============================================================
	public function __construct(&$system) {
		$this->system = $system;
		$this->system->load->dao('cursos');
	}
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			//case 'index': 	$this->doIndex(); break;
			//default: 		$this->pagina404(); break;			
			default: 		$this->doIndex(); break;
		}	
	}
	// ===============================================================
	protected function doIndex() {
		$cursos = $this->system->cursos->getCursosSemSistemaId();
		$this->system->view->assign('cursos', $cursos);
		$this->system->site->topo();
		$this->system->view->display('portal/certificado.tpl');
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