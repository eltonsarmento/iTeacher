<?php
// ===================================================================
class Home {
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
			case 'index': 	$this->doIndex(); break;
			default: 		$this->pagina404(); break;
		}	
	}
	// ===============================================================
	protected function doIndex() {		
		$cursos = $this->system->cursos->getCursosPortal();
		
		foreach ($cursos as $key => $curso) {
			$cursos[$key]['descricao_decode_html'] = html_entity_decode($curso['descricao']);
		}
		
		$this->system->view->assign('cursos', $cursos);
		$this->system->site->topo();
		$this->system->view->display('portal/home.tpl');
		$this->system->site->rodape();
	}
	
	// ===============================================================
	protected function pagina404() {
		$url = end(explode($this->system->getUrlSite(), $_SERVER['REQUEST_URI']));
		$this->system->view->assign('url', $url);
		$this->system->site->topo(0);
		$this->system->view->display('portal/pagina404.tpl');
		$this->system->site->rodape();
	}
}
// ===================================================================