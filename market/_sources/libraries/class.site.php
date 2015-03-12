<?php
// ===================================================================
class Site {
	// ===============================================================
	private $module = '';
	private $categoria = 'site';
	private $system = null;
	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();
		//eval(base64_decode('aWYgKCdkZTYwMjhhYmJlYmNmNDllYjMyMWUxZmViNTllZmIzZDE1MjAxOGQ4JyAhPSBzaGExKGRpcm5hbWUoX19GSUxFX18pKSkge2RpZTt9'));
	}
	// ===============================================================
    public final function Load($module) {    	
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
		$this->system->view->assign(array(
			'usuario_id'		=> $this->system->session->getItem('session_cod_usuario'),
			'usuario_nome'		=> $this->system->session->getItem('session_nome'),
			'usuario_categoria'	=> $this->system->session->getItem('session_nivel_categoria'),
			'carrinhoTotal'		=> count($this->system->session->getItem('carrinho_produtos')),
			'url_site'			=> $this->system->getUrlSite(),
			'tituloPagina'		=> $tituloPagina
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
}
// ===================================================================