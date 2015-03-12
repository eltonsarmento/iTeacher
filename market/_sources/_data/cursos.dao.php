<?php
// ===================================================================
class CursosDAO {
	// ===============================================================
	private $system = null;
	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();		
	}
	// ===============================================================
	public function cadastrar($input) {
		$this->system->sql->insert('cursos', array(
			'sistema_id'				=> $this->system->getSistemaID(),
			'curso'						=> $input['curso'],
			'tags'						=> $input['tags'],
			'gratuito'					=> intval($input['gratuito']),
			'valor'						=> $input['valor'],
			'dvd'						=> intval($input['dvd']),
			'certificado'				=> intval($input['certificado']),
			'suporte'					=> intval($input['suporte']),
			'exibir_site'				=> intval($input['exibir_site']),
			'destaque_arquivo'			=> '',
			'banner' 					=> intval($input['banner']),
			'banner_arquivo'			=> '',
			'frete'						=> intval($input['frete']),
			'valor_frete'				=> intval($input['valor_frete']),
			'servidor'					=> intval($input['servidor']),
			'descricao'					=> trim($input['descricao']),
			'professor_id'				=> intval($input['professor_id']),
			'qt_capitulos'				=> intval($input['qt_capitulos']),
			'carga_horaria'				=> intval($input['carga_horaria']),
			'data_cadastro'				=> date('Y-m-d'),
			'url'						=> $input['url'],
			'usuario_id'				=> intval($this->system->session->getItem('session_cod_usuario')),
			'excluido'					=> 0
		));
		$id = $this->system->sql->nextid();
		
		if ($input['areas'])
			foreach($input['areas'] as $area)
				$this->system->sql->insert('cursos_areas', array('curso_id' => $id, 'area_id' => $area));
		
        return $id;
	}
	// ===============================================================
	public function atualizar($input) {
		$query = $this->system->sql->select('professor_id', 'cursos', "excluido='0' and id = '" .  $input['id'] . "' and sistema_id='".$this->system->getSistemaID()."'");
		$professor = end($this->system->sql->fetchrowset($query));
		
		$this->system->sql->update('cursos', array(
        	'curso'						=> $input['curso'],
			'tags'						=> $input['tags'],
			'gratuito'					=> intval($input['gratuito']),
			'valor'						=> str_replace(',', '.', $input['valor']),
			'dvd'						=> intval($input['dvd']),
			'certificado'				=> intval($input['certificado']),
			'suporte'					=> intval($input['suporte']),
			'exibir_site'				=> intval($input['exibir_site']),
			'banner' 					=> intval($input['banner']),
			'frete'						=> intval($input['frete']),
			'valor_frete'				=> intval($input['valor_frete']),
			'servidor'					=> intval($input['servidor']),
			'descricao'					=> trim($input['descricao']),
			'professor_id'				=> intval($input['professor_id']),
			'qt_capitulos'				=> intval($input['qt_capitulos']),
			'carga_horaria'				=> intval($input['carga_horaria']),
			'url'						=> $input['url'],
        ),
		"id='" . $input['id'] . "' and sistema_id='".$this->system->getSistemaID()."'");
		
		if (count($input['areas'])) {
			$this->system->sql->delete('cursos_areas', "curso_id='" . $input['id'] . "'");
			foreach($input['areas'] as $area)
				$this->system->sql->insert('cursos_areas', array('curso_id' => $input['id'], 'area_id' => $area));	
		}
		
		return $input['id'];
	}
	// ===============================================================
	public function atualizarImagemDestaque($id, $imagem) {
		$this->system->sql->update('cursos', array('destaque_arquivo' => $imagem), "id='" . $id . "' and sistema_id='".$this->system->getSistemaID()."'");
	}
	// ===============================================================
	public function atualizarImagemBanner($id, $imagem) {
		$this->system->sql->update('cursos', array('banner_arquivo' => $imagem), "id='" . $id . "' and sistema_id='".$this->system->getSistemaID()."'");
	}
	// ===============================================================
	public function deletar($id) {
	 	$this->system->sql->update('cursos', array('excluido' => 1), "id='" . $id . "' and sistema_id='".$this->system->getSistemaID()."'");
	}
	// ===============================================================
	public function countCursos() {
		$total = end($this->system->sql->fetchrowset($this->system->sql->select('count(1) as total', 'cursos', "excluido='0' and sistema_id='".$this->system->getSistemaID()."'", $limit, $orderby)));
		return $total['total'];
	}
	// ===============================================================
	public function getCursos($palavra = '', $limit = '', $order = 'curso', $campos = '*') {
		$query = $this->system->sql->select($campos, 'cursos', "excluido='0' and sistema_id='".$this->system->getSistemaID()."' " . ($palavra != ''? " and curso like '%" . $palavra.  "%'" : ''), $limit, $order);
		return $this->system->sql->fetchrowset($query);
	}	
	// ===============================================================
	public function getCursosRelatorio($palavra = '', $metodo_busca = '', $limit = '', $order = 'curso', $apenas_total = false, $tipo = ""){
		//$sql_extra = ' and sistema_id = ' . $this->system->getSistemaID();
        if ($palavra != '') {
            //nome
            if ($metodo_busca == 'curso')   $sql_extra .= " and curso like '%" . $palavra . "%'";
            //tags
            if ($metodo_busca == 'tags')     $sql_extra .= " and tags like '%" . $palavra . "%'";   
            //padrao
            if ($metodo_busca == 'padrao')  $sql_extra .= " and (curso like '%" . $palavra . "%' OR tags like '%" . $palavra . "%')";
        }

        if($tipo != ""){
        	if ($tipo == "instituicao"){
        		if ($apenas_total){
        			return $this->system->sql->querycountunit($this->system->sql->select('count(c.id) as total', 'cursos c, usuarios u', "c.excluido='0' and u.id=c.usuario_id and u.nivel=5" . $sql_extra));
        		}	
       			$query = $this->system->sql->select('*', 'cursos c, usuarios u', "c.excluido='0' and u.id=c.usuario_id and u.nivel=5", $limit, $order); 	
	        }elseif($tipo == 'professor'){

	        	if ($apenas_total){
        			return $this->system->sql->querycountunit($this->system->sql->select('count(c.id) as total', 'cursos c, usuarios u', "c.excluido='0' and u.id=c.usuario_id and u.nivel=3" . $sql_extra));
        		}
	        	$query = $this->system->sql->select('*', 'cursos c, usuarios u', "c.excluido='0' and u.id=c.usuario_id and u.nivel=3", $limit, $order); 	
	        }
        }else{
        	if ($apenas_total){
        		return $this->system->sql->querycountunit($this->system->sql->select('count(id) as total', 'cursos', "excluido='0'" . $sql_extra));
        	}
            	
        	$query = $this->system->sql->select('*', 'cursos', "excluido='0'" . ($palavra ? " and curso like '%" . $palavra . "%'" : ''), $limit, $order);
        }
        $cursos =  $this->system->sql->fetchrowset($query);
        
        return $cursos;

	}
	// ===============================================================

	public function getCursosCondicao($sistema_id = '', $where, $limit = '', $order = 'curso', $campos = '*') {
		if($sistema_id == '') $sistema_id = $this->system->getSistemaID();
		$query = $this->system->sql->select($campos, 'cursos', "excluido='0' and sistema_id='".$sistema_id."'" . $where, $limit, $order);
		return $this->system->sql->fetchrowset($query);
	}
	// ==============================================================
	public function getCursoCondicao($sistema_id, $where, $order = 'curso', $campos = '*') {
		return end($this->getCursosCondicao($sistema_id,$where, 1, $order, $campos));
	}
	// ===============================================================
	public function getAreasByCurso($id, $pai = false, $sistema_id = false) {
		$query = $this->system->sql->select('area_id', 'cursos_areas', "curso_id='" . $id . "'");
		$areas = $this->system->sql->fetchrowset($query);
		
		foreach ($areas as $key => $area) {
			if ($sistema_id) {
				$query = $this->system->sql->select('*', 'areas', "id='" . $area['area_id'] . "' and sistema_id='".$this->system->getSistemaID()."' " . ($pai ? ' and area_pai_id = 0' : ''));	
			}
			else {
				$query = $this->system->sql->select('*', 'areas', "id='" . $area['area_id'] . "'". ($pai ? ' and area_pai_id = 0' : ''));		
			}
			$areas[$key] =  end($this->system->sql->fetchrowset($query));
		}
		return $areas;
	}
	// ===============================================================
	public function getCurso($id, $todos_dados = true, $sistemaID = '') {
		if($sistemaID == '') $sistemaID = $this->system->getSistemaID();
		$query = $this->system->sql->select('*', 'cursos', "excluido='0' and id= '" . $id . "' and sistema_id='".$sistemaID."'", '', 'curso');
		$curso =  $this->system->sql->fetchrowset($query);
		if ($curso[0]['id'] && $todos_dados) {
			$curso = $curso[0];
			//Categorias
			$query = $this->system->sql->select('id', 'areas', "excluido='0' and sistema_id='".$sistemaID."' and id IN (SELECT area_id FROM cursos_areas WHERE curso_id = '" . $id .  "' )");
			$areas =  $this->system->sql->fetchrowset($query);
			foreach ($areas as $area)
				$curso['areas'][] = $area['id'];
			
			//Professor
			$query = $this->system->sql->select('id, nome, email', 'usuarios', "excluido='0' and sistema_id='".$sistemaID."' AND id = '" . $curso['professor_id'] .  "'");
			$professor =  end($this->system->sql->fetchrowset($query));
			$curso['professor'] = $professor;
		}
		return $curso;
	}
	// ===============================================================
	public function getCapitulos($curso_id) {
		$query = $this->system->sql->select('qt_capitulos', 'cursos', "excluido='0' and id= '" . $curso_id . "' and sistema_id='".$sistemaID."'", '', 'curso');
		$curso =  end($this->system->sql->fetchrowset($query));
		if ($curso['qt_capitulos']) {
			$query = $this->system->sql->select('capitulo_id', 'cursos_capitulos', "excluido='0' and curso_id= '" . $curso_id . "' and sistema_id='".$sistemaID."'", $curso['qt_capitulos'], 'capitulo_id');
			$capitulos = $this->system->sql->fetchrowset($query);
			foreach ($capitulos as $key=> $capitulo)
				$capitulos[$key] = $capitulo['capitulo_id'];
			return $capitulos;
		}
		return array();
	}
	// ===============================================================
	public function cadastrarCapitulos($curso_id, $qt_capitulos) {
		//Cadastra
		$query = $this->system->sql->select('count(1) as total', 'cursos_capitulos', "excluido='0' and sistema_id='".$this->system->getSistemaID()."' and curso_id= '" . $curso_id . "'");
		$total = end($this->system->sql->fetchrowset($query));
		$falta = max(0, ($qt_capitulos - $total['total']));
		
		for ($i = 1; $i <= $falta; $i++) {
			$this->system->sql->insert('cursos_capitulos', array(
				'sistema_id' 	=> $this->system->getSistemaID(),
				'curso_id'		=> $curso_id,
				'descricao'		=> '',
				'capitulo'		=> ($total['total'] + $i)	
			));	
		}
		
		//deletar
		$query = $this->system->sql->select('count(1) as qt_capitulos', 'cursos_capitulos', "excluido='0' and sistema_id='".$this->system->getSistemaID()."' and curso_id= '" . $curso_id . "'");
		$curso = end($this->system->sql->fetchrowset($query));
		
		if ($qt_capitulos < $curso['qt_capitulos']) {
			$query = $this->system->sql->select('capitulo_id ', 'cursos_capitulos', "curso_id = '" . $curso_id . "' and sistema_id='".$this->system->getSistemaID()."' AND excluido = 0 AND capitulo_id NOT IN (SELECT capitulo_id FROM cursos_aulas WHERE curso_id = '" . $curso_id . "' AND excluido = 0)");
			$capitulos =  $this->system->sql->fetchrowset($query);
			$total = $curso['qt_capitulos'] - $qt_capitulos;
			
			foreach ($capitulos as $key => $capitulo) {
				$this->system->sql->update('cursos_capitulos', array('excluido' => 1),	"capitulo_id='" . $capitulo['capitulo_id'] . "' and sistema_id='".$this->system->getSistemaID()."'");
				if (($key+1) == $total) 
					break;
			}
			
			//ordenar
			$ordem = 1;
			$query = $this->system->sql->select('capitulo_id', 'cursos_capitulos', "excluido='0' and sistema_id='".$this->system->getSistemaID()."' and curso_id= '" . $curso_id . "'", '', 'capitulo');
			$capitulos2 = $this->system->sql->fetchrowset($query);
			
			foreach ($capitulos2 as $capitulo) {
				$this->system->sql->update('cursos_capitulos', array('capitulo' => $ordem),	"capitulo_id='" . $capitulo['capitulo_id'] . "' and sistema_id='".$this->system->getSistemaID()."'");
				$ordem++;
			}
		}
		return true;
	}
	// ===============================================================
	public function getTotalAlunos($curso_id) {
		$query = $this->system->sql->select('count(1) as total', 'cursos_alunos', "excluido='0' and curso_id= '" . $curso_id . "' and sistema_id='".$this->system->getSistemaID()."'");
		return end($this->system->sql->fetchrowset($query));
	}
	// ===============================================================
	public function validarMudancaCapitulos($curso_id, $qt_capitulos) {
		$query = $this->system->sql->select('qt_capitulos', 'cursos', "excluido='0' and sistema_id='".$this->system->getSistemaID()."' and id= '" . $curso_id . "'", '', 'curso');
		$curso = end($this->system->sql->fetchrowset($query));
		
		if ($qt_capitulos < $curso['qt_capitulos']) {
			$query = $this->system->sql->select('COUNT(DISTINCT capitulo_id) AS total ', 'cursos_aulas', "curso_id = '" . $curso_id . "' and sistema_id='".$this->system->getSistemaID()."' AND excluido = 0 AND capitulo_id IN (SELECT capitulo_id FROM `cursos_capitulos` WHERE curso_id = '" . $curso_id . "' AND excluido = 0 and sistema_id='".$this->system->getSistemaID()."')");
			$capitulos = end($this->system->sql->fetchrowset($query)); 
			if ($qt_capitulos < $capitulos['total'])
				return false;
		}
		return true;
	}
	// ===============================================================
	public function atualizarDescricaoCapitulo($capitulo_id, $descricao) {
		$this->system->sql->update('cursos_capitulos', array('descricao' => $descricao), "capitulo_id='" . $capitulo_id . "' and sistema_id='".$this->system->getSistemaID()."'");
	}
	// ==============================================================
	public function getCapitulo($capitulo_id) {
		$query = $this->system->sql->select('*', 'cursos_capitulos', "excluido='0' and capitulo_id = '" . $capitulo_id . "' and sistema_id='".$this->system->getSistemaID()."'");
		return end($this->system->sql->fetchrowset($query));
	}
	// ===============================================================
	public function getCursosByAluno($usuario_id, $palavra = '', $limit = '') {
		$cursos = array();
		$query = $this->system->sql->select('*', 'cursos_alunos', "excluido='0' and expira >= '" . date('Y-m-d') . "' and sistema_id='".$this->system->getSistemaID()."' and usuario_id= '" . $usuario_id . "' " . ($palavra? "and curso_id in (SELECT id from cursos where curso like '%" . $palavra . "%' and sistema_id='".$this->system->getSistemaID()."')" : ''), $limit, 'curso_id desc');
		$resultado = $this->system->sql->fetchrowset($query);
		
		foreach ($resultado as $valor) {
			$query = $this->system->sql->select('curso, qt_capitulos, professor_id, destaque_arquivo, certificado as curso_certificado ', 'cursos', "excluido='0' and sistema_id='".$this->system->getSistemaID()."' and id= '" . $valor['curso_id'] . "'");
			$curso =  end($this->system->sql->fetchrowset($query));
			if ($curso['curso']) {
				//aulas assistidas
				$query = $this->system->sql->select('count(aula_id) as aulas_assistidas', 'cursos_alunos_aulas', "aluno_id = '" . $usuario_id . "' and cursos_alunos_id = '" . $valor['id'] . "' and sistema_id='".$this->system->getSistemaID()."' and concluida=1");
				$resultado = end($this->system->sql->fetchrowset($query));
				$curso['aulas_assistidas'] = $resultado['aulas_assistidas'];
				
				//total aulas
				$query = $this->system->sql->select('count(aula_id) as aulas_total', 'cursos_aulas', "excluido = '0' and sistema_id='".$this->system->getSistemaID()."' and curso_id = '" . $valor['curso_id'] . "'");
				$resultado = end($this->system->sql->fetchrowset($query));
				$curso['aulas_total'] = $resultado['aulas_total'];
				$curso = array_merge($curso, $valor);
				$cursos[] = $curso;
			}
		}
		return $cursos;
	}
	// ==============================================================
	public function checarCursoAtivo($relacionamento, $usuario_id) {
		$query = $this->system->sql->select('id', 'cursos_alunos', "excluido='0' and expira >= '" . date('Y-m-d') . "' and usuario_id = '" . $usuario_id . "' and sistema_id='".$this->system->getSistemaID()."' and id = '" . $relacionamento . "'", 1);
		$resultado = end($this->system->sql->fetchrowset($query));
		if ($resultado['id'])
			return true;
		return false;
	}
	// ==============================================================
	public function getCursosAlunos($campos = '', $limit = '', $orderby = 'curso_id desc', $excluido = true) {
		$query = $this->system->sql->select('*', 'cursos_alunos', 'sistema_id=' . $this->system->getSistemaID() . ($excluido ? " and excluido='0' and expira >= '" . date('Y-m-d') . "'" : " and 1=1") . $campos, $limit, $orderby);
		return $this->system->sql->fetchrowset($query);
	}
	// ==============================================================
	public function atualizarCursoAluno($campos, $relacionamentoId) {
		$this->system->sql->update('cursos_alunos', $campos, "id='" . $relacionamentoId . "' and sistema_id='".$this->system->getSistemaID()."'");
	}
	// ==============================================================
	public function countAlunosAtivosPorCurso($limit = '') {
		$query = $this->system->sql->select('curso_id, count(usuario_id) as total', 'cursos_alunos', "excluido='0' and sistema_id='".$this->system->getSistemaID()."' GROUP BY curso_id", $limit, 'count(usuario_id) desc');
		$cursos = $this->system->sql->fetchrowset($query);
		foreach ($cursos as $key => $curso) {
			$query = $this->system->sql->select('curso', 'cursos', "excluido='0' and sistema_id='".$this->system->getSistemaID()."' and id = '" . $curso['curso_id'] . "'");
			$resultado = end($this->system->sql->fetchrowset($query));
			if ($resultado['curso'])
				$cursos[$key]['curso'] = $resultado['curso'];
		}
		return $cursos;
	}
	//===============================================================
	public function cadastrarCursoAluno($curso, $sistema_id, $usuario_id, $expiracao) {
		$this->system->sql->insert('cursos_alunos', array('usuario_id' => $usuario_id, 'curso_id' => $curso['id'], 'sistema_id' => $sistema_id, 'expira' => $expiracao, 'certificado_emitido' => 0, 'suporte' => $curso['suporte'], 'certificado' => $curso['certificado'], 'excluido' => 0));
		return $this->system->sql->nextid();
	}
	//===============================================================
	public function cadastrarCursosAluno($cursos, $sistema_id, $usuario_id, $expiracao) {
		foreach($cursos as $curso)
			$this->cadastrarCursoAluno($curso, $sistema_id, $usuario_id, $expiracao);
		return true;
	}
	// ==============================================================
	public function deleteCursoAluno($id) {
		$this->system->sql->update('cursos_alunos', array('excluido' => 1), "id='" . $id . "' and sistema_id='".$this->system->getSistemaID()."'");
	}
	//===============================================================
	public function salvarServidor($curso_id, $servidor) {
		$this->system->sql->update('cursos', array('servidor' => $servidor), "id='" . $curso_id . "' and sistema_id='".$this->system->getSistemaID()."'");
	}
	// ==============================================================
	public function alunosByCurso($curso) {
		$query = $this->system->sql->select('u.id, u.nome, u.email', 'cursos_alunos AS c, usuarios AS u', "c.expira > '" . date('Y-m-d') ."' AND c.excluido = 0 AND c.curso_id = '" . $curso . "' and c.sistema_id='".$this->system->getSistemaID()."' and u.sistema_id='".$this->system->getSistemaID()."' AND u.excluido = 0 AND u.id = c.usuario_id");
		return $this->system->sql->fetchrowset($query);	
	}
	// ==============================================================
	// public function getCursosByCategorias($categorias = array(0), $limit = '', $orderby = 'data_cadastro desc') {
	// 	$query = $this->system->sql->select('DISTINCT c.id, c.curso, c.valor, c.destaque_arquivo, c.gratuito, c.url', 'cursos as c, cursos_categorias as ca', "c.excluido = 0 and ca.categoria_id IN (" . implode(',', $categorias) . ") and c.sistema_id='".$this->system->getSistemaID()."' and ca.sistema_id='".$this->system->getSistemaID()."' and c.exibir_site = 1 and ca.curso_id = c.id", $limit, $orderby);
	// 	return $this->system->sql->fetchrowset($query);	
	// }
	// ==============================================================
	// public function getMaisAcessadosCursosByCategorias($categorias = array(0), $limit = '') {
	// 	$query = $this->system->sql->select('DISTINCT c.id, c.curso, c.valor, c.destaque_arquivo, c.gratuito, c.url', 'cursos as c, cursos_categorias as ca, cursos_alunos as a', "c.excluido = 0 and a.curso_id = c.id and ca.categoria_id IN (" . implode(',', $categorias) . ") and c.sistema_id='".$this->system->getSistemaID()."' and ca.sistema_id='".$this->system->getSistemaID()."' and ca.curso_id = c.id and c.exibir_site = 1 GROUP BY c.id", $limit, 'count(a.usuario_id) desc');
	// 	return $this->system->sql->fetchrowset($query);			
	// }
	// =============================================================
	public function primeiroAcessso($relacionamentoId) {
		$curso = end($this->system->sql->fetchrowset($this->system->sql->select('curso_id', 'cursos_alunos', 'id = ' . $relacionamentoId . ' and sistema_id=' . $this->system->getSistemaID())));
		$capitulo = end($this->system->sql->fetchrowset($this->system->sql->select('capitulo_id', 'cursos_capitulos', 'curso_id = ' . $curso['curso_id'] . ' and excluido = 0 and sistema_id=' . $this->system->getSistemaID() . ' and capitulo = 1')));
		$aula = end($this->system->sql->fetchrowset($this->system->sql->select('aula_id', 'cursos_aulas', 'curso_id = ' . $curso['curso_id'] . ' and sistema_id =' . $this->system->getSistemaID() . ' and capitulo_id = ' . $capitulo['capitulo_id'] . ' and posicao = 1 and excluido = 0')));

		$query = $this->system->sql->select('count(1) as total', 'cursos_alunos_aulas', 'cursos_alunos_id = ' . $relacionamentoId . ' and aula_id = ' . intval($aula['aula_id']));
		$resultado = end($this->system->sql->fetchrowset($query));
		if ($resultado['total'])
			return false;
		return true;
	}
	// ============================================================
	public function atualizarCampos($id, $campos = array()) {
		if (count($campos))
			$this->system->sql->update('cursos', $campos, "id='" . $id . "' and sistema_id='".$this->system->getSistemaID()."'");
		return true;
	}
	// ===========================================================
	public function getIdByUrl($url) { 
		$query = $this->system->sql->select('id', 'cursos', "excluido = 0 and url = '" . $url . "' and sistema_id='".$this->system->getSistemaID()."'");
		$resultado = end($this->system->sql->fetchrowset($query));
		return ($resultado['id'] ? $resultado['id'] : false);
	}
	// ===========================================================
	public function verificaCursoAtivo($usuario_id, $curso_id) {
		$query = $this->system->sql->select('id', 'cursos_alunos', "excluido = 0 and usuario_id = '" . $usuario_id . "' and sistema_id='".$this->system->getSistemaID()."' and curso_id = '" . $curso_id . "' and expira > '" . date('Y-m-d H:i:s') . "'");
		$resultado = end($this->system->sql->fetchrowset($query));
		return ($resultado['id'] ? true : false);
	}
	// ===========================================================
	public function countCursosByAluno($id){
		$query = $this->system->sql->select('COUNT(1) qtd', 'cursos c, cursos_alunos ca', "ca.excluido = 0 and c.id = ca.curso_id and ca.sistema_id='".$this->system->getSistemaID()."' and ca.usuario_id='".$id."'");
		$resultado = end($this->system->sql->fetchrowset($query));
		return $resultado['qtd'];
	}

	// ===================DASHBOARD DO ALUNO======================
	public function getUltimoCurso($id_aluno){
		$ultima_aula = "";
		$query_id_curso = $this->system->sql->select('MAX(id) ultimo_curso, curso_id, expira, ultimo_acesso, ultima_aula', 'cursos_alunos ca', "ca.excluido = 0 and ca.sistema_id='".$this->system->getSistemaID()."' and ca.usuario_id='".$id_aluno."'");
		$resultado_id_curso = end($this->system->sql->fetchrowset($query_id_curso));
		$query_dados_curso = $this->system->sql->select('*', 'cursos',"id='".$resultado_id_curso['curso_id']."'");
		$resultado_dados_curso = end($this->system->sql->fetchrowset($query_dados_curso));		
		//qtd de aulas cadastradas no curso
		$aulas = $this->system->sql->select('COUNT(1) aulas', 'cursos_aulas',"curso_id='".$resultado_dados_curso['id']."'");
		$resultado_aulas = end($this->system->sql->fetchrowset($aulas));
		if($resultado_aulas['aulas']){	
			$resultado_dados_curso['qtd_aulas'] = $resultado_aulas['aulas'];
			
		}
		//tempo que o curso está disponível
		$resultado_dados_curso['expira'] = $resultado_id_curso['expira'];
		//ultimo acesso
		if ($resultado_id_curso['ultimo_acesso'] == "0000-00-00") {
			$resultado_dados_curso['ultimo_acesso'] = "";		
		}else{
			$resultado_dados_curso['ultimo_acesso'] = $resultado_id_curso['ultimo_acesso'];	
		}
		

		// recuperando a utima aula
		if($resultado_id_curso['ultima_aula']){
			$resultado_ultima_aula = end($this->system->sql->fetchrowset($this->system->sql->select('nome', 'cursos_aulas', "aula_id='".$resultado_id_curso['ultima_aula']."'")));
			$ultima_aula = $resultado_ultima_aula['nome'];
		}else{
			$ultima_aula = "O curso não contém aulas cadastradas.";
		}
		$resultado_dados_curso['ultima_aula'] = $ultima_aula;

		//pegando o id de cursos_alunos
		$query_cursos_alunos = $this->system->sql->select('id', 'cursos_alunos', "usuario_id='".$id_aluno."'");
		$resultado_cursos_alunos = end($this->system->sql->fetchrowset($query_cursos_alunos));
		$resultado_dados_curso['id_relacionamento'] = $resultado_cursos_alunos['id'];
		//contando as aulas assistidas
		$query_conclusao = $this->system->sql->select('count(aula_id) as aulas_assistidas', 'cursos_alunos_aulas', "aluno_id = '" . $id_aluno . "' and cursos_alunos_id = '" . $resultado_cursos_alunos['id'] . "' and sistema_id='".$this->system->getSistemaID()."' and concluida=1");
		$resultado_conclusao = end($this->system->sql->fetchrowset($query_conclusao));

		//porcentagem de conclusão do curso
		//conta todas as aulas assistidas. se existir divide as aulas assistidas pelo o total de aulas cadastradas e multiplica por 100
		if ($resultado_conclusao['aulas_assistidas']) {
			$resultado_dados_curso['porcentagem'] = round((($resultado_conclusao['aulas_assistidas']/$resultado_aulas['aulas'])*100));	
		}
					
		return $resultado_dados_curso;
	}
	// ===============================================================
	// PORTAL
	// ===============================================================
	public function getCursosSemSistemaId($palavra = '', $limit = '', $order = 'curso', $campos = '*'){
		$query = $this->system->sql->select($campos, 'cursos', "exibir_site = '1' AND excluido='0' " . ($palavra != ''? " and curso like '%" . $palavra.  "%'" : '') . ($area != ''? " and curso like '%" . $palavra.  "%'" : ''), $limit, $order);
		return $this->system->sql->fetchrowset($query);	
	}
	// ===============================================================
	public function getCursoSemSistemaId($id,$campos = '*'){
		$query = $this->system->sql->select($campos, 'cursos', "excluido='0' " . ($id != ''? " and id ='" . $id .  "'" : ''), $limit, $order);
		return end($this->system->sql->fetchrowset($query));	
	}
	// ===============================================================
	public function getCursosByArea($area_id = '', $limit = '', $order = ''){


		$query = $this->system->sql->select('c.*, a.area AS categoria', 
										'cursos c 
										INNER JOIN cursos_areas ca  ON (c.id = ca.curso_id)
										INNER JOIN areas a ON (a.id = ca.area_id)', 
										"c.excluido = '0' AND c.exibir_site='1' AND a.id = '".$area_id."' and c.sistema_id='".$this->system->getSistemaID()."'", $limit, $order);
		return $this->system->sql->fetchrowset($query);	
	}
	// ===============================================================
	public function getCursosPortal($limit = '', $order = ''){
		$query = $this->system->sql->select('*', 'cursos', "excluido = '0' AND exibir_site='1' AND sistema_id='".$this->system->getSistemaID()."'", $limit, $order);
		return $this->system->sql->fetchrowset($query);	
	}
	// ===============================================================
	public function getCategoriaCarreiraByCurso ($id) {
		$query = $this->system->sql->select('count(1) carreira', 'cursos_categorias', "curso_id='" . $id . "' and categoria_id = 19");
		$categoriaCarreira =  end($this->system->sql->fetchrowset($query));
		return $categoriaCarreira;
	}

}
// ===================================================================