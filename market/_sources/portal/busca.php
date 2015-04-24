<?php
// ===================================================================
class Busca {
	// ===============================================================
	protected $system = null;
	// ===============================================================
	public function __construct(&$system) {
		$this->system = $system;
		$this->system->load->dao('cursos');
	}
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			default: $this->doIndex(); break;
		}	
	}
	// ===============================================================
	protected function doIndex() {
		$palavra = $this->system->input['palavra'];
		$order 	 = "c." . str_replace("_"," ", $this->system->input['comboOrdenacao']);
		if ($order == "c." or $order == "c.data cadastro DESC") $order = "c.data_cadastro DESC";
		
		$cursos = $this->system->cursos->getBuscaCursos($palavra, $order);
		foreach ($cursos as $key => $curso)
			$cursos[$key]['descricao_decode_html'] = html_entity_decode($curso['descricao']);
		
		$this->system->view->assign('palavra', ($palavra ? $palavra : "Nenhum curso para esta palavra"));		
		$this->system->view->assign('cursos', $cursos);
		$this->system->view->assign('order', $order);
		$this->system->site->topo();
		$this->system->view->display('portal/busca.tpl');
		$this->system->site->rodape();
	}
	// ===============================================================
}
// ===================================================================