<?php
// ===================================================================
class PaginasDAO {
	// ===============================================================
	private $system = null;
	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();		
	}

	private function paginasEstaticas(){
		$linhas[] =  array(
			'pag1' => array("titulo" => "Quem Somos",'tipo_id' => 1),
			'pag2' => array("titulo" => "Termos e Condições",'tipo_id' => 2),
			'pag3' => array("titulo" => "10 Razões para estudar",'tipo_id' => 3),
			'pag4' => array("titulo" => "Guia de Carreira",'tipo_id' => 4),
			'pag5' => array("titulo" => "Cursos Online",'tipo_id' => 5),
			'pag6' => array("titulo" => "Suporte",'tipo_id' => 6)
		);	
		return $linhas;
	}	
	// ===============================================================
	public function criarPaginas($id = "") {
		if (!$this->system->sql->querycountunit($this->system->sql->select('sistema_id', 'paginas', "sistema_id = '" . $this->system->getSistemaID() . "'"))){
			foreach ($this->paginasEstaticas() as $key => $paginas) {
				foreach ($paginas as $key => $value) {
					$this->system->sql->insert('paginas', array(
					'tipo_id' => $value['tipo_id'], 
					'titulo'  => $value['titulo'], 
					'conteudo'  => "",
					'sistema_id' => $this->system->getSistemaID()));	
				}	
			}	
		}
	}	
	// ===============================================================
	public function atualizar($input) {
		$this->system->sql->update('paginas', array(
			'conteudo'				=> trim($input['conteudoHidden']),			
        ),
		"id='" . $input['id'] . "' AND sistema_id ='". $this->system->getSistemaID() ."'");
	}
	// ===============================================================
	public function getPagina($id) {
		$query = $this->system->sql->select('*', 'paginas', "id = '" . $id . "' and sistema_id = '".$this->system->getSistemaID()."'");
		return end($this->system->sql->fetchrowset($query));
	}
	// ===============================================================
	public function getPaginaByName($titulo) {
		$query = $this->system->sql->select('*', 'paginas', "titulo  = '" . $titulo . "' and sistema_id = '".$this->system->getSistemaID()."'");
		return end($this->system->sql->fetchrowset($query));
	}
	// ===============================================================
	public function getPaginas($palavra = '', $limit = '', $order = '', $campos = '*')  {
		$query = $this->system->sql->select($campos, 'paginas', "sistema_id = '".$this->system->getSistemaID()."'". ($palavra != ''? " and curso like '%" . $palavra.  "%'" : ''), $limit, $order);
		return $this->system->sql->fetchrowset($query);	
	}
	// ===============================================================
	public function alteraStatus($pagina){
		if($pagina['status'] == 0){
			$status = 1;
		}else{
			$status = 0;
		}

		$this->system->sql->update('paginas', array(
        	'status' => trim($status)
        	),
		"id ='" . $pagina['id'] . "'");
	}	
	// ==============================================================	
}
// ===================================================================