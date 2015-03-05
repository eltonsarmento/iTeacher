<?php
require_once(dirname(__FILE__) . '/usuarios.dao.php');
// ===================================================================
class CoordenadoresDAO extends UsuariosDAO {
	// ===============================================================
	protected $system = null;
	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();		
	}
	// ===============================================================
	public function cadastrar($input) {
        
		$this->system->sql->insert('usuarios', array(
			'sistema_id' 		=> $this->system->getSistemaID(),
        	'nome'			    => trim($input['nome']),
        	'senha'			    => $this->system->func->criptografar(trim($input['senha'])),
        	'email'			    => trim($input['email']),
        	'nivel'			    => 6,
        	'data_cadastro'     => date('Y-m-d H:i:s'),
            'cadastro_por_id'   => intval($this->system->session->getItem('session_cod_usuario')),
            'avatar'            => 'avatar_padrao.jpg',
        	'ativo'	            => 1,
            'reference'         => ""
        ));
        
		$id = $this->system->sql->nextid();
		
		$this->system->sql->insert('usuarios_dados', array(
			'usuario_id'	 => $id,
        	'cep'			 => trim($input['cep']),
        	'cpf'			 => trim($input['cpf']),
        	'endereco'		 => trim($input['endereco']),
        	'complemento'	 => trim($input['complemento']),
        	'bairro'		 => trim($input['bairro']),
        	'cidade'		 => trim($input['cidade']),
        	'estado'		 => trim($input['estado']),
        	'telefone'       => trim($input['telefone']),
            'email_secundario' => "",
            'data_nascimento'  => "0000-00-00",
            'facebook' => "",
            'twitter' => "",
            'minicurriculo' => "",
            'contato' => "",
            'razao_social' => "",
            'cnpj' => ""
        ));
        $this->system->sql->update('usuarios', array('reference' => md5($id)), "id='" . $id . "'");
        return $id;
	}
	// ===============================================================
	public function atualizarDados($input) {
		$this->system->sql->update('usuarios', array(
        	'nome'	=> trim($input['nome']),
           	'email'	=> trim($input['email']),
        ),
		"id='" . $input['id'] . "' and sistema_id = '".$this->system->getSistemaID()."'");
		
		$this->system->sql->update('usuarios_dados', array(
        	'cep'          	=> trim($input['cep']),
            'cpf'           => trim($input['cpf']),
            'endereco'      => trim($input['endereco']),
            'complemento'	=> trim($input['complemento']),
            'bairro'        => trim($input['bairro']),
            'cidade'        => trim($input['cidade']),
            'estado'        => trim($input['estado']),
            'telefone'      => trim($input['telefone'])
        ),
		"usuario_id='" . $input['id'] . "'");
	}
    
	// ===============================================================
	public function getCoordenadores($palavra = '', $metodo_busca = '', $limit, $order = 'nome', $apenas_total = false) {
		$sql_extra = ' and sistema_id = ' . $this->system->getSistemaID();
        if ($palavra != '') {
			//email
            if ($metodo_busca == 'email') 	$sql_extra .= " and email like '%" . $palavra . "%'";
            //cpf
            if ($metodo_busca == 'cpf') 	$sql_extra .= " and id in (SELECT usuario_id FROM usuarios_dados WHERE cpf = '" . $palavra . "')";   
            //padrao
            if ($metodo_busca == 'padrao') 	$sql_extra .= " and (nome like '%" . $palavra . "%' OR email like '%" . $palavra . "%')";
        }
        
		//Parceiro
        //if ($this->system->session->getItem('session_nivel') == 5) {
        //    $sql_extra .= " and cadastro_por_id = '" . $this->system->session->getItem('session_cod_usuario') . "'";
        //}
		
		if ($apenas_total)
			return $this->system->sql->querycountunit($this->system->sql->select('count(id) as total', 'usuarios', "excluido='0' and nivel = '6'" . $sql_extra));
		$query = $this->system->sql->select('*', 'usuarios', "excluido='0' and nivel = '6'" . $sql_extra, $limit, $order);
		return $this->system->sql->fetchrowset($query);
	}
    // ===============================================================
	public function getCoordenador($id, $dadosCompletos = false) {
		$aluno = parent::getUsuario($id, $dadosCompletos);
        if ($aluno['nivel'] != 6) return array();
        return $aluno;
	}
    // ===============================================================
    public function countCoordenadores() {
        $total = end($this->system->sql->fetchrowset($this->system->sql->select('count(1) as total', 'usuarios', "excluido='0' and nivel='6' and sistema_id='".$this->system->getSistemaID()."'", $limit, $orderby)));
        return $total['total'];
    }

    
	public function getCadastrosCoordenadores($campos) {
		return $this->system->sql->fetchrowset($this->system->sql->select('id, nome, data_cadastro', 'usuarios', "excluido=0 and nivel = 6 and sistema_id='".$this->system->getSistemaID()."' and ativo = 1" . $campos));
	}
	// ===============================================================
}
// ===================================================================