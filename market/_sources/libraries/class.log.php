<?php
// ===================================================================
class Log {
	
	private $system = null;
	private $registrarAcoes = false;
	private $registrarLogins = false;
	private $filtrarUsuarios = array();

	public function __construct() {
		$this->system =& getInstancia();
	}

	//=============================================================================================================================
	public function gravarPassos() {
		if ($this->registrarAcoes) {
			if (empty($this->filtrarUsuarios)) { //Registra a pagina que todos os usuários acessaram
				$this->gravar(array('passos' => 1));
			} else { //Registra a página que usuarios no array acessaram
				foreach ((array)$this->filtrarUsuarios as $usuario) {
					if ($usuario == $this->system->session->getItem('session_cod_usuario')) {
						$this->gravar(array('passos' => 1));
					}
				}
			}
		}
	}
	//=============================================================================================================================
	public function registrarLogins() {
		if ($this->registrarLogins) {
			if (empty($this->filtrarUsuarios)) { //Registra a pagina que todos os usuários acessaram
				$this->gravar(array('login' => 1));
			} else { //Registra a página que usuarios no array acessaram
				foreach ((array)$this->filtrarUsuarios as $usuario) {
					if ($usuario == $this->system->session->getItem('session_cod_usuario')) {
						$this->gravar(array('login' => 1));
					}
				}
			}
		}	
	}
	//=============================================================================================================================
	public function gravar($dados = array()) {
		$log['link'] = $_SERVER['REQUEST_URI'];
		$log['logado'] = ($this->system->session->getItem('session_logged_in') ? 'Sim' : 'Nao');
		$log['usuario'] = $this->system->session->getItem('session_cod_usuario');
		$log['data'] = date('Y-m-d H:i:s');
		$log['sessao'] = session_id();
		$log['host'] = $_SERVER['SERVER_NAME'];
		$log['ip'] = $this->system->func->getIP();
		if (is_array($dados))
			$log = array_merge($log, $dados);
		else
			$log['extra'] = $dados;

		$fp = fopen($this->system->getRootPath() . '/logs/log-' . date('Y-m-d') . '.txt', 'a');
		$escreve = fwrite($fp, json_encode($log)."\n");
		fclose($fp);	
	}
	//=============================================================================================================================
	public function getRegistrarAcoes() {
	    return $this->registrarAcoes;
	}
	//=============================================================================================================================
	public function setRegistrarAcoes($registrarAcoes) {
	    return $this->registrarAcoes = $registrarAcoes;
	}
	//=============================================================================================================================
	public function getRegistrarLogins() {
	    return $this->registrarLogins;
	}
	//=============================================================================================================================
	public function setRegistrarLogins($registrarLogins) {
	    return $this->registrarLogins = $registrarLogins;
	}
	//=============================================================================================================================
	public function getFiltrarUsuarios() {
	    return $this->filtrarUsuarios;
	}
	//=============================================================================================================================
	public function setFiltrarUsuarios($filtrarUsuarios) {
		if (is_array($filtrarUsuarios))
	    	return $this->filtrarUsuarios = $filtrarUsuarios;
	    else
	    	return $this->filtrarUsuarios = array($filtrarUsuarios);
	}


}
// ===================================================================