<?php
// ===================================================================
class Dashboard extends AdminModules {
	// ===============================================================
	public function __construct() {
		parent::__construct();
		$this->system->load->dao('cursos');
		$this->system->load->dao('alunos');
		$this->system->load->dao('professores');
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
			case 'home':						$this->doDashboard(); break;
			case 'mudarAdministrador':			$this->doMudarParaAdministrador(); break;
			default:							$this->doDashboard(); break;
		}
	}
	// ===============================================================
	private function doDashboard() {
		if ($this->system->input['reportar_erro']) {
			$dados['usuario_id'] = $this->system->session->getItem('session_cod_usuario');
			$dados['material_id'] = $this->system->input['material_id'];
			$dados['descricao']	= $this->system->input['descricao'];
			if ($this->system->materialmarketing->reportarErro($dados)) 
				$this->system->view->assign('reportar_sucesso', true);
		}

		$this->system->view->assign('categorias', $this->system->materialmarketing->getMateriaisPorCategoriaDashboard());
		$this->system->view->assign('alunos', $this->system->alunos->countAlunos());
		$this->system->view->assign('professores', $this->system->professores->countProfessores());
		$this->system->view->assign('vendas', $this->system->vendas->countVendas());
		$this->system->admin->topo('dashboard');
		$this->system->view->display('instituicao/dashboard.tpl');
		$this->system->admin->rodape();
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
}
// ===================================================================