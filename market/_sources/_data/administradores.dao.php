<?php
require_once(dirname(__FILE__) . '/usuarios.dao.php');
// ===================================================================
class AdministradoresDAO extends UsuariosDAO {
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
        	'nivel'			    => 1,
        	'data_cadastro'     => date('Y-m-d H:i:s'),
            'cadastro_por_id'   => intval($this->system->session->getItem('session_cod_usuario')),
            'avatar'            => 'avatar_padrao.jpg',
        	'ativo'	            => 1,
            'reference'         => '',
        ));
		$id = $this->system->sql->nextid();
		$this->system->sql->insert('usuarios_dados', array(
			'usuario_id'	        => $id,
        	'cep'			        => trim($input['cep']),
            'cpf'                   => trim($input['cpf']),
        	'endereco'		        => trim($input['endereco']),
        	'complemento'	        => trim($input['complemento']),
        	'bairro'		        => trim($input['bairro']),
        	'cidade'		        => trim($input['cidade']),
        	'estado'		        => trim($input['estado']),
        	'telefone'              => trim($input['telefone']),
            'email_secundario'      => trim($input['email_secundario']),
            'razao_social'          => trim($input['razao_social']),
            'email_secundario'      => trim($input['email_secundario']),
            'tipo_pessoa'           => 2,
            'nome_responsavel'      => trim($input['nome_responsavel']),
            'inscricao_municipal'   => trim($input['inscricao_municipal']),
            'inscricao_estadual'    => trim($input['inscricao_estadual']),
            'area_atuacao'          => trim($input['area_atuacao']),
            'telefone_responsavel'  => trim($input['telefone_responsavel']),
            'site'                  => trim($input['site']),


        ));
        $this->system->sql->update('usuarios', array('reference' => md5($id)), "id='" . $id . "'");
        return $id;
	}
	// ===============================================================
	public function atualizar($input) {

        
		$this->system->sql->update('usuarios', array(
        	'nome'	=> trim($input['nome']),
           	'email'	=> trim($input['email']),
        	'ativo'	=> (isset($input['ativo']) ? $input['ativo'] : 1) 
        ),
		"id='" . $input['id'] . "'");
		
		if ($input['senha']) 
			$this->system->sql->update('usuarios', array('senha' => $this->system->func->criptografar(trim($input['senha']))), "id='" . $input['id'] . "' and sistema_id = '".$this->system->getSistemaID()."'");

		$this->system->sql->update('usuarios_dados', array(
        	'cep'                  => trim($input['cep']),
            'cpf'                   => trim($input['cpf']),
            'endereco'              => trim($input['endereco']),
            'complemento'           => trim($input['complemento']),
            'bairro'                => trim($input['bairro']),
            'cidade'                => trim($input['cidade']),
            'estado'                => trim($input['estado']),
            'telefone'              => trim($input['telefone']),
            'email_secundario'      => trim($input['email_secundario']),
            'razao_social'          => trim($input['razao_social']),
            'email_secundario'      => trim($input['email_secundario']),
            'tipo_pessoa'           => 2,
            'nome_responsavel'      => trim($input['nome_responsavel']),
            'inscricao_municipal'   => trim($input['inscricao_municipal']),
            'inscricao_estadual'    => trim($input['inscricao_estadual']),
            'area_atuacao'          => trim($input['area_atuacao']),
            'telefone_responsavel'  => trim($input['telefone_responsavel']),
            'site'                  => trim($input['site']),
        ),
		"usuario_id='" . $input['id'] . "'");
	}
	// ===============================================================
	public function getAdministradores($palavra = '', $metodo_busca = '', $limit, $order = 'nome', $apenas_total = false) {
		//$sql_extra = ' and sistema_id = ' . $this->system->getSistemaID();
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
			return $this->system->sql->querycountunit($this->system->sql->select('count(id) as total', 'usuarios', "excluido='0' and nivel = '5'" . $sql_extra));
		$query = $this->system->sql->select('*', 'usuarios', "excluido='0' and nivel = '1'" . $sql_extra, $limit, $order);
		return $this->system->sql->fetchrowset($query);
	}
    // ===============================================================
	public function getAdministrador($id, $dadosCompletos = false) {
		$aluno = parent::getUsuario($id, $dadosCompletos);
               
        if ($aluno['nivel'] != 1) return array();
        return $aluno;
	}
    // ===============================================================
    public function countAdministradores() {
        $total = end($this->system->sql->fetchrowset($this->system->sql->select('count(1) as total', 'usuarios', "excluido='0' and nivel='1' and sistema_id='".$this->system->getSistemaID()."'", $limit, $orderby)));
        return $total['total'];
    }
    // ===============================================================
    public function atualizarLogotipo($id, $imagem) {
        $this->system->sql->update('usuarios', array('logotipo' => $imagem), "id='" . $id . "'");
    }
    // ===============================================================
    public function desativarAdministrador($id){
        $this->system->sql->update('usuarios', array(
            'ativo' => 0 
        ),"id='". $id ."'");
    }
    // ===============================================================
    public function deletaAdministrador($id){
        $this->system->sql->update('usuarios', array(
            'excluido' => 1 
        ),"id='". $id ."'");
    }
}
// ===================================================================