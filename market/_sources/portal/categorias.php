<?php
// ===================================================================
class Categorias {
	// ===============================================================
	protected $system = null;
	private $limit = '';
	
	// ===============================================================
	public function __construct(&$system) {
		$this->system = $system;
		$this->system->load->dao('cursos');
		$this->system->load->dao('areas');
	}
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			case 'index': 	$this->doIndex(); break;
			//default: 		''$this->pagina404(); break;			
			default: 		$this->doIndex(); break;
		}	
	}
	// ===============================================================
	protected function doIndex() {
		
		$area_id = $this->system->input['parametro'];
		$limit   = 12;
		
		$order 	 = "c." . str_replace("_"," ", $this->system->input['comboOrdenacao']);
		if($order == "c." or $order == "c.data cadastro DESC") $order = "c.data_cadastro DESC";
		
		$cursos = $this->system->cursos->getCursosByArea($area_id,$limit,$order);
		
		$nome_area = $cursos[0]['categoria'];

		foreach ($cursos as $key => $curso) {
			$cursos[$key]['descricao_decode_html'] = html_entity_decode($curso['descricao']);
		}
		
		$this->system->view->assign('area',($nome_area ? $nome_area :"Nenhum curso para esssa área"));		
		$this->system->view->assign('cursos', $cursos);
		$this->system->view->assign('order', $order);
		$this->system->site->topo();
		$this->system->view->display('portal/categoria.tpl');
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