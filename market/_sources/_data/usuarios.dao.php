<?php
// ===================================================================
class UsuariosDAO {
	// ===============================================================
	protected $system = null;
	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();		
	}
	// ===============================================================
	public function cadastrar($input) {
		$this->system->sql->insert('usuarios', array('sistema_id' => $this->system->getSistemaID()));
		return $this->system->sql->nextid();
	}
	// ===============================================================
	public function atualizar($input) {
		$this->system->sql->update('usuarios', array(
        	'nome'	=> trim($input['nome']),
        	'email' => trim($input['email']),
        ),
		"id='" . $input['id'] . "'");
		$this->system->sql->update('usuarios_dados', array(
        	'cep'					=> trim($input['cep']),
        	'cpf'					=> trim($input['cpf']),
        	'endereco'				=> trim($input['endereco']),
        	'complemento'			=> trim($input['complemento']),
        	'bairro'				=> trim($input['bairro']),
        	'cidade'				=> trim($input['cidade']),
        	'estado'				=> trim($input['estado']),
        	'telefone'   		    => trim($input['telefone']),
        	'inscricao_municipal'   => trim($input['inscricao_municipal']),
        	'inscricao_estadual'    => trim($input['inscricao_estadual']),
        	'nome_responsavel'      => trim($input['responsavel']),
        	'area_atuacao'      	=> trim($input['area_atuacao']),
        	'email_secundario'      => trim($input['email_responsavel']),        	
        	'cnpj'			        => trim($input['cnpj']),
        	'razao_social'			=> trim($input['razao_social']),
        	'site'			        => trim($input['site']),
        	'minicurriculo'			=> trim($input['minicurriculo'])
        ),
		"usuario_id='" . $input['id'] . "'");

		$dominio = trim($input['dominio']);
		if(!empty($dominio)){
			$usuario = $this->getUsuario($input['id'], false);  
        	$this->system->sql->update('sistemas', array('dominio' => trim(str_replace(' ','-',$dominio))), "id='" . $usuario['sistema_id'] . "'");
        }
	}

	//=================================================================

	public function atualizarRedeSocial($input){
		$this->system->sql->update('usuarios_dados', array(
        	'facebook'		=> trim($input['facebook']),
        	'twitter'		=> trim($input['twitter']),
        	'instagram'		=> trim($input['instagram']),
        	'youtube'		=> trim($input['youtube'])
        ),
		"usuario_id='" . $input['id'] . "'");
	}

	// ===============================================================
	public function atualizarImagem($id, $imagem) {
		$this->system->sql->update('usuarios', array('avatar' => $imagem), "id='" . $id . "' and sistema_id = '".$this->system->getSistemaID()."'");
	}
	// ===============================================================
	public function getUsuario($id, $dadosCompletos = true) {
		if($this->system->session->getItem('session_nivel_categoria') == 'administrador'){
			$query = $this->system->sql->select('*', 'usuarios', "excluido='0' and id= '" . $id . "'");	
		}else{
			$query = $this->system->sql->select('*', 'usuarios', "excluido='0' and id= '" . $id . "' and sistema_id = '".$this->system->getSistemaID()."'");	
		}
		
		$usuario = end($this->system->sql->fetchrowset($query));
		if ($usuario['id'] && $dadosCompletos) {			
			$query = $this->system->sql->select('*', 'usuarios_dados', "usuario_id= '" . $id . "'");
			$dadosExtras = end($this->system->sql->fetchrowset($query));
			$dadosExtras['data_nascimento'] = date('d/m/Y', strtotime($dadosExtras['data_nascimento']));
			$usuario = array_merge($usuario, $dadosExtras);
		}
		$query = $this->system->sql->select('*', 'sistemas', "id= '" . $usuario['sistema_id'] . "'");
		$sistema = end($this->system->sql->fetchrowset($query));
		$usuario['dominio'] = $sistema['dominio'];

		
		return $usuario;
	}
	// ===============================================================
	public function deletar($id) {
		$this->system->sql->update('usuarios', array('excluido' => 1), "id='" . $id . "' and sistema_id = '".$this->system->getSistemaID()."'");
	}
	// ===============================================================
	public function atualizarSenha($id, $senha) {				
		$this->system->sql->update('usuarios', array('senha' => $this->system->func->criptografar(trim($senha))), "id='" . $id . "'" . ($this->system->getSistemaID() ? " and sistema_id = '".$this->system->getSistemaID()."'" : "") );
	}
	// ===============================================================
	public function getValorExtra($id, $campo) {
		$query = $this->system->sql->select($campo, 'usuarios_dados', "usuario_id='" . $id . "'");
		$result = end($this->system->sql->fetchrowset($query));
		return $result[$campo];
	}
	// ===============================================================
	public function checkEmailCadastrado($id, $email, $sistema_id) {
		$query = $this->system->sql->select('id', 'usuarios', "id != '" . $id . "' and email = '" . $email . "'  and excluido = 0");
		$result = end($this->system->sql->fetchrowset($query));
		if ($result['id']) return true;
		return false;
	}
	// ===============================================================
	public function getUsuariosByNivel($nivel) {
		$query = $this->system->sql->select('id, nome, email, sistema_id', 'usuarios', "nivel = '" . $nivel . "' and ativo = 1 and excluido = 0");
		return $this->system->sql->fetchrowset($query);
	}
	// ===============================================================
	public function getUsuarioByEmail($email) {
		$query = $this->system->sql->select('*', 'usuarios', "excluido='0' and email = '" . $email . "'");
		$usuario = end($this->system->sql->fetchrowset($query));
		if ($usuario['id'])
			return $usuario;
	}
	// ===============================================================
	public function getIDByEmail($email) {
		$query = $this->system->sql->select('id', 'usuarios', "email = '" . $email . "' and excluido = 0");
		$usuario = end($this->system->sql->fetchrowset($query));
		if ($usuario['id'])
			return $usuario['id'];
		else
			return 0;
	}
	// ===============================================================
	public function getUsuarioByIdMd5($idMD5) {
		$query = $this->system->sql->select('*', 'usuarios', "excluido='0' and id_md5 = '" . $idMD5 . "'");
		$usuario = end($this->system->sql->fetchrowset($query));
		if ($usuario['id']) 
			return $usuario;
	}
	// ===============================================================
	public function getUsuarioByReference($reference) {
		$query = $this->system->sql->select('*', 'usuarios', "excluido='0' and reference = '" . $reference . "'");
		$usuario = end($this->system->sql->fetchrowset($query));
		if ($usuario['id']) 
			return $usuario;
	}
	// ===============================================================
	public function atualizarCampo($id, $campo) {
		$this->system->sql->update('usuarios', $campo, "id='" . $id . "' and sistema_id = '".$this->system->getSistemaID()."'");
	}
	// ===============================================================
	public function getDadosUsuario($id){
		$query = $this->system->sql->select('*', 'usuarios_dados', " usuario_id = '" . $id . "'");
		$usuario = end($this->system->sql->fetchrowset($query));
		return $usuario;
	}
	// ===============================================================
	public function getSistemaID($usuarioID) {
		return  end(end($this->system->sql->fetchrowset($this->system->sql->select('sistema_id', 'usuarios', 'id =' . $usuarioID))));

	}
	// ===============================================================
	public function countUsuariosByNivel($nivel){
		$total = end($this->system->sql->fetchrowset($this->system->sql->select('count(1) as total', 'usuarios', "excluido='0' and nivel='".$nivel."'", $limit, $orderby)));
        return $total['total'];
	}

	// ===============================================================
	public function getUsuarioBySistemaID() {
		$query = $this->system->sql->select('u.*, ud.*', 'usuarios u INNER JOIN usuarios_dados ud ON (u.id = ud.usuario_id)', " sistema_id =  '" . $this->system->getSistemaID() . "' AND nivel in('5','3') AND ativo = '1' AND excluido = '0'");
		$usuario = end($this->system->sql->fetchrowset($query));
		return $usuario;
	}
	// ===============================================================
	public function getUsuarioAdmin() {
		return end($this->system->sql->fetchrowset($this->system->sql->select('*', 'usuarios', 'nivel = 1 and excluido = 0  and ativo  = 1')));
	}
}
// ===================================================================