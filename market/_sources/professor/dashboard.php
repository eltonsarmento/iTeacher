<?php
//require_once(dirname(__FILE__).'/../global/materialmarketing.global.php');

// ===================================================================
class Dashboard extends AdminModules {	
	// ===============================================================
	public function __construct() {
		parent::__construct();
		$this->system->load->dao('cursos');
		$this->system->load->dao('alunos');
		$this->system->load->dao('duvidas');
		$this->system->load->dao('vendas');
		$this->system->load->dao('materialmarketing');
	}
	// ===============================================================
	public function autoRun() {
		if ($this->system->input['do'] == 'home') {
			$this->system->load->dao('cursos');
			if ($this->system->cursos->countCursos() == 0 && $this->system->session->getItem('temp_liberado') == false) {
				$this->system->session->addItem('temp_liberado', true); //Libera após acessa a primeira vez
				$this->tempProfessor();
				die;
			}
		}
		switch($this->system->input['do']) {
			case 'home': 					$this->doDashboard(); break;
			case 'mudarHome':				$this->doMudarHome(); break;
			case 'mudarAdministrador':		$this->doMudarParaAdministrador(); break;			
			default: 						$this->doDashboard(); break;
		}
	}
	// ===============================================================
	private function tempProfessor() {
		$this->system->view->assign(array(
			'usuario_id'			=> $this->system->session->getItem('session_cod_usuario'),
			'usuario_nome'			=> $this->system->session->getItem('session_nome'),
			'usuario_avatar'		=> $this->system->session->getItem('session_avatar'),
			'url_site'				=> $this->system->getUrlSite(),
			'admin_dir'				=> 'market/',
			'admin_url'				=> $this->system->getUrlSite().'market/'.$this->system->session->getItem('session_nivel_categoria'),
		));
		$this->system->view->display('professor/temp_professor.tpl');
	}
	// ==============================================================
	private function doMudarHome() {
		if ($this->system->session->getItem('estrutura') == 'secundaria') 
			$this->system->session->deleteItem('estrutura');
		else
			$this->system->session->addItem('estrutura', 'secundaria');
		$this->system->func->redirecionar();
	}
	// ==============================================================
	private function doMudarParaAdministrador() {
		$this->system->session->deleteItem('session_administrador');
		$id 		= $this->system->session->getItem('session_cod_usuario_administrador');
		$sistema_id = $this->system->session->getItem('session_cod_empresa_administrador');
		$nivel 		= $this->system->session->getItem('session_nivel_administrador');
		$this->system->session->addItem('session_cod_usuario', 	$id);
		$this->system->session->addItem('session_cod_empresa', 	$sistema_id);				
		$this->system->session->addItem('session_nivel', 		$nivel);	
		$categorias = $this->system->arrays->getArrayCategorias();
		$this->system->session->addItem('session_nivel_categoria', $categorias[$nivel]);						
       	$this->system->func->redirecionar('/dashboard/home');
	}
	// ==============================================================
	private function doDashboard() {
		if ($this->system->session->getItem('estrutura') == 'secundaria') {
			$this->doDashboardSecundario();
			exit();
		}
		if ($this->system->input['reportar_erro']) {
			$dados['usuario_id'] = $this->system->session->getItem('session_cod_usuario');
			$dados['material_id'] = $this->system->input['material_id'];
			$dados['descricao']	= $this->system->input['descricao'];
			if ($this->system->materialmarketing->reportarErro($dados))
				$this->system->view->assign('reportar_sucesso', true);
		}
		$this->system->view->assign('saldo_receber', $this->system->vendas->getSaldoReceber("receber"));
		$this->system->view->assign('saldo_disponivel', $this->system->vendas->getSaldoReceber("disponivel"));
		$this->system->view->assign('saldo_bloqueado', $this->system->vendas->getSaldoReceber("bloqueado"));
		$this->system->view->assign('qtd_vendas', $this->system->vendas->countVendas());
		$this->system->view->assign('categorias', $this->system->materialmarketing->getMateriaisPorCategoriaDashboard());
		$this->system->view->assign('cursos', $this->system->cursos->countCursos());
		$this->system->view->assign('alunos', $this->system->alunos->countAlunos());
		$this->system->admin->topo('dashboard');
		$this->system->view->display('professor/dashboard_professor_admin.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	private function doDashboardSecundario() {
		$duvidas = $this->system->duvidas->getDuvidas('','5','primeira');
		$duvidasNaoRespondidas = $this->system->duvidas->countTotalDuvidas(' AND fechada = 0');
		$this->system->view->assign('duvidas', $duvidas);
		$this->system->view->assign('ultimas_vendas',$this->system->vendas->getVendasGerenciar('', true));
		$this->system->view->assign('qtd_vendas', $this->system->vendas->countVendas());
		$this->system->view->assign('duvidas_nao_respondidas', $duvidasNaoRespondidas);
		$this->system->admin->topo('dashboard');
		$this->system->view->display('professor/dashboard_professor.tpl');
		$this->system->admin->rodape();	
	}
}
// ===================================================================