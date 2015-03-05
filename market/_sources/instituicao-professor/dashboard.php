<?php
// ===================================================================
class Dashboard extends AdminModules {
	// ===============================================================
	public function __construct() {
		parent::__construct();
		$this->system->load->dao('duvidas');
		$this->system->load->dao('vendas');
		$this->system->load->dao('alunos');
		

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
		$this->system->view->assign('duvidas', $this->system->duvidas->countTotalDuvidas());
		$this->system->view->assign('vendas', $this->system->vendas->countVendas());
		$ultimasVendas = $this->system->vendas->getVendas('','0, 10 ',false);
		$campos = " and professor_id = ".$this->system->session->getItem('session_cod_usuario')."";
		$ultimasDuvidas = $this->system->duvidas->getDuvidas($campos,'0,10',$posicao);
		
		foreach ($ultimasVendas as $key => $vendas) {
			$aluno = $this->system->alunos->getAluno($vendas['aluno_id']);
			$ultimasVendas[$key]['aluno'] = $aluno['nome'];
			$nivel_usuario = $this->system->session->getItem('session_nivel');
			$data = strtotime(substr($vendas['data_venda'], 2,8));
			$ultimasVendas[$key]['data_convertida'] = date('d/m/Y',$data);
			if ($nivel_usuario == 8) {
				$sql = "and c.professor_id = '".$this->system->session->getItem('session_cod_usuario')."'";
				$cursosVenda = $this->system->vendas->getCursosByVendas($vendas['id'], $sql);
				if (!$cursosVenda) unset($ultimasVendas[$key]);
			}	
		}
		$this->system->view->assign('ultimas_duvidas',$ultimasDuvidas);
		$this->system->view->assign('ultimas_vendas',$ultimasVendas);
		$this->system->admin->topo('dashboard');
		$this->system->view->display('instituicao-professor/dashboard.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
}
// ===================================================================