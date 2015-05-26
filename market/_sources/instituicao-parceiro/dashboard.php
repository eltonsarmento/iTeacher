<?php
// ===================================================================
class Dashboard extends AdminModules {
	// ===============================================================
	public function __construct() {
		parent::__construct();
		$this->system->load->dao('cursos');
		$this->system->load->dao('vendas');
		$this->system->load->dao('alunos');
		$this->system->load->dao('professores');
	}
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			case 'home': 	$this->doDashboard(); break;
			default: 		$this->doDashboard(); break;
		}
	}
	// ===============================================================
	private function doDashboard() {
		$this->system->view->assign('cursos', $this->system->cursos->countCursos());
		$this->system->view->assign('vendas', $this->system->vendas->countVendas());
		$this->system->view->assign('alunos', $this->system->alunos->countAlunos());
		// ultimos cursos cadastrados 0,10
		$cursos = $this->system->cursos->getCursos('', '0, 10 ','data_cadastro', $campos = '*');
		foreach ($cursos as $key => $curso) {			
			if ($curso['usuario_id'] == $this->system->session->getItem('session_cod_usuario') and $curso['exibir_site']){				
				$ultimosCursos[$key] = $curso;
				$professor = $this->system->professores->getProfessor($curso["professor_id"]);
				$ultimosCursos[$key]['professor'] = $professor['nome'];
				$data = strtotime(substr($curso['data_cadastro'], 2,8));
				$ultimosCursos[$key]['data_convertida'] = date('d/m/Y',$data);
			}
		}
		// ultimas vendas cadastradas 0,10
		$vendas = $this->system->vendas->getVendas('','0, 10 ',false);
		foreach ($vendas as $key => $vendas) {
			if ($curso['parceiro_id'] == $this->system->session->getItem('session_cod_usuario')){
				$ultimasVendas[$key] = $vendas;
				$aluno = $this->system->alunos->getAluno($vendas['aluno_id']);
				$ultimasVendas[$key]['aluno'] = $aluno['nome'];
				$data = strtotime(substr($vendas['data_venda'], 2,8));
				$ultimasVendas[$key]['data_convertida'] = date('d/m/Y',$data);
			}
		}		
		$this->system->view->assign('ultimas_vendas',$ultimasVendas);
		$this->system->view->assign('ultimos_cursos',$ultimosCursos);
		$this->system->admin->topo('dashboard');
		$this->system->view->display('instituicao-parceiro/dashboard.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
}
// ===================================================================