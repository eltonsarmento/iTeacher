<?php
require_once(dirname(__FILE__) . '/usuarios.dao.php');
// ===================================================================
class InstituicoesDAO extends UsuariosDAO {
	// ===============================================================
	protected $system = null;
	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();		
	}
    // ===============================================================
    public function cadastrarBySite($input) {
        
         $this->system->sql->insert('sistemas', array(
            'nome'              => "Sistema - ". trim($input['nome']),
            'data_cadastro'     => date('Y-m-d H:i:s'),            
            'tipo_sistema'      => 1,
            'excluido'          => 0
        ));
        $sistemaID = $this->system->sql->nextid();        
        
        $this->system->sql->insert('usuarios', array(
            'sistema_id'        => $sistemaID,
            'nome'              => trim($input['nome']),
            'senha'             => $this->system->func->criptografar(trim($input['senha'])),
            'email'             => trim($input['email_secundario']),
            'nivel'             => 5,
            'data_cadastro'     => date('Y-m-d H:i:s'),
            'cadastro_por_id'   => 0,
            'avatar'            => 'avatar_padrao.jpg',
            'ativo'             => 1,
            'reference'         => '',
        ));
        $id = $this->system->sql->nextid();
        $this->system->sql->insert('usuarios_dados', array(
            'usuario_id'            => $id,
            'cep'                   => trim($input['cep']),
            'cnpj'                  => trim($input['cnpj']),
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
            'cpf'                  => '',


        ));
        $this->system->sql->update('usuarios', array('reference' => md5($id)), "id='" . $id . "'");
        return $id;
    }
	// ===============================================================
	public function cadastrar($input) {
        if($this->system->session->getItem('session_nivel_categoria') == 'administrador'){
             $this->system->sql->insert('sistemas', array(
                'nome'              => "Sistema - ". trim($input['nome']),
                'data_cadastro'     => date('Y-m-d H:i:s'),            
                'tipo_sistema'      => 1,
                'dominio'           => trim(str_replace(' ','-',$input['nome'])),
                'excluido'          => 0
            ));
            $sistemaID = $this->system->sql->nextid();
        }else{
            $sistemaID = $this->system->getSistemaID();
        }
        
		$this->system->sql->insert('usuarios', array(
			'sistema_id' 		=> $sistemaID,
        	'nome'			    => trim($input['nome']),
        	'senha'			    => $this->system->func->criptografar(trim($input['senha'])),
        	'email'			    => trim($input['email_secundario']),
        	'nivel'			    => 5,
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
        	'cnpj'			        => trim($input['cnpj']),
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
            'cpf'                   => '',


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
			$this->system->sql->update('usuarios', array('senha' => trim($input['senha'])), "id='" . $input['id'] . "' and sistema_id = '".$this->system->getSistemaID()."'");

		$this->system->sql->update('usuarios_dados', array(
        	'cep'                  => trim($input['cep']),
            'cnpj'                  => trim($input['cnpj']),
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

        $usuario = parent::getUsuario($input['id'], false);  
        $this->system->sql->update('sistemas', array('dominio' => trim(str_replace(' ','-',$input['nome']))), "id='" . $usuario['sistema_id'] . "'");
	}
	// ===============================================================
	public function getInstituicoes($palavra = '', $metodo_busca = '', $limit, $order = 'nome', $apenas_total = false) {
		//$sql_extra = ' and sistema_id = ' . $this->system->getSistemaID();
        if ($palavra != '') {
			//email
            if ($metodo_busca == 'email') 	$sql_extra .= " and email like '%" . $palavra . "%'";
            //cpf
            if ($metodo_busca == 'cpf') 	$sql_extra .= " and id in (SELECT usuario_id FROM usuarios_dados WHERE cpf = '" . $palavra . "')";   
            //padrao
            if ($metodo_busca == 'padrao') 	$sql_extra .= " and (nome like '%" . $palavra . "%' OR email like '%" . $palavra . "%')";
            
        }
		
		if ($apenas_total)
			return $this->system->sql->querycountunit($this->system->sql->select('count(id) as total', 'usuarios', "excluido='0' and nivel = '5'" . $sql_extra));
		$query = $this->system->sql->select('*', 'usuarios', "excluido='0' and nivel = '5'" . $sql_extra, $limit, $order);
		return $this->system->sql->fetchrowset($query);
	}
    // ===============================================================
	public function getInstituicao($id, $dadosCompletos = false) {
		$instituicao = parent::getUsuario($id, $dadosCompletos);
               
        if ($instituicao['nivel'] != 5) return array();
        return $instituicao;
	}
    // ===============================================================
    public function countInstituicoes() {
        $total = end($this->system->sql->fetchrowset($this->system->sql->select('count(1) as total', 'usuarios', "excluido='0' and nivel='5' and sistema_id='".$this->system->getSistemaID()."'", $limit, $orderby)));
        return $total['total'];
    }
    // ===============================================================
    public function atualizarLogotipo($id, $imagem) {
        $this->system->sql->update('usuarios', array('logotipo' => $imagem), "id='" . $id . "'");
    }
    // ===============================================================
    public function desativarInstituicao($id){
        $this->system->sql->update('usuarios', array(
            'ativo' => 0 
        ),"id='". $id ."'");
    }
    // ===============================================================
    public function ativarInstituicao($id){
        $this->system->sql->update('usuarios', array(
            'ativo' => 1 
        ),"id='". $id ."'");
    }
    // ===============================================================
    public function getInstituicaoBySistemaID($sistema_id){
        $query = $this->system->sql->select('*', 'usuarios', "excluido='0' and nivel = '5' and sistema_id='".$sistema_id."'" . $sql_extra, $limit, $order);
        return end($this->system->sql->fetchrowset($query));
    }

    // ==============================================================
}
// ===================================================================