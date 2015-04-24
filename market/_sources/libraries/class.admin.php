<?php
// ===================================================================
class Admin {
	// ===============================================================
	private $module = '';
	private $system = null;
	public  $categoria = '';
	private $sistema_id = 0;
	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();
		$this->categoria = $this->system->session->getItem('session_nivel_categoria');
		$this->sistema_id = $this->system->session->getItem('session_cod_empresa');
		eval(base64_decode('JGRhZG9zID0gc3RhdChMSUJTX0RJUiAuICcvc2VjLmtleScpOyBpZiAoc2hhMSgkZGFkb3NbJ2F0aW1lJ10pICE9ICR0aGlzLT5zeXN0ZW0tPmdldEtleVNpdGUoKSkge2RpZTt9'));
	}
	// ===============================================================
    public final function Load($module) {
    	$this->BuscaSistemaByCliente();
    	if (!$this->categoria)
    		$this->categoria = $this->system->session->getItem('session_nivel_categoria');
    	$this->module = $this->_name_cleaner(($module == ''? 'dashboard': $module));
		
		if (file_exists($this->system->getRootPath() . '/_sources/'.$this->system->admin->categoria.'/' . strtolower($this->module) . '.php'))
            $arquivo = $this->system->getRootPath() . '/_sources/'.$this->system->admin->categoria.'/' . strtolower($this->module) . '.php';
        else {
        	session_write_close();
			header('Location: ' . $this->system->getUrlSite() . 'market/' .  $this->system->admin->categoria . '/erro/pagina404');
            die;
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
	public function topo($menu = '', $submenu = '') {
		//Notificações
		$notificacoes = (array) $this->system->session->getItem('notificacoes_topo');		
		$id = $this->system->session->getItem('session_cod_usuario');
		if (empty($notificacoes[0])) {
			$this->system->load->dao('notificacoes');		
			$notificacoes = $this->system->notificacoes->getNaoLidas($id);
			$this->system->session->addItem('notificacoes_topo', $notificacoes);
		}		
		
		//Duvidas
		$duvidas_topo = (array)$this->system->session->getItem('duvidas_topo');
		if (($this->system->session->getItem('session_nivel') == 3 || $this->system->session->getItem('session_nivel') == 2 || $this->system->session->getItem('session_nivel') == 8) && empty($duvidas_topo)){ //Professor e aluno
			$this->system->load->dao('duvidas');
			$aluno = ($this->system->session->getItem('session_nivel') == 2 ? true : false);
			$duvidas_topo = $this->system->duvidas->getNaoLidas($this->system->session->getItem('session_cod_usuario'), $aluno);
			
			$this->system->session->addItem('duvidas_topo', $duvidas_topo);
		
		}
		// saques
		$saquesSolicitados = (array)$this->system->session->getItem('solicitacoes_saque');
		if($this->system->session->getItem('session_nivel') == 1){
			$this->system->load->dao('financeiro');
			$saquesSolicitados = $this->system->financeiro->getSaquesSolicitados();
			//print_r($saquesSolicitados);die;
			$this->system->session->addItem('solicitacoes_saque', $saquesSolicitados);	
		}


		
		//verifica se o adm está logado como professor. habilita a visao do mesmo!
		if($this->system->session->getItem('session_administrador')){
			$this->system->view->assign('visao_adm', true);
			$this->system->view->assign('nome_usuario_visitado', $this->system->session->getItem('session_nome_usuario'));
			
		}
		//Estatisticas
		//$estatisticas_topo = (array)$this->system->session->getItem('estatisticas_topo');
		//if ($this->system->session->getItem('session_nivel') == 4 && empty($estatisticas_topo)) {
		//	$this->system->load->dao('estatisticas');
		//	$estatisticas_topo = $this->system->estatisticas->getNaoVistas($this->system->session->getItem('session_cod_usuario'));
		//	$this->system->session->addItem('estatisticas_topo', $estatisticas_topo);
		//}
		$this->system->load->dao('sistemas');
		$sistema = $this->system->sistemas->getSistema($this->sistema_id);

		$this->system->view->assign(array(
			'menu'   				=> $menu,
			'submenu'  				=> $submenu,
			'usuario_id'			=> $this->system->session->getItem('session_cod_usuario'),
			'usuario_nome'			=> $this->system->session->getItem('session_nome'),
			'usuario_email'			=> $this->system->session->getItem('session_email'),
			'usuario_avatar'		=> $this->system->session->getItem('session_avatar'),
			'url_site'				=> $this->system->getUrlSite(),
			'admin_dir'				=> 'market/',
			'url_portal'			=> $this->system->getUrlPortal(),
			'admin_url'				=> $this->system->getUrlSite().'market/'.$this->system->session->getItem('session_nivel_categoria'),
			'estatisticas_topo'		=> $estatisticas_topo,
			'notificacoes_topo'		=> $notificacoes,
			'duvidas_topo'			=> $duvidas_topo,
			'solicitacoes_saque'    => $saquesSolicitados,
			'site'    				=> 'http://localmarket.com/'.$sistema['dominio']
		));
		switch($this->system->session->getItem('estrutura'))  {
			case 'secundaria':
				echo $this->system->view->fetch($this->categoria.'/estrutura_secundaria.tpl');
				break;
			case 'acesso_instituicao':
				echo $this->system->view->fetch($this->categoria.'/acesso_instituicao/estrutura.tpl');
				break;	
			default:
				echo $this->system->view->fetch($this->categoria.'/estrutura.tpl');
				break;
		}
        
	}
	// ===============================================================
	public function rodape() {
		echo $this->system->view->fetch($this->categoria.'/rodape.tpl');
	}
	// ===============================================================
	public function posicoesMenusGlobais($menu) {
		switch($menu) {
			case 'curso':
				switch($this->system->session->getItem('session_nivel')) {
					case 3:
						return 7;
					case 2:
						return 3;
				}
				break;
			case 'vendas':
				switch($this->system->session->getItem('session_nivel')) {
					case 1:
						return 9;
					case 6:
						return 2;
				}
				break;
			case 'certificados-gerenciar':
				switch($this->system->session->getItem('session_nivel')) {
					case 1:
						return 3;
					case 6:
						return 2;
				}
				break;
			case 'cupons':
				switch($this->system->session->getItem('session_nivel')) {
					case 1:
						return 6;
					case 3:
						return 3;
				}
				break;
			case 'areas': 
				switch ($this->system->session->getItem('session_nivel')) {
					case 3:
						return 9;
					case 1:
						return 7;
				}
				break;
		}
		return 0;
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