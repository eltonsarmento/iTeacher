<?php
// ===================================================================
class Dashboard extends AdminModules {
	// ===============================================================
	public function __construct() {
		parent::__construct();
		$this->system->load->dao('duvidas');
		$this->system->load->dao('vendas');
		$this->system->load->dao('alunos');
		$this->system->load->dao('cursos');
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

		
		$cursos = $this->system->cursos->countCursosByAluno($this->system->session->getItem('session_cod_usuario'));
		$campos = " and aluno_id = '".$this->system->session->getItem('session_cod_usuario')."'"; 
		$ultimasDuvidas = $this->system->duvidas->getDuvidas($campos,'0,10',$posicao);		
		$ultimoCurso = $this->system->cursos->getUltimoCurso($this->system->session->getItem('session_cod_usuario'));	
		$vendasMes = $this->system->vendas->getVendasGerenciar($data,0, 5,$palavra, $this->system->session->getItem('session_cod_usuario'));
		$this->system->view->assign('vendas',$vendasMes);
		$this->system->view->assign('cursos', $cursos);		
		$this->system->view->assign('ultimas_duvidas', $ultimasDuvidas);			
		$this->system->view->assign('ultimo_curso', $ultimoCurso);			
		$this->system->admin->topo('dashboard');
		$this->system->view->display('aluno/dashboard.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
}
// ===================================================================