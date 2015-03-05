<?php
require_once(dirname(__FILE__).'/../global/financeiro.global.php');
// ===================================================================
class Financeiro  extends FinanceiroGlobal{
	// ===============================================================
	public function autoRun() {
    	switch($this->system->input['do']) {
			case 'gerenciar': 				$this->doGerenciar(); break;
			case 'detalhes':				$this->doDetalhes(); break;
			case 'pagamentos':				$this->doPagamentosProfessorInstituicao(); break;			
			default: 					$this->pagina404(); break;
		}	
	}
	// ==============================================================
	public function doGerenciar() {
		$this->system->admin->topo('financeiro');
		$this->system->view->display('instituicao/gerenciar_financeiro.tpl');
		$this->system->admin->rodape();	
	}
}
// ===================================================================