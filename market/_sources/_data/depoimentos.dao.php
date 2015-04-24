<?php
// ===================================================================
class DepoimentosDAO {
	// ===============================================================
	private $system = null;
	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();		
	}
	// ===============================================================
	public function cadastrar($input) {
		$this->system->sql->insert('depoimentos', array(
			'usuario_id'	=> $this->system->session->getItem('session_cod_usuario'),
			'curso_id'	=> $input['curso_id'],
			'mensagem'	=> $input['mensagem'],
			'status'	=> 0,
			'excluido'  => 0,
			'data_cadastro'			=> date('Y-m-d H:i:s'),
		));
		return $this->system->sql->nextid();

	}
	// ================================================================
	public function atualizar($id, $input) {
		$this->system->sql->update('depoimentos', $input, 'id = ' . $id);
	}
	// =================================================================
	public function getDepoimentos($campos = '', $limit = '') {//usuario id e o campo professor

		$query = $this->system->sql->select('id', 'cursos', "excluido = 0 and sistema_id = '" . $this->system->getSistemaID() . "'");
		$cursos = $this->system->sql->fetchrowset($query);					
		foreach ($cursos as $key => $curso) {
			if(count($cursos) == $key+1) $codigosCurso .= $curso['id'];
			else $codigosCurso .= $curso['id'] ."," ;
		}

		if(empty($codigosCurso))
			return array();
		$query = $this->system->sql->select('*', 'depoimentos', ' curso_id in ('.$codigosCurso.') AND excluido = 0 ' . $campos, $limit, 'id desc');
		$depoimentos = $this->system->sql->fetchrowset($query);

		foreach($depoimentos as $key => $depoimento) {
			//tempo de cadastro (Ex: uma hora atrás)
			$tempo_cadastrado = strtotime($depoimento['data_cadastro']);
			$depoimentos[$key]['tempo_cadastrado'] = $this->system->func->tempoDeCadastro($tempo_cadastrado);
			
			//aluno
			$query = $this->system->sql->select('id, nome, avatar', 'usuarios', "excluido = 0 and id = '" . $depoimento['usuario_id'] . "'");
			$depoimentos[$key]['aluno'] = end($this->system->sql->fetchrowset($query));

			//curso
			$query = $this->system->sql->select('curso', 'cursos', "excluido = 0 and id = '" . $depoimento['curso_id'] . "'");
			$depoimentos[$key]['curso'] = end($this->system->sql->fetchrowset($query));			

		}

		return $depoimentos;
	}

	
	// =================================================================
	public function getDepoimento($campos) {
		$query = $this->system->sql->select('*', 'depoimentos', 'excluido = 0 ' . $campos);
		$depoimento = end($this->system->sql->fetchrowset($query));

		//aluno
		$query = $this->system->sql->select('id, nome, email, avatar', 'usuarios', "excluido = 0 and id = '" . $depoimento['aluno_id'] . "'");
		$depoimento['aluno'] = end($this->system->sql->fetchrowset($query));

		//curso
		$query = $this->system->sql->select('id, curso', 'cursos', "excluido = 0 and id = '" . $depoimento['curso_id'] . "'");
		$depoimento['curso'] = end($this->system->sql->fetchrowset($query));

		
		return $depoimento;
	}

	//=================================================================
	public function getDepoimentosBySistemaId($campos = '',$sistema_id, $limit = ''){
		$query = $this->system->sql->select('d.*', 'depoimentos d, cursos c', 'd.curso_id = c.id and d.excluido = 0 and c.sistema_id = '.$sistema_id.'' . $campos, $limit, 'd.id desc');
		$depoimentos = $this->system->sql->fetchrowset($query);

		foreach($depoimentos as $key => $depoimento) {
			//tempo de cadastro (Ex: uma hora atrás)
			$tempo_cadastrado = strtotime($depoimento['data_cadastro']);
			$depoimentos[$key]['tempo_cadastrado'] = $this->system->func->tempoDeCadastro($tempo_cadastrado);
			
			//aluno
			$query = $this->system->sql->select('id, nome, avatar', 'usuarios', "excluido = 0 and id = '" . $depoimento['usuario_id'] . "'");
			$depoimentos[$key]['aluno'] = end($this->system->sql->fetchrowset($query));

			//curso
			$query = $this->system->sql->select('curso', 'cursos', "excluido = 0 and id = '" . $depoimento['curso_id'] . "'");
			$depoimentos[$key]['curso'] = end($this->system->sql->fetchrowset($query));			

		}

		return $depoimentos;
	}
	

}
// ===================================================================