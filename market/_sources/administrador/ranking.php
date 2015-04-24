<?php
// ===================================================================
class Ranking extends AdminModules {
	// ===============================================================
	public function __construct() {
		parent::__construct();
		$this->system->load->dao('usuarios');
		$this->system->load->dao('vendas');
		$this->system->load->dao('alunos');
	}
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			case 'listar': 					$this->doListar(); break;
			case 'ver-todos-cursos':		$this->doVerTodosCurso(); break; 
			case 'ver-todos-professores':	$this->doVerTodosProfessor(); break; 
			case 'ver-todos-alunos':		$this->doVerTodosAluno(); break; 
			case 'ver-todos-instituicoes':	$this->doVerTodosInstituicao(); break; 
			default: 						$this->doListar(); break;
		}
	}
	// ===============================================================
	private function doListar() {
		$limit = 5;
		$rankingCurso = $this->system->vendas->getRankingCurso($where, $limit, $order);
		$rankingProfessor = $this->system->vendas->getRankingProfessor($where, $limit, $order);
		$rankingAlunos = $this->system->vendas->getRankingAluno($where, $limit);
		$rankingInstituicoes = $this->system->alunos->getRankingInstituicao($where, $limit);
		$dadosRanking = array('ranking_curso'			=> $rankingCurso,
							  'ranking_professor'		=> $rankingProfessor,
							  'ranking_aluno'			=> $rankingAlunos,
							  'ranking_instituicao'		=> $rankingInstituicoes
							);
		$this->system->view->assign($dadosRanking);
		$this->system->admin->topo('ranking');
		$this->system->view->display('administrador/ranking.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================

	protected function doVerTodosCurso() {
		$rankingCurso = $this->system->vendas->getRankingCurso($where, $limit, $order);
		$this->system->view->assign('ranking',$rankingCurso);
		$this->system->view->assign('tipo', 'curso');
		$this->system->admin->topo('ranking');
		$this->system->view->display('administrador/ranking_completo.tpl');
		$this->system->admin->rodape();
	}

	// ===============================================================
	protected function doVerTodosProfessor() {
		$rankingProfessor = $this->system->vendas->getRankingProfessor($where, $limit, $order);
		$this->system->view->assign('ranking',$rankingProfessor);
		$this->system->view->assign('tipo', 'professor');
		$this->system->admin->topo('ranking');
		$this->system->view->display('administrador/ranking_completo.tpl');
		$this->system->admin->rodape();
	}

	// ===============================================================
	protected function doVerTodosAluno() {
		$rankingAlunos = $this->system->vendas->getRankingAluno($where, $limit);
		$this->system->view->assign('ranking',$rankingAlunos);
		$this->system->view->assign('tipo', 'aluno');
		$this->system->admin->topo('ranking');
		$this->system->view->display('administrador/ranking_completo.tpl');
		$this->system->admin->rodape();
	}

	// ===============================================================
	protected function doVerTodosInstituicao() {
		$rankingInstituicoes = $this->system->alunos->getRankingInstituicao($where, $limit);
		$this->system->view->assign('ranking',$rankingInstituicoes);
		$this->system->view->assign('tipo', 'instituicao');
		$this->system->admin->topo('ranking');
		$this->system->view->display('administrador/ranking_completo.tpl');
		$this->system->admin->rodape();
	}
}
// ===================================================================