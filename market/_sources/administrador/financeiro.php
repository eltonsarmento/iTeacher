<?php
require(dirname(__FILE__).'/../global/financeiro.global.php');
// ===================================================================
class Financeiro extends FinanceiroGlobal {

	public function __construct() {		
		parent::__construct();
		$this->system->load->dao('planos');
		$this->system->load->dao('instituicoes');
	}
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			case 'totais': 					$this->doTotais(); break;
			case 'totais-receber': 			$this->doTotaisReceber(); break;
			case 'totais-pagas': 			$this->doTotaisPagas(); break;
			case 'saques':					$this->doSaques(); break;
			case 'get-dados':				$this->doDetalhesSaque(); break;
			case 'get-dados-nf':		  	$this->doDetalhesNF(); break;
			case 'alterar-status-fatura':	$this->doAlteraStatusFatura(); break;
			case 'atualiza-comprovante':	$this->doAtualizaComprovante(); break;			
			case 'detalhes':				$this->doDetalhes(); break;
			default: 						$this->pagina404(); break;
		}
	}
	// ===============================================================
	protected function doSaques() {
		$id = $this->system->input['id'];
		$id_nf = $this->system->input['id_nf'];
		$editar = $this->system->input['editar'];
		$editarNF = $this->system->input['editarNF'];
		$palavra = $this->system->input['palavra_chave'];
		$filtrar = $this->system->input['filtrar'];
		$de = $this->system->func->converteData($this->system->input['de']);
		$ate = $this->system->func->converteData($this->system->input['ate']);
		$status = $this->system->input['status'];
		
		if ($editar) {
			if ($id) {
				$this->system->financeiro->mudarStatusSaqueAdministrador($this->system->input);
				$msg_alert = "Status atualizado com sucesso!";
			}
		}
		if ($editarNF) {
			if ($id_nf) {
				$this->system->financeiro->enviarCodigoNF($this->system->input);
				$msg_alert = "NFE atualizada com sucesso!";
			}	
		}
		if ($palavra) {
			$saques = $this->system->financeiro->getSaquesParaAdministrador($campos = "", $palavra);				
		} elseif ($filtrar) {
			if($de && $ate && $status) {
				switch ($status) {
					case 'aguardando':
						$status = 0;break;
					case 'pago':
						$status = 1;break;
					case 'cancelado':
						$status = 2;break;
					default: break;
				}
				$campos = "data BETWEEN '".$de."' AND '".$ate."' and status = '".$status."'";
				$saques = $this->system->financeiro->getSaquesParaAdministrador($campos, $palavra = "");
			}elseif ($de && $ate && !$status) {
				$campos = "data BETWEEN '".$de."' AND '".$ate."'";
				$saques = $this->system->financeiro->getSaquesParaAdministrador($campos, $palavra = "");
			}
		} else {
			$saques = $this->system->financeiro->getSaquesParaAdministrador($campos = "", $palavra = "");	
		}

		$this->system->view->assign('saques', $saques);
		$this->system->admin->topo('financeiro', 'saques');
		$this->system->view->display('administrador/solicitacoes_saques.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function doDetalhesSaque() {
		$id = $this->system->input['id'];
		$saque = $this->system->financeiro->getDetalheSaqueByIdParaAdministrador($id, "id,codigo, status, valor, usuario_id");
		echo json_encode($saque);
	}
	// ===============================================================
	protected function doDetalhesNF() {
		$id = $this->system->input['id'];
		$nf = $this->system->financeiro->getDetalheSaqueByIdParaAdministrador($id, "id, nfe");
		echo json_encode($nf);
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
					$nomearquivo = 'comprovantes_saque_' . $id . '.' . $extensao;					
					if (file_exists($this->system->getUploadPath() . '/comprovantes_saque/'. $nomearquivo))
						unlink($this->system->getUploadPath() . '/comprovantes_saque/'. $nomearquivo);
					if (copy($_FILES['comprovante']['tmp_name'], $this->system->getUploadPath() . '/comprovantes_saque/' . $nomearquivo)) {
						$this->system->financeiro->atualizar($id, array('comprovante' => $nomearquivo));
						$retorno['sucesso'] = 'Comprovante enviado com sucesso.';
					} else {
						$retorno['msg'][] = 'Erro ao fazer o upload do comprovante!';
					}
				}
			}
		}
		echo json_encode($retorno);
	}
	// ===============================================================
	protected function doTotais(){
		$totais = $this->system->financeiro->getTotais();
		$faturasPagas 	= $this->system->financeiro->getFaturasPainel("PAGAS");
		$faturasReceber = $this->system->financeiro->getFaturasPainel("RECEBER");

		$this->system->view->assign('totais', $totais);
		$this->system->view->assign('faturasPagas', $faturasPagas);
		$this->system->view->assign('faturasReceber', $faturasReceber);
		$this->system->admin->topo('financeiro', 'totais');
		$this->system->view->display('administrador/totais.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function doTotaisReceber(){
		$palavra = $this->system->input['palavra_chave'];
		
		if($this->system->input['filtro']){

			$dataFiltro		   	= date("Y-d-m", strtotime($this->system->input['dataFiltro']));
			$sistema_intituicao = $this->system->input['instituicaoFiltro'];
			$planoFiltro 	    = $this->system->input['planoFiltro'];	
			$faturasReceber 	= $this->system->financeiro->getFaturasPainel("RECEBER", $palavra,$dataFiltro, $sistema_intituicao);

		}else{			
			$faturasReceber = $this->system->financeiro->getFaturasPainel("RECEBER",$palavra);	
		}
		
		
		$instituicoes 	= $this->system->instituicoes->getInstituicoes($palavra, $metodo_busca, $limit,'nome',false);
		$planos =  $this->system->planos->getPlanos();
		$this->system->view->assign('faturasReceber', $faturasReceber);
		$this->system->view->assign('instituicoes', $instituicoes);
		$this->system->view->assign('planos', $planos);
		$this->system->view->assign('dataAtual', date('d/m/Y'));
		$this->system->admin->topo('financeiro', 'totais');
		$this->system->view->display('administrador/totais_receber.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function doTotaisPagas(){
		$palavra = $this->system->input['palavra_chave'];
		$faturasPagas 	= $this->system->financeiro->getFaturasPainel("PAGAS",$palavra);
		
		$this->system->view->assign('faturasPagas', $faturasPagas);		
		$this->system->admin->topo('financeiro', 'totais');
		$this->system->view->display('administrador/totais_pagas.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function doAlteraStatusFatura(){
		$id 	= $this->system->input['id'];
		$status = $this->system->input['status'];
		$campos =  array('status' => $status);
		$this->system->financeiro->atualizaFatura($id,$campos);


		$faturaAlterada = $this->system->financeiro->getFaturaInstituicao($id);
		if($faturaAlterada['status'] == $status){
			echo '<p class="alert alert-success" style="text-align: center;">Fatura alterada com sucesso!</p>.';
		}else{
			echo '<p class="alert alert-danger" style="text-align: center;">Não foi possível alterar o status!</p>.';
		}
		die();
	}
	
	
}
// ===================================================================