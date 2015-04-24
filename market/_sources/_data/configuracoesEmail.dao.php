<?php
// ===================================================================
class ConfiguracoesEmailDAO {
	// ===============================================================
	protected $system = null;
	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();		
	}	
	// ===============================================================
	public function getConfiguracoesGeraisEmail($id) {
		$query = $this->system->sql->select('*', 'configuracoes_gerais_email', "sistema_id = '".$id."'");
		$configuracoes = end($this->system->sql->fetchrowset($query));
		
		return $configuracoes;
	}
	// ===============================================================
	public function cadastrarServidor($input) {
		$this->system->sql->insert('configuracoes_gerais_email', array(
			'sistema_id' => $this->system->getSistemaID(),
			'host' => trim($input['host']),
			'porta' => trim($input['porta']),
			'senha' => trim($input['senha']), 
			'SMTPSecure' => trim($input['SMTPSecure']), 
			'nome' => '',
			'email' => '',
			'imagem_cabecalho' => '',
			'texto_rodape' => ''
			));
		return $this->system->sql->nextid();
	}
	// ===============================================================
	public function atualizarServidor($input) {
		$this->system->sql->update('configuracoes_gerais_email', array(
			'host' => trim($input['host']),
			'porta' => trim($input['porta']),
			'senha' => trim($input['senha']),
			'SMTPSecure' => trim($input['SMTPSecure'])
			), "sistema_id = '".$input['sistema_id']."'");
	}
	// ===============================================================
	public function cadastrarRemetente($input) {
		$this->system->sql->insert('configuracoes_gerais_email', array(
			'sistema_id' => $this->system->getSistemaID(),
			'nome' => trim($input['nome']),
			'email' => trim($input['email'])			
			));
		return $this->system->sql->nextid();
	}
	// ===============================================================
	public function atualizarRemetente($input) {
		$this->system->sql->update('configuracoes_gerais_email', array(
			'nome' => trim($input['nome']),
			'email' => trim($input['email'])
			), "sistema_id = '".$input['sistema_id']."'");
	}
	// ===============================================================
	public function cadastrarModelo($input) {
		$this->system->sql->insert('configuracoes_gerais_email', array(
			'sistema_id' => $this->system->getSistemaID(),
			'rodape' => trim($input['rodape'])			
			));
		return $this->system->sql->nextid();
	}
	// ===============================================================
	public function atualizarImagem($id, $imagem) {
		$this->system->sql->update('configuracoes_gerais_email', array('imagem_cabecalho' => $imagem), "sistema_id = '".$id."'");
	}
	// ===============================================================
	public function atualizarModelo($input) {
		$this->atualizarImagem($input['sistema_id'],$input['imagem_cabecalho']);
		$this->system->sql->update('configuracoes_gerais_email', array('texto_rodape' => $input['texto_rodape']), "sistema_id = '".$input['sistema_id']."'");
	}
		
	// ===============================================================
	public function getUsuariosByNivel($nivel) {
		$query = $this->system->sql->select('id, nome, email', 'usuarios', "nivel = '" . $nivel . "' and ativo = 1 and excluido = 0");
		return $this->system->sql->fetchrowset($query);
	}
	
	// ===============================================================
}
// ===================================================================