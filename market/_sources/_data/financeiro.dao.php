<?php
class FinanceiroDAO {
	// ===============================================================
	protected $system = null;
	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();		
	}
	// ===============================================================
	public function sacar($input) {
        $this->system->sql->insert('saques', array(
            'sistema_id'        => $this->system->getSistemaID(),
            'conta_id'          => intval($input['id_conta']),
            'valor'             => $input['valor_saque'],
            'usuario_id'        => $this->system->session->getItem('session_cod_usuario') ,
            'data'              => date('Y-m-d H:i:s'),
        )); 
        $id = $this->system->sql->nextid();
        $this->system->sql->update('saques', array(
            'codigo'  => $this->system->func->criptografar(trim($id))
        ),
        "id='" . $id . "'");
        return $id;           
	}
    // ===============================================================
    public function getSaques($campos = "", $palavra = "") {
        if($palavra)
            $query = $this->system->sql->select('*', 'saques', "sistema_id = '" .$this->system->getSistemaID(). "' and codigo LIKE '%" . $palavra . "%'" . $campos);    
        else
            $query = $this->system->sql->select('*', 'saques', "sistema_id = '" .$this->system->getSistemaID(). "'" . $campos);    
        $saques = $this->system->sql->fetchrowset($query); 
        return $saques;
    }
    // ===============================================================
    public function getSaquesSolicitados() {
        $saques_solicitados = array();
        $query = $this->system->sql->select('s.usuario_id', 'saques s', "s.status = 0", '10', 'data desc');
        $resultado =  $this->system->sql->fetchrowset($query);
        foreach ($resultado as $key => $saque) {
            //solicitante
            $query = $this->system->sql->select('nome', 'usuarios', "id = '".$saque['usuario_id']."'");
            $solicitante = end($this->system->sql->fetchrowset($query));
            $resultado[$key]['solicitante'] = $solicitante['nome'];
            $saques_solicitados['solicitantes'][] = $resultado[$key];
        }
        $query = $this->system->sql->select('count(1) as total', 'saques s', "s.status = 0");
        $total =  $this->system->sql->fetchrowset($query);
        $saques_solicitados['qtd_saques'] = $total[0]['total'];
        return $saques_solicitados;
    }
    // ===============================================================
    public function getDetalheSaqueByCodigo($codigo) {
        if ($this->system->session->getItem('session_nivel_categoria') == 'administrador')
            $query = $this->system->sql->select('*', 'saques s, contas_bancarias c', "c.id = s.conta_id and codigo = '".$codigo."'");    
        else
            $query = $this->system->sql->select('*', 'saques s, contas_bancarias c', "c.id = s.conta_id and s.sistema_id = '" .$this->system->getSistemaID(). "' and codigo = '".$codigo."'");
        $saque = end($this->system->sql->fetchrowset($query));
        return $saque;   
    }
    // ===============================================================
    public function getDetalheSaqueById($id) {   
        $query = $this->system->sql->select('*', 'saques s, contas_bancarias c', "c.id = s.conta_id and s.sistema_id = '" .$this->system->getSistemaID(). "' and s.id = '".$id."'");
        $saque = end($this->system->sql->fetchrowset($query)); 
        return $saque;   
    }	
    // ===============================================================
	public function verificaDisponibilidadeSaque($valor_saque) {
        $query = $this->system->sql->select('disponivel', 'professor_saldo', "sistema_id = '" .$this->system->getSistemaID(). "'");
        $valorDisponivel = end($this->system->sql->fetchrowset($query));
        if($valorDisponivel['disponivel'] >= $valor_saque)
            return "0";
        else
            return "1";
    }
    // ===============================================================
    public function verificaContaVerificada($id_conta) {
        $query = $this->system->sql->select('status', 'contas_bancarias', "id = '".intval($id_conta)."' and sistema_id = '" .$this->system->getSistemaID(). "'");
        $statusConta = end($this->system->sql->fetchrowset($query));
        if($statusConta['status'] == 0)
            return "1";
        else
            return "0";
    }
    // ===============================================================
    public function verificaQtdSaquesNoDia() {
        $data_hoje = date('Y-m-d');
        $query = $this->system->sql->select('count(1) qtd', 'saques', "sistema_id = '" .$this->system->getSistemaID(). "' and data like '%".$data_hoje."%'");
        $qtd_saques = end($this->system->sql->fetchrowset($query));
        if($qtd_saques['qtd'] > 0)
            return "1";
        else
            return "0";
    }
    // ===============================================================
    public function getSaquesParaAdministrador($campos = "", $palavra = "") {
        if($palavra)
            $query = $this->system->sql->select('*', 'saques', "codigo LIKE '%" . $palavra . "%'" . $campos);    
        else
            $query = $this->system->sql->select('*', 'saques', $campos);
        $saques = $this->system->sql->fetchrowset($query); 
        return $saques;
    }
    // ===============================================================
    public function getDetalheSaqueByIdParaAdministrador($id, $colunas = "*") {
        $query = $this->system->sql->select($colunas, 'saques s', "s.id = '".$id."'");
        $saque = end($this->system->sql->fetchrowset($query)); 
        return $saque;   
    }
    // ===============================================================
    public function mudarStatusSaqueAdministrador($input) {
        $valor = $input['valor'];
        $usuario_id = $input['usuario'];
        $this->system->sql->update('saques', array(
            'status'  => $input['status']        
        ),
        "id='" . $input['id'] . "'");
        $query = $this->system->sql->select('sistema_id', "usuarios","id = ".$usuario_id);
        $usuario = end($this->system->sql->fetchrowset($query)); 

        $query = $this->system->sql->select('receber, bloqueado', "professor_saldo","sistema_id = ". $usuario['sistema_id']);
        $professor_saldo = end($this->system->sql->fetchrowset($query)); 

        $receberNovo   = $professor_saldo['receber'] + $valor;
        $bloqueadoNovo = $professor_saldo['bloqueado'] - $valor;

        $this->system->sql->update('professor_saldo', array(
            'receber'  => $receberNovo,
            'bloqueado'  => $bloqueadoNovo,
        ),
        "sistema_id='" . $usuario['sistema_id'] . "'");
    }   
    // ===============================================================
    public function enviarCodigoNF($input) {
        $this->system->sql->update('saques', array(
             'nfe'  => $input['nfe']
        ),
        "id='" . $input['id_nf'] . "'");
    }
    // ===============================================================
    public function atualizar($id, $campos) {
        $this->system->sql->update('saques', $campos, "id = '" . $id . "'");
    }
    // ===============================================================
    public function getTotais() {
        $query = $this->system->sql->select('SUM(valor_liquido) liquido, SUM(valor_total) total', "vendas");
        $vendas = end($this->system->sql->fetchrowset($query));
        return $vendas;
    }
    // ===============================================================
    public function getTotalByProfessor($id, $nivel) {
        $query = $this->system->sql->select('SUM(vc.preco_desconto) total_professor', "vendas_cursos vc, usuarios u", "u.id = vc.professor_id AND u.nivel = ".$nivel." AND vc.professor_id = ".$id."");
        $total_professor = end($this->system->sql->fetchrowset($query));
        return $total_professor['total_professor'];
    }
    // ===============================================================
    public function getTotalMesAtualProfessor($sistema_id) {
        $query = $this->system->sql->select("SUM(v.valor_liquido) soma_valor", "vendas v", "v.sistema_id = " . $sistema_id . " AND data_venda LIKE '%" . date('Y-m') . "%'");
        $soma_valor = end($this->system->sql->fetchrowset($query));
        return $soma_valor['soma_valor'];
    }
    // ===============================================================
    // FATURAS INSTITUIÇÕES
    // ===============================================================
    public function getInstituicoesTrias() {
        $query = $this->system->sql->select("*", "instituicoes_pagamentos", "excluido = '0' and  status ='5  ' ");
        $registro = $this->system->sql->fetchrowset($query);
        return $registro;
    }
    // ===============================================================
    public function getInstituicoesNormais() {
        $query = $this->system->sql->select("*", "instituicoes_pagamentos", "excluido = '0'");
        $registro = $this->system->sql->fetchrowset($query);
        return $registro;
    }
    // ===============================================================
    public function getFaturasInstituicao($sistema_id) {

        if(empty($sistema_id)){
            $sistema_id  = $this->system->getSistemaID();
        }
        $query = $this->system->sql->select("i.id, s.nome, i.data_pagamento,i.status", 
            "instituicoes_pagamentos i INNER JOIN sistemas s ON (i.sistema_id = s.id)",
            "i.sistema_id = '".$sistema_id."'",0,"i.data_pagamento desc");
        $faturas = $this->system->sql->fetchrowset($query);
        return $faturas;
    }
    // ===============================================================
    public function getFaturaInstituicao($id) {

        $query = $this->system->sql->select("i.id, s.nome, i.data_pagamento, i.status", 
            "instituicoes_pagamentos i INNER JOIN sistemas s ON (i.sistema_id = s.id)",
            "i.id = ".$id);
        $fatura = end($this->system->sql->fetchrowset($query));
        return $fatura;
    }
    // ===============================================================
    public function getFaturasPainel($tipo, $palavra = '',$data = '', $sistema_id = '') {
        $sqlExtra = "";
        if($tipo == "PAGAS"){
            $sqlExtra .= "and i.status = '1'";
        }elseif($tipo == "RECEBER"){
            $sqlExtra .= "and i.status  IN (0,2,3,4)";
        }

        if($data != "") $sqlExtra .= " and data_pagamento = '".$data."'";
        if($sistema_id != "") $sqlExtra .= " aand sistema_id = '".$sistema_id."'";

        if($palavra != '') $sqlExtra .= " and s.nome like '%".$palavra."%'";
        $query = $this->system->sql->select("i.id, s.nome, i.data_pagamento, i.status", "instituicoes_pagamentos i INNER JOIN sistemas s ON (i.sistema_id = s.id)",
         "i.excluido = '0' and i.status != 5 ".$sqlExtra);
        $faturas = $this->system->sql->fetchrowset($query);
        return $faturas;
    }
    // ===============================================================
    public function cadastraNovaFatura($sistema_id,$data_pagamento,$status,$excluido) {    
        $this->system->sql->insert('instituicoes_pagamentos', array(
            'sistema_id'        => $sistema_id,
            'data_pagamento'    => $data_pagamento,
            'status'            => $status,
            'excluido'          => $excluido
        ));

        $query = $this->system->sql->select("*", "instituicoes_pagamentos", "excluido = '0' and  status ='5  ' ");
        $registro = $this->system->sql->fetchrowset($query);
        return $registro;
    }
    // ===============================================================
    public function atualizaFatura($id,$campos) {            
        $this->system->sql->update('instituicoes_pagamentos', $campos, "id = '" . $id . "'");
    }
}
// ===================================================================