<?php
require_once(dirname(__FILE__).'/usuarios.dao.php');

// ===================================================================
class ProfessoresDAO extends UsuariosDAO{
    // ===============================================================
    protected $system = null;
    // ===============================================================
    public function __construct() {
        $this->system =& getInstancia();        
    }
    // ===============================================================
    public function cadastrarBySite($input) {
        $this->system->load->dao('sistemas');
        $input['tipo_sistema'] = 1;
        $sistemaID = $this->system->sistemas->cadastrar($input);
        /*$this->system->sql->insert('sistemas', array(
        'nome'              => "Sistema - ". trim($input['nome']),
        'data_cadastro'     => date('Y-m-d H:i:s'),            
        'tipo_sistema'      => 1,
        'dominio'           => trim(str_replace(' ','_',$this->system->func->removeAcentos($input['nome']))),
        'excluido'          => 0
        ));*/
        //$sistemaID = $this->system->sql->nextid();
        $nivelProfessor = 3;

        $this->system->sql->insert('usuarios', array(
            'nome'              => trim($input['nome']),
            'senha'             => $this->system->func->criptografar(trim($input['senha'])),
            'email'             => trim($input['email']),
            'nivel'             => $nivelProfessor,
            'avatar'            => 'avatar_padrao.jpg',
            'data_cadastro'     => date('Y-m-d H:i:s'),
            'cadastro_por_id'   => intval($this->system->session->getItem('session_cod_usuario')),
            'ativo'             => 1,
            'sistema_id'        => $sistemaID,
            'reference'         => ''
        ));
        $id = $this->system->sql->nextid();
        
        $this->system->sql->insert('usuarios_dados', array(
            'usuario_id'        => $id,
            'email_secundario'  => trim($input['email_secundario']),
            'cep'               => trim($input['cep']),
            'cpf'               => trim($input['cpf']),
            'data_nascimento'   => trim($input['data_nascimento']) ? $this->system->func->converteData(trim($input['data_nascimento'])) : '0000-00-00',
            'endereco'          => trim($input['endereco']),
            'complemento'       => trim($input['complemento']),
            'bairro'            => trim($input['bairro']),
            'cidade'            => trim($input['cidade']),
            'estado'            => trim($input['estado']),          
            'facebook'          => trim($input['facebook']),       
            'twitter'           => trim($input['twitter']),    
            'telefone'          => trim($input['telefone']),   
            'minicurriculo'     => trim($input['minicurriculo']),
            'contato'           => trim($input['contato']),
            'razao_social'      => trim($input['razao_social']),
            'cnpj'              => trim($input['cnpj']),
            'comissao'          => intval($input['comissao']),
        ));

        $this->system->sql->update('usuarios', array('reference' => md5($id)), "id='" . $id . "'");

        
        return $id;
    }
    // ===============================================================
    public function cadastrar($input) {

        if($this->system->session->getItem('session_nivel_categoria') == 'administrador'){

            $this->system->load->dao('sistemas');
            $input['tipo_sistema'] = 1;
            $sistemaID = $this->system->sistemas->cadastrar($input);
            /*$this->system->sql->insert('sistemas', array(
            'nome'              => "Sistema - ". trim($input['nome']),
            'data_cadastro'     => date('Y-m-d H:i:s'),            
            'tipo_sistema'      => 1,
            'dominio'           => trim(str_replace(' ','_',$this->system->func->removeAcentos($input['dominio']))),
            'excluido'          => 0
            ));
            $sistemaID = $this->system->sql->nextid();*/


            $nivelProfessor = 3;
        }else{
            $sistemaID = $this->system->getSistemaID();
            $nivelProfessor = 8;
        }
        $this->system->sql->insert('usuarios', array(
            'nome'              => trim($input['nome']),
            'senha'             => $this->system->func->criptografar(trim($input['senha'])),
            'email'             => trim($input['email']),
            'nivel'             => $nivelProfessor,
            'avatar'            => 'avatar_padrao.jpg',
            'data_cadastro'     => date('Y-m-d H:i:s'),
            'cadastro_por_id'   => intval($this->system->session->getItem('session_cod_usuario')),
            'ativo'             => 1,
            'sistema_id'        => $sistemaID,
            'reference'         => ''
        ));
        $id = $this->system->sql->nextid();
        
        $this->system->sql->insert('usuarios_dados', array(
            'usuario_id'        => $id,
            'email_secundario'  => trim($input['email_secundario']),
            'cep'               => trim($input['cep']),
            'cpf'               => trim($input['cpf']),
            'data_nascimento'   => trim($input['data_nascimento']) ? $this->system->func->converteData(trim($input['data_nascimento'])) : '0000-00-00',
            'endereco'          => trim($input['endereco']),
            'complemento'       => trim($input['complemento']),
            'bairro'            => trim($input['bairro']),
            'cidade'            => trim($input['cidade']),
            'estado'            => trim($input['estado']),          
            'facebook'          => trim($input['facebook']),       
            'twitter'           => trim($input['twitter']),    
            'telefone'          => trim($input['telefone']),   
            'minicurriculo'     => trim($input['minicurriculo']),
            'contato'           => trim($input['contato']),
            'razao_social'      => trim($input['razao_social']),
            'cnpj'              => trim($input['cnpj']),
            'comissao'          => intval($input['comissao']),
        ));

        $this->system->sql->update('usuarios', array('reference' => md5($id)), "id='" . $id . "'");
        
        return $id;
    }
    // ===============================================================
    public function atualizar($input) {
        $this->system->sql->update('usuarios', array(
            'nome'  => trim($input['nome']),
            'email' => trim($input['email']),
            'ativo' => $input['ativo'] ? intval($input['ativo']) : 1
        ),
        "id='" . $input['id'] . "'");
        
        if ($input['senha']) 
            $this->system->sql->update('usuarios', array('senha' => $this->system->func->criptografar(trim($input['senha']))), "id='" . $input['id'] . "'");
        
        $this->system->sql->update('usuarios_dados', array(
            'email_secundario'  => trim($input['email_secundario']),
            'cep'               => trim($input['cep']),
            'cpf'               => trim($input['cpf']),
            'data_nascimento'   => trim($input['data_nascimento']) ? $this->system->func->converteData(trim($input['data_nascimento'])) : '0000-00-00',
            'endereco'          => trim($input['endereco']),
            'complemento'       => trim($input['complemento']),
            'bairro'            => trim($input['bairro']),
            'cidade'            => trim($input['cidade']),
            'estado'            => trim($input['estado']),    
            'facebook'          => trim($input['facebook']),       
            'twitter'           => trim($input['twitter']),             
            'telefone'          => trim($input['telefone']),
            'minicurriculo'     => trim($input['minicurriculo']),
            'contato'           => trim($input['contato']),
            'razao_social'      => trim($input['razao_social']),
            'cnpj'              => trim($input['cnpj']),
            'comissao'          => intval($input['comissao'])
        ),
        "usuario_id='" . $input['id'] . "'");

        $usuario = parent::getUsuario($input['id'], false);  
        $this->system->sql->update('sistemas', array('dominio' => trim(str_replace(' ','-',$input['nome']))), "id='" . $usuario['sistema_id'] . "'");
    }
    // ===============================================================
    public function atualizarCampos($id, $campos) {
        $this->system->sql->update('professores_pagamentos', $campos, "id = '" . $id . "'");
    }
    // ===============================================================
    public function getProfessores($palavra = '', $metodo_busca = '', $limit = '', $order = 'nome', $apenas_total = false, $nivel = 8) {    
        $sql_extra = ' and sistema_id = ' . $this->system->getSistemaID();


        if ($palavra != '') {
            //email
            if ($metodo_busca == 'email')   $sql_extra .= " and email like '%" . $palavra . "%'";
            //cpf
            if ($metodo_busca == 'cpf')     $sql_extra .= " and id in (SELECT usuario_id FROM usuarios_dados WHERE cpf = '" . $palavra . "')";   
            //padrao
            if ($metodo_busca == 'padrao')  $sql_extra .= " and (nome like '%" . $palavra . "%' OR email like '%" . $palavra . "%')";
            
        }
        if ($apenas_total)
            return $this->system->sql->querycountunit($this->system->sql->select('count(id) as total', 'usuarios', "excluido='0' and nivel = '".$nivel."'" . $sql_extra));

        $query = $this->system->sql->select('*', 'usuarios', "excluido='0' and sistema_id = '".  $this->system->getSistemaID() ."' and nivel = '".$nivel."'" . ($palavra? " and nome like '%" . $palavra . "%'" : ''), $limit, $order);
        $professores =  $this->system->sql->fetchrowset($query);
        return $professores;
    }

