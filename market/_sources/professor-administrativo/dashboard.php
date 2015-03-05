<?php
// ===================================================================
class Dashboard extends AdminModules {
	// ===============================================================
	public function __construct() {
		parent::__construct();
		$this->system->load->dao('cursos');
		$this->system->load->dao('alunos');
		$this->system->load->dao('duvidas');
		$this->system->load->dao('vendas');
	}
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			case 'home': $this->doDashboard(); break;
			default: $this->doDashboard(); break;
		}
	}
	// ===============================================================
	private function doDashboard() {
		$this->system->view->assign('saldo_receber', $this->system->vendas->getSaldoReceber("receber"));
		$this->system->view->assign('saldo_disponivel', $this->system->vendas->getSaldoReceber("disponivel"));
		$this->system->view->assign('qtd_vendas', $this->system->vendas->countVendas());
		$this->system->view->assign('cursos', $this->system->cursos->countCursos());
		$this->system->view->assign('alunos', $this->system->alunos->countAlunos());
		$this->system->admin->topo('dashboard');
		$this->system->view->display('professor-administrativo/dashboard.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
}
// ===================================================================