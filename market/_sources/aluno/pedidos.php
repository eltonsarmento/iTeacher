<?php
require_once(dirname(__FILE__).'/../global/vendas.global.php');
// ===================================================================
class Pedidos extends VendasGlobal {	
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			case 'listar': 								$this->doListar(); break;		
			case 'status':								$this->doAlterarPagamento(); break;
			case 'cursosByVenda': 						$this->doRecuperarCursoByIdVenda(); break;	
			case 'atualizaComprovante':					$this->doAtualizaComprovante(); break;
			case 'cancelar':							$this->doCancelar(); break;
			default: 									$this->pagina404(); break;
		}	
	}
	// ===============================================================
	public function doCancelar() {
		$id = $this->system->input['id'];
		$venda = $this->system->vendas->getVenda($id);
		$this->system->vendas->alterarPagamento($id, 2);
		$regerarDados = array();
		//cursos
		foreach($this->system->vendas->getCursosByVenda($id) as $curso) {
			$cursoAluno = end($this->system->cursos->getCursosAlunos(" and curso_id = '" . $curso['curso_id'] . "' and usuario_id = '" . $venda['aluno_id'] . "'"));
			$this->system->cursos->deleteCursoAluno($cursoAluno['id']);
			$regerarDados[] = $curso['professor_id'];
		}
		//planos
		$plano = $this->system->vendas->getPlanoVenda($venda['id']);
		if ($plano['id']) {
			$planoAluno = $this->system->planos->getPlanoAluno(" and usuario_id = '" . $venda['aluno_id'] . "' and plano_id = '" . $plano['id'] . "'");	
			if ($planoAluno['id'])
				$this->system->planos->desativarAssinatura($planoAluno['id']);
		}
		if (count($regerarDados) > 0) {
			list($ano, $mes, $dia) = explode('-', $venda['data_venda']);
			if (date('Y-m') != $ano.'-'.$mes) {
				$this->regerarComissaoProfessor($regerarDados, $mes, $ano);
			}
		}
		$this->system->saldo_model->removerVenda($id);
		$this->system->func->redirecionar('/pedidos/listar/');
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
				} 
				else {
					$retorno['msg'][] = 'Comprovante de pagamento inválido';
					$comprovante = false;
				}
			}
			if (!count($retorno['msg'])) {				
				if ($comprovante) {
					$nomearquivo = 'comprovante_pagamento_'.$id . '.' . $extensao;					
					if (file_exists($this->system->getUploadPath() . '/comprovantes_pagamentos/' . $nomearquivo))
						unlink($this->system->getUploadPath() . '/comprovantes_pagamentos/' . $nomearquivo);
					if (copy($_FILES['comprovante']['tmp_name'], $this->system->getUploadPath() . '/comprovantes_pagamentos/' . $nomearquivo)){						
						$campos = array('comprovante' => $nomearquivo);
						$this->system->vendas->atualizar($id, $campos);							
						$retorno['sucesso'] = 'Comprovante enviado com sucesso.';						
					}
					else {
						$retorno['msg'][] = 'Erro ao fazer o upload do comprovante!';
					}					
				}
			}
		}
		echo json_encode($retorno);
	}
	// ===============================================================
	protected function doEditar() {
		$id = intval($this->system->input['id']);
		$editar = intval($this->system->input['editar']);
		if ($editar) {							
			if (is_uploaded_file($_FILES['comprovante']['tmp_name'])) {
				$extensao = end(explode('.', $_FILES['comprovante']['name']));
				$nomearquivo = 'comprovante_' . $id . '.' . $extensao;
				if (file_exists($this->system->getUploadPath() . '/comprovante/' . $nomearquivo))
					unlink($this->system->getUploadPath() . '/comprovante/' . $nomearquivo);
				copy($_FILES['comprovante']['tmp_name'], $this->system->getUploadPath() . '/comprovante/' . $nomearquivo);
				$campos = array('comprovante' => $nomearquivo);
				$this->system->vendas->atualizar($id, $campos);				
			}	
			$this->system->view->assign('msg_alert', 'Ação realizada com sucesso!');			
			$this->doListar();
			die();
		}		
		$this->system->admin->topo('pedidos', 'pedidos-listar');
		$this->system->view->display($this->system->admin->getCategoria() . '/pedidos_listar.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function doListar() {						
		$total = $this->system->vendas->getVendas('','',true);		
		$vendasMes = $this->system->vendas->getVendasGerenciar($data,$this->inicial, $this->mostrar,$palavra, $this->system->session->getItem('session_cod_usuario'));
		
		$this->system->view->assign('vendas',$vendasMes);
		$this->system->view->assign('paginacao',$paginacao);
		$this->system->view->assign('categoria', $this->system->admin->categoria);
		$this->system->admin->topo('pedidos');
		$this->system->view->display("aluno/pedidos_listar.tpl");
		$this->system->admin->rodape();
	}		
	// ===============================================================
	protected function doRecuperarCursoByIdVenda($return = FALSE){
		$id = $this->system->input['id'];
		$nivel_usuario = $this->system->session->getItem('session_nivel');
		//recuperando os cursos da venda
		if($nivel_usuario == 8){
			$sql = "and c.professor_id = '".$this->system->session->getItem('session_cod_usuario')."'";
			$cursos = $this->system->vendas->getCursosByVendas($id, $sql);	
		} 
		else {
			$sql = "";
			$cursos = $this->system->vendas->getCursosByVendas($id,$sql);	
		}
		//recuperando o aluno da venda
		$aluno = $this->system->vendas->getAlunoByVendas($id);
		//recuperando o numero da venda
		$numero = $this->system->vendas->getNumeroVendaById($id);
		//inserindo o aluno no array
		$cursos[0]['aluno'] = $aluno;
		//inserindo o numero da venda no array
		$cursos[0]['numero_venda'] = $numero;		
		if ($return) {
			return $cursos;			
		} 
		else {
			echo json_encode($cursos);
		}
	}
	// ==================Metodo comentado por enquanto===================
	/*protected function doCancelaPedido() {
		$editar = $this->system->input['editar'];
		$vendaID = $this->system->input['venda_id'];

		if ($editar) {
			$venda = $this->system->vendas->getVenda($vendaID);

			if ($venda['id']) {
				$this->system->vendas->alterarPagamento($vendaID, $status);				
		}

		//Email
		$venda = $this->system->vendas->getVenda($vendaID);
		$this->system->email_model->alteradoStatusVendaAdministrativo($venda['numero']);		
		
	}	*/	
	
}