    // ===============================================================
    public function getProfessoresAutonomos($palavra = '', $metodo_busca = '', $limit = '', $order = 'nome', $apenas_total = false) {    
        $sql_extra = ' and sistema_id = ' . $this->system->getSistemaID();

        if ($palavra != '') {
            //email
            if ($metodo_busca == 'email')   $sql_extra .= " and email like '%" . $palavra . "%'";
            //cpf
            if ($metodo_busca == 'cpf')     $sql_extra .= " and id in (SELECT usuario_id FROM usuarios_dados WHERE cpf = '" . $palavra . "')";   
            //padrao
            if ($metodo_busca == 'padrao')  $sql_extra .= " and (nome like '%" . $palavra . "%' OR email like '%" . $palavra . "%')";
            
        }
        if ($apenas_total)
            return $this->system->sql->querycountunit($this->system->sql->select('count(id) as total', 'usuarios', "excluido='0' and nivel = '3'" . $sql_extra));

        $query = $this->system->sql->select('*', 'usuarios', "excluido='0' and nivel = '3'" . ($palavra? " and nome like '%" . $palavra . "%'" : ''), $limit, $order);
        $professores =  $this->system->sql->fetchrowset($query);
        return $professores;
    }
    // ===============================================================
    public function getProfessor($id, $dadosCompletos = false, $tipo = 'instituicao') {
        $professor = parent::getUsuario($id, $dadosCompletos);
        if($tipo == 'instituicao'){
            if ($professor['nivel'] != 8)
                return array();    
        }elseif($tipo == 'autonomo'){
            if ($professor['nivel'] != 3)
                return array();    
        }
        
        return $professor;
    }

