<?php
// ===================================================================
class PlanosGlobal extends AdminModules{
	// ===============================================================
	public function __construct() {
		parent::__construct();
		$this->system->load->dao('planos');
	}
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			case 'listar':
			case 'buscar':						$this->doListar(); break;
			case 'listar-planos-instituicoes':
			case 'buscar-planos-instituicoes':	$this->doListarPlanoInstituicao(); break;
			case 'novo':
			case 'editar': 						$this->doEdicao(); break;
			case 'novo-plano-instituicao':
			case 'editar-plano-instituicao': 	$this->doEdicaoPlanoInstituicao(); break;
			case 'apagar': 						$this->doDeletar(); break;
			default: 							$this->pagina404(); break;
		}	
	}
	// ===============================================================
	private function doEdicao() {
		$id = intval($this->system->input['id']);
		$editar = intval($this->system->input['editar']);
		if ($editar) {
			$erro_msg = $this->validarDados();
			if ($erro_msg) {
				$this->system->view->assign('msg_alert', $erro_msg['msg']);
				$this->system->view->assign('plano', $this->system->input);
			} 
			else {
				//Salvar	
				if ($id) {
					$this->system->planos->atualizar($this->system->input);
					$this->system->view->assign('msg_alert', 'Plano atualizado com sucesso!');
				}
				else {		
					$this->system->load->model('pagarme_model');
					$this->system->load->dao('configuracoesgerais');

					$campos = $this->system->input;					
					$pagarme = $this->system->configuracoesgerais->getPagarme($this->system->getSistemaID());

					if($pagarme['pagarme_status'] == 1){					

						try {							
							$id_plano = $this->system->pagarme_model->criarPlano($campos);
							$this->system->input['codigoPlanoPagarme'] = $id_plano;

						} catch (Exception $e) {
							$this->system->view->assign('msg_alert', 'O plano não foi criado no Pagarme!');	
						}
						
					}					
					$id = $this->system->planos->cadastrar($this->system->input);
					$this->system->view->assign('msg_alert', 'Plano cadastrado com sucesso!');
				}
				if ($editar != 2) {
					$this->doListar();
					die;
				}
			}
		} 
		else {	
			if ($id) 
			    $this->system->view->assign('plano', $this->system->planos->getPlano($id));
		}
		$this->system->admin->topo('planos','planos-novo');
		$this->system->view->display('professor/planos_edicao.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	private function doEdicaoPlanoInstituicao(){
		$id = intval($this->system->input['id']);
		$editar = intval($this->system->input['editar']);
		if ($editar) {
			$erro_msg = $this->validarDados();
			if ($erro_msg) {
				$this->system->view->assign('msg_alert', $erro_msg['msg']);
				$this->system->view->assign('plano', $this->system->input);
			} 
			else {
				//Salvar	
				if ($id) {
					$this->system->planos->atualizar($this->system->input);
					$this->system->view->assign('msg_alert', 'Plano atualizado com sucesso!');
				}
				else {	
					$this->system->load->model('pagarme_model');
					$this->system->load->dao('configuracoesgerais');

					$campos = $this->system->input;					
					$pagarme = $this->system->configuracoesgerais->getPagarme($this->system->getSistemaID());

					if($pagarme['pagarme_status'] == 1){					

						try {							
							$id_plano = $this->system->pagarme_model->criarPlano($campos);
							$this->system->input['codigoPlanoPagarme'] = $id_plano;

						} catch (Exception $e) {
							$this->system->view->assign('msg_alert', 'O plano não foi criado no Pagarme!');	
						}
						
					}					
					$id = $this->system->planos->cadastrar($this->system->input);
					$this->system->view->assign('msg_alert', 'Plano cadastrado com sucesso!');
				}
				if ($editar != 2) {
					$this->doListarPlanoInstituicao();
					die;
				}
			}
		} 
		else {	
			if ($id) 
			    $this->system->view->assign('plano', $this->system->planos->getPlano($id));
		}
		if ($this->system->input['do'] == 'novo-plano-instituicao')
			$this->system->admin->topo('instituicoes','planos-novo');
		else
			$this->system->admin->topo('instituicoes');
		$this->system->view->display('administrador/novo_plano_instituicao.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	private function validarDados() {
		$retorno = array();
    	//plano
    	if ($this->system->input['plano'] == '') 
            $retorno['msg'][] = "O campo Nome do Plano está vázio.";
        //verificando dados de um plano para professores autonomos
        if ($this->system->input['tipo'] == 1) {
        	//meses
	        if ($this->system->input['meses'] == '') 
	            $retorno['msg'][] = "O campo Quantidade de Meses está vázio.";
	        elseif (intval($this->system->input['meses']) == 0)
	            $retorno['msg'][] = "O campo Quantidade de Meses deve ser númerico maior que zero.";
	        else
	        	$this->system->input['meses'] = intval($this->system->input['meses']);
        }
        // verificandos dados de um plano para instituições
        if ($this->system->input['tipo'] == 2) {
        	//qtd_alunos
        	if ($this->system->input['qtd_alunos'] == '')
        		$retorno['msg'][] = "O campo Quantidade de Alunos está vázio.";
        }
        //valor
        if ($this->system->input['valor'] == '')
            $retorno['msg'][] = "O campo Valor do Plano está vázio.";	
        //plano
    	if ($this->system->input['descricao'] == '') 
            $retorno['msg'][] = "O campo Descrição do Plano está vázio.";
		if (count($retorno))
		   $retorno['msg'] = implode('<br/>', $retorno['msg']);
        return $retorno;
	}
	// ===============================================================
	private function doListar() {
		$this->listagem();
		$this->system->admin->topo('planos','planos-listar');
		$this->system->view->display('professor/planos_gerenciar.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	private function listagem() {
		$palavra = $this->system->input['palavra_busca'];
		$planos = $this->system->planos->getPlanos($palavra, $this->limit, '', 1);
		$this->system->view->assign('planos', $planos);
		$this->system->view->assign('url_site', $this->system->getUrlSite());
	}
	// ===============================================================
	private function doListarPlanoInstituicao() {
		$this->listagemPlanosInstituicoes();
		$this->system->admin->topo('instituicoes','planos-listar');
		$this->system->view->display('administrador/planos_instituicoes_listar.tpl');
		$this->system->admin->rodape();	
	}
	// ===============================================================
	private function listagemPlanosInstituicoes() {
		$palavra = $this->system->input['palavra_busca'];
		$planos = $this->system->planos->getPlanos($palavra, $this->limit, '', 2);
		$this->system->view->assign('planos', $planos);
		$this->system->view->assign('url_site', $this->system->getUrlSite());
	}
	// ===============================================================
	private function doDeletar() {
		$id = intval($this->system->input['id']);
		$plano = $this->system->planos->getPlano($id);
		if ($plano['id']) {
			$this->system->planos->deletar($plano['id']);
			$this->system->view->assign('msg_alert', 'Plano "' . $plano['plano'] . '" excluído com sucesso!');
		} 
		else {
			$this->system->view->assign('msg_alert', 'Não foi possível excluir esse plano!');	
		}
		$this->doListar();
	}
	// ===============================================================
}
// ===================================================================