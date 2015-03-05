<?php
require_once(dirname(__FILE__) . '/usuarios.dao.php');
// ===================================================================
class AlunosDAO extends UsuariosDAO {
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
        	'nivel'			    => 2,
        	'data_cadastro'     => date('Y-m-d H:i:s'),
            'cadastro_por_id'   => intval($this->system->session->getItem('session_cod_usuario')),
            'avatar'            => 'avatar_padrao.jpg',
        	'ativo'	            => 1,
            'reference'             => "",
        ));
		$id = $this->system->sql->nextid();
		$this->system->sql->insert('usuarios_dados', array(
			'usuario_id'	    => $id,
        	'cep'			    => trim($input['cep']),
        	'cpf'			    => trim($input['cpf']),
        	'endereco'		    => trim($input['endereco']),
        	'complemento'	    => trim($input['complemento']),
        	'bairro'		    => trim($input['bairro']),
        	'cidade'		    => trim($input['cidade']),
        	'estado'		    => trim($input['estado']),
        	'telefone'          => trim($input['telefone']),
            'email_secundario'          => "",
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
	public function getAlunos($palavra = '', $metodo_busca = '', $limit, $order = 'nome', $apenas_total = false, $sistema_id = "") {
        if($sistema_id){
            $sql_extra = ' and sistema_id = ' . $sistema_id;
        }else{
            $sql_extra = ' and sistema_id = ' . $this->system->getSistemaID();    
        }
	
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
			return $this->system->sql->querycountunit($this->system->sql->select('count(id) as total', 'usuarios', "excluido='0' and nivel = '2'" . $sql_extra));
		$query = $this->system->sql->select('*', 'usuarios', "excluido='0' and nivel = '2'" . $sql_extra, $limit, $order);
		return $this->system->sql->fetchrowset($query);
	}
    // ===============================================================
	public function getAluno($id, $dadosCompletos = false) {
		$aluno = parent::getUsuario($id, $dadosCompletos);
               
        if ($aluno['nivel'] != 2) return array();
        return $aluno;
	}
    // ===============================================================
    public function countAlunos($id = "") {
        if($id){
            $total = end($this->system->sql->fetchrowset($this->system->sql->select('count(1) as total', 'usuarios', "excluido='0' and nivel='2' and sistema_id='".$id."'", $limit, $orderby)));    
        }else{
            $total = end($this->system->sql->fetchrowset($this->system->sql->select('count(1) as total', 'usuarios', "excluido='0' and nivel='2' and sistema_id='".$this->system->getSistemaID()."'", $limit, $orderby)));    
        }    
        return $total['total'];
    }

    // ===============================================================
    public function getAlunosByCurso($curso_id) {
        //Alunos
        $query = $this->system->sql->select('usu.id, usu.nome, usu.email, ca.expira', 'usuarios usu, cursos_alunos ca, cursos c', "c.id = ca.curso_id and usu.id = ca.usuario_id and c.excluido='0' and ca.curso_id = '".$curso_id."'");
        $alunos = $this->system->sql->fetchrowset($query);
        return $alunos;
    }
    // ===============================================================
    public function getAlunosByDia($data){
        $d = str_replace('/', '-', $data);

        $data = date('Y-m-d',strtotime($d));
        
        $query = $this->system->sql->select('id, nome, email', 'usuarios', "excluido = 0 and nivel = 2 and sistema_id='".$this->system->getSistemaID()."' and data_cadastro LIKE  '%".$data."%'");

        $alunos = $this->system->sql->fetchrowset($query);
        return $alunos;
    }

    // ===============================================================
    public function getCursos($usuario_id) {
         $query = $this->system->sql->select('c.*, ca.certificado_emitido ', 'cursos as c, cursos_alunos as ca', "c.id = ca.curso_id AND c.excluido='0' AND ca.excluido = 0 AND ca.usuario_id = '" . $usuario_id . "' and c.sistema_id = '" . $this->system->getSistemaID()."'");
         return $this->system->sql->fetchrowset($query);
    }
	// ===============================================================
    public function getCadastrosAlunos($campos) {
		return $this->system->sql->fetchrowset($this->system->sql->select('id, nome, data_cadastro', 'usuarios', "excluido=0 and nivel = 2 and sistema_id='".$this->system->getSistemaID()."' and ativo = 1" . $campos));
    }
    // =====RANKING DAS INSTITUIÇÕES COM MAIS ALUNOS CADASTRADOS======
    public function getRankingInstituicao($where, $limit = '', $order = 'usuarios DESC'){
        $countPosisaoRanking = 0;
        $where = "s.id = ca.sistema_id  AND ca.sistema_id = u.sistema_id AND u.nivel = 5 GROUP BY ca.sistema_id";
        $queryInstituicoes = $this->system->sql->select('COUNT(ca.usuario_id) usuarios, ca.sistema_id, s.nome', 'cursos_alunos ca, sistemas s, usuarios u', $where,$limit,$order);
        $instituicoes = $this->system->sql->fetchrowset($queryInstituicoes);
        foreach ($instituicoes as $key => $instituicao) {
            $countPosisaoRanking++;
            $instituicoes[$key]['posicao_ranking'] = $countPosisaoRanking;
        }

        return $instituicoes;
    }
    // =============================================================
   

}
// ===================================================================