    // ===============================================================
    public function getProfessorAutonomo($id, $dadosCompletos = false) {
        $professor = parent::getUsuario($id, $dadosCompletos);
        if ($professor['nivel'] != 3)
            return array();
        return $professor;
    }
    // ===============================================================
    public function countProfessores($sistema_id = ""){
        if($sistema_id){    
            $total = end($this->system->sql->fetchrowset($this->system->sql->select('count(1) as total', 'usuarios', "excluido='0' and nivel='3' and sistema_id='".$sistema_id."'", $limit, $orderby)));
        }else{
            $total = end($this->system->sql->fetchrowset($this->system->sql->select('count(1) as total', 'usuarios', "excluido='0' and nivel='3' and sistema_id='".$this->system->getSistemaID()."'", $limit, $orderby)));    
        }
        
        return $total['total'];
    }
    // ===============================================================
    public function estaEnsinando($id) {
        $query = $this->system->sql->select('count(1) as total', 'cursos', "excluido='0' and (professor_id = '" . $id . "' or professor_substituto_id = '" . $id . "')");
        $resultado = end($this->system->sql->fetchrowset($query));
        if ($resultado['total'] > 0)
            return true;
        return false;
    }
    // ===============================================================
    public function countTotalCursos($id) {
        $query = $this->system->sql->select('count(1) as total', 'cursos', "excluido='0' and (professor_id = '" . $id . "' or professor_substituto_id = '" . $id . "')");
        $resultado = end($this->system->sql->fetchrowset($query));
        return $resultado['total'];
    }
    // ===============================================================
    public function getProfessoresByCurso($curso_id) {
        $query = $this->system->sql->select('professor_id, professor_substituto_id', 'cursos', "excluido='0' and id = '" . $curso_id . "'");
        $curso = end($this->system->sql->fetchrowset($query));
        //Professores
        $query = $this->system->sql->select('id, nome', 'usuarios', "excluido='0' and id IN (" .implode(',', $curso) . ")");
        $professores = $this->system->sql->fetchrowset($query);
        return $professores;
    }

    // ===============================================================
    public function desativarProfessor($id){
        $this->system->sql->update('usuarios', array(
            'ativo' => 0
        ),
        "id='" . $id . "'");
    }
    // ===============================================================
    public function ativarProfessor($id){
        $this->system->sql->update('usuarios', array(
            'ativo' => 1
        ),
        "id='" . $id . "'");
    }
    // ===============================================================
    public function getGerenciarPagamentos($id) {


        $query = $this->system->sql->select(' u.nome AS nome_professor, p.*', 'professores_pagamentos p INNER JOIN usuarios u ON (u.id = p.professor_id)', "p.excluido='0'  and p.sistema_id = '" . $this->system->getSistemaID() ."' ". ($id ? " and p.id='".$id."' " : ""));
        $pagamentos = $this->system->sql->fetchrowset($query);
        
        foreach ($pagamentos as $key => $pagamento) {
            //convertendo a data de 0000-00-00 para 00/00/0000
            $data = strtotime(substr($pagamentos[$key]['mes_faturado'], 2,8));
            $pagamentos[$key]['mes_faturado'] = date('d/Y',$data);

            $data2 = strtotime(substr($pagamentos[$key]['data_pagamento'], 2,8));
            $pagamentos[$key]['data_pagamento'] = date('d/m/Y',$data2);
        }

        return $pagamentos;
    }
    // ===============================================================
    //                              PORTAL
    // ===============================================================
    public function getProfessorPortal($id) {
        $query = $this->system->sql->select('u.*, ud.*', 'usuarios u INNER JOIN usuarios_dados ud ON (u.id = ud.usuario_id)', "u.nivel = '5' AND u.excluido = '0' AND u.ativo = '1' ". ($id ? " AND u.id='".$id."' " : ""));
        $professor = $this->system->sql->fetchrowset($query);
        return $professor;
    }
    // ===============================================================
}
// ===================================================================