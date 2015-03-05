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
		$this->sistema_id = $this->system->session->getItem('session_cod_empresa');
		
		//eval(base64_decode('aWYgKCdkZTYwMjhhYmJlYmNmNDllYjMyMWUxZmViNTllZmIzZDE1MjAxOGQ4JyAhPSBzaGExKGRpcm5hbWUoX19GSUxFX18pKSkge2RpZTt9'));
	}
	// ===============================================================
    public final function Load($module) {
    	$this->BuscaSistemaByCliente();

        $this->module = $this->_name_cleaner($module == '' ? 'home': $module);

 		if(file_exists($this->system->getRootPath() . '/_sources/'.$this->categoria.'/' . strtolower($this->module) . '.php'))
            $arquivo = $this->system->getRootPath() . '/_sources/'.$this->categoria.'/' . strtolower($this->module) . '.php';
        else {
        	$this->module = 'erro';
        	$arquivo = $this->system->getRootPath() . '/_sources/'.$this->categoria.'/erro.php';
        }
		
		require($arquivo);
	}
	// ===============================================================
	public final function BuscaSistemaByCliente() {
		$cliente 	 = $this->system->session->getItem('session_empresa_cliente');
		$sistema_id  = $this->system->session->getItem('session_cod_empresa');
		
		if (empty($sistema_id)) {		
			$this->system->load->dao('sistemas');
	    	$dados = $this->system->sistemas->getSistemaByDominio($cliente);	    	    	
			if ($dados){				
				$this->system->session->addItem('session_cod_empresa', 	$dados['id']);			
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
		$areas =  $this->system->areas->getAreas($palavra, 12);	
		$vCursos  = $this->system->session->getItem('carrinho_cursos');
		$cliente  = $this->system->usuarios->getUsuarioBySistemaID();
		$this->system->view->assign(array(
			'usuario_id'		=> $this->system->session->getItem('session_cod_usuario'),
			'usuario_nome'		=> $this->system->session->getItem('session_nome'),
			'usuario_categoria'	=> $this->system->session->getItem('session_nivel_categoria'),			
			'carrinhoTotal'		=> count($this->system->session->getItem('carrinho_produtos')),
			'url_site'			=> $this->system->getUrlSite(),
			'url_portal'		=> $this->system->getUrlPortal(),
			'tituloPagina'		=> $tituloPagina,
			'categorias'		=> $areas,
			'cliente'		    => $cliente,
			'total_carrinho'	=> ($vCursos['total_carrinho'] ? $vCursos['total_carrinho'] : '0'),
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