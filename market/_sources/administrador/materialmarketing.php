<?php 
require_once(dirname(__FILE__).'/../global/materialmarketing.global.php');

// ===============================================================
class Materialmarketing extends MaterialMarketingGlobal {

	// ===============================================================
	public function autoRun() {
    	switch($this->system->input['do']) {
			case 'listar': 				$this->doListar(); break;	
			case 'listarCategorias': 	$this->doListarCategoria(); break;
			case 'listarErros':		 	$this->doListarErros(); break;
			case 'salvarDados':			$this->doSalvarDados(); break;			
			case 'deletarCategoria':	$this->doDeletarCategoria(); break;	
			case 'buscarCampos':		$this->doBuscarCampos(); break;
			case 'buscarValores':		$this->doBuscarErrosPorMaterial(); break;
			case 'corrigirMaterial':	$this->doCorrigirMaterial(); break;
			case 'novo': 		
			case 'editar': 				$this->doEdicao(); 	break;
			case 'deletarMarketing':	$this->doDeletarMarketing(); break;
			default: 					$this->pagina404(); break;
		}
	}


	// ===============================================================
	protected function doEdicao() {
		$id = intval($this->system->input['id']);
		$editar = intval($this->system->input['editar']);
		if ($editar) {
			$erro_msg = $this->validarDados();
			
			if ($erro_msg) {
				$this->system->view->assign('msg_alert_error', $erro_msg['msg']);
				$this->system->view->assign('materialmarketing', $this->system->input);
			} else {
				if ($id) {
					$this->system->materialmarketing->atualizarMaterial($this->system->input);																				
					$this->system->view->assign('msg_alert_sucesso', 'Material atualizado com sucesso!');
				} else {												
					$id = $this->system->materialmarketing->cadastrarMaterial($this->system->input);
					$this->system->view->assign('msg_alert', 'Material cadastrado com sucesso!');
				}

				if ($this->system->input['nova'])
					$this->system->func->redirecionar('/materialmarketing/novo');
				else
					$this->system->func->redirecionar('/materialmarketing/listar');

				$this->doListar();
				die;
			}
		} else {
			if ($this->system->session->getItem('session_nivel_categoria') == 'administrador'){				
				if ($id) $this->system->view->assign('material', $this->system->materialmarketing->getMaterial($id));
			}
				
		}
		$this->system->view->assign('categorias', $this->system->materialmarketing->getCategorias());
		$this->system->admin->topo('materialmarketing','materialmarketing-novo');
		$this->system->view->display('administrador/materialmarketing_edicao.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function validarDados() {
		$retorno = array();
        //Nome
        if($this->system->input['material'] == '') 
            $retorno['msg'][] = "O campo material está vázio.";		    
        //CEP
        if ($this->system->input['descricao'] == '')
        	$retorno['msg'][] = "O campo Descricao está vázio";		
        //Endereço
        if ($this->system->input['link'] == '')
        	$retorno['msg'][] = 'O campo Link está vázio';
        //Bairro
        if ($this->system->input['categoria_id'] == '')
        	$retorno['msg'][] = 'O campo Categoria está vázio';
		if (count($retorno))
			$retorno['msg'] = implode('<br/>', $retorno['msg']);
        return $retorno;
	}
	// ===============================================================	
	public function doListar() {
		$this->system->view->assign('materiais', $this->system->materialmarketing->getMateriais());
		$this->system->admin->topo('materialmarketing', 'materialmarketing-novo');
		$this->system->view->display('administrador/materialmarketing_gerenciar.tpl');			
		$this->system->admin->rodape();
	}
	// ===============================================================	
	public function doListarCategoria() {
		$this->system->view->assign('categorias', $this->system->materialmarketing->getCategorias());
		$this->system->admin->topo('materialmarketing', 'categorias_gerenciar');
		$this->system->view->display('administrador/categorias_gerenciar.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================	
	public function doListarErros() {
		$this->system->view->assign('materiais', $this->system->materialmarketing->getMateriaisPorErros());
		$this->system->admin->topo('materialmarketing', 'categorias_gerenciar');
		$this->system->view->display('administrador/materialmarketing_listarErros.tpl');			
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function doDeletarCategoria() {
		$id = $this->system->input['id'];		
		if ($id) $this->system->materialmarketing->deletarCategoria($id);				
		$this->doListarCategoria();		
	}
	// ===============================================================
	protected function doDeletarMarketing() {
		$id = $this->system->input['id'];		
		if ($id) $this->system->materialmarketing->deletarMarketing($id);
		$this->doListar();
	}
	// ===============================================================	
	protected function doSalvarDados() {
		$categoria_id = $this->system->input['categoria_id'];		
		$categoria = $this->system->input['categoria'];
		$this->system->materialmarketing->salvarCategoriaPorId($categoria_id, $categoria);
		return true;
	}
	// ===============================================================	
	protected function doBuscarCampos() {
		$categoria_id = $this->system->input['categoria'];
		$dados = array();
		$dados['categoria'] = $this->system->materialmarketing->getCategoriaPorId($categoria_id);
		echo json_encode($dados);
	}
	// ===============================================================	
	protected function doBuscarErrosPorMaterial() {
		$material_id = $this->system->input['material'];
		$dados = array();
		$material = $this->system->materialmarketing->getMateriaisPorErros($material_id);
		
		$dados['nomeMaterial']      = $material[0]['material'];
		$dados['nomeCategoria']     = $material[0]['categoria'];
		$dados['tamanho']   		= $material[0]['tamanho'];
		$dados['descricoes'] 		= $material[0]['descricoes'];
		echo json_encode($dados);
	}
	// ===============================================================	
	protected function doCorrigirMaterial() {
		$material_id = $this->system->input['material'];
		$this->system->materialmarketing->atualizarMaterialErros($material_id);
		$this->doListarErros();	
	}	
	// ===============================================================
}