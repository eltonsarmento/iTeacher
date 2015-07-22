<?php
require_once(dirname(__FILE__).'/../global/financeiro.global.php');
// ===================================================================
class Financeiro  extends FinanceiroGlobal{
	// ===============================================================
	public function autoRun() {
    	switch($this->system->input['do']) {
			case 'gerenciar': 				$this->doGerenciar(); break;
			case 'gerenciar-financeiro': 	$this->doGerenciarFinanceiro(); break;
			case 'atualiza-comprovante': 	$this->doAtualizaComprovante(); break;		
			case 'buscar-fatura': 	    	$this->doObterFatura(); break;		
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
	// ===============================================================
	protected function doGerenciarFinanceiro(){
		$faturas 	= $this->system->financeiro->getFaturasInstituicao($sistema_id);		
		foreach ($faturas as $key => $fatura) {
			if($fatura['status'] == 2){
				$dataPagamento = new DateTime($fatura['data_pagamento']);
				$dataAtual = new DateTime(date("Y-m-d"));
				$intervalo = $dataAtual->diff($dataPagamento);				
				if($intervalo->days > 5){
					unset($faturas[$key]);
				}
			}
		}
		
		$this->system->view->assign('faturas', $faturas);		
		$this->system->admin->topo('financeiro', 'instituicao');
		$this->system->view->display('instituicao/gerenciar_faturas.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function doAtualizaComprovante() {
		$id = intval($this->system->input['id']);
		
		if ($id) {
			$comprovante = false;
			if (is_uploaded_file($_FILES['comprovante']['tmp_name'])) {
				$extensao = $this->system->func->getExtensaoArquivo($_FILES['comprovante']['name']);
				if (in_array($extensao, array('pdf', 'doc', 'docx', 'rar', 'zip'))) {
					$comprovante = true;
					if ($_FILES['comprovante']['size'] > 10485760) {
						$retorno['msg'][] = 'O Comprovante está com mais de 10MB';
						$comprovante = false;
					}
				} else {
					$retorno['msg'][] = 'Comprovante de pagamento inválido';
					$comprovante = false;
				}
			}
			if (!count($retorno['msg'])) {				
				if ($comprovante) {
					$nomearquivo = 'comprovantes_pagamento_' . $id . '.' . $extensao;					
					if (file_exists($this->system->getUploadPath() . '/comprovantes_pagamentos/'. $nomearquivo))
						unlink($this->system->getUploadPath() . '/comprovantes_pagamentos/'. $nomearquivo);
					if (copy($_FILES['comprovante']['tmp_name'], $this->system->getUploadPath() . '/comprovantes_pagamentos/' . $nomearquivo)) {
						$this->system->financeiro->atualizaFatura($id, 
							array('comprovante' => $nomearquivo));
						$retorno['sucesso'] = 'Comprovante enviado com sucesso.';
						$retorno['id'] = $id;
					} else {
						$retorno['msg'][] = 'Erro ao fazer o upload do comprovante!';
					}
				}
			}
		}

		echo json_encode($retorno);
	}
	// ====================================================================================	
	protected function doObterFatura() {
		$id = $this->system->input['id'];

		$fatura  = $this->system->financeiro->getFaturaInstituicao($id);
		
		echo json_encode($fatura);
	}
}
// ===================================================================