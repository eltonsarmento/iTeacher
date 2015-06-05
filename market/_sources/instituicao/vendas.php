<?php

require_once(dirname(__FILE__).'/../global/vendas.global.php');
// ===================================================================
class Vendas extends VendasGlobal{

	public function autoRun() {
		$this->system->view->assign('categoria', $this->system->admin->getCategoria());
		switch($this->system->input['do']) {
			case 'detalhes': 	$this->doDetalhesVenda(); break;
		}	
   	}
}
