<?php
// ===================================================================
require(dirname(__FILE__).'/../global.php');
$system = new System(false);

$system->load->dao('pagseguro');
$system->load->dao('vendas');
$system->load->dao('cursos');
$system->load->dao('configuracoesgerais');
$system->load->model('email_model');
$system->load->model('pagamento_model');
$system->load->model('pagseguro_model');

// teste local
//$_POST['notificationCode'] = '1990FDDCCE0ACE0AD7D004271FB97A095806';
//$_POST['notificationType'] = 'transaction';
// teste local

$sistema_id = (int)$_GET['cod_empresa'];
if (!$sistema_id) die;

$fp = fopen($system->getRootPath() . '/logs/pagseguro-assinaturas.txt', 'a');
$escreve = fwrite($fp, json_encode($_POST)."\n");
fclose($fp);

if ($_POST['notificationCode'] && $_POST['notificationType'] == 'transaction' && $sistema_id) {
	$system->setSistemaID($sistema_id);
	$transaction = $system->pagamento_model->obterTransacao($sistema_id, $_POST);
	
	if ($transaction->getCode()) {
		$fields['code'] = $transaction->getCode();
		$fields['venda_id'] = $transaction->getReference();
		$fields['status'] = $transaction->getStatus()->getValue();
		$fields['data']	= $transaction->getDate();
		$fields['ultima_atualizacao'] = $transaction->getLastEventDate();
		$fields['total'] = $transaction->getGrossAmount();
		$fields['total_liquido'] = $transaction->getNetAmount();
		$fields['taxas'] = (int)$transaction->getFeeAmount();
		$transacao = $system->pagseguro->getTransacao($transaction->getReference());
		
		// Cadastra no banco
		if ($transacao['venda_id'])
		 	$system->pagseguro->atualizar($fields);
		else {
		 	$system->pagseguro->cadastrar($fields);
		 	$campos = array(
				'valor_taxas' => $fields['taxas'],
				'valor_total' => $fields['total_liquido'],
			);
			$system->vendas->atualizar(intval($fields['venda_id']), $campos);
		}
	}

	///////   Aprovado ///////
	// Assinaturas //
	if ($system->vendas->tipoVenda(intval($fields['venda_id'])) == 2) { //Planos
		$dataInicial = substr($fields['data'], 0, 10) . ' 00:00';
		$dataFinal = substr($fields['data'], 0, 10) . ' 23:59';

		$achouTipo = 0;
		if ($preApprovalCode = $system->pagseguro_model->getPreApprovalCodeByVenda(intval($fields['venda_id']), $dataInicial, $dataFinal)) {
			$achouTipo = 1;
		} elseif ($preApprovalCode = $system->pagseguro_model->getPreApprovalCodeByVenda(intval($fields['venda_id']))) {
			$achouTipo = 2;
		}
		if ($preApprovalCode) {
			$system->vendas->atualizar(intval($fields['venda_id']), array('codePagSeguro' => $preApprovalCode));
		}

		//Aprovado
		if ($transaction->getStatus()->getValue() == 3) {
			$venda = $system->vendas->getVenda(intval($fields['venda_id']));
			$plano = $system->vendas->getPlanoVenda($venda['id']);
			
			//Nova Assinatura
			if ($venda['status'] == 0) { 
			 	$system->vendas->alterarPagamento($venda['id'], 1);
			
				//Adicionar Plano
				$dataExpiracao = date('Y-m-d', mktime(0, 0, 0, (date('m') + $plano['meses']), date('d'), date('Y')));
				$system->planos->cadastrarPlanoAluno($plano['id'], $venda['aluno_id'], $venda['id'], $dataExpiracao);
				$system->vendas->atualizar($venda['id'], array('data_expiracao' => $dataExpiracao));

				//Emails
				//Administrativo
				$system->email_model->alteradoStatusVendaAdministrativo($venda['numero']);
				
				//Aluno
				$system->email_model->vendaAprovadaAluno($venda['aluno_id'], $venda['numero'], date('d/m/Y', strtotime($dataExpiracao)));
				$system->email_model->assinaturaContratadaAluno($venda['aluno_id'], $plano['plano']);

				
				/*===========================================================================================*/
				/* avaliar em cada curso se o limite de alunos por curso altrapassará do plano da instituição*/
				/*===========================================================================================*/
				$cursos = $system->vendas->getCursosVenda($venda['id']);
				$this->system->load->model("saldo_model");				
				$this->system->saldo_model->verificaAlunoPorPlano($this->system->getSistemaID(),$cursos);
				/*===========================================================================================*/
				/* FIM */
				/*===========================================================================================*/

			}
			//Renova
			elseif ($transacao['ultima_atualizacao'] != $fields['ultima_atualizacao']) {
			 	$assinatura = end($system->planos->getPlanosAluno("assinatura_id = '" . $venda['id'] . "'"));
				$dataExpiracao = date('Y-m-d', mktime(0, 0, 0, (date('m') + $plano['meses']), date('d'), date('Y')));

				$campos = array(
					'usuario_id'		=> 0,
					'aluno_id'			=> $assinatura['usuario_id'],
					'cupom_id'			=> 0,
					'parceiro_id'		=> 0,
					'forma_desconto'	=> 0,
					'forma_pagamento'	=> 0,
					'status'			=> 1,
					'valor_desconto'	=> 0,
					'codePagSeguro'		=> $venda['codePagSeguro'],
					'valor_taxas'		=> $fields['taxas'],
					'valor_total'		=> $fields['total_liquido'],
					'data_venda'		=> date('d/m/Y'),
					'data_expiracao'	=> $dataExpiracao,
					'cursos'			=> array(),
					'planos'			=> array($plano['id']),
				);
				$id = $system->vendas->cadastrar($campos);
				$system->planos->renovarAssinatura($assinatura['id'], $dataExpiracao);
				$system->planos->renovarCursoPlano(intval($assinatura['curso_id']), $dataExpiracao);

				//Aluno
				$system->email_model->assinaturaRenovadaAluno($assinatura['usuario_id'], $plano['nome']);
			}
		}
	}
	// Cursos //
	elseif($system->vendas->tipoVenda(intval($fields['venda_id'])) == 1) { //Cursos
		if ($transaction->getStatus()->getValue() == 3 && $transacao['status'] != 3) {

			$venda = $system->vendas->getVenda(intval($fields['venda_id']));
			$system->vendas->alterarPagamento($venda['id'], 1);
			
			//Adicionar curso
			$cursos = $system->vendas->getCursosVenda($venda['id']);
			$dataExpiracao = date('Y-m-d H:i:s', mktime(23, 59, 59, (date('m') + $system->configuracoesgerais->getPeriodoAcesso()), date('d'), (date('Y'))));


			/*===========================================================================================*/
			/* avaliar em cada curso se o limite de alunos por curso altrapassará do plano da instituição*/
			/*===========================================================================================*/
			$this->system->load->model("saldo_model");				
			$this->system->saldo_model->verificaAlunoPorPlano($this->system->getSistemaID(),$cursos);
			/*===========================================================================================*/
			/* FIM */
			/*===========================================================================================*/

			$system->cursos->cadastrarCursosAluno($cursos, $sistema_id, $venda['aluno_id'], $dataExpiracao);
			$system->vendas->atualizar($venda['id'], array('data_expiracao' => $dataExpiracao));
			
			//Emails
			//Administrativo
			$system->email_model->alteradoStatusVendaAdministrativo($venda['numero']);
			
			//Aluno
			$system->email_model->vendaAprovadaAluno($venda['aluno_id'], $venda['numero'], date('d/m/Y', strtotime($dataExpiracao)));

			//Professor
			foreach ($cursos as $curso)
				$system->email_model->vendaCursoProfessor($curso['id'], $venda['numero']);
		}
	}	
}
/*
Status 
1	Aguardando pagamento: o comprador iniciou a transação, mas até o momento o PagSeguro não recebeu nenhuma informação sobre o pagamento.
2	Em análise: o comprador optou por pagar com um cartão de crédito e o PagSeguro está analisando o risco da transação.
3	Paga: a transação foi paga pelo comprador e o PagSeguro já recebeu uma confirmação da instituição financeira responsável pelo processamento.
4	Disponível: a transação foi paga e chegou ao final de seu prazo de liberação sem ter sido retornada e sem que haja nenhuma disputa aberta.
5	Em disputa: o comprador, dentro do prazo de liberação da transação, abriu uma disputa.
6	Devolvida: o valor da transação foi devolvido para o comprador.
7	Cancelada: a transação foi cancelada sem ter sido finalizada.
*/