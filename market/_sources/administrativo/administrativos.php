<?php
require_once(dirname(__FILE__).'/../global/administrativos.global.php');
// ===================================================================
class Administrativos extends AdministrativosGlobal {
	// ===============================================================
	public function autoRun() {	
		switch($this->system->input['do']) {
			case 'visualizar': 				$this->doVisualizar(); break;
			case 'editarnavisualizacao': 	$this->doEditarNaVisualizacao(); break;
			default: 						$this->pagina404(); break;
		}	
   	}
	// ===============================================================
}
// ===================================================================