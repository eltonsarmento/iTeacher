<?php
// ===================================================================
class Portal {
	// ===============================================================
	private $module = '';
	private $categoria = 'portal';
	private $system = null;
	private $sistema_id = 0;
	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();
		$this->BuscaSistemaByCliente();
	}
	// ===============================================================
    public final function Load($module) {    	
    	$this->module = $this->_name_cleaner($module == '' ? 'home': $module);        
 		if (file_exists($this->system->getRootPath() . '/_sources/'.$this->categoria.'/' . strtolower($this->module) . '.php'))
			$arquivo = $this->system->getRootPath() . '/_sources/'.$this->categoria.'/' . strtolower($this->module) . '.php';
        require($arquivo);
	}
	// ===============================================================
	public final function BuscaSistemaByCliente() {
		$cliente = $this->system->input['cliente'];
		$inicia_sessao = false;

		if ($cliente) {
			$this->system->load->dao('sistemas');

			$cliente_sessao = $this->system->session->getItem('session_empresa_cliente'); // cliente da sessão

			if (!$cliente_sessao)
				$inicia_sessao = true;
			
			if ($cliente_sessao && ($cliente != $cliente_sessao))
				$inicia_sessao = true;
			
			if ($inicia_sessao) {
				$dados = $this->system->sistemas->getSistemaByDominio($cliente);
				if (intval($dados['id'])) {
					$this->system->session->addItem('session_cod_empresa', $dados['id']);
					$this->system->session->addItem('session_empresa_cliente', $dados['dominio']);
				} else {
					header('location: ' . $this->system->getUrlSite());
					die;
				}
			}
		}
		$this->sistema_id = $this->system->session->getItem('session_cod_empresa');
	}
	// ===============================================================
	public final function Run() {
		$modulename = ucfirst($this->module);
		$class = new $modulename($this->system);
		$class->autoRun();
	}
	// ===============================================================
    private function _name_cleaner($name) {    	
        return preg_replace("/[^a-zA-Z0-9\-\_]/", "", $name);
    }
	// ===============================================================
	public function topo($tituloPagina = '') {
		$this->system->load->dao('areas');
		$this->system->load->dao('usuarios');
		$this->system->load->dao('instituicoes');
		$this->system->load->dao('configuracoesgerais');
		
		$areas =  $this->system->areas->getAreas($palavra, 12);	
		$vCursos  = $this->system->session->getItem('carrinho_cursos');
		$cliente  = $this->system->usuarios->getUsuarioBySistemaID();
		$instituicao = $this->system->instituicoes->getInstituicaoBySistemaID($this->sistema_id, true);
		$config_pagamentos = $this->system->configuracoesgerais->getConfiguracoesPagamentos($this->sistema_id);

		$this->system->view->assign(array(
			'usuario_id'			=> $this->system->session->getItem('session_cod_usuario'),
			'usuario_nome'			=> $this->system->session->getItem('session_nome'),
			'usuario_categoria'		=> $this->system->session->getItem('session_nivel_categoria'),			
			'carrinhoTotal'			=> count($this->system->session->getItem('carrinho_produtos')),
			'url_site'				=> $this->system->getUrlSite(),
			'url_portal'			=> $this->system->getUrlPortal(),
			'tituloPagina'			=> $tituloPagina,
			'nomeInstituicao'		=> $instituicao['nome'],
			'categorias'			=> $areas,
			'cliente'		    	=> $cliente,
			'configs_pagamentos'	=> $config_pagamentos,
			'total_carrinho'		=> ($vCursos['total_carrinho'] ? $vCursos['total_carrinho'] : '0'),
		));
        echo $this->system->view->fetch($this->categoria.'/estrutura.tpl');
	}
	// ===============================================================
	public function rodape() {
		echo $this->system->view->fetch($this->categoria.'/rodape.tpl');
	}
	// ===============================================================
	public function getCategoria() {
		return $this->categoria;
	}
	// ===============================================================	
	public function getSistemaID() {
		return $this->sistema_id;
	}
	// ===============================================================
}
// ===================================================================