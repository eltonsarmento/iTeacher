<?php
require_once(dirname(__FILE__).'/../global/alunos.global.php');
// ===================================================================
class Alunos extends AlunosGlobal {
	// ===============================================================
	public function autoRun() {
		$this->system->view->assign('categoria', $this->system->admin->getCategoria());
		switch($this->system->input['do']) {
			case 'home':
			case 'listar':
			case 'buscar': 	$this->doListar('administrativo/alunos_gerenciar.tpl'); break;
			default:		$this->pagina404(); break;
		}	
   	}
	// ===============================================================
}
// ===================================================================