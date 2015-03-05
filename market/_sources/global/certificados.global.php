<?php
// ===================================================================
class CertificadosGlobal extends AdminModules {
	protected $mostrar = 2;
	// ===============================================================
	public function __construct() {
		parent::__construct();
		$this->system->load->dao('configuracoesgerais');
		$this->system->load->dao('certificados');
		$this->system->load->dao('cursos');
		$this->system->load->model('certificados_model');
	}
	// ===============================================================
	public function autoRun() {
    	switch($this->system->input['do']) {
			case 'editar': 		$this->doEdicao(); 	break;
			case 'listar': 		$this->doListar(); 	break;
			default: 			$this->pagina404(); break;
		}
	}
	// ===============================================================
	protected function doEdicao() {
		$editar = $this->system->input['editar'];
		$id = $this->system->input['id'];
		$filtrar = $this->system->input['filtrar'];
		if($editar){
			$msg_erro = $this->validarDados();
			if($msg_erro){
				$this->system->view->assign('msg_erro', $msg_erro);
				$this->system->view->assign('certificado',$this->system->input);
			}
			else{
				if($id){
					//atualizar
					$this->system->configuracoesgerais->atualizarCertificado($this->system->input);
					$this->system->view->assign('msg_erro', "Atualizado com sucesso!");
				}
				else{
					//cadastrar
					$id = $this->system->configuracoesgerais->cadastrarCertificado($this->system->input);
					$this->system->view->assign('msg_erro', "Cadastrado com sucesso!");
				}
				if (is_uploaded_file($_FILES['assinatura']['tmp_name'])) {
					$extensao = end(explode('.', $_FILES['assinatura']['name']));
					$nomearquivo = 'assinatura_' . $id . '.' . $extensao;
					if (file_exists($this->system->getUploadPath() . '/certificados/' . $nomearquivo))
						unlink($this->system->getUploadPath() . '/certificados/' . $nomearquivo);
					copy($_FILES['assinatura']['tmp_name'], $this->system->getUploadPath() . '/certificados/' . $nomearquivo);
					$this->system->configuracoesgerais->atualizarAssinatura($id, $nomearquivo);					
				}
				if (is_uploaded_file($_FILES['modelo']['tmp_name'])) {
					$extensao = end(explode('.', $_FILES['modelo']['name']));
					$nomearquivo = 'modelo_'.$id.'.'.$extensao;
					if (file_exists($this->system->getUploadPath().'/certificados/'.$nomearquivo))
						unlink($this->system->getUploadPath().'/certificados/'.$nomearquivo);
					copy($_FILES['modelo']['tmp_name'], $this->system->getUploadPath().'/certificados/'.$nomearquivo);
					$this->system->configuracoesgerais->atualizarModelo($id, $nomearquivo);
				}
			}
		}elseif ($filtrar) {
			
		}
		$certificado = $this->system->configuracoesgerais->getCertificadoCompleto();
		$this->system->view->assign('certificado',$certificado);
		$this->system->admin->topo('configuracoes', 'configuracoesgerais-certificados');
		$this->system->view->display('instituicao/configuracao_certificado.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	private function validarDados() {
		$retorno = array();
        if (!$this->system->input['titulo'])
            $retorno['msg'][] = "O campo titulo está vazio.";
		if (!$this->system->input['texto'])
            $retorno['msg'][] = "O campo texto está vazio.";
        if (!$this->system->input['percentual_conclusao'])
            $retorno['msg'][] = "O campo percentual de conclusão está vazio.";
		if (!$this->system->input['autenticacao'])
            $retorno['msg'][] = "O campo autenticação está vazio.";        
        if (count($retorno) > 0)
		   $retorno['msg'] = implode('<br/>', $retorno['msg']);
        return $retorno;
	}

}
// ===================================================================