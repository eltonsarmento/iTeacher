<?php
// ===================================================================
class Curso {
	// ===============================================================
	protected $system = null;
	// ===============================================================
	public function __construct(&$system) {
		$this->system = $system;
		$this->system->load->dao('aulas');
		$this->system->load->dao('cursos');
		$this->system->load->dao('professores');
	}
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			case 'index':	$this->doIndex(); break;			
			default: 		$this->pagina404(); break;						
		}	
	}
	// ===============================================================
	protected function doIndex() {		
		$curso_id = $this->system->input['parametro']; 
		if ($curso_id) {
			$curso 	   					= $this->system->cursos->getCursoSemSistemaId($curso_id,$campos = '*');	
			$professor 					= $this->system->professores->getProfessorPortal($curso['professor_id']);
			$curso['valor_dividido'] 	= number_format(($curso['valor'] / 12), 2, ',', '.');
			$curso['valor'] 			= number_format($curso['valor'], 2,',','.');
			if ($curso['gratuito']) $curso['valor'] = 0;
			
			$this->system->view->assign('aulaGratuita', $this->system->aulas->getAulaGratuitaByCurso($curso['id'], $curso['sistema_id']));
			$this->system->view->assign('curso', $curso);				
			$this->system->view->assign('professor', $professor);
			$this->system->view->assign('capitulos', $this->system->aulas->getCapitulosByCursoPortal($curso['id']));
			$this->system->site->topo();
			$this->system->view->display('portal/curso.tpl');
			$this->system->site->rodape();
		} else {
			header('Location: ' . $this->system->getUrlSite() . '/');
			die;
		}
	}	
	// ===============================================================
	protected function pagina404() {
		$url = end(explode($this->system->getUrlSite(), $_SERVER['REQUEST_URI']));
		$this->system->view->assign('url', $url);
		$this->system->site->topo(0);
		$this->system->view->display('site/pagina404.tpl');
		$this->system->site->rodape();
	}
	// ===============================================================
}
// ===================================================================