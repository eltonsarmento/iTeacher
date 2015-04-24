<?php
require_once(dirname(__FILE__).'/../global/administrativos.global.php');
// ===================================================================
class Administrativos  extends AdministrativosGlobal{
	// ===============================================================
	public function autoRun() {
    	switch($this->system->input['do']) {
			case 'listar': 						$this->doListar(); break;
			case 'novo': 						$this->doEdicao(); break;
			case 'editar': 						$this->doEdicao(); break;
			case 'apagar': 						$this->doDeletar(); break;
			case 'buscar':						$this->doListar(); break;
			case 'visualizar': 					$this->doVisualizar(); break;
			case 'editarnavisualizacao': 		$this->doEditarNaVisualizacao(); break;
			default: 							$this->pagina404(); break;
		}	
	}
}
// ===================================================================