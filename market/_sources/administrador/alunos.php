<?php
require_once(dirname(__FILE__).'/../global/alunos.global.php');
// ===================================================================
class Alunos extends AlunosGlobal {
	public function __construct() {
		parent::__construct();
		$this->system->load->dao('alunos');
		$this->system->load->dao('instituicoes');
		$this->system->load->dao('depoimentos');
	}
	// ===============================================================
	public function autoRun() {
		$this->system->view->assign('categoria', $this->system->admin->getCategoria());
		switch($this->system->input['do']) {
			case 'home':
			case 'listar':
			case 'buscar': 				$this->doListar(); break;
			case 'novo':
			case 'editar': 				$this->doEdicao(); 	break;
			case 'depoimentos': 		$this->doDepoimentos(); break;
			default:					$this->pagina404(); break;
		}	
   	}
   	
	// ===============================================================
   	
	protected function doListar() {
		// Visualização da instituição pelo administrador
		if ($this->system->session->getItem('estrutura') == 'acesso_instituicao') {
			$this->listagem();
			$this->system->admin->topo('alunos');
			$this->system->view->display('administrador/acesso_instituicao/todos_alunos.tpl');
			$this->system->admin->rodape();
		}
	}

	// ===============================================================
	protected function listagem() {
		$sistema_id = $this->system->input['id'];
		$palavra = $this->system->input['palavra_busca'];
		$base_url = ($palavra ? $this->system->func->baseurl('/alunos/buscar&palavra_busca=' . $palavra) : $this->system->func->baseurl('/alunos/listar&id=' . $sistema_id));
		$total = $this->system->alunos->getAlunos($palavra, 'padrao', 0, '', true, $sistema_id);
		$paginacao = $this->system->func->paginacao($this->pagina, $this->mostrar, $total, $base_url);
		$alunos = $this->system->alunos->getAlunos($palavra, 'padrao', $this->inicial . ',' . $this->mostrar, 'nome', false, $sistema_id);
		foreach ($alunos as $key => $aluno) {
			$alunos[$key]['cep'] = $this->system->alunos->getValorExtra($aluno['id'], 'cep');
			$alunos[$key]['endereco'] = $this->system->alunos->getValorExtra($aluno['id'], 'endereco');
			$alunos[$key]['bairro'] = $this->system->alunos->getValorExtra($aluno['id'], 'bairro');
			$alunos[$key]['cidade'] = $this->system->alunos->getValorExtra($aluno['id'], 'cidade');
			$alunos[$key]['estado'] = $this->system->alunos->getValorExtra($aluno['id'], 'estado');
			$alunos[$key]['cpf'] = $this->system->alunos->getValorExtra($aluno['id'], 'cpf');
			$alunos[$key]['telefone'] = $this->system->alunos->getValorExtra($aluno['id'], 'telefone');
		}
		$this->system->view->assign('sistema_id', $sistema_id);
		$this->system->view->assign('alunos', $alunos);
		$this->system->view->assign('paginacao', $paginacao);
		$this->system->view->assign('palavra_busca', $palavra);
		$this->system->view->assign('url_site', $this->system->getUrlSite());
	}

	protected function doDepoimentos() {
		// Visualização da instituição pelo administrador
		$sistema_id = $this->system->input['id'];
		$instituicao = $this->system->instituicoes->getInstituicaoBySistemaID($sistema_id);
		$depoimentos = $this->system->depoimentos->getDepoimentosBySistemaId("", $sistema_id);		
		$this->system->view->assign('depoimentos', $depoimentos);
		$this->system->view->assign('sistema_id', $sistema_id);
		if ($this->system->session->getItem('estrutura') == 'acesso_instituicao') {
			$this->system->admin->topo('alunos');
			$this->system->view->display('administrador/acesso_instituicao/depoimentos.tpl');
			$this->system->admin->rodape();
		}
	}
}
// ===================================================================