<?php

// ===================================================================
class ComprovantesDAO {
	// ===============================================================
	protected $system = null;
	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();		
	}
	// ===============================================================
	public function cadastrar($input) {
		$this->system->sql->insert('comprovantes', array(
			'sistema_id' 		=> $this->system->getSistemaID(),
        	'mes'			    => trim($input['mes']),
        	'valor_total'	    => trim($input['valor']),
        	'observacao'			=> trim($input['observacao']),
        	'usuario_id'		=> intval($this->system->session->getItem('session_cod_usuario')),
        ));
		$id = $this->system->sql->nextid();
        return $id;
	}
	// ===============================================================
	public function atualizar($input) {

        
		$this->system->sql->update('usuarios', array(
        	'nome'	=> trim($input['nome']),
           	'email'	=> trim($input['email']),
        	'ativo'	=> (isset($input['ativo']) ? $input['ativo'] : 1) 
        ),
		"id='" . $input['id'] . "' and sistema_id = '".$this->system->getSistemaID()."'");
		
		if ($input['senha']) 
			$this->system->sql->update('usuarios', array('senha' => trim($input['senha'])), "id='" . $input['id'] . "' and sistema_id = '".$this->system->getSistemaID()."'");

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
	public function getComprovantes($palavra = '', $metodo_busca = '', $limit, $order = 'mes', $apenas_total = false) {
		$sql_extra = ' sistema_id = ' . $this->system->getSistemaID();
        if ($palavra != '') {
            //padrao
            if ($metodo_busca == 'padrao') 	$sql_extra .= " and (mes like '%" . $palavra . "%' OR observacao like '%" . $palavra . "%')";
            
        }
        
		//Parceiro
        //if ($this->system->session->getItem('session_nivel') == 5) {
        //    $sql_extra .= " and cadastro_por_id = '" . $this->system->session->getItem('session_cod_usuario') . "'";
        //}
		
		if ($apenas_total)
			return $this->system->sql->querycountunit($this->system->sql->select('count(id) as total', 'comprovantes', $sql_extra));
		$query = $this->system->sql->select('*', 'comprovantes', $sql_extra, $limit, $order);
		return $this->system->sql->fetchrowset($query);
	}
    // ===============================================================
	public function getComprovante($id) {
	   	$query = $this->system->sql->select('*', 'comprovantes', "excluido='0' and id = '".$id."'");
        return $this->system->sql->fetchrowset($query);
	}
    // ===============================================================
    public function countComprovantes() {
        $total = end($this->system->sql->fetchrowset($this->system->sql->select('count(1) as total', 'usuarios', "excluido='0' and nivel='2' and sistema_id='".$this->system->getSistemaID()."'", $limit, $orderby)));
        return $total['total'];
    }
    // ===============================================================
    public function atualizarAnexo($id, $documento, $campo) {
        $this->system->sql->update('comprovantes', array($campo => $documento), "id='" . $id . "' and sistema_id='" . $this->system->getSistemaID() . "'");
    }
    // ===============================================================
    public function getObservacao($id){
        $query = $this->system->sql->select('observacao', 'comprovantes', "id = '".$id."' and sistema_id='".$this->system->getSistemaID()."'");
        return $this->system->sql->fetchrowset($query);   
    }


}
// ===================================================================