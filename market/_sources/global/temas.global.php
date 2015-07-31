<?php
// ===================================================================
class TemasGlobal extends AdminModules {
	protected $mostrar = 10;
	// ===============================================================
	public function __construct() {
		parent::__construct();
		$this->system->load->dao('configuracoesgerais');
	}
	// ===============================================================
	public function autoRun() {
    	switch($this->system->input['do']) {
			case 'gerenciar-temas':				$this->doGerenciarTemas(); 	break;
			case 'personalizar-temas':			$this->doPersonalizarTemas(); 	break;
			case 'configuracoes-temas':			$this->doConfigurarTemas(); 	break;			
			default: 				$this->pagina404(); break;
		}
	}
	// ===============================================================
	protected function doGerenciarTemas() {		
		$configuracoestemas = $this->system->configuracoesgerais->getConfiguracoesTemas();
		if ($configuracoestemas['id'] == "") 
			$this->system->configuracoesgerais->cadastrarConfiguracoesTemas();
		
		$this->system->admin->topo('configuracoestemas', 'temas');
		$this->system->view->display('global/gerenciar_temas.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function doConfigurarTemas() {
		$id = $this->system->input['id'];
		$editar = $this->system->input['editar'];
		if ($editar) {		
			if ($id) {
				$this->system->configuracoesgerais->atualizarConfiguracoesTemas($this->system->input);
				$this->system->view->assign('msg_sucesso', 'Atualizado com sucesso!');
				$this->system->view->assign('configuracoestemas', $this->system->input);	
			}			

		}
		
		$configuracoestemas = $this->system->configuracoesgerais->getConfiguracoesTemas();
		
		$this->system->view->assign('configuracoestemas', $configuracoestemas);
		$this->system->admin->topo('configuracoestemas', 'novo');
		$this->system->view->display('global/configurar_temas.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function doPersonalizarTemas() {
		$id = $this->system->input['id'];
		$editar = $this->system->input['editar'];
		if ($editar) {

			
			if ($id) {
				$this->system->input['cor_primaria'] = str_replace("%", "#",$this->system->input['cor_primaria']);
				$this->system->input['cor_secundaria'] = str_replace("%", "#",$this->system->input['cor_secundaria']);
				
				$this->system->configuracoesgerais->atualizarConfiguracoesTemas($this->system->input);
				$this->system->view->assign('msg_sucesso', 'Tema atualizado com sucesso!');
				$this->system->view->assign('configuracoestemas', $this->system->input);	
			} 
					
			if (is_uploaded_file($_FILES['logo_tema']['tmp_name'])) {	
				$extensao = substr($_FILES['logo_tema']['name'], -3);
				$nomearquivo = 'logo_tema_' . $id . '.' . $extensao;
				if (file_exists($this->system->getUploadPath() . '/logos_temas/' . $nomearquivo))
					unlink($this->system->getUploadPath() . '/logos_temas/' . $nomearquivo);
				copy($_FILES['logo_tema']['tmp_name'], $this->system->getUploadPath() . '/logos_temas/' . $nomearquivo);
				$this->system->configuracoesgerais->atualizarLogotipoTema($id, $nomearquivo);
			}		
		}
		
		$configuracoestemas = $this->system->configuracoesgerais->getConfiguracoesTemas();
		

		$this->system->view->assign('configuracoestemas', $configuracoestemas);
		$this->system->admin->topo('configuracoestemas', 'novo');
		$this->system->view->display('global/personalizar_temas.tpl');
		$this->system->admin->rodape();
	}	
	// ====================================================================================
}
// ===================================================================