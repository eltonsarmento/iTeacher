<?php 
// ===============================================================
class MaterialMarketingGlobal extends AdminModules {
	// ===============================================================
	public function __construct() {
		parent::__construct();
		$this->system->load->dao('materialmarketing');
	}
	// ===============================================================
	public function autoRun() {
    	switch($this->system->input['do']) {
			case 'listar': 		$this->doListar();break;	
			default: 			$this->pagina404(); break;
		}
	}
	// ===============================================================
	public function doListar() {
		if ($this->system->input['reportar_erro']) {
			$dados['usuario_id'] = $this->system->session->getItem('session_cod_usuario');
			$dados['material_id'] = $this->system->input['material_id'];
			$dados['descricao']	= $this->system->input['descricao'];
			if ($this->system->materialmarketing->reportarErro($dados)) 
				$this->system->view->assign('reportar_sucesso', true);
		}
		$this->system->view->assign('categorias', $this->system->materialmarketing->getMateriaisPorCategoria());
		$this->system->admin->topo('materialmarketing');
		$this->system->view->display('global/material_marketing.tpl');
		$this->system->admin->rodape();
	}
}