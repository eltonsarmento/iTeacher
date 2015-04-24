<?php
// ===================================================================
class ComprovantesGlobal extends AdminModules {
	protected $mostrar = 10;
	// ===============================================================
	public function __construct() {
		parent::__construct();
		$this->system->load->dao('comprovantes');
	}
	// ===============================================================
	public function autoRun() {
    	switch($this->system->input['do']) {
    		case 'buscar':
			case 'listar':		$this->doListar(); 		break;
			case 'novo':
			case 'editar':		$this->doEditar();		break;
			case 'observacao':  $this->doObservacao();	break;
			default: 			$this->pagina404(); 	break;
		}
	}
	// ===============================================================
	protected function doListar() {
		$this->listagem();
		$this->system->admin->topo('vendas','comprovantes-listar');
		$this->system->view->display('instituicao-parceiro/lista_comprovantes.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	private function listagem() {
		$palavra = $this->system->input['palavra_busca'];
		$base_url = ($palavra ? $this->system->func->baseurl('/comprovantes/buscar&palavra_busca=' . $palavra) : $this->system->func->baseurl('/comprovantes/listar'));
		$total = $this->system->comprovantes->getComprovantes($palavra, 'padrao', 0, '', true);
		$paginacao = $this->system->func->paginacao($this->pagina, $this->mostrar, $total, $base_url);
		$comprovantes = $this->system->comprovantes->getComprovantes($palavra, 'padrao', $this->inicial . ',' . $this->mostrar);	
		$this->system->view->assign('comprovantes', $comprovantes);
		$this->system->view->assign('paginacao', $paginacao);
		$this->system->view->assign('palavra_busca', $palavra);
		$this->system->view->assign('url_site', $this->system->getUrlSite());
	}
	// ===============================================================
	protected function doEditar() {
		$retorno = array();
		$error_msg = $this->validarDados();
		if ($error_msg) {
			$retorno['msg'] = $error_msg;
			$this->system->view->assign('error_msg', $error_msg);
		}
		else {
			$id = $this->system->comprovantes->cadastrar($this->system->input);
			if ($_FILES['anexo']['name']) {
				//copia rg
					if (is_uploaded_file($_FILES['anexo']['tmp_name'])) {
						$extensao = $this->system->func->getExtensaoArquivo($_FILES['anexo']['name']);			
						if (in_array($extensao, array('pdf', 'doc', 'docx', 'rar', 'zip'))) {
							$copia_rg = true;
							if ($_FILES['anexo']['size'] > 10485760) {
								$retorno['msg_rg'][] = 'O Comprovante está com mais de 10MB';
								$copia_rg = false;
							}
						} 
						else {
							$retorno['msg'] = 'Arquivo anexo inválido';
							$copia_rg = false;
						}
					}
					if (!count($retorno['msg_rg'])) {
						if ($copia_rg) {
							$nomearquivo = 'comprovante_'.$id.'.'.$extensao;
							if (file_exists($this->system->getUploadPath() . '/comprovantes/' . $nomearquivo))
								unlink($this->system->getUploadPath() . '/comprovantes/' . $nomearquivo);
							copy($_FILES['anexo']['tmp_name'], $this->system->getUploadPath() . '/comprovantes/' . $nomearquivo);
							$campo = "anexo";
							$this->system->comprovantes->atualizarAnexo($id, $nomearquivo, $campo);
						}
						$retorno['msg'] = 'Cadastrado com sucesso!';
					}
			}
		echo json_encode($retorno);
		}
	}
	// =========================================================================
	protected function doObservacao() {
		$id = intval($this->system->input['id']);
		$observacao = $this->system->comprovantes->getObservacao($id);
		echo json_encode($observacao);
	}
	// =========================================================================
	private function validarDados() {
		$retorno = array();
        if (!$this->system->input['mes']) 
            $retorno['msg'][] = "O campo mes está vazio.";
        if (!$this->system->input['valor']) 
            $retorno['msg'][] = "O campo valor está vazio.";
        if (!$this->system->input['observacao']) 
            $retorno['msg'][] = "O campo observacao está vazio.";
		if(count($retorno) > 0) {
		   $retorno['msg'] = implode("<br/>",$retorno['msg']);
		}
        return $retorno;
	}
}
// ===================================================================