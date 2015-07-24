<?php

// ===================================================================
require(dirname(__FILE__) . '/../_sources/libraries/class.system.php');
$system = new System(false);
$this->system->load->dao('modelo');
$this->system->load->dao('pneu');

print_r($this->system->input);
$largura = intval($this->system->input['largura']);		
$perfil  = intval($this->system->input['perfil']);		
$aro 	  = intval($this->system->input['aro']);		

$campos = " and largura = '".$largura."' and perfil = '".$perfil."' and aro = '".$aro."'";
$pneus  = $this->system->pneu->getPneus($campos);

$modelos = $this->system->modelo->getModelos();

foreach ($pneus as $key => $pneu) {
foreach ($modelos as $key2 => $modelo) {
	if($pneu['codigoModelo'] == $modelo['codigo']){
		$pneus[$key]['modelo'] = $modelo['nome'];
		//break;
	}

}			
}

foreach ($pneus as $key => $item) {
	$lista['pneus'][] = $item;
}         
echo json_encode($lista);die();