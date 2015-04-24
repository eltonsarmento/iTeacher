<?php
// ===================================================================
class FinanceiroGlobal extends AdminModules {
	// ===============================================================
	public function __construct() {
		parent::__construct();
		$this->system->load->dao('vendas');
		$this->system->load->dao('usuarios');
		$this->system->load->dao('contas');
		$this->system->load->dao('financeiro');
		$this->system->load->model('saldo_model');
	}
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			case 'gerenciar': 				$this->doGerenciar(); break;
			case 'detalhes':				$this->doDetalhes(); break;
			case 'pagamentos':				$this->doPagamentosProfessorInstituicao(); break;			
			default: 						$this->pagina404(); break;
		}
	}
	// ===============================================================
	protected function doGerenciar() {
		$id_usuario = $this->system->session->getItem('session_cod_usuario');
		$sacar = $this->system->input['saque'];
		$saquesEfetuados = $this->system->financeiro->getSaques();
		$verificar_dados = $this->system->input['verificar_dados'];
		if ($verificar_dados) {	
			//verificando se tem erro de validação
			$erro_msg = $this->validarDados();
			if ($erro_msg) {
				$this->system->view->assign('msg_alert', $erro_msg['msg']);
				$this->system->view->assign('usuario_dados', $this->system->usuarios->getDadosUsuario($id_usuario));
				$this->system->view->assign('valor_sacar', $this->system->input['valor_saque']);
				$this->system->view->assign('contas', $this->system->contas->getContas());
				$this->system->view->assign(
				array(
						'saldo_disponivel' 	=> $this->system->vendas->getSaldoReceber('disponivel'),
						'saldo_receber'	=> $this->system->vendas->getSaldoReceber('receber'),
						'saldo_bloqueado' 	=> $this->system->vendas->getSaldoReceber('bloqueado'),
						'saques_efetuados'	=> $saquesEfetuados,
					)
				);
				$this->system->admin->topo('financeiros');
				$this->system->view->display('professor/gerenciar_financeiro.tpl');
				$this->system->admin->rodape();			
			} 
			else{
				$this->system->view->assign('msg_alert', $erro_msg['msg']);
				$this->system->view->assign('usuario_dados', $this->system->usuarios->getDadosUsuario($id_usuario));
				$this->system->view->assign('valor_sacar', $this->system->input['valor_saque']);
				$this->system->view->assign('contas', $this->system->contas->getContas());
				$this->system->view->assign(
				array(
						'saldo_disponivel' 	=> $this->system->vendas->getSaldoReceber('disponivel'),
						'saldo_receber'		=> $this->system->vendas->getSaldoReceber('receber'),
						'dados_conta' 		=> $this->system->contas->getConta($this->system->input['id_conta']),
						'saldo_bloqueado' 	=> $this->system->vendas->getSaldoReceber('bloqueado'),
						
					)
				);
				$this->system->admin->topo('financeiros');
				$this->system->view->display('professor/confirma_saque.tpl');
				$this->system->admin->rodape();	
			}
		}
		elseif ($sacar) { 
			//depois de verificado envia para a tela de saque. 
			$retornoQtdSaqueDia = $this->system->financeiro->verificaQtdSaquesNoDia();
			if ($retornoQtdSaqueDia) {
				$erro_msg = "Só é permitido um saque por dia.";
				$this->system->view->assign('msg_alert', $erro_msg);
				$this->system->view->assign('usuario_dados', $this->system->usuarios->getDadosUsuario($id_usuario));
				$this->system->view->assign('valor_sacar', $this->system->input['valor_saque']);
				$this->system->view->assign('contas', $this->system->contas->getContas());
				$this->system->view->assign(
				array(
						'saldo_disponivel' 	=> $this->system->vendas->getSaldoReceber('disponivel'),
						'saldo_receber'		=> $this->system->vendas->getSaldoReceber('receber'),
						'dados_conta' 		=> $this->system->contas->getConta($this->system->input['id_conta']),
						'saldo_bloqueado' 	=> $this->system->vendas->getSaldoReceber('bloqueado'),
						
					)
				);

				$this->system->admin->topo('financeiros');
				$this->system->view->display('professor/confirma_saque.tpl');
				$this->system->admin->rodape();
				;
			} 
			else {
				$retornoSaque = $this->system->financeiro->sacar($this->system->input);
				if ($retornoSaque) {
					$this->system->saldo_model->solicitarSaque($retornoSaque);
					$detalheSaque = $this->system->financeiro->getDetalheSaqueById($retornoSaque);
					$this->system->view->assign(
					array(
							'saldo_disponivel' 	=> $this->system->vendas->getSaldoReceber('disponivel'),
							'saldo_receber'		=> $this->system->vendas->getSaldoReceber('receber'),
							'saldo_bloqueado' 	=> $this->system->vendas->getSaldoReceber('bloqueado'),
							'dados_conta' 		=> $this->system->contas->getConta($this->system->input['id_conta']),
							'usuario_dados'		=> $this->system->usuarios->getDadosUsuario($id_usuario),
							'detalheSaque'		=> $detalheSaque,
						)
					);
					$this->system->admin->topo('financeiros');
					$this->system->view->display('professor/solicita_saque.tpl');
					$this->system->admin->rodape();
				}	
			}
		} 
		else {
			$saquesEfetuados = $this->system->financeiro->getSaques();
			//abre a tela de solicitação de saque
			$this->system->view->assign(
				array(
						'saldo_disponivel' 	=> $this->system->vendas->getSaldoReceber('disponivel'),
						'saldo_receber'		=> $this->system->vendas->getSaldoReceber('receber'),
						'saldo_bloqueado' 	=> $this->system->vendas->getSaldoReceber('bloqueado'),
						'contas'			=> $this->system->contas->getContas(),										
						'usuario_dados'		=> $this->system->usuarios->getDadosUsuario($id_usuario),
						'saques_efetuados'	=> $saquesEfetuados,
					)
			);
			$this->system->admin->topo('financeiros');
			$this->system->view->display('professor/gerenciar_financeiro.tpl');
			$this->system->admin->rodape();	
		}		
	}
	// ===============================================================
	private function validarDados() {
		$retorno = array();
        if (!$this->system->input['id_conta']) 
            $retorno['msg'][] = "A conta bancária deve ser selecionada.";
        if (!$this->system->input['valor_saque']) 
            $retorno['msg'][] = "O valor que você deseja sacar deve ser preenchido.";
        $retornoVerificacaoSaque = $this->system->financeiro->verificaDisponibilidadeSaque($this->system->input['valor_saque']);
        if($retornoVerificacaoSaque)
			$retorno['msg'][] = "O valor solicitado deve ser menor ou igual que o valor disponível para saque.";
		$retornoContaVerificada = $this->system->financeiro->verificaContaVerificada($this->system->input['id_conta']);
		if($retornoContaVerificada)
			$retorno['msg'][] = "Selecione uma conta já verificada.";			       	
		if(count($retorno) > 0)
		   $retorno['msg'] = implode("<br/>",$retorno['msg']);
        return $retorno;
	}
	// ================================================================
	protected function doDetalhes() {
		$codigo = $this->system->input['codigo'];
		$detalheSaque = $this->system->financeiro->getDetalheSaqueByCodigo($codigo);
		$id_usuario = $this->system->session->getItem('session_cod_usuario');
		$this->system->view->assign('detalheSaque', $detalheSaque);
		if ($this->system->session->getItem('session_nivel_categoria') == 'administrador')
			$this->system->view->assign('usuario_dados', $this->system->usuarios->getDadosUsuario($detalheSaque['usuario_id']));	
		else
			$this->system->view->assign('usuario_dados', $this->system->usuarios->getDadosUsuario($id_usuario));	
		$this->system->admin->topo('financeiros');
		$this->system->view->display('professor/saque_detalhe.tpl');
		$this->system->admin->rodape();		
	}
	// ================================================================
	protected function doPagamentosProfessorInstituicao() {
		$this->system->admin->topo('pagamentos');
		$this->system->view->display('instituicao-professor/pagamentos_listar.tpl');
		$this->system->admin->rodape();			
	}
}
// ===================================================================