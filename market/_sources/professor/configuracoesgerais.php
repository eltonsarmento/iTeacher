<?php

require_once(dirname(__FILE__).'/../global/configuracoesgerais.global.php');
// ===================================================================
class ConfiguracoesGerais extends ConfiguracoesGeraisGlobal{
	public function autoRun() {
		switch($this->system->input['do']){
			case 'servidores':					$this->doEdicaoServidores(); break;
			case 'listarPagamentos':			$this->doEdicaoTokensDePagamentos(); break;
			case 'opcaoPagamentos'			:$this->doListaOpcaoDePagamentos(); break;
			default: 							$this->pagina404(); break;
		}
	}
		
}
