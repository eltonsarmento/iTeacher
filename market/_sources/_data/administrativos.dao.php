<?php
require_once(dirname(__FILE__) . '/usuarios.dao.php');
// ===================================================================
class AdministrativosDAO extends UsuariosDAO {
	// ===============================================================
	protected $system = null;
	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();		
	}
	// ===============================================================
	public function cadastrar($input) {
        $this->system->sql->insert('usuarios', array(
            'sistema_id'        => $this->system->getSistemaID(),
            'nome'              => trim($input['nome']),
            'senha'             => $this->system->func->criptografar(trim($input['senha'])),
            'email'             => trim($input['email']),
            'nivel'             => 4,
            'avatar'            => 'avatar_padrao.jpg',
            'cadastro_por_id'   => $this->system->session->getItem('session_cod_usuario'),
            'data_cadastro'     => date('Y-m-d H:i:s'),
            'ativo'             => 1
            
        ));
        $id = $this->system->sql->nextid();
        $this->system->sql->insert('usuarios_dados', array(
            'usuario_id'    => $id
        ));

        $this->system->sql->update('usuarios', array('reference' => md5($id)), "id='" . $id . "'");
        
        return $id;
    }
    // ===============================================================
    public function atualizar($input) {
        $this->system->sql->update('usuarios', array(
            'nome'  => trim($input['nome']),
            'email' => trim($input['email'])
        ),  "id='" . $input['id'] . "'");
        if ($input['senha']) 
            $this->system->sql->update('usuarios', array('senha' => trim($input['senha'])), "id='" . $input['id'] . "'");
    }
    // ===============================================================
    public function getAdministrativos($palavra = '', $limit = '', $order = 'nome') {
        $query = $this->system->sql->select('*', 'usuarios', "excluido='0' and nivel = '4' AND sistema_id = '".$this->system->getSistemaID()."' " . ($palavra ? " and nome like '%" . $palavra . "%'" : ''), $limit, $order);
        return $this->system->sql->fetchrowset($query);
    }
    // ===============================================================
    public function getAdministrativo($id, $dadosCompletos = false) {
        $administrativo = parent::getUsuario($id, $dadosCompletos);
        if ($administrativo['nivel'] != 4)
            return array();
        return $administrativo;
    }
}
// ===================================================================