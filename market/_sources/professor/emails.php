<?php
require(dirname(__FILE__).'/../global/email.global.php');
// ===================================================================
class Emails extends EmailGlobal{
	// ===============================================================
	public function autoRun() {
		//parent::autoRun();
		switch($this->system->input['do']) {
			case 'listar': 				$this->doListar("professor/emails.tpl"); 	break;
			case 'salvarDados':			$this->doSalvarDados(); 		break;
			case 'buscarCampos':		$this->doBuscarCampos();		break;
			case 'configurarEmail':		$this->doConfigurarEmail();		break;
			default: 					$this->pagina404();				break;
		}
   	}
}
// ===================================================================