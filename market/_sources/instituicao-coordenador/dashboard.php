<?php
// ===================================================================
class Dashboard extends AdminModules {
	// ===============================================================
	public function __construct() {
		parent::__construct();
		$this->system->load->dao('cursos');
		$this->system->load->dao('notificacoes');
		$this->system->load->dao('areas');
		$this->system->load->dao('professores');
	}
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			case 'home':	 	$this->doDashboard(); break;
			default: 			$this->doDashboard(); break;
		}
	}
	// ===============================================================
	private function doDashboard() {				
		$this->system->view->assign('cursos', $this->system->cursos->countCursos());
		$this->system->view->assign('areas', $this->system->areas->getTotalAreas());
		$ultimosCursos = $this->system->cursos->getCursos('', '0, 10 ','data_cadastro', $campos = '*');
		foreach ($ultimosCursos as $key => $cursos) {
			$professor = $this->system->professores->getProfessor($cursos["professor_id"]);
			$ultimosCursos[$key]['professor'] = $professor['nome'];
			$data = strtotime(substr($cursos['data_cadastro'], 2,8));
			$ultimosCursos[$key]['data_convertida'] = date('d/m/Y',$data);	
		}
		$ultimosProfessores = $this->system->professores->getProfessores('', '', '0, 10 ','data_cadastro');
		$this->system->view->assign('ultimos_professores',$ultimosProfessores);
		$this->system->view->assign('ultimos_cursos',$ultimosCursos);
		$this->system->admin->topo('dashboard');
		$this->system->view->display('instituicao-coordenador/dashboard.tpl');
		$this->system->admin->rodape();
	}	
}
// ===================================================================