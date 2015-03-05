<?php
// ===================================================================
class AreasDAO {
	// ===============================================================
	private $system = null;
	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();		
	}
	// ===============================================================
	public function cadastrar($input) {
		$this->system->sql->insert('areas', array(
            'sistema_id'	=> $this->system->getSistemaID(),
			'area' 			=> $input['area'],
            'area_pai_id'	=> $input['area_pai_id'],
            'url'			=> $input['url'],
            'excluido' 		=> 0
		));
        return $this->system->sql->nextid();
	}
	// ===============================================================
	public function atualizar($input) {
		$this->system->sql->update('areas', array(
			'area' 			=> $input['area'],
            'area_pai_id'	=> $input['area_pai_id'],
            'url'			=> $input['url'],
        ),	"id='" . $input['id'] . "' and sistema_id='" . $this->system->getSistemaID() . "'");
	}
	// ===============================================================
	public function getAreasPais($ordem = 'area') {
		$query = $this->system->sql->select('*', 'areas', "excluido='0' and area_pai_id = '0' and sistema_id='" . $this->system->getSistemaID() . "'", '', $ordem);
		return $this->system->sql->fetchrowset($query);
	}
	// ===============================================================
	// public function getAreasFilhas($where = '', $limit = '', $orderby = 'area', $campos = '*') {
	// 	$query = $this->system->sql->select($campos, 'areas', "excluido='0' and sistema_id='" . $this->system->getSistemaID() . "' " . $where, $limit, $orderby);
	// 	return $this->system->sql->fetchrowset($query);
	// }
	// ===============================================================
	public function getAreas($palavra = '', $limit = '') {
	 	$query = $this->system->sql->select('*', 'areas', "excluido='0' and sistema_id='" . $this->system->getSistemaID() . "' " . ($palavra != ''? " and area like '%" . $palavra.  "%'" : ''), $limit, 'area');
	 	$areas =  $this->system->sql->fetchrowset($query);
	 	foreach ($areas as $key => $area) {
	 		if ($area['area_pai_id'] == 0) {
	 			$areas[$key]['area_pai_id'] = 'Sem categoria pai';
	 		} else {
	 			$query = $this->system->sql->select('area', 'areas', "excluido='0' and id= '" . $area['area_pai_id'] . "' and sistema_id='" . $this->system->getSistemaID() . "'");
	 			$areaPai =  $this->system->sql->fetchrowset($query);
	 			$areas[$key]['area_pai'] = $areaPai[0]['area'];
	 		}
	 	}
	 	return $areas;
	}	
	// ===============================================================
	public function getTotalAreas() {
		$query = $this->system->sql->select('COUNT(id) AS total', 'areas', "excluido='0' and sistema_id='" . $this->system->getSistemaID() . "'");
		return $this->system->sql->querycountunit($query);
	}
	// ===============================================================
	public function getArea($id) {
		$query = $this->system->sql->select('*', 'areas', "excluido='0' and id = '" . $id ."' and sistema_id='" . $this->system->getSistemaID() . "'");
		return end($this->system->sql->fetchrowset($query));
	}
	// ===============================================================
	public function deletar($id) {
		$this->system->sql->update('areas', array('excluido' => 1), "id='" . $id . "' and sistema_id='" . $this->system->getSistemaID() . "'");
	}
	// ===============================================================
	public function atualizarCampos($id, $campos = array()) {
		$this->system->sql->update('areas', $campos, "id='" . $id . "' and sistema_id='" . $this->system->getSistemaID() . "'");
	}
	// ===============================================================
	public function salvarPaiID($id, $pai_id, $ordem) {
		$this->system->sql->update('areas', array('area_pai_id' => $pai_id, 'ordem' => $ordem), "id='" . $id . "' and sistema_id='" . $this->system->getSistemaID() . "'");
	}
	// ===============================================================
	public function getAreasNiveis($orderby = 'area') {
		$query = $this->system->sql->select('*', 'areas', "excluido='0' and sistema_id='" . $this->system->getSistemaID() . "' and area_pai_id = 0", '', $orderby);
		$areas = $this->system->sql->fetchrowset($query);

		foreach ($areas as $key => $area) 
			$areas[$key]['filhas'] = $this->getAreasFilhas($area['id']);
			
		return $areas;
	}
	// ================================================================
	public function getAreasFilhas($id,  $limit = '', $orderby = 'area') {
		$areas = $this->system->sql->fetchrowset($this->system->sql->select('id, area, url', 'areas', "excluido='0' and area_pai_id= '" . $id . "' and sistema_id='" . $this->system->getSistemaID() . "'", $limit, $orderby));
		foreach ($areas as $key => $area) 
			$areas[$key]['filhas'] = $this->getAreasFilhas($area['id']);
		return $areas;
	}

	// ===========================================================
	public function getAreasFilhasPorPaiID($id_pai, $link_editar) {
		$query = $this->system->sql->select('*', 'areas', "excluido='0' and area_pai_id = '". $id_pai ."' and sistema_id='" . $this->system->getSistemaID() . "'", '', 'ordem');
		$areas = $this->system->sql->fetchrowset($query);
		if (count($areas)) {
			$html  = "\n";
			$html .= "<ol class='dd-list'>\n";
			foreach ($areas as $key => $area) {
				$html .= "\n";
				$html .= "<li class=\"dd-item dd3-item\" data-id=\"".$area['id']."\">\n";
				$html .= "<div class=\"dd-handle dd3-handle\"></div>\n";
				$html .= "<div class=\"dd3-content\"><a href=\"".$link_editar.$area['id']."\">".$area['area']."</a> <a data-toggle=\"modal\" href=\"#deletarArea\" onclick=\"javascript:setaDeletar(".$area['id'].");\" class=\"pull-right\"><i class=\"fa fa-trash-o\"></i></a></div>\n";
				$html .= $this->getAreasFilhasPorPaiID($area['id'], $link_editar);
				$html .= "</li>\n";
			}
			$html .= "</ol>\n";
		}
		return $html;
	}
	// ===========================================================
	public function getIdByUrl($url) { 
		$query = $this->system->sql->select('id', 'areas', "excluido = 0 and url = '" . $url . "' and sistema_id='" . $this->system->getSistemaID() . "'");
		$resultado = end($this->system->sql->fetchrowset($query));
		return ($resultado['id'] ? $resultado['id'] : false);
	}
	// ===============================================================
	//  PORTAL
	// ===============================================================
	public function getAreasPortal($palavra = '', $limit = '') {
	 	$query = $this->system->sql->select('*', 'areas', "excluido='0'  " . ($palavra != ''? " and area like '%" . $palavra.  "%'" : ''), $limit, 'area');
	 	$areas =  $this->system->sql->fetchrowset($query);
	 	foreach ($areas as $key => $area) {
	 		if ($area['area_pai_id'] == 0) {
	 			$areas[$key]['area_pai_id'] = 'Sem categoria pai';
	 		} else {
	 			$query = $this->system->sql->select('area', 'areas', "excluido='0' and id= '" . $area['area_pai_id'] . "'");
	 			$areaPai =  $this->system->sql->fetchrowset($query);
	 			$areas[$key]['area_pai'] = $areaPai[0]['area'];
	 		}
	 	}
	 	return $areas;
	}
}
// ===================================================================