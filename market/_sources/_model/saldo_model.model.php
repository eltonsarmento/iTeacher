<?php
// ===================================================================
class Saldo_modelMODEL {
	// ===============================================================
	protected $system = null;
	private $comissaoProfessor = 70;
	private $comissaoSistema = 30;

	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();		
	}
	// ===============================================================
	public function adicionarVenda($vendaID) { //Apenas adiciona venda aprovada (Afinal só vai pro saldo do professor o que foi aprovado)
		//Verifica se a venda pertence a um sistema do tipo Professor Autonomo e não excluida.
		$venda = end($this->system->sql->fetchrowset($this->system->sql->select('V.*', 'vendas as V, sistemas as S', 'V.sistema_id = S.id and S.tipo_sistema = 1 and S.excluido = 0 and V.excluido = 0 and V.status = 1 and V.id = ' . $vendaID)));
		
		if ($venda['sistema_id']) {

			//verificar se ela já existe na tabela de controle do saldo
			$controleSaldo = end($this->system->sql->fetchrowset($this->system->sql->select('venda_id', 'professor_controle_vendas', 'venda_id = ' . $venda['id'] . ' and sistema_id = ' . $venda['sistema_id'] . ' and excluido = 0')));

			if (empty($controleSaldo)) {

				$valorLiquido = $venda['valor_liquido'];

				//Não é uma venda de gratuita
				if ($valorLiquido > 0) {
					$porcentagemProfessor = $this->system->func->getValorByPorcentagem($valorLiquido, $this->comissaoProfessor);
					$porcentagemSistema = ($valorLiquido - $porcentagemProfessor);
					$ano = date('Y', strtotime($venda['data_venda']));
					$mes = date('m', strtotime($venda['data_venda']));
					$dia = date('d', strtotime($venda['data_venda']));

					//insere e venda
					$this->system->sql->insert('professor_controle_vendas', array(
						'venda_id'		=> $venda['id'],
						'sistema_id'	=> $venda['sistema_id'],
						'valor_repassar'=> $porcentagemSistema,
						'valor_receber'	=> $porcentagemProfessor,
						'data_venda'	=> $ano.'-'.$mes.'-'.$dia,
						'data_liberacao'=> date('Y-m-d', mktime(0, 0, 0, $mes, ($dia+15), $ano))
					));

					//Adiciona o saldo ao professor como a receber
					$saldoProfessor = end($this->system->sql->fetchrowset($this->system->sql->select('*', 'professor_saldo', 'sistema_id = ' . $venda['sistema_id'])));

					$this->system->sql->update('professor_saldo', array(
						'receber' => number_format(($saldoProfessor['receber'] + $porcentagemProfessor), 2, '.', '')
					), 'sistema_id = ' . $venda['sistema_id']);
				}
			}
		}
	}
	// ===============================================================
	public function removerVenda($vendaID) { //Verifica se o status da venda esta como cancelado
		$venda = end($this->system->sql->fetchrowset($this->system->sql->select('V.*', 'vendas as V, sistemas as S', 'V.sistema_id = S.id and S.tipo_sistema = 1 and S.excluido = 0 and V.excluido = 0 and V.status = 2 and V.id = ' . $vendaID)));

		if ($venda['sistema_id']) {

			//Verifica se tem algum saldo a receber desta venda
			$controleSaldo = end($this->system->sql->fetchrowset($this->system->sql->select('*', 'professor_controle_vendas', 'venda_id = ' . $venda['id'] . ' and sistema_id = ' . $venda['sistema_id'] . ' and excluido = 0 and status = 0')));

			if ($controleSaldo['venda_id']) {
					$this->system->sql->update('professor_controle_vendas', array(
						'status'		=> 2,
					), 'venda_id = ' . $venda['id'] . ' and sistema_id = ' . $venda['sistema_id']);

					//Remove o saldo ao professor como a receber
					$saldoProfessor = end($this->system->sql->fetchrowset($this->system->sql->select('*', 'professor_saldo', 'sistema_id = ' . $venda['sistema_id'])));

					$this->system->sql->update('professor_saldo', array(
						'receber' => number_format(($saldoProfessor['receber'] - $controleSaldo['valor_receber']), 2, '.', '')
					), 'sistema_id = ' . $venda['sistema_id']);
			}
		}
	}
	// ===================================================================
	public function liberarSaldoDisponivel() {
		$vendas = $this->system->sql->fetchrowset($this->system->sql->select('*', 'professor_controle_vendas', "excluido = 0 and status = 0 and data_liberacao = '" . date('Y-m-d') . "'"));
		
		foreach ($vendas as $venda) {
			try {
				$this->system->sql->update('professor_controle_vendas', array(
					'status'		=> 1,
				), 'venda_id = ' . $venda['venda_id'] . ' and sistema_id = ' . $venda['sistema_id']);

				//Adiciona o saldo a receber para disponivel
				$saldoProfessor = end($this->system->sql->fetchrowset($this->system->sql->select('*', 'professor_saldo', 'sistema_id = ' . $venda['sistema_id'])));
				$this->system->sql->update('professor_saldo', array(
					'receber' 		=> number_format(($saldoProfessor['receber'] - $venda['valor_receber']), 2, '.', ''),
					'disponivel' 	=> number_format(($saldoProfessor['disponivel'] + $venda['valor_receber']), 2, '.', '')
				), 'sistema_id = ' . $venda['sistema_id']);

				$vendas[$key]['concluido'] = true;
			} catch (Exception $e) {
				$vendas[$key]['erro'] = true;
				$vendas[$key]['erro_msg'] = $e->getMessage();
			}
		}
		return $vendas;
	}
	// ===================================================================
	public function solicitarSaque($saqueID) {
		//Verifica se existe o saque para um sistema de Professor Autonomo não excluido a receber
		$saque = end($this->system->sql->fetchrowset($this->system->sql->select('SA.*', 'saques as SA, sistemas as S', 'SA.sistema_id = S.id and S.tipo_sistema = 1 and S.excluido = 0 and SA.excluido = 0 and SA.status = 0 and SA.id = ' . $saqueID)));
		
		if ($saque['id']) { 

			$saldoProfessor = end($this->system->sql->fetchrowset($this->system->sql->select('*', 'professor_saldo', 'sistema_id = ' . $saque['sistema_id'])));
			if ($saldoProfessor['sistema_id']) {
				$this->system->sql->update('professor_saldo', array(
					'disponivel' 	=> number_format(($saldoProfessor['disponivel'] - $saque['valor']), 2, '.', ''),
					'bloqueado' 	=> number_format(($saldoProfessor['bloqueado'] + $saque['valor']), 2, '.', ''),
				), 'sistema_id = ' . $saque['sistema_id']);
			}	
		}
	}
	// ===================================================================
	public function verificaAlunoPorPlano($sistema_instituicao, $cursos) {		
		$this->system->load->dao('planos');
		$this->system->load->dao('cursos');		
		

		/* Busca o dados de plano_instituicao */
		$plano_instituicao 	= $this->system->planos->getPlanoInstituicao($sistema_instituicao);
		
		$plano_id 	= $plano_instituicao['plano_id'];		


		/* Busca o configuração do plano atual da instituição para saber qual o limite de alunos do plano*/
		$plano 		    = $this->system->planos->getPlano($plano_id);
		$qtd_max_plano  = $plano['qtd_alunos'];
		$sistema_admin  = $plano_instituicao['sistema_id'];

		/* Busca a quantidade de alunos cadastrados no curso escolhido*/
		foreach ($cursos as $key => $curso) {

			 $quantidade = $this->system->cursos->getQuantidadeAlunosByCurso($curso['id']);
			 echo "Curso ID :".$curso['id'] . "<br>";
			 echo "Quantidade de alunos matriculados = ".$quantidade . " no curso acima<br>";
			 echo "limite do seu plano = ".$qtd_max_plano . " alunos por curso<br> ";
			 if($quantidade == $qtd_max_plano){ // se a quantidade for igual a do limite do plano, buscar  proximo e atualizar na fatura da instituição			 	
			 	$proximo_plano = $this->system->planos->getProximoPlanoByQuantidade($sistema_admin,$qtd_max_plano);
			 	echo "sera automaticamente atualizado para o proximo plano. <br> Detalhes : <br> Nome: ".$proximo_plano['plano'] . " <br> Limite 	: ".$proximo_plano['qtd_alunos'] ." alunos por curso";
			 	
			 	/* cancela plano anterior da instituição*/
			 	$this->system->planos->trancaPlanoInstituicao($plano_instituicao['id']);
			 	/* cria um novo plano para a instituição com um plano maio de capacidade de aluno*/
			 	$this->system->planos->cadastrarNovoPlanoInstituicao($plano_instituicao['sistema_id'], $plano_instituicao['sistema_instituicao'], $proximo_plano['id']);			 
			 	break;
			 }elseif($quantidade > $qtd_max_plano){ // se a quantidade for maio a do limite do maior plano, entao acrescenta mais 1 no campo aluno_excente
			 	$qtd_alunos_exedentes = $plano_instituicao['alunos_excedentes'] + 1;
			 	$this->system->planos->adicionaAlunoExedente($qtd_alunos_exedentes,$plano_instituicao['id']);
			 	echo "Aluno Exede a quantidade de alunos por curso do plano! Incrementado mais 1.";
			 	break;
			 }
		}

	}
}
// ===================================================================