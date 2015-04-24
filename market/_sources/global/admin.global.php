<?php
// ===================================================================
class AdminModules {
	// ===============================================================
	protected $system = null;
	protected $redir = '';
	protected $mostrar = 10;
	protected $pagina = 1;
	protected $inicial = 0;
	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();
		$this->pagina  = (int)($this->system->input['pagina'] ? $this->system->input['pagina'] : 1);
		$this->mostrar = (int)($this->system->input['mostrar'] ? $this->system->input['mostrar'] : $this->mostrar);
		$this->inicial = ($this->pagina - 1) * $this->mostrar;
		$this->system->view->assign('categoria', $this->system->admin->getCategoria());
	}
	// ===============================================================
	protected function pagina404() {
		$this->system->view->assign('categoria', $this->system->session->getItem('session_nivel_categoria'));
		$this->system->admin->topo('dashboard');
		$this->system->view->display('global/pagina404.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
}
// ===================================================================