<?php
// ===================================================================
class Dashboard extends AdminModules {
	// ===============================================================
	public function __construct() {
		parent::__construct();
		$this->system->load->dao('usuarios');
		$this->system->load->dao('vendas');
		$this->system->load->dao('instituicoes');
		$this->system->load->dao('professores');
		$this->system->load->dao('materialmarketing');
		$this->system->load->dao('alunos');
	}
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			case 'home': 		$this->doDashboard(); break;
			case 'instituicao': $this->doAcessoInstituicao(); break;
			default: 			$this->doDashboard(); break;
		}
	}
	// ===============================================================
	private function doDashboard() {
		if ($this->system->session->getItem('estrutura') == 'acesso_instituicao') {
			$this->doDashboardAcessoInstituicao();
			exit();
		}
		$limit = 5;
		$instituicoes = $this->system->usuarios->countUsuariosByNivel(5);
		$professoresAutonomos = $this->system->usuarios->countUsuariosByNivel(3);
		$alunos = $this->system->usuarios->countUsuariosByNivel(2);
		$vendasMesCorrente = $this->system->vendas->getVendasMesCorrente();
		$saldoProfessoresMesCorrente = $this->system->vendas->getSaldoProfessoresMesCorrente();
		$rankingCurso = $this->system->vendas->getRankingCurso($where, $limit, $order);
		$rankingProfessor = $this->system->vendas->getRankingProfessor($where, $limit, $order);
		$rankingAlunos = $this->system->vendas->getRankingAluno($where, $limit);
		$rankingInstituicoes = $this->system->alunos->getRankingInstituicao($where, $limit);
		
		if (!$vendasMesCorrente)
			$vendasMesCorrente = '0.00';
		if (!$saldoProfessoresMesCorrente)
			$saldoProfessoresMesCorrente = '0.00';
		if (!$valorMesInstituicoes)
			$valorMesInstituicoes = '0.00';
		
		$dadosDashboardUsuarios = array('instituicoes' 			=> $instituicoes,
										'professores_autonomos' => $professoresAutonomos,
										'alunos' 				=> $alunos,
										'vendas_professores'	=> $vendasMesCorrente,
										'valor_instituicoes'	=> $valorMesInstituicoes,
										'saldo_professores'		=> $saldoProfessoresMesCorrente,
										'ranking_curso'			=> $rankingCurso,
										'ranking_professor'		=> $rankingProfessor,
										'ranking_aluno'			=> $rankingAlunos,
										'ranking_instituicao'	=> $rankingInstituicoes
										);

		$this->system->view->assign($dadosDashboardUsuarios);
		$this->system->admin->topo('dashboard');
		$this->system->view->display('administrador/dashboard.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================

	protected function doAcessoInstituicao() {
		$sistema_id = $this->system->input['id'];
		if (($this->system->session->getItem('estrutura') == 'acesso_instituicao') && ($this->system->session->getItem('sistema_id') != "")) {
			$this->system->session->deleteItem('estrutura');
			$this->system->session->deleteItem('sistema_id');
		} 
		else {
			$this->system->session->addItem('estrutura', 'acesso_instituicao');
			$this->system->session->addItem('sistema_id', $sistema_id);
		}

		$this->system->func->redirecionar();
	}

	protected function doDashboardAcessoInstituicao() {
		$id = $this->system->session->getItem('sistema_id');
		$qtd_alunos = $this->system->alunos->countAlunos($id);
		$instituicao = $this->system->instituicoes->getInstituicaoBySistemaID($id);
		$qtd_professores = $this->system->professores->countProfessores($id);
		$qtd_vendas = $this->system->vendas->countVendas($id);
		$categorias = $this->system->materialmarketing->getMateriaisPorCategoriaDashboard();
		$variaveis = array(
				'qtd_alunos' 		=> $qtd_alunos,
				'qtd_professores' 	=> $qtd_professores,
				'qtd_vendas' 		=> $qtd_vendas,
				'nome_instituicao' 	=> $instituicao['nome'],
				'categorias' 		=> $categorias,
				'sistema_id' 		=> $id
				);
		
		$this->system->view->assign($variaveis);
		$this->system->admin->topo('dashboard');
		$this->system->view->display('administrador/acesso_instituicao/dashboard.tpl');
		$this->system->admin->rodape();
	}
}
// ===================================================================