<?php
// ===================================================================
class NotificacoesDAO {
	// ===============================================================
	private $system = null;
	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();		
	}
	// ===============================================================
	public function cadastrar($input, $destinatario_nivel) {
		$this->system->sql->insert('notificacoes', array(
        	'remetente_id'			=> $this->system->session->getItem('session_cod_usuario'),
        	'destinatario_id'		=> 0,
        	'destinatario_nivel'	=> intval($destinatario_nivel),
        	'sistema_id'			=> $this->system->getSistemaID(),
        	'titulo'				=> trim($input['titulo']),
        	'conteudo'				=> trim($input['conteudo']),
        	'data_hora' 			=> date('Y-m-d H:i:s'),
        	'excluido'				=> 0
        ));
		$id = $this->system->sql->nextid();
		
		if ($destinatario_nivel == 2) {
			foreach($input['cursos'] as $curso)	{
				$fields = array('notificacao_id' => $id);
				if ($curso != 0) $fields['curso_id'] = $curso;
				$this->system->sql->insert('notificacoes_cursos', $fields);	
			}
		}
		
		return $id;
		
	}
	// ===============================================================
	public function atualizar($input, $destinatario_nivel) {
		$this->system->sql->update('notificacoes', array(
        	'destinatario_nivel'	=> $destinatario_nivel,
        	'titulo'				=> trim($input['titulo']),
        	'conteudo'				=> trim($input['conteudo']),        	
        ),
		"id='" . $input['id'] . "'");
		
		$this->system->sql->delete('notificacoes_cursos', "notificacao_id='" . $input['id'] . "'");

		if ($destinatario_nivel == 2) {
			foreach($input['cursos'] as $curso)	{
				$fields = array('notificacao_id' => $input['id']);
				if ($curso != 0) $fields['curso_id'] = $curso;
				$this->system->sql->insert('notificacoes_cursos', $fields);	
			}
		}
	}

	// ===============================================================
	public function getNaoLidas($id_usuario) {
		$notificacoes = array();

		//Montar vetor com os ids dos cursos que pertence a usuário
		//Montar Sql Extra e obter nivel usuario
		$query = $this->system->sql->select('id, nivel ', 'usuarios', "excluido='0' and id = '" . $id_usuario . "' ");
		$usuario = end($this->system->sql->fetchrowset($query));

		//Se aluno
		$sql_extra = '';
		if ($usuario['nivel'] == 2) {

			$queryCursos = $this->system->sql->select('curso_id', 'cursos_alunos', "usuario_id = '" . $usuario['id'] . "' and excluido = 0 and expira >= '" . date('Y-m-d H:i:s') . "'");
			$resultadoCursos =  $this->system->sql->fetchrowset($queryCursos);
			$cursosID = array(0);
			foreach ($resultadoCursos as $resultadoCurso)
				$cursosID[] = $resultadoCurso['curso_id'];

			$sql_extra .= " AND (destinatario_nivel = '2'  AND (destinatario_id = '" . $usuario['id'] . "' OR destinatario_id = '0'))"; 
			
			//$sql_extra .= " AND ((id IN (SELECT notificacao_id FROM notificacoes_cursos WHERE curso_id = 0) AND destinatario_nivel = '4') OR destinatario_id = '" . $usuario['id'] . "')";
		} else {
			$sql_extra .= "  AND (destinatario_nivel = '" . $usuario['nivel'] . "' AND  ( destinatario_id = '" . $id_usuario . "'  OR destinatario_id = 0))";			
		}
		if ($usuario['nivel'] == 2) {

			$queryCursos1  = $this->system->sql->select('curso_id', 'cursos_alunos', "usuario_id = '" . $usuario['id']  . "' and excluido = '0' GROUP BY curso_id ");	
			$codigosCursos1 = $this->system->sql->fetchrowset($queryCursos1);
			foreach ($codigosCursos1 as $resultadoCurso1)
					$cursosID1[] = $resultadoCurso1['curso_id'];
						
			if(count($cursosID1)){
				$sql_extra .= " AND (SELECT COUNT(notificacao_id) FROM notificacoes_cursos WHERE curso_id IN (" . implode(',', $cursosID1) . ") 
				AND   notificacao_id NOT IN (SELECT notificacao_id FROM notificacoes_lidas WHERE usuario_id = '" . $usuario['id'] . "')) > 0  
				AND notificacoes.id NOT IN (SELECT notificacao_id FROM notificacoes_lidas WHERE usuario_id = '". $usuario['id'] ."')";
			}else{
				$sql_extra .= " AND notificacoes.id NOT IN (SELECT notificacao_id FROM notificacoes_lidas WHERE usuario_id = '". $usuario['id'] ."')";				
			}
		}else{
			$sql_extra .= " AND notificacoes.id NOT IN (SELECT notificacao_id from notificacoes_lidas WHERE usuario_id = '" . $usuario['id'] . "') ";										
		}

		/*if ($usuario['nivel'] == 2) {
			$queryCursos = $this->system->sql->select('curso_id', 'cursos_alunos', "usuario_id = '" . $usuario['id'] . "' and excluido = 0 and expira >= '" . date('Y-m-d H:i:s') . "'");
			$resultadoCursos =  $this->system->sql->fetchrowset($queryCursos);
			$cursosID = array(0);
			foreach ($resultadoCursos as $resultadoCurso)
				$cursosID[] = $resultadoCurso['curso_id'];
			$sql_extra .= " AND ((id IN (SELECT notificacao_id FROM notificacoes_cursos WHERE curso_id IN (" . implode(',', $cursosID) . ")) AND destinatario_nivel = '2') OR destinatario_id = '" . $usuario['id'] . "')"; 
			
			//$sql_extra .= " AND ((id IN (SELECT notificacao_id FROM notificacoes_cursos WHERE curso_id = 0) AND destinatario_nivel = '4') OR destinatario_id = '" . $usuario['id'] . "')";
		} else {
			$sql_extra .= " AND (destinatario_nivel = '" . $usuario['nivel'] . "' OR destinatario_id = '" . $id_usuario . "')";
		}
		if ($usuario['nivel'] == 2) {
			$queryCursos1  = $this->system->sql->select('curso_id', 'cursos_alunos', "usuario_id = '" . $usuario['id']  . "' and excluido = '0' GROUP BY curso_id ");	
			$codigosCursos1 = $this->system->sql->fetchrowset($queryCursos1);
			foreach ($codigosCursos1 as $resultadoCurso1)
					$cursosID1[] = $resultadoCurso1['curso_id'];
			$cursosID1[] = 0;
			$sql_extra .= " 2 AND (notificacoes.destinatario_id = '". $usuario['id'] ."'
							AND id NOT IN (SELECT notificacao_id from notificacoes_lidas WHERE usuario_id = '" . $usuario['id'] . "')) 
			OR (notificacoes.destinatario_id = 0 and notificacoes.destinatario_nivel = ". $usuario['nivel'] .") AND (SELECT COUNT(notificacao_id) FROM notificacoes_cursos WHERE curso_id IN (" . implode(',', $cursosID1) . ") 
			AND   notificacao_id NOT IN (SELECT notificacao_id FROM notificacoes_lidas WHERE usuario_id = '" . $usuario['id'] . "')) > 0";
		}else{
			$sql_extra .= "AND notificacoes.destinatario_id = '". $usuario['id'] ."' AND id NOT IN (SELECT notificacao_id from notificacoes_lidas WHERE usuario_id = '" . $usuario['id'] . "') ";			
		}*/
		
		
		//Não lida
		//
		//echo $sql_extra;die;

		//Verificar se é não lida
		$query = $this->system->sql->select('*', 'notificacoes', "excluido='0' AND sistema_id = '". $this->system->getSistemaID() ."'  " . $sql_extra, '10', 'data_hora desc');
		$resultado =  $this->system->sql->fetchrowset($query);
		
		foreach ($resultado as $key => $notificacao) {
				
				/*if($notificacao['remetente_id'] != 0){
					$query = $this->system->sql->select('nome, avatar', 'usuarios', " id = '" . $notificacao['remetente_id'] . "'");
					$remetente =  end($this->system->sql->fetchrowset($query));					
					
					if  ($remetente['nome']) {
						$resultado[$key]['remetente'] = $remetente['nome'];					
						$resultado[$key]['avatar'] = $remetente['avatar'];
						$resultado[$key]['data'] = date('d/m/Y H:i', strtotime($resultado[$key]['data_hora']));
						$notificacoes['resultado'][] = $resultado[$key];
					}				
				} */
				$query = $this->system->sql->select('nome', 'sistemas', " id = '" . $notificacao['sistema_id'] . "'");
				$remetente =  end($this->system->sql->fetchrowset($query));

				if  ($remetente['nome']) {
					$resultado[$key]['remetente'] = $remetente['nome'];					
					$resultado[$key]['avatar'] = "avatar_padrao.jpg";
					$resultado[$key]['data'] = date('d/m/Y H:i', strtotime($resultado[$key]['data_hora']));
					$notificacoes['resultado'][] = $resultado[$key];
				}				
				
			
		}
		
		$query = $this->system->sql->select('count(1) as total', 'notificacoes', "excluido='0' AND sistema_id = '". $this->system->getSistemaID() ."' " . $sql_extra);
		$total =  $this->system->sql->fetchrowset($query);
		$notificacoes['total'] = $total[0]['total'];

		return $notificacoes;
	}
	// ===============================================================
	public function getNotificacoes($id_usuario) {
		$notificacoes = array();

		//Montar Sql Extra e obter nivel usuario
		$query = $this->system->sql->select('id, nivel', 'usuarios', "excluido='0' and id = '" . $id_usuario . "' ");
		$usuario = end($this->system->sql->fetchrowset($query));

		//Se aluno
		$sql_extra = '';
		if ($usuario['nivel'] == 2) {

			$queryCursos = $this->system->sql->select('curso_id', 'cursos_alunos', "usuario_id = '" . $usuario['id'] . "' and excluido = 0 and expira >= '" . date('Y-m-d H:i:s') . "'");
			$resultadoCursos =  $this->system->sql->fetchrowset($queryCursos);
			$cursosID = array(0);
			foreach ($resultadoCursos as $resultadoCurso)
				$cursosID[] = $resultadoCurso['curso_id'];

			$sql_extra .= " AND ((id IN (SELECT notificacao_id FROM notificacoes_cursos WHERE curso_id IN (" . implode(',', $cursosID) . ") OR curso_id = 0) AND destinatario_nivel = '4') OR destinatario_id = '" . $usuario['id'] . "')";
		}
		else 
			$sql_extra .= " AND (destinatario_nivel = '" . $usuario['nivel'] . "' OR destinatario_id = '" . $id_usuario . "')";

		//echo $sql_extra;die;

		$query = $this->system->sql->select('*', 'notificacoes', "excluido ='0' AND sistema_id = '". $this->system->getSistemaID() ."' " . $sql_extra, '', 'data_hora desc');
		$resultado =  $this->system->sql->fetchrowset($query);
		

		foreach ($resultado as $key => $notificacao) {
				$resultado[$key]['conteudo'] = utf8_encode(html_entity_decode($notificacao['conteudo']));

				$query = $this->system->sql->select('nome, avatar', 'usuarios', " id = '" . $notificacao['remetente_id'] . "'");
				$remetente =  $this->system->sql->fetchrowset($query);


				if  ($remetente[0]['nome']) {
					$resultado[$key]['remetente'] = $remetente[0]['nome'];
					$resultado[$key]['avatar'] = $remetente[0]['avatar'];					
					

					$resultado[$key]['data'] = $this->system->func->tempoDeCadastro(strtotime($resultado[$key]['data_hora']));

					//Lida
					$notificadoLida = end($this->system->sql->fetchrowset($this->system->sql->select('notificacao_id', 'notificacoes_lidas', " notificacao_id = '" . $notificacao['id'] . "' and usuario_id = '" . $id_usuario . "'")));

					$resultado[$key]['lida'] = ($notificadoLida['notificacao_id'] ? true: false);

					$notificacoes[] = $resultado[$key];
				}
			
		}
		return $notificacoes;
	}
	// ===============================================================
	public function getNotificacoesGeral($palavra = '', $limit = '') {
		
		$notificacoes = array();

		$query = $this->system->sql->select('*', 'notificacoes', "sistema_id = '".$this->system->getSistemaID()."' AND excluido='0' and destinatario_id = 0 	" . ($palavra != '' ? " and titulo like '%" . $palavra ."%'" : ''), $limit, 'data_hora desc');
		$notificacoes =  $this->system->sql->fetchrowset($query);
		
		foreach ($notificacoes as $key=>$notificacao) {
			//Destinarario
			switch ($notificacao['destinatario_nivel']) {
				case 2:
					$notificacoes[$key]['destinatario'] = 'Alunos';
					break;				
				case 4:
					$notificacoes[$key]['destinatario'] = 'Administrativo';
					break;
				case 7:
					$notificacoes[$key]['destinatario'] = 'Parceiros';
					break;
				case 6:
					$notificacoes[$key]['destinatario'] = 'Coordenadores';
					break;
				case 8:
					$notificacoes[$key]['destinatario'] = 'Professores';
					break;
			}

			//Cursos
			if ($notificacao['destinatario_nivel'] == 2) {
				//todos os cursos
				$query = $this->system->sql->select("curso_id", "notificacoes_cursos", "notificacao_id = '" . $notificacao['id'] . "'");
				$cursos = $this->system->sql->fetchrowset($query);
				foreach ($cursos as $key2 => $curso) {
					$cursos[$key2] = $curso['curso_id'];
				}

				//Exibe a opção todos os cursos
				if (in_array(0, $cursos)) 
					$notificacoes[$key]['cursos'][] = 'Todos os cursos';

				$query = $this->system->sql->select('curso', 'cursos', "excluido='0' and id IN (SELECT curso_id FROM notificacoes_cursos where notificacao_id = '" . $notificacao['id'] . "')");
				$cursos = $this->system->sql->fetchrowset($query);

				foreach ($cursos as $curso) 
					$notificacoes[$key]['cursos'][] = $curso['curso'];
				
			} else {
				$notificacoes[$key]['cursos'] = array();
			}
		}

		//print_r($notificacoes);die;
		return $notificacoes;
	}
	// ===============================================================
	public function getNotificacoesAdm($palavra = '', $limit = '') {
		
		$notificacoes = array();

		$query = $this->system->sql->select('*', 'notificacoes', "sistema_id = '".$this->system->getSistemaID()."' AND excluido='0' and destinatario_id = 0 	" . ($palavra != '' ? " and titulo like '%" . $palavra ."%'" : ''), $limit, 'data_hora desc');
		$notificacoes =  $this->system->sql->fetchrowset($query);
		
		foreach ($notificacoes as $key=>$notificacao) {
			//Destinarario
			switch ($notificacao['destinatario_nivel']) {
				case 5:
					$notificacoes[$key]['destinatario'] = 'Instituicoes';
					break;
				case 3:
					$notificacoes[$key]['destinatario'] = 'Professores';
					break;				
			}			
		}

		//print_r($notificacoes);die;
		return $notificacoes;
	}

	// ===============================================================
	public function getNotificacao($id) {
		$query = $this->system->sql->select('*', 'notificacoes', "excluido='0' and id = '" . $id . "' ");
		$notificacao = end($this->system->sql->fetchrowset($query));
		if ($notificacao['id']) {
			/*$notificacao['conteudo'] = nl2br($notificacao['conteudo']);*/

			$notificacao['cursos'] = array();

			$query = $this->system->sql->select('curso_id', 'notificacoes_cursos', " notificacao_id = '" . $notificacao['id'] . "' and curso_id is not null");
			$cursos = $this->system->sql->fetchrowset($query);
			foreach ($cursos as $curso) {
				
				$notificacao['cursos'][]  = $curso['curso_id'];
				
			}
		}
		
		return $notificacao;
	}
	// ===============================================================
	public function lerNotificacao($id) {
		$id_usuario = $this->system->session->getItem('session_cod_usuario');
		$notificacoes = array();

		//Montar Sql Extra e obter nivel usuario
		$query = $this->system->sql->select('id, nivel', 'usuarios', "excluido='0' and id = '" . $id_usuario . "' ");
		$usuario = end($this->system->sql->fetchrowset($query));

		//Se aluno
		$sql_extra = '';
		if ($usuario['nivel'] == 4) 
			$sql_extra .= " AND ((id IN (SELECT notificacao_id FROM notificacoes_cursos WHERE curso_id IN (SELECT curso_id FROM cursos_alunos WHERE usuario_id = '" . $usuario['id'] . "' and excluido = 0 and expira >= '" . date('Y-m-d H:i:s') . "') OR curso_id = 0) AND destinatario_nivel = '4') OR destinatario_id = '" . $usuario['id'] . "')";
		else 
			$sql_extra .= " AND (destinatario_nivel = '" . $usuario['nivel'] . "' OR destinatario_id = '" . $id_usuario . "')";

		$query = $this->system->sql->select('*', 'notificacoes', "excluido='0' and id = '" . $id . "' " . $sql_extra, '', 'data_hora desc');
		$notificacao =  end($this->system->sql->fetchrowset($query));
		
		
		$notificacao['conteudo'] = html_entity_decode($notificacao['conteudo']);

		$query = $this->system->sql->select('nome, avatar', 'usuarios', " id = '" . $notificacao['id_remetente'] . "'");
		$remetente =  $this->system->sql->fetchrowset($query);

		if  ($remetente[0]['nome']) {
			$notificacao['remetente'] = $remetente[0]['nome'];
			$notificacao['avatar'] = $remetente[0]['avatar'];
			$notificacao['data'] = date('d/m/Y H:i', strtotime($resultado[$key]['data_hora']));
		}

		return $notificacao;
	}
	// ===============================================================
	public function deletar($id) {
	 	$this->system->sql->update('notificacoes', array(
             'excluido' 	=> 1),
	 	"id='" . $id . "'");
	}
	// ===============================================================
	public function marcarLida($notificacao) {
		$usuarioID = $this->system->session->getItem('session_cod_usuario');
		$query = $this->system->sql->select("count(1) as total", "notificacoes_lidas", "notificacao_id = '" . $notificacao . "' AND usuario_id =  '" . $usuarioID . "'");
		$total = end($this->system->sql->fetchrowset($query));
		
		if ($total['total'] == 0) {
			$this->system->sql->insert('notificacoes_lidas', array(
	        	'notificacao_id'	=> $notificacao,
	        	'usuario_id'		=> $usuarioID
	        ));
        }
		
	}
	// ===============================================================
	public function getUltimaNotificacao($id_usuario) {
		$query = $this->system->sql->select('id, nivel', 'usuarios', "excluido='0' and id = '" . $id_usuario . "' ");
		$usuario = end($this->system->sql->fetchrowset($query));


		$sql_extra = '';
		if ($usuario['nivel'] == 4) {
			
			$queryCursos = $this->system->sql->select('curso_id', 'cursos_alunos', "usuario_id = '" . $usuario['id'] . "' and excluido = 0 and expira >= '" . date('Y-m-d H:i:s') . "'");
			$resultadoCursos =  $this->system->sql->fetchrowset($queryCursos);
			$cursosID = array(0);
			foreach ($resultadoCursos as $resultadoCurso)
				$cursosID[] = $resultadoCurso['curso_id'];

			$sql_extra .= " AND ((id IN (SELECT notificacao_id FROM notificacoes_cursos WHERE curso_id IN (" . implode(',', $cursosID) . ")) AND destinatario_nivel = '4') OR destinatario_id = '" . $usuario['id'] . "')"; 

			//$sql_extra .= " AND ((id IN (SELECT notificacao_id FROM notificacoes_cursos WHERE curso_id = 0) AND destinatario_nivel = '4') OR destinatario_id = '" . $usuario['id'] . "')";
		} else 
			$sql_extra .= " AND (destinatario_nivel = '" . $usuario['nivel'] . "' OR destinatario_id = '" . $id_usuario . "')";

		$query = $this->system->sql->select('*', 'notificacoes', "excluido='0' " . $sql_extra, '1', 'data_hora desc');
		return  end($this->system->sql->fetchrowset($query));
	}
	// ===============================================================
	public function notificacaoEmail($usuarioID, $titulo, $conteudo, $remetenteID) {
		 
		if(!empty($usuarioID)){
			$query      = $this->system->sql->select('*','usuarios',"id= '" . $usuarioID."'");
			$retorno    = end($this->system->sql->fetchrowset($query));
			$sistema_id = $retorno['sistema_id'];
			$destinatario_nivel = $retorno['nivel'];
		}		

		$this->system->sql->insert('notificacoes', array(
        	'remetente_id'			=> trim($remetenteID ? $remetenteID : $this->system->getSistemaID()), //Conta do Adriano Gianini
        	'destinatario_id'		=> $usuarioID,
        	'sistema_id'		    => trim($sistema_id),
        	'destinatario_nivel'	=> trim($destinatario_nivel),
        	'titulo'				=> trim($titulo),
        	'conteudo'				=> trim($conteudo),
        	'data_hora' 			=> date('Y-m-d H:i:s'),
        	'excluido'				=> 0
        ));
		return $this->system->sql->nextid();
	}
}
// ===================================================================