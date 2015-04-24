<?php
// ===================================================================
class PaginasGlobal extends AdminModules{	
	// ===============================================================
	public function __construct() {
		parent::__construct();
		$this->system->load->dao('paginas');
		//criação de novas paginas para um nono sistema.
		//Retirar esse método, apos a criação do sistema estiver pronto.
		$this->system->paginas->criarPaginas();		
	}
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			case 'listar':
			case 'buscar':	$this->doListar(); break;
			case 'novo':
			case 'editar': 	$this->doEdicao(); break;
			case 'alterar': $this->doAlterarStatus(); break;
			default: 		$this->pagina404(); break;
		}	
	}
	// ===============================================================
	private function doEdicao() {
		$id = intval($this->system->input['id']);
		$editar = intval($this->system->input['editar']);
		if ($editar) {
			$erro_msg = $this->validarDados();
			if ($erro_msg) {
				$this->system->view->assign('msg_alert', $erro_msg['msg']);
				$this->system->view->assign('pagina', $this->system->input);
			} else {
				//Salvar
				if ($id) {		
						
					$this->system->paginas->atualizar($this->system->input);
					$this->system->view->assign('msg_alert', 'Página atualizada com sucesso!');
				}
				if ($editar != 2) {
					$this->doListar();
					die;
				}
			}
		} else {
			if ($id)
				$this->system->view->assign('pagina', $this->system->paginas->getPagina($id));
			    
		}
		$this->system->admin->topo('paginas');
		$this->system->view->display('global/paginas_edicao.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	private function validarDados() {
		$retorno = array();
    	//plano
    	if($this->system->input['conteudoHidden'] == '') 
            $retorno['msg'][] = "O campo conteúdo da página está vázio.";
		if (count($retorno))
		   $retorno['msg'] = implode('<br/>', $retorno['msg']);
        return $retorno;
	}
	// ===============================================================
	private function doListar() {
		$this->listagem();
		$this->system->admin->topo('paginas','listar');
		$this->system->view->display('global/paginas_gerenciar.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	private function listagem() {
		$palavra = $this->system->session->getItem('palavra_busca');
		if ($palavra) $this->system->session->deleteItem('palavra_busca');
		$paginas = $this->system->paginas->getPaginas($palavra, $this->limit);
		$this->system->view->assign('paginas', $paginas);
		$this->system->view->assign('url_site', $this->system->getUrlSite());
	}
	// ===============================================================
	private function doAlterarStatus() {
		$id = intval($this->system->input['id']);
		$pagina = $this->system->paginas->getPagina($id);
		if ($pagina['id'])
			$this->system->paginas->alteraStatus($pagina);
		$this->system->func->redirecionar('/paginas/listar');	
	}
	// ===============================================================
}
// ===================================================================