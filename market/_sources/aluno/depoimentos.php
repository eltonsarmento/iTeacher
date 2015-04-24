<?php
require_once(dirname(__FILE__).'/../global/depoimentos.global.php');
// ===================================================================
class Depoimentos extends DepoimentosGlobal {
	// ===============================================================
	public function autoRun() {
		$this->system->view->assign('categoria', $this->system->admin->getCategoria());
		switch($this->system->input['do']) {
			case 'listar': 				$this->doListar(); break;
			case 'todosDepoimentos': 	$this->doListarTodos(); break;
			case 'aceitar': 			$this->doAceitar(); break;
			case 'recusar': 			$this->doRecusar(); break;
			case 'buscarDepoimento': 	$this->doBuscarDepoimento(); break;
			case 'editar': 				$this->doEditar(); break;
			case 'novo':				$this->doNovo(); break;
			case 'excluir': 			$this->doExcluir(); break;
			default: 					$this->pagina404(); break;
		}
	}

	// ===============================================================
	protected function doNovo() {
		$idCurso = $this->system->input['curso_id'];
		$editar = $this->system->input['editar'];
		if($editar && $idCurso) {	
			$this->system->depoimentos->cadastrar($this->system->input);
			echo '<p>Cadastrado com sucesso!</p>';
		}
		else {
			echo '<p>Erro ao cadastrar!</p>';
		}
	}
}
// ===================================================================