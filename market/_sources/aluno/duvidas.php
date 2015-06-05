<?php
require_once(dirname(__FILE__).'/../global/duvidas.global.php');

// ===================================================================
class Duvidas extends DuvidasGlobal {
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {	
			case 'listar':				$this->doListar(); break;		
			case 'buscar':				$this->doListar(); break;		
			case 'pendentes': 			$this->doPendentes(); break;
			case 'excluidos': 			$this->doExcluidos(); break;
			case 'excluir': 			$this->doExcluir(); break;
			case 'restaurar': 			$this->doRestaurar(); break;
			case 'responder':			$this->doResponder(); break;
			case 'fechar':				$this->doFechar(); break;
			default: 					$this->pagina404(); break;
		}
	}
	// ===============================================================
	protected function doListar() {
		$usuarioId = $this->system->session->getItem('session_cod_usuario');		
		$duvidaId = $this->system->input['id'];
		//Obter duvidas
		$palavra = $this->system->session->getItem('palavra_busca');
		if ($palavra) $this->system->session->deleteItem('palavra_busca');
		if ($this->system->input['palavra']) $palavra = $this->system->input['palavra'];
		$duvidas = $this->system->duvidas->getDuvidas("and D.aluno_id = '" . $usuarioId . "' and D.excluido_aluno = 0 and C.lido = 1" . ($palavra? " and titulo like '%" . $palavra . "%'" : ''));
		
		//Abrir a primeira duvida se nenhuma foi selecionada.
		if (!$duvidaId)
			$duvidaId = $duvidas[0]['id'];
		//duvida aberta

		if ($duvidaId) {
			$this->system->session->deleteItem('duvidas_topo');
			$duvida = $this->system->duvidas->getDuvida("aluno_id = '" . $usuarioId . "' and id = '" . $duvidaId . "' and excluido_aluno = 0" );
			$this->system->duvidas->lerDuvida($duvidaId, $usuarioId);
		}

		$this->system->view->assign('usuario_id', $this->system->session->getItem('session_cod_usuario'));
		$this->system->view->assign('duvida_selecionada', $duvidaId);
		$this->system->view->assign('duvidas', $duvidas);
		$this->system->view->assign('duvida', $duvida);
		$this->system->admin->topo("duvidas", "duvidas-listar");
		$this->system->view->display('aluno/duvidas_respondidas.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function doPendentes() {
		$usuarioId = $this->system->session->getItem('session_cod_usuario');
		$duvidaId = $this->system->input['id'];

		//Obter duvidas
		$duvidas = $this->system->duvidas->getDuvidas("and D.aluno_id = '" . $usuarioId . "' and D.excluido_aluno = 0 and C.lido = 0" . ($palavra? " and titulo like '%" . $palavra . "%'" : ''));

		//Abrir a primeira duvida se nenhuma foi selecionada.
		if (!$duvidaId)
			$duvidaId = $duvidas[0]['id'];

		//duvida aberta
		if ($duvidaId) {
			$duvida = $this->system->duvidas->getDuvida("aluno_id = '" . $usuarioId . "' and id = '" . $duvidaId . "' and excluido_aluno = 0");
			$this->system->duvidas->lerDuvida($duvidaId, $usuarioId);
		}
		
		$this->system->view->assign('usuario_id', $this->system->session->getItem('session_cod_usuario'));
		$this->system->view->assign('duvida_selecionada', $duvidaId);
		$this->system->view->assign('duvidas', $duvidas);
		$this->system->view->assign('duvida', $duvida);
		$this->system->view->assign('secao', 2);
		$this->system->admin->topo(2);
		$this->system->view->display('aluno/duvidas_pendentes.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function doExcluidos() {
		$usuarioId = $this->system->session->getItem('session_cod_usuario');
		$duvidaId = $this->system->input['id'];

		if ($this->system->input['palavra']) $palavra = $this->system->input['palavra'];
		//Obter duvidas
		$duvidas = $this->system->duvidas->getDuvidas("and D.aluno_id = '" . $usuarioId . "' and D.excluido_aluno = 1" . ($palavra? " and titulo like '%" . $palavra . "%'" : ''));
		//Abrir a primeira duvida se nenhuma foi selecionada.
		if (!$duvidaId)
			$duvidaId = $duvidas[0]['id'];
		//duvida aberta
		if ($duvidaId) {
			$duvida = $this->system->duvidas->getDuvida("aluno_id = '" . $usuarioId . "' and id = '" . $duvidaId . "' and excluido_aluno = 1" );
			$this->system->duvidas->lerDuvida($duvidaId, $usuarioId);
		}
		$this->system->view->assign('usuario_id', $this->system->session->getItem('session_cod_usuario'));
		$this->system->view->assign('duvida_selecionada', $duvidaId);
		$this->system->view->assign('duvidas', $duvidas);
		$this->system->view->assign('duvida', $duvida);
		$this->system->view->assign('secao', 2);
		$this->system->admin->topo(2);
		$this->system->view->display('aluno/duvidas_excluidas.tpl');
		$this->system->admin->rodape();
	}
}
// ===================================================================
