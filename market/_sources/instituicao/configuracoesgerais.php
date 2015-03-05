<?php
require_once(dirname(__FILE__).'/../global/configuracoesgerais.global.php');
// ===================================================================
class ConfiguracoesGerais extends ConfiguracoesGeraisGlobal{
	public function autoRun() {
		switch($this->system->input['do']){
			case 'servidores':						$this->doEdicaoServidores(); break;
			case 'pagamentos':						$this->doEdicaoPagamentos(); break;
			case 'listarPagamentos':				$this->doEdicaoTokensDePagamentos(); break;
			default: 								$this->pagina404(); break;
		}
	}
		
}
