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
			case 'buscar': 		$this->doListar('instituicao/alunos_gerenciar.tpl'); break;
			case 'novo':
			case 'editar': 		$this->doEdicao(); 	break;
			default:			$this->pagina404(); break;
		}	
   	}
   	
	// ===============================================================
}
// ===================================================================