<?php
require_once(dirname(__FILE__).'/../global/vendas.global.php');
// ===================================================================
class Vendas extends VendasGlobal {
	// ===============================================================
	public function autoRun() {
		$this->system->view->assign('categoria', $this->system->admin->getCategoria());
		switch($this->system->input['do']) {
			case 'vendasByAluno':		$this->doRecuperarHistoricoDeVendasAlunos(); break;
			case 'cursosByVenda': 		$this->doRecuperarCursoByIdVenda(); break;
			case 'status':				$this->doAlterarPagamento(); break;
			case 'listarTodas':              
			case 'buscar': 				$this->doListar(); break;
			case 'detalhes': 			$this->doDetalhesVenda(); break;
			case 'observacao':			$this->doBuscarObs(); break;
			case 'alterarObservacao':	$this->doAlterarObservacoes(); break;
			default:					$this->pagina404(); break;
		}	
   	}   	   
	// ===============================================================
}
// ===================================================================