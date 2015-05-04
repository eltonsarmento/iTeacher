<?php
// ===================================================================
class AlunosGlobal extends AdminModules {
	protected $mostrar = 10;
	// ===============================================================
	public function __construct() {
		parent::__construct();
		$this->system->load->dao('alunos');
		$this->system->load->dao('paginas');
		$this->system->load->model('email_model');
	}
	// ===============================================================
	public function autoRun() {
    	switch($this->system->input['do']) {
			case 'listar':
			case 'buscar':					$this->doListar(); 	break;
			case 'novo':
			case 'editar': 					$this->doEdicao(); 	break;
			case 'apagar': 					$this->doDeletar(); break;
			case 'visualizar': 				$this->doVisualizar(); break;
			case 'alunos':					$this->doVisualizarAlunosByCurso(); break;
			case 'editarnavisualizacao': 	$this->doEditarNaVisualizacao(); break;
			default: 						$this->pagina404(); break;
		}
	}
	// ===============================================================
	protected function doListar($view = 'global/alunos_gerenciar.tpl') {		
		$this->listagem();
		$this->system->admin->topo('alunos', 'alunos-listar');
		$this->system->view->display($view);
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function listagem() {		
		$palavra = $this->system->input['palavra_busca'];		
		$base_url = ($palavra ? $this->system->func->baseurl('/alunos/buscar&palavra_busca=' . $palavra) : $this->system->func->baseurl('/alunos/listar'));
		$total = $this->system->alunos->getAlunos($palavra, 'padrao', 0, '', true);
		$paginacao = $this->system->func->paginacao($this->pagina, $this->mostrar, $total, $base_url);
		$alunos = $this->system->alunos->getAlunos($palavra, 'padrao', $this->inicial . ',' . $this->mostrar);
		foreach ($alunos as $key => $aluno) {
			$alunos[$key]['cursos'] = $this->system->alunos->getCursos($aluno['id']);
			$alunos[$key]['cep'] = $this->system->alunos->getValorExtra($aluno['id'], 'cep');
			$alunos[$key]['endereco'] = $this->system->alunos->getValorExtra($aluno['id'], 'endereco');
			$alunos[$key]['bairro'] = $this->system->alunos->getValorExtra($aluno['id'], 'bairro');
			$alunos[$key]['cidade'] = $this->system->alunos->getValorExtra($aluno['id'], 'cidade');
			$alunos[$key]['estado'] = $this->system->alunos->getValorExtra($aluno['id'], 'estado');
			$alunos[$key]['cpf'] = $this->system->alunos->getValorExtra($aluno['id'], 'cpf');
			$alunos[$key]['telefone'] = $this->system->alunos->getValorExtra($aluno['id'], 'telefone');
		}		
		$this->system->view->assign('alunos', $alunos);
		$this->system->view->assign('paginacao', $paginacao);
		$this->system->view->assign('palavra_busca', $palavra);
		$this->system->view->assign('url_site', $this->system->getUrlSite());
	}
	// ===============================================================
	protected function doEdicao() {
		$id = intval($this->system->input['id']);
		$editar = intval($this->system->input['editar']);
		if ($editar) {
			$erro_msg = $this->validarDados();	
			if ($erro_msg) {
				$this->system->view->assign('msg_alert', $erro_msg['msg']);
				$this->system->view->assign('aluno', $this->system->input);
			} 
			else {
				if ($id) {
					$this->system->alunos->atualizar($this->system->input);
					$this->system->view->assign('msg_alert', 'Aluno atualizado com sucesso!');
				}
				else {
					$id = $this->system->alunos->cadastrar($this->system->input);
					$this->system->view->assign('msg_alert', 'Aluno cadastrado com sucesso!');					
					//Email
					$this->system->email_model->cadastroAluno($this->system->input['email'], $this->system->input['nome'], $this->system->input['senha']);
				}
				if ($this->system->input['nova'])
					$this->system->func->redirecionar('/alunos/novo');
				else
					$this->system->func->redirecionar('/alunos/listar');
				$this->doListar();
				die;
			}
		} 
		else {
			if ($id) $this->system->view->assign('aluno', $this->system->alunos->getAluno($id, true));
		}
		$this->system->admin->topo('alunos','alunos-novo');
		$this->system->view->display('global/alunos_edicao.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function validarDados() {
		$retorno = array();
	        //Nome
	        if($this->system->input['nome'] == '') 
	            $retorno['msg'][] = "O campo nome está vázio.";
	        //Email
	        if ($this->system->input['email'] == '')
	        	$retorno['msg'][] = "O campo E-mail está vázio";
	        elseif(!$this->system->func->checkEmail($this->system->input['email']))
	        	$retorno['msg'][] = "O campo E-mail é inválido";
	        elseif($this->system->alunos->checkEmailCadastrado($this->system->input['id'], $this->system->input['email'], $this->system->getSistemaID()))
	        	$retorno['msg'][] = "Já existe um usuário cadastrado com esse e-mail";
	       //CPF
	        if ($this->system->input['cpf'] != '' && !$this->system->func->validaCPF($this->system->input['cpf']))
	        	$retorno['msg'][] = "O campo CPF é inválido.";
	        //CEP
	        if ($this->system->input['cep'] == '')
	        	$retorno['msg'][] = "O campo CEP está vázio";
	        //Endereço
	        if ($this->system->input['endereco'] == '')
	        	$retorno['msg'][] = "O campo Endereço está vázio";
	        //Bairro
	        if ($this->system->input['bairro'] == '')
	        	$retorno['msg'][] = "O campo Bairro está vázio";
	        //Cidade
	        if ($this->system->input['cidade'] == '')
	        	$retorno['msg'][] = "O campo Cidade está vázio";
	        //Estado
	        if ($this->system->input['estado'] == '')
	        	$retorno['msg'][] = "O campo Estado está vázio";
	        //Senha
	        if ($this->system->input['id'] == '') {
		        if ($this->system->input['senha'] == '')
		        	$retorno['msg'][] = "O campo Senha está vázio";
		        elseif (strlen($this->system->input['senha']) < 5)
		        	$retorno['msg'][] = "O campo Senha deve ter pelo menos 5 digitos.";
				if ($this->system->input['senha2'] == '')
		        	$retorno['msg'][] = "O campo Confirme a Senha está vázio";
		        elseif (strlen($this->system->input['senha2']) < 5)
		        	$retorno['msg'][] = "O campo Confirme a Senha deve ter pelo menos 5 digitos.";
		        if($this->system->input['senha'] != $this->system->input['senha2'])
		        	$retorno['msg'][] = "Os campos Senha e Confirme a Senha não estão iguais.";
		    }
		    //Senha Atualizar
	        if ($this->system->input['id'] != '') {
	        		if (($this->system->input['senha'] != '') && ($this->system->input['senha2'] != '')){	        	
			        	if (strlen($this->system->input['senha']) < 5)
			        		$retorno['msg'][] = "O campo Senha deve ter pelo menos 5 digitos.";
			        	if (strlen($this->system->input['senha2']) < 5)
			        		$retorno['msg'][] = "O campo Confirme a Senha deve ter pelo menos 5 digitos.";	      	
			        	if($this->system->input['senha'] != $this->system->input['senha2'])
			        		$retorno['msg'][] = "Os campos Senha e Confirme a Senha não estão iguais.";
		    	}
		}
		if (count($retorno) > 0)
			$retorno['msg'] = implode("<br/>",$retorno['msg']);

	        return $retorno;
	}
	// ===============================================================
	protected function doDeletar() {
		$id = intval($this->system->input['id']);
		if ($id) {
			$cursos = $this->system->alunos->getCursos($id);
			$aluno = $this->system->alunos->getAluno($id);
			if(count($cursos) == 0 && $aluno['nivel'] == 2) {
				$this->system->alunos->deletar($id);
				$this->system->view->assign('msg_alert', 'Aluno excluído com sucesso!');
			} 
			else {
				$this->system->view->assign('msg_alert', 'Não foi possível excluir esse usuário!');	
			}
		}
		$this->doListar();
	}
	// ===============================================================
	protected function doVisualizar() {
		$id = intval($this->system->input['id']);
		if ($id)
			$this->system->view->assign('aluno', $this->system->alunos->getAluno($id, true));
		else
			header('location: ' . $this->system->admin->categoria . '/alunos/listar');
		$this->system->admin->topo(2);
		$this->system->view->display('global/alunos_visualizar.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================

	protected function doEditarNaVisualizacao() {
		$id = intval($this->system->input['id']);
		$editar = intval($this->system->input['editar']);
		if ($editar) {
			$erro_msg = $this->validarDados();
			if ($erro_msg) {
				$this->system->view->assign('msg_alert', $erro_msg['msg']);
				$this->system->view->assign('aluno', $this->system->input);
			} 
			else {	
				if ($id) {
					$this->system->alunos->atualizar($this->system->input);
					$this->system->view->assign('msg_alert', 'Aluno atualizado com sucesso!');
				} 
				else {
					$id = $this->system->alunos->cadastrar($this->system->input);
					$this->system->view->assign('msg_alert', 'Aluno cadastrado com sucesso!');
				}
				$this->doVisualizar();
				exit;
			}
		} 
		else {
			if ($id) 
				$this->system->view->assign('aluno', $this->system->alunos->getAluno($id, true));
			else
				header('location: ' . $this->system->admin->categoria . '/alunos/visualizar');
		}
		$this->system->admin->topo(2);
		$this->system->view->display('global/alunos_editar_perfil.tpl');
		$this->system->admin->rodape();
	}
// ====================================================================================
	protected function doVisualizarAlunosByCurso() {
		$id_curso = $this->system->input['id'];
		$alunos = $this->system->alunos->getAlunosByCurso($id_curso);		
		echo json_encode($alunos);
	}
// ====================================================================================
}
// ====================================================================================