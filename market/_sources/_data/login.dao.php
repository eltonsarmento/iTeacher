<?php
// ===================================================================
class LoginDAO {
	// ===============================================================
	private $system = null;
	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();		
	}
	// ===============================================================
	public function getLoginDao($usuario, $senha) {
		if($usuario && $senha) {

    		$result = $this->system->sql->select('id, sistema_id, nome, email, senha, avatar, nivel', 'usuarios', "email='".$usuario."' and excluido = 0 and ativo = 1");
    		$setinfo = $this->system->sql->fetchobject($result);    		

	    	if($this->system->sql->numrows($result) && trim($setinfo->senha) != '') {
	    		if($setinfo->senha != $this->system->func->criptografar($senha))
					return false;

				//Verifica se o sistema está ativo.
				$result = $this->system->sql->select('id, excluido', 'sistemas', "id = '" . $setinfo->sistema_id . "'");
				$sistema = end($this->system->sql->fetchrowset($result));
				if (!empty($sistema['id']) && $sistema['excluido'] == 0)
					return $setinfo;
	    	}
		}
		return false;
	}
	// ===============================================================
	public function getNivelUsuario($id) {
		$result = $this->system->sql->select('nivel', 'usuarios', "id='".$id."' and excluido = 0");
    	$setinfo = $this->system->sql->fetchobject($result);
		return (int)$setinfo->nivel;
	}
	// ===============================================================
	public function updateEntrada($id) {
		if ($id) {
			$this->system->sql->delete('usuarios_logados', "usuario_id='" . $id . "'");
			$this->system->sql->insert('usuarios_logados', array(
				'usuario_id' => $id,
				'ip'		 => $this->system->func->getIp(),
				'data'		=> date('Y-m-d H:i:s')
			));	
		}
	}
	// ===============================================================
	public function checarBanco($id) {
		$data = date('Y-m-d H:i:s', mktime(date('H')-1));
		$result = end($this->system->sql->fetchrowset($this->system->sql->select('*', 'usuarios_logados', "usuario_id='".$id."' and data >= '" . $data . "' ")));

		if (!$result['usuario_id'] || $result['ip'] == $this->system->func->getIP()) 
		 	return false; //Liberado
		
		return true; //Deslogar
	}
	// ===============================================================
	public function deslogar($id) {
		if ($id)
			$this->system->sql->delete('usuarios_logados', "usuario_id='" . $id . "'");
	}
	// ===============================================================
}
// ===================================================================