<?php
require(dirname(__FILE__).'/../global/instituicoes.global.php');
// ===================================================================
class Instituicoes extends InstituicoesGlobal {
	// ===============================================================
	public function autoRun() {
		parent::autoRun();
	}
	// ===============================================================
	protected function doValidarAcessoInstituicao() {
		$this->system->load->dao('login');
		$id = intval($this->system->input['id']); 
		$dados = $this->system->instituicoes->getInstituicao($id, true);
		
		$this->system->session->addItem('session_administrador', true);
		$this->system->session->addItem('session_cod_usuario_administrador', $this->system->session->getItem('session_cod_usuario'));
		$this->system->session->addItem('session_cod_empresa_administrador', $this->system->session->getItem('session_cod_empresa'));
		$this->system->session->addItem('session_nivel_administrador', $this->system->session->getItem('session_nivel'));
		$this->system->session->addItem('session_cod_usuario', 	$dados['id']);
		$this->system->session->addItem('session_cod_empresa', 	$dados['sistema_id']);				
		$this->system->session->addItem('session_nivel', 		$dados['nivel']);		
		$this->system->session->addItem('session_nome_usuario', $dados['nome']);
		
		$categorias = $this->system->arrays->getArrayCategorias();
		$this->system->session->addItem('session_nivel_categoria', $categorias[$dados['nivel']]);						
       	$this->system->func->redirecionar('/dashboard/home');
	}
}
// ===================================================================