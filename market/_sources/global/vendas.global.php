<?php
// ===================================================================
class VendasGlobal extends AdminModules {
	protected $mostrar = 10;
	// ===============================================================
	public function __construct() {
		parent::__construct();
		$this->system->load->dao('cursos');
		$this->system->load->dao('alunos');
		$this->system->load->dao('vendas');
		$this->system->load->dao('areas');
		$this->system->load->dao('cupons');
		$this->system->load->model('email_model');
		$this->system->load->model('saldo_model');
	}
	// ===============================================================
	public function autoRun() {
		
		switch($this->system->input['do']) {
			case 'nova': 								$this->doEdicao(); break;
			case 'listar': 								$this->doListar(); break;
			case 'listarTodas': 						$this->doListar(); break;
			case 'detalhes': 							$this->doDetalhesVenda(); break;
			case 'cursosByVenda': 						$this->doRecuperarCursoByIdVenda(); break;
			case 'vendasByAluno':						$this->doRecuperarHistoricoDeVendasAlunos(); break;
			case 'status':								$this->doAlterarPagamento(); break;
			case 'observacao':							$this->doBuscarObs(); break;
			case 'alterarObservacao':					$this->doAlterarObservacoes(); break;
			// case 'pedidos': 							$this->doLista(); break; 
			// case 'buscar': 							$this->doLista(); break;
			// case 'buscar-vendas': 					$this->doTodasVendas(); break;
			case 'calcularPreco':						$this->doCalcularPreco(); break;
			// case 'todas': 							$this->doTodasVendas(); break;
			// case 'baixarComprovante':				$this->doBaixarComprovante(); break;
			// case 'buscarPorAluno':					$this->doBuscarPorAluno(); break;
			// case 'cancelar':							$this->doCancelar(); break;
			default: 									$this->pagina404(); break;
		}
		
	}
	// ===============================================================
	protected function doEdicao() {
		$editar = intval($this->system->input['editar']);
		if ($editar) {
			$erro_msg = $this->validarDados();
			if ($erro_msg) {
				$this->system->view->assign('msg_erro', $erro_msg['msg']);
				$this->system->view->assign('vendas', $this->system->input);
			} 
			else {
				//Salvar
				$this->system->input['status'] = 1;
				$this->system->input['data_expiracao'] = date('Y-m-d', mktime(0, 0, 0, date('m'), date('d'), (date('Y') + 2)));									
				if ($this->system->input['forma_desconto'] == 2) {
					//Porcentagem menor que 100
					if ($this->system->input['valor_porcentagem_desconto'] < 100) {
							$porcentagemPaga = 100 - $this->system->input['valor_porcentagem_desconto'];
							$valorTotal = ((100 * $this->system->input['valor_total'])/$porcentagemPaga);
							$this->system->input['valor_desconto'] = $valorTotal - $this->system->input['valor_total'];	
					} 
					else  //100 de porcentagem
						$this->system->input['valor_desconto'] = $this->system->input['valor_sem_desconto'];
				} 
				elseif ($this->system->input['forma_desconto'] == 1) {
					//Valor real
					$this->system->input['valor_desconto'] = $this->system->input['valor_real_desconto'];
				}
				//Valor liquido
				$this->system->input['valor_liquido'] = $this->system->input['valor_total'];
				$this->system->input['valor_total'] += $this->system->input['valor_desconto'];
				//Cursos Adicionar Suporte
				$cursos = array();
				foreach($this->system->input['cursos'] as $curso_id) {
					$curso = array();
					$curso['id'] = $curso_id;
					$dadosCurso = $this->system->cursos->getCurso($curso_id);
					$curso['preco_total'] = 0;
					//Preco do curso puro
					if (!$dadosCurso['gratuito'] && $dadosCurso['valor'] != '0.00') 
						$curso['preco_total'] += $dadosCurso['valor'];
					if ($dadosCurso['suporte']) 
						$curso['suporte'] = 1;
					else 
						$curso['suporte'] = 0;
					$curso['professor_id'] = $dadosCurso['professor_id'];
					$curso['certificado'] = 0;
					$curso['preco_total'] = $curso['preco_total'];
					//Desconto do curso
					$curso['preco_desconto'] = number_format($this->system->func->divisaoCusto($this->system->input['valor_total'], $curso['preco_total'], $this->system->input['valor_desconto']), 2, '.', '');

					$cursos[] = $curso;
				}
				$this->system->input['cursos'] = $cursos;
				$vendaID = $this->system->vendas->cadastrar($this->system->input);
				$this->system->cursos->cadastrarCursosAluno($cursos, $this->system->admin->getSistemaID(), $this->system->input['aluno_id'], $this->system->input['data_expiracao'] . ' 23:59:59');
				$this->system->view->assign('msg_suc', 'Ação realizada com sucesso!');
				//Adicionar saldo ao Professor Autonomo
				$this->system->saldo_model->adicionarVenda($vendaID);
				//Email Venda 
				$venda = $this->system->vendas->getVenda($vendaID);
				$numero = $venda['numero'];
				// foreach ($this->system->input['cursos'] as $curso)
				// 	$this->system->email_model->vendaCursoProfessor($curso['id'], $numero);
				// //
				// $this->system->email_model->vendaRealizadaAdministrativo($numero);
				// //
				// $this->system->email_model->vendaAprovadaAluno($this->system->input['aluno_id'], $numero, date('d/m/Y', strtotime($this->system->input['data_expiracao'] . ' 23:59:59')));
				if ($this->system->input['nova'])
					$this->system->func->redirecionar('/vendas/nova');
				else
					$this->system->func->redirecionar('/vendas/listarTodas');
			}
		} 
		$this->system->admin->topo('vendas','vendas-editar');
		$cursos = $this->system->cursos->getCursos();
		foreach ($cursos as $key => $curso) {
			if($curso['exibir_site']) $cursosListar[$key] = $curso;
		}
		$this->system->view->assign(array(
			'alunos' 		 => $this->system->alunos->getAlunos(),
			'cursos' 		 => $cursosListar,
			'data_venda'	 => date('d/m/Y'),
			'periodoLiberado'=> ($this->system->session->getItem('session_nivel') == 1 ? true : false)
		));
		$this->system->view->display('global/vendas_edicao.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function doListar() {		
		$acao = $this->system->input['do'];
		if ($acao == "listarTodas") {
			$data   = FALSE;
			$pagina = "global/vendas_listar.tpl";
		}
		elseif ($acao == "listar") {		
			$data   = TRUE;
			$pagina = "global/vendas_gerenciar.tpl";
		}
		$palavra = $this->system->input['palavra_busca'];
		$base_url = ($palavra ? $this->system->func->baseurl('/vendas/'. $acao . '&palavra_busca=' . $palavra) : $this->system->func->baseurl('/vendas/'. $acao ));
		$total = $this->system->vendas->getVendas('','',true);
		$paginacao = $this->system->func->paginacao($this->pagina, $this->mostrar, $total, $base_url);
		if ($acao == "listarTodas") {
			$vendasMes = $this->system->vendas->getVendasGerenciar($data,$this->inicial, $this->mostrar,$palavra);
		}else {
			$vendasMes = $this->system->vendas->getVendasGerenciar($data,"","",$palavra);	
		}		
		$this->system->view->assign('vendas',$vendasMes);
		$this->system->view->assign('paginacao',$paginacao);
		$this->system->view->assign('categoria', $this->system->admin->categoria);
		$this->system->admin->topo('vendas', 'vendas-listar');
		$this->system->view->display($pagina);
		$this->system->admin->rodape();
	}	
	// ===============================================================
	protected function doRecuperarCursoByIdVenda($return = FALSE) {
		$id = $this->system->input['id'];
		$nivel_usuario = $this->system->session->getItem('session_nivel');
		//recuperando os cursos da venda
		if ($nivel_usuario == 8) {
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
		if($return) {
			return $cursos;			
		}
		else {
			echo json_encode($cursos);
		}
	}
	//================================================================
	protected function doRecuperarHistoricoDeVendasAlunos() {
		//id do aluno
		$id = $this->system->input['id'];
		//recuperando vendas por aluno
		$vendasByAluno = $this->system->vendas->getVendasAlunoById($id);
		//recuperando nome e email do aluno
		$aluno = $this->system->alunos->getAluno($id);
		//recuperando o curso
		foreach ($vendasByAluno as $key => $vendas) {
			$curso = $this->system->vendas->getCursosByVendas($vendas['id']);
			$vendasByAluno[$key]['cursos'] = $curso;
		}
		//inserindo o aluno no array
		$vendasByAluno[0]['aluno'] = $aluno;
		echo json_encode($vendasByAluno);
	}
	// ===============================================================
	protected function listagem() {
		$palavra = $this->system->session->getItem('palavra_busca');
		$palavra = ($palavra ? $this->system->session->deleteItem('palavra_busca') : $this->system->input['palavra_busca']);
		$base_url = ($palavra ? $this->system->func->baseurl('/vendas/buscar&palavra_busca=' . $palavra) : $this->system->func->baseurl('/vendas/listar'));
		$this->system->view->assign('vendas', $alunos);
		$this->system->view->assign('url_site', $this->system->getUrlSite());
	}
	// ===============================================================
	protected function validarDados() {
		$retorno = array();
        if (!$this->system->input['aluno_id'])
            $retorno['msg'][] = "O campo aluno está vazio.";
        if (!count($this->system->input['cursos']))
            $retorno['msg'][] = "Selecione ao menos um curso.";
        elseif ($this->system->input['aluno_id']) {
        	foreach ($this->system->input['cursos'] as $curso) {
		    	if ($this->system->cursos->verificaCursoAtivo($this->system->input['aluno_id'], $curso)) {
		    		$dadosCurso = $this->system->cursos->getCurso($curso);
					$retorno['msg'][] = 'O aluno já possui o curso ' . $dadosCurso['curso'] . '. Apenas poderá vende esse mesmo curso para este aluno quando seu acesso ao curso expirar.';		
					break;
				}
				if ($this->system->vendas->verificaCompraCursoAberta($this->system->input['aluno_id'], $curso)) {
					$dadosCurso = $this->system->cursos->getCurso($curso);
					$retorno['msg'][] = 'O aluno já possui uma compra aberta com ' . $dadosCurso['curso'] . '. . Apenas poderá vende esse mesmo curso para este aluno, se ele cancelar a compra.';	
					break;
				}
			}
        }
		if (!$this->system->input['forma_pagamento'])
            $retorno['msg'][] = "Selecione a Forma de Pagamento.";
        if (count($retorno) > 0)
		   $retorno['msg'] = implode('<br/>', $retorno['msg']);
        return $retorno;
	}
	// ===============================================================
	protected function doDetalhesVenda() {
		$id = (int)$this->system->input['id'];
		$venda = $this->system->vendas->getVenda($id);

		$data = strtotime(substr($venda['data_venda'], 2,8));
		$venda['data_venda'] = date('d/m/Y',$data);		

		$data = strtotime(substr($venda['data_expiracao'], 2,8));
		$venda['data_expiracao'] = date('d/m/Y',$data);

		$cursos = $this->doRecuperarCursoByIdVenda(TRUE);
		$aluno = $cursos[0]['aluno'];		

		if ($this->system->session->getItem('session_nivel') == 7 && ($venda['parceiro_id'] != $this->system->session->getItem('session_cod_usuario')))
			$this->system->func->redirecionar('/vendas/listar');

		$this->system->view->assign(array(			
			'venda'					=> $venda,
			'cursos'				=> $cursos,
			'aluno'	      			=> $aluno				
		));			
		$this->system->admin->topo('vendas', 'vendas_listar');
		$this->system->view->display("global/vendas_detalhes.tpl");
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function doBuscarObs() {
		$id_venda = $this->system->input['id_venda'];
		if ($id_venda) {
			$venda = $this->system->vendas->getVenda($id_venda);
			echo json_encode($venda);	
		}
		else {
			echo json_encode("não contém obs");
		}
	}
	// ===============================================================
	protected function doCalcularPreco() {
		$cursos 				= $this->system->input['cursos'];
		$forma_desconto 		= $this->system->input['forma_desconto'];
		$descontoReal 			= $this->system->input['valor_real_desconto'];
		$descontoPorcentagem 	= $this->system->input['valor_porcentagem_desconto'];
		$preco 					= 0.00;
		if (count($cursos)) {
			foreach ($cursos as $curso) {
				$curso = $this->system->cursos->getCurso($curso);
				if (!$curso['gratuito'] && $curso['valor'] != '0.00') {
					$preco += $curso['valor'];
				}
				//suporte
				if ($curso['suporte']) {
					$this->system->load->dao('configuracoesgerais');
					$suporteConfig = $this->system->configuracoesgerais->getProdutosSuporte();				
					//Valor fixo
					if ($suporteConfig['produtos_suporte_tipo'] == 2) 
						$preco += $suporteConfig['produtos_suporte_valor'];
					//Porcentagem
					if ($suporteConfig['produtos_suporte_tipo'] == 3) {
						$valor = (($curso['valor'] * $suporteConfig['produtos_suporte_valor'])/100);
						$preco += $valor;
					}
				}
			}
		}

		$precoSemDesconto = $preco;
		switch ($forma_desconto) {
			case 1:
				$desconto = str_replace(',', '.', $descontoReal);
				$preco -= $desconto;
				break;
			case 2:
				$desconto = str_replace(',', '.', $descontoPorcentagem);
				$preco -= ($preco * $desconto) / 100;
				break;
		}		
		$preco = number_format(round(max(0, $preco), 2), 2, '.', ',');
		echo json_encode(array('preco' => $preco, 'preco_sem_desconto' => $precoSemDesconto));
	}
	// ===============================================================
	protected function doLista() {
		//modos de busca
		$palavra = $this->system->session->getItem('palavra_busca');
		$metodo_busca = 'padrao';
		if ($palavra) $this->system->session->deleteItem('palavra_busca');
		else {
			$palavra = $this->system->input['palavra_busca'];
		//	$metodo_busca = $this->system->input['metodo_busca'];
		}
		//Paginação
		$pagina = ($this->system->input['pag'] ? $this->system->input['pag'] : 1);
		if ($palavra)
			$paginacao['base_url'] = $this->system->func->baseurl('/vendas/buscar&palavra_busca=' . $palavra);
		else
			$paginacao['base_url'] = $this->system->func->baseurl('/vendas/pedidos');
		$paginacao['per_page'] = $this->exibirPorPagina;
		$paginacao['total_rows'] = $this->system->vendas->getTotal($palavra, $metodo_busca);
		$paginacao['cur_page'] = $pagina;
		$this->system->pagination->initialize($paginacao);
		$this->system->view->assign('paginacao', $this->system->pagination->create_links());
		//Resultado
		$inicial = ($this->exibirPorPagina * ($pagina - 1));
		$final = $this->exibirPorPagina;
		$limit = $inicial . ',' . $final;
		$this->system->view->assign('vendas', $this->system->vendas->getPedidosBuscaVendas($palavra, $metodo_busca, $limit));			
		$this->system->admin->topo($this->system->func->posicoesMenusGlobais('vendas'));
		$this->system->view->display('global/vendas_pedidos_gerenciar.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function doTodasVendas() {
		//modos de busca
		$palavra = trim($this->system->session->getItem('palavra_busca'));
		$metodo_busca = 'padrao';
		if ($palavra) $this->system->session->deleteItem('palavra_busca');
		else {
			$palavra = $this->system->input['palavra_busca'];
		}
		//Paginação
		$pagina = ($this->system->input['pag'] ? $this->system->input['pag'] : 1);
		if ($palavra)
			$paginacao['base_url'] = $this->system->func->baseurl('/vendas/buscar-vendas&palavra_busca=' . $palavra);
		else
			$paginacao['base_url'] = $this->system->func->baseurl('/vendas/todas');
		$paginacao['per_page'] = $this->exibirPorPagina;
		$paginacao['total_rows'] = $this->system->vendas->getTotal($palavra, $metodo_busca);
		$paginacao['cur_page'] = $pagina;
		$this->system->pagination->initialize($paginacao);
		$this->system->view->assign('paginacao', $this->system->pagination->create_links());
		//Resultado
		$inicial = ($this->exibirPorPagina * ($pagina - 1));
		$final = $this->exibirPorPagina;
		$limit = $inicial . ',' . $final;		
		$todas_vendas = $this->system->vendas->getVendasBusca($palavra, $metodo_busca, $limit);
		foreach($todas_vendas as $key => $vendas) {
			$todas_vendas[$key]['cliente'] = $this->system->alunos->getAluno($vendas['aluno_id']);
			//cursos
			$cursos = array();
			foreach($this->system->vendas->getCursosByVenda($vendas['id']) as $curso) {
				$cursos[] = end($this->system->cursos->getCurso($curso['curso_id'], false));
			}
			$plano = $this->system->vendas->getPlanoVenda($vendas['id']);
			$todas_vendas[$key]['cursos'] 		= $cursos;
			$todas_vendas[$key]['plano'] 		= $plano;
		}
		$this->system->view->assign('pedidos', $todas_vendas);			
		$this->system->admin->topo($this->system->func->posicoesMenusGlobais('vendas'));
		$this->system->view->display('global/vendas_todas_listagem.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function doAlterarPagamento() {
		$editar = $this->system->input['editar'];
		$vendaID = $this->system->input['venda_id'];
		$status = $this->system->input['status'];
		if ($editar) {
			$venda = $this->system->vendas->getVenda($vendaID);
			if ($venda['id']) {
				$this->system->vendas->alterarPagamento($vendaID, $status);
				echo "Pagamento atualizado ";
				echo "<script type='text/javascript'>jQuery('.status_" . $vendaID . "').val('" . $status . "')</script>";
				if ($status == 0)
					$htmlTd = '<span class="label label-info"><i class="fa fa-check-circle"></i> Aguardando Pagamento</span>';
				if ($status == 1) {
					$htmlTd = '<span class="label label-success"><i class="fa fa-check-circle"></i> Aprovado</span>';
					echo "<script type='text/javascript'>jQuery('.bota_venda_" . $vendaID . "').hide()</script>";

				} if ($status == 2) 
					$htmlTd = '<span class="label label-danger"><i class="fa fa-check-circle"></i>Cancelado</span>';
				echo "<script type='text/javascript'>jQuery('.td_status_" . $vendaID . "').html('" . $htmlTd . "')</script>";
			} 
			else {
				echo "Status da venda não pode ser alterado! ";
			}
		}

		//Email
		$venda = $this->system->vendas->getVenda($vendaID);
		$this->system->email_model->alteradoStatusVendaAdministrativo($venda['numero']);
		if ($status == 1) {
			//Email
			$this->system->email_model->vendaAprovadaAluno($venda['aluno_id'], $venda['numero'], date('d/m/Y'));
			//Adicionar Curso
			$dataExpiracao = date('Y-m-d H:i:s', mktime(23, 59, 59, date('m'), date('d'), (date('Y') + 2)));
			$cursos = $this->system->vendas->getCursosVenda($vendaID);
			if (!empty($cursos)) {
				$this->system->cursos->cadastrarCursosAluno($cursos, $this->system->getSistemaID() , $venda['aluno_id'], $dataExpiracao);
				//Email Professor
				foreach ($cursos as $curso)
					$this->system->email_model->vendaCursoProfessor($curso['id'], $venda['numero']);	
			}
			//Adicionar plano
			$plano = $this->system->vendas->getPlanoVenda($venda['id']);
			if ($plano['id']) {
				$dataExpiracao = date('Y-m-d', mktime(0, 0, 0, (date('m') + $plano['meses']), date('d'), date('Y')));
				$this->system->planos->cadastrarPlanoAluno($plano['id'], $venda['aluno_id'], $venda['id'], $dataExpiracao);
			}
			$this->system->vendas->atualizar($venda['id'], array('data_expiracao' => $dataExpiracao));
			echo "<script type='text/javascript'>jQuery('.td_data_" . $vendaID . "').html('" . date('d/m/Y') . "')</script>";	
		}
	}
	// ===============================================================
	protected function doAlterarRastreamento() {
		$editar = $this->system->input['editar'];
		$vendaID = $this->system->input['venda_id'];
		$codigo_rastreamento = $this->system->input['codigo_rastreamento'];
		if ($editar) {
			$this->system->vendas->alterarRastreamento($vendaID, $codigo_rastreamento);
			echo "Rastreamento atualizado";
			echo "<script type='text/javascript'>jQuery('.codigo_rastreamento_" . $vendaID . "').val('" . $codigo_rastreamento . "')</script>";
			echo "<script type='text/javascript'>jQuery('.td_rastreamento_" . $vendaID . "').html('" . $codigo_rastreamento . "')</script>";
		}
	}
	// ===============================================================
	protected function doAlterarObservacoes() {
		$editar = $this->system->input['editar'];
		$vendaID = $this->system->input['venda_id'];
		$observacoes = $this->system->input['observacoes'];
		if ($editar) {
			$this->system->vendas->alterarObservacoes($vendaID, $observacoes);
			echo "Observações atualizadas";
		}
	}
	// ===============================================================
	protected function doBaixarComprovante() {
		$vendaID = $this->system->input['id'];
		if ($vendaID) {
			$venda = $this->system->vendas->getVenda($vendaID);	
			if ($venda['comprovante']) {
				$file = $this->system->getUploadPath() . '/comprovantes_alunos/' . $venda['comprovante'];
				header("Content-Disposition: attachment; filename=" . $venda['comprovante']);    
				header("Content-Type: application/force-download");
				header("Content-Type: application/octet-stream");
				header("Content-Type: application/download");
				header("Content-Description: File Transfer");             
				header("Content-Length: " . filesize($file));
				flush(); 
				$fp = fopen($file, "r"); 
				while (!feof($fp))	{
	    			echo fread($fp, 65536); 
	    			flush(); // this is essential for large downloads
				}  
				fclose($fp); 	
			}
		}
	}
	// ===============================================================
	protected function doBuscarPorAluno() {
		$alunoID = $this->system->input['aluno_id'];
		$todas_vendas = $this->system->vendas->getVendas(' and aluno_id = ' . $alunoID);
		$cliente = $this->system->alunos->getAluno($vendas['aluno_id']);
		foreach($todas_vendas as $key => $vendas) {
			//cursos
			$cursos = array();
			foreach($this->system->vendas->getCursosByVenda($vendas['id']) as $curso) {
				$cursos[] = end($this->system->cursos->getCurso($curso['curso_id'], false));
			}
			$plano = $this->system->vendas->getPlanoVenda($vendas['id']);
			$todas_vendas[$key]['cursos'] 		= $cursos;
			$todas_vendas[$key]['plano'] 		= $plano;
		}
		echo '<table class="table table-bordered" >';
		echo '<thead>';
		echo '<th>#</th>';
        echo '<th>Cursos</th>';
       	echo '<th class="center">Status</th>';
        echo '<th class="center">Data</th>';
        echo '<th class="center">Valor Total</th>';
        echo '</thead>';
        echo '<tbody>';
        foreach ($todas_vendas as $pedido) {
        	echo '<tr>';
        	//Numero
        	echo '<td><a href="' . $this->system->getUrlSite() . 'lms/' . $this->system->admin->getCategoria() .  '/vendas/detalhes/' . $pedido['id'] . '">' . $pedido['numero'] . '</a></td>';
        	//Cursos
        	echo '<td>';
        		foreach ($pedido['cursos'] as $curso)
        			echo $curso['curso'] . '<br/>';
        		if ($pedido['plano']['id'])
        			echo $pedido['plano']['plano'];
        	echo '</td>';
        	//Status
        	echo '<td>';
        	if ($pedido['status'] == 0)
            	echo '<span class="label label-info"><i class="iconfa-calendar"></i> Aguardando Pagamento</span>';
            elseif ($pedido['status'] == 1)
                echo '<span class="label label-success"><i class="iconfa-ok"></i> Pago</span>';
            else
                echo '<span class="label label-important"><i class="iconfa-remove"></i>Cancelado</span>';
        	echo '</td>';
        	//Data
        	echo '<td class="center">' . date('d/m/Y', strtotime($pedido['data_cadastro'])) . '</td>';
        	//Preço
        	echo '<td class="center">' . number_format($pedido['valor_total'], 2, ',', '.') . '</td>';
        	echo '</tr>';
        }
        echo '</tbody>';
        echo '</table>';
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
		$this->system->func->redirecionar('/vendas/detalhes/' . $id);
	}
	// ===============================================================
	protected function pagina404() {
		$this->system->admin->topo(0);
		$this->system->view->display('global/pagina404.tpl');
		$this->system->admin->rodape();
	}
	// EXCLUSIVO DE CANCELAR COMPRA 
	// =========================================================================================================
	private function regerarComissaoProfessor($professores = array(), $mes = 0, $ano = 0) {
		$this->system->load->dao('pagamentos');
		$this->system->load->dao('parceiros');
		foreach ($professores as $professor_id) {
			$totalReceber = 0;
			$percentualComissao = 0;
			$where = " and t2.status = 1 and t1.professor_id = '" . $professor_id . "' and t2.data_venda >= '" . $ano ."-". $mes . "-1' and t2.data_venda < '" . date('Y') . "-" . date('m') . "-1'";
			$vendas = $this->system->vendas->getVendasPorCursos($where);
			$percentualComissao = $this->system->professores->getValorExtra($professor_id, 'comissao');
			foreach($vendas as $key => $venda) {
				$venda = $this->system->vendas->getVenda($venda['venda_id']);
			 	//CURSOS
			 	$this->totalPreco = 0;
			 	$this->totalPrecoProfessor = 0;
			 	$cursos = array();
				foreach($this->system->vendas->getCursosByVenda($venda['id']) as $curso) {
			 		$curso_dados = end($this->system->cursos->getCurso($curso['curso_id'], false));
			 		$this->totalPreco += $curso['preco_total'];
			 		if ($curso_dados['professor_id'] == $professor_id) 
			 			$this->totalPrecoProfessor += $curso['preco_comissao'];
			 	}
			 	////// TAXA //////
			 	//PagSeguro e MoIP
			 	$valorTaxas = $this->divisaoCustos($venda['valor_taxas']);
			 	////// CUPOM (SITE) ou DESCONTO (LMS) ////// 
			 	$valorCupom = 0;
			 	$valorDesconto = 0;
			 	if ($venda['cupom_id']) {
			 		$cupom = $this->system->cupons->getCupom($venda['cupom_id']);
			 		if ($cupom['tipo_desconto'] == 1) //Valor inteiro
			 			 $valorCupom = $this->divisaoCustos($cupom['valor']);
			 		else { //Porcentagem
			 			$porcentagemPaga = (100 - $cupom['valor']);
			 			$valorSemCupom = ((100 * $venda['valor_total'])/$porcentagemPaga);
			 			$valorCupom = $this->divisaoCustos($valorSemCupom - $venda['valor_total']);
			 		}
			 	} else 
	 				$valorDesconto = $this->divisaoCustos($venda['valor_desconto']);
			 	////// COMISSÃO PARCEIRO (DESCONTO) /////
			 	$valorComissaoParceiro = 0;
			 	if ($venda['parceiro_id']) {
			 		$comissaoParceiro = $this->system->parceiros->getValorExtra($venda['parceiro_id'], 'comissao');
			 		$valorComissaoParceiro = $this->divisaoCustos(($comissaoParceiro * $venda['valor_total'])/100);		 		
			 	}
			 	////// BRUTO //////
		 		$valorBruto = ($this->totalPrecoProfessor - $valorComissaoParceiro - $valorTaxas - $valorCupom - $valorDesconto);	 		
			 	////// LÍQUIDO //////
			 	$valorLiquido = (($percentualComissao * $valorBruto)/100);
			 	$totalReceber += $valorLiquido;
			}

			$pagamento = $this->system->pagamentos->getPagamento(" and t1.usuario_id = '" . $professor_id . "' and t1.mes_faturado = '" . $ano ."-". $mes . "-1'");
			if ($pagamento['id']) {
				$this->system->pagamentos->atualizar(array(
					'valor'				=> number_format($totalReceber, 2),
					'data_cadastro'		=> date('Y-m-d H:i:s'),
					),
					"id = '" . $pagamento['id'] . "'"
				);
			}
		}
	}
	// =======================================================================================================================================
	private function divisaoCustos($custo) {
		$porcentagem = ((100 * $totalPrecoProfessor) / $totalPreco);
		return (($custo * $porcentagem) / 100);
	}
}
// ===================================================================
