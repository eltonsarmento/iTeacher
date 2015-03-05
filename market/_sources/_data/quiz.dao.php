<?php
// ===================================================================
class QuizDAO {
	// ===============================================================
	private $system = null;
	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();		
	}
	// ===============================================================
	public function cadastrar($input) {
		$this->system->sql->insert('cursos_quizzes', array(
			'pergunta'				=> $input['pergunta'],
			'sistema_id'			=> $this->system->getSistemaID(),
			'alternativa_correta' 	=> 0,
			'curso_id'				=> $input['curso_id'],
			'usuario_id'			=> $this->system->session->getItem('session_cod_usuario'),
			'capitulo_id'			=> $input['capitulo_id'],
			'aula_id'				=> $input['aula_id'],
			'obrigatorio'			=> $input['obrigatorio'],
			'data_cadastro'			=> date('Y-m-d H:i:s'),
		));
	
		$quiz_id = $this->system->sql->nextid();

		//alternativa
		foreach ($input['alternativa'] as $key => $alternativa) {
			if (!empty($alternativa))
				$this->system->sql->insert('cursos_quizzes_alternativas', array(
					'alternativa'			=> $alternativa,
					'quiz_id'				=> $quiz_id,
				));		

			if ($key == $input['alternativa_correta'])
				$alternativa_id = $this->system->sql->nextid();
		}

		
		$this->system->sql->update('cursos_quizzes', array(
			'alternativa_correta' 	=> $alternativa_id,
		), "id = '" . $quiz_id . "'");

	}
	// ===============================================================
	public function atualizar($input) {
		$this->system->sql->update('cursos_quizzes', array(
        	'pergunta'				=> $input['pergunta'],
			'alternativa_correta' 	=> 0,
			'curso_id'				=> $input['curso_id'],
			'capitulo_id'			=> $input['capitulo_id'],
			'usuario_id'			=> $this->system->session->getItem('session_cod_usuario'),
			'aula_id'				=> $input['aula_id'],
			'obrigatorio'			=> $input['obrigatorio'],
        ),
		"id='" . $input['id'] . "'");


		//alternativas
		$this->system->sql->delete('cursos_quizzes_alternativas', "quiz_id = '" . $input['id'] . "'");

		foreach ($input['alternativa'] as $key => $alternativa) {
			if (!empty($alternativa))
				$this->system->sql->insert('cursos_quizzes_alternativas', array(
					'alternativa'			=> $alternativa,
					'quiz_id'				=> $input['id'],
				));		

			if ($key == $input['alternativa_correta'])
				$alternativa_id = $this->system->sql->nextid();
		}
		
		$this->system->sql->update('cursos_quizzes', array(
			'alternativa_correta' 	=> $alternativa_id,
		), "id = '" . $input['id'] . "'");

	}
	// ===============================================================
	public function deletar($id) {
		$this->system->sql->update('cursos_quizzes', array(
            'excluido' 	=> 1),
		"id='" . $id . "'");
	}
	// ===============================================================
	public function getQuizzes($curso_id) {
		$query = $this->system->sql->select('*', 'cursos_quizzes', "excluido='0' and curso_id = '" . $curso_id . "'");
		$quizzes = $this->system->sql->fetchrowset($query);
		foreach ($quizzes as $key => $quiz) {
			//Autor
			$query = $this->system->sql->select('nome', 'usuarios', "excluido='0' and id = '" . $quiz['usuario_id'] . "'");
			$usuario = $this->system->sql->fetchrowset($query);

			$countAlternativas = $this->getQuantidadeRespostaQuizzes($quiz['id']);
			
			if($countAlternativas[0]['quantidade_alternativas']){
				$quizzes[$key]['quantidade_alternativas'] = $countAlternativas[0]['quantidade_alternativas'];
				
			}
			if ($usuario[0]['nome'])
				$quizzes[$key]['usuario'] = $usuario[0]['nome'];

		}
		return $quizzes;	
	}

	// ===============================================================
	protected function getQuantidadeRespostaQuizzes($quizz_id){
		$query = $this->system->sql->select('count(1) as quantidade_alternativas', 'cursos_quizzes_alternativas', "quiz_id = '" . $quizz_id . "'");
		$alternativas = $this->system->sql->fetchrowset($query);

		return $alternativas;
	}

	//==============================================================
	public function getDetalheQuizzes($id_quizz){
		$query = $this->system->sql->select('*', 'cursos_quizzes', "excluido='0' and id = '" . $id_quizz . "'");
		$quizz = $this->system->sql->fetchrowset($query);
		
		foreach($quizz as $a => $quizzes){

			$alternativas = $this->getRespostasDoQuizz($id_quizz);
			foreach($alternativas as $b => $alternativa){
				if($alternativa['alternativa']){
					$quizzes['alternativas'][$b] = $alternativa['alternativa'];	
				}
				if($alternativa['id']){
					$quizzes['id_alternativas'][$b] = $alternativa['id'];	
				} 					
			}			
		}
		return $quizzes;
	}

	//================================================================

	protected function getRespostasDoQuizz($id_quizz){
		$query = $this->system->sql->select('id ,alternativa', 'cursos_quizzes_alternativas', "quiz_id = '" . $id_quizz . "'");
		$alternativas = $this->system->sql->fetchrowset($query);
		
		return $alternativas;	
	}

	// ===============================================================
	public function getQuizCondicao($condicao) {
		$query = $this->system->sql->select('*', 'cursos_quizzes', "excluido='0'" . $condicao);
		return end($this->system->sql->fetchrowset($query));
	}
	// ===============================================================
	public function getQuiz($id) {
		$quiz = end($this->system->sql->fetchrowset($this->system->sql->select('*', 'cursos_quizzes', "excluido='0' and id= '" . $id . "'")));
		$alternativas = $this->system->sql->fetchrowset($this->system->sql->select('*', 'cursos_quizzes_alternativas', "quiz_id='" . $quiz['id'] . "'"));

		$alternativaCorreta = 0;
		foreach ($alternativas as $key => $alternativa) {
			$quiz['alternativa'][] = $alternativa['alternativa'];

			if ($quiz['alternativa_correta'] == $alternativa['id']) 
				$alternativaCorreta = $key;
		}	
		$quiz['alternativa_correta'] = $alternativaCorreta;


		return $quiz;
	}
	// ===============================================================
	public function getTotalQuiz($curso_id) {
		$query = $this->system->sql->select('COUNT(1)', 'cursos_quizzes', "excluido = 0 and curso_id = " . $curso_id);
		return $this->system->sql->querycountunit($query);
	}
}
// ===================================================================