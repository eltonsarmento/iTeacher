<?php
// ===================================================================
class ProfessorGlobal extends AdminModules {
	protected $mostrar = 10;
	// ===============================================================
	public function __construct() {
		parent::__construct();
		$this->system->load->dao('professores');
		$this->system->load->dao('paginas');
		$this->system->load->model('email_model');
	}
	// ===============================================================
	public function autoRun() {
    	switch($this->system->input['do']) {
			case 'listar':		
			case 'buscar':										$this->doListar(); 	break;
			case 'novo':
			case 'editar': 										$this->doEdicao(); 	break;
			case 'apagar': 										$this->doDeletar(); break;
			case 'visualizar': 								$this->doVisualizar(); break;			
			case 'editarnavisualizacao': 			$this->doEditarNaVisualizacao(); break;
			case 'gerenciar-pagamentos': 			$this->doGerenciarPagamentosProfessores(); break;
			case 'visualizarObservacoes': 		$this->doVisualizarObservacoes(); break;	
			case 'atualiza-comprovante': 			$this->doAtualizaComprovante(); break;						
			default: 													$this->pagina404(); break;
		}
	}
	// ===============================================================
	protected function doListar() {		
		$titulo = $this->system->emails->getValorPorId(95);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(96));
		
		$this->listagem();
		$this->system->admin->topo('professor', 'professor-listar');
		$this->system->view->display('instituicao/professor_gerenciar.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function listagem() {
		$palavra = $this->system->input['palavra_busca'];
		$base_url = ($palavra ? $this->system->func->baseurl('/professor/buscar&palavra_busca=' . $palavra) : $this->system->func->baseurl('/professor/listar'));
		$total = $this->system->professores->getProfessores($palavra, 'padrao', 0, '', true);
		$paginacao = $this->system->func->paginacao($this->pagina, $this->mostrar, $total, $base_url);
		$professores = $this->system->professores->getProfessores($palavra, 'padrao', $this->inicial . ',' . $this->mostrar);
		foreach ($professores as $key => $professor) {
			$professores[$key]['cep'] = $this->system->professores->getValorExtra($professor['id'], 'cep');
			$professores[$key]['endereco'] = $this->system->professores->getValorExtra($professor['id'], 'endereco');
			$professores[$key]['bairro'] = $this->system->professores->getValorExtra($professor['id'], 'bairro');
			$professores[$key]['cidade'] = $this->system->professores->getValorExtra($professor['id'], 'cidade');
			$professores[$key]['estado'] = $this->system->professores->getValorExtra($professor['id'], 'estado');
			$professores[$key]['cpf'] = $this->system->professores->getValorExtra($professor['id'], 'cpf');
			$professores[$key]['telefone'] = $this->system->professores->getValorExtra($professor['id'], 'telefone');
		}
		$this->system->view->assign('professores', $professores);
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
				$this->system->view->assign('msg_alert_error', $erro_msg['msg']);
				$this->system->view->assign('professor', $this->system->input);
			} 
			else {
				if ($id) {
					$this->system->professores->atualizar($this->system->input);										
					if (is_uploaded_file($_FILES['avatar']['tmp_name'])) {
						$extensao = end(explode('.', $_FILES['avatar']['name']));
						$nomearquivo = 'avatar_'.$id.'.'.$extensao;
						if (file_exists($this->system->getUploadPath().'/avatar/'.$nomearquivo))
							unlink($this->system->getUploadPath().'/avatar/'.$nomearquivo);
						copy($_FILES['avatar']['tmp_name'], $this->system->getUploadPath().'/avatar/'.$nomearquivo);
						$this->system->usuarios->atualizarImagem($id, $nomearquivo);
					}	
					$this->system->view->assign('msg_alert_sucesso', 'Professor atualizado com sucesso!');
				} 
				else {	
					//$id = $this->system->professores->cadastrar($this->system->input);
					if (is_uploaded_file($_FILES['avatar']['tmp_name'])) {
						$extensao = end(explode('.', $_FILES['avatar']['name']));
						$nomearquivo = 'avatar_' . $id . '.' . $extensao;
						if (file_exists($this->system->getUploadPath() . '/avatar/' . $nomearquivo))
							unlink($this->system->getUploadPath() . '/avatar/' . $nomearquivo);
						copy($_FILES['avatar']['tmp_name'], $this->system->getUploadPath() . '/avatar/' . $nomearquivo);
						$this->system->usuarios->atualizarImagem($id, $nomearquivo);
					}	
					//cadastra
					$this->system->professores->cadastrar($this->system->input);										
					//alerta
					$this->system->view->assign('msg_alert', 'Professor cadastrado com sucesso!');
					//Email
					$this->system->email_model->cadastroProfessor($this->system->input['email'], $this->system->input['nome'], $this->system->input['senha']);

				}
				if ($this->system->input['nova'])
					$this->system->func->redirecionar('/professor/novo');
				else
					$this->system->func->redirecionar('/professor/listar');
				$this->doListar();
				die;
			}
		} 
		else {	
			if ($this->system->session->getItem('session_nivel_categoria') == 'administrador') {
				if ($id) $this->system->view->assign('professor', $this->system->professores->getProfessorAutonomo($id, true));	
			}
			else {
				if ($id) $this->system->view->assign('professor', $this->system->professores->getProfessor($id, true));
			}		
		}
		$this->system->admin->topo('professor','professor-novo');
		$this->system->view->display('instituicao/professor_edicao.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function validarDados() {
		$retorno = array();
        //Nome
        if($this->system->input['nome'] == '') 
            $retorno['msg'][] = "O campo nome está vazio.";
        //Email
        if ($this->system->input['email'] == '')
        	$retorno['msg'][] = "O campo E-mail está vazio";
        elseif(!$this->system->func->checkEmail($this->system->input['email']))
        	$retorno['msg'][] = "O campo E-mail é inválido";
        elseif($this->system->professores->checkEmailCadastrado($this->system->input['id'], $this->system->input['email'], $this->system->getSistemaID()))
        	$retorno['msg'][] = "Já existe um usuário cadastrado com esse e-mail";

        //CPF
        if ($this->system->input['cpf'] == ''){
        	$retorno['msg'][] = "O campo CPF está vazio.";        	
        }elseif(!$this->system->func->validaCPF($this->system->input['cpf'])){
        	$retorno['msg'][] = "O campo CPF é inválido.";        
        }
        
        //CEP
        if ($this->system->input['cep'] == '')
        	$retorno['msg'][] = "O campo CEP está vazio";
        //Endereço
        if ($this->system->input['endereco'] == '')
        	$retorno['msg'][] = "O campo Endereço está vazio";
        //Bairro
        if ($this->system->input['bairro'] == '')
        	$retorno['msg'][] = "O campo Bairro está vazio";
        //Cidade
        if ($this->system->input['cidade'] == '')
        	$retorno['msg'][] = "O campo Cidade está vazio";
        //Estado
        if ($this->system->input['estado'] == '')
        	$retorno['msg'][] = "O campo Estado está vazio";
        //Senha
        if ($this->system->input['id'] == '') {
	        if ($this->system->input['senha'] == '')
	        	$retorno['msg'][] = "O campo Senha está vazio";
	        elseif (strlen($this->system->input['senha']) < 5)
	        	$retorno['msg'][] = "O campo Senha deve ter pelo menos 5 digitos.";
			if ($this->system->input['senha2'] == '')
	        	$retorno['msg'][] = "O campo Confirme a Senha está vazio";
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
		//Arquivo Imagem
		if (is_uploaded_file($_FILES['avatar']['tmp_name'])) {
			$extensao = end(explode('.', $_FILES['avatar']['name']));
			if (!in_array($extensao, array('jpg', 'gif', 'png'))) {				
				$retorno['msg'][] = 'Formato de Imagem do destaque inválido';
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
			$professor = $this->system->professores->getProfessor($id);
			if($professor['nivel'] == 8) {
				$this->system->professores->deletar($id);
				$this->system->view->assign('msg_alert_sucesso', 'Professor excluído com sucesso!');
			} 
			else {
				$this->system->view->assign('msg_alert_error', 'Não foi possível excluir esse usuário!');	
			}
		}
		$this->doListar();
	}
	// ===============================================================
	protected function doVisualizar() {
		$id = intval($this->system->input['id']);
		if ($id)
			$this->system->view->assign('professor', $this->system->professores->getProfessor($id, true));
		else
			header('location: ' . $this->system->admin->categoria . '/professor/listar');
		$this->system->admin->topo('professor','professor-listar');
		$this->system->view->display('instituicao/professor_visualizar.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================

	protected function doEditarNaVisualizacao() {
		$id = intval($this->system->input['id']);
		$editar = intval($this->system->input['editar']);
		if ($editar) {
			$erro_msg = $this->validarDados();
			if ($erro_msg) {
				$this->system->view->assign('msg_alert_error', $erro_msg['msg']);
				$this->system->view->assign('professor', $this->system->input);
			} 
			else {
				if ($id) {
					$this->system->professores->atualizar($this->system->input);
					$this->system->view->assign('msg_alert_sucesso', 'Professor atualizado com sucesso!');
				} 
				else {
					$id = $this->system->professores->cadastrar($this->system->input);
					$this->system->view->assign('msg_alert_sucesso', 'Professor cadastrado com sucesso!');
				}
				$this->doVisualizar();
				exit;
			}
		} 
		else {
			if ($id) 
				$this->system->view->assign('professor', $this->system->professores->getProfessor($id, true));
			else
				header('location: ' . $this->system->admin->categoria . '/professor/visualizar');
		}
		$this->system->admin->topo('professor','professor-listar');
		$this->system->view->display('instituicao/professor_editar_perfil.tpl');
		$this->system->admin->rodape();
	}
	// ====================================================================================	
	protected function doVisualizarprofessorByCurso() {
		$id_curso = $this->system->input['id'];
		$professor = $this->system->professores->getprofessorByCurso($id_curso);
		echo json_encode($professor);
	}
	// ====================================================================================
	protected function doGerenciarPagamentosProfessores() {
		$pagamentos = $this->system->professores->getGerenciarPagamentos($id); 
		//print_r($pagamentos);
		$this->system->view->assign('pagamentos', $pagamentos);
		$this->system->admin->topo('professor','gerenciar-pamentos');
		$this->system->view->display('instituicao/gerenciar_pagamentos_professores.tpl');
		$this->system->admin->rodape();
	}
	// ====================================================================================	
	protected function doVisualizarObservacoes() {
		$id = $this->system->input['id'];

		$pagamento  = $this->system->professores->getGerenciarPagamentos($id);
		
		echo json_encode($pagamento[0]);
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
				} else {
					$retorno['msg'][] = 'Comprovante de pagamento inválido';
					$comprovante = false;
				}
			}
			if (!count($retorno['msg'])) {				
				if ($comprovante) {
					$nomearquivo = 'comprovantes_pagamento_' . $id . '.' . $extensao;					
					if (file_exists($this->system->getUploadPath() . '/comprovantes_pagamentos/'. $nomearquivo))
						unlink($this->system->getUploadPath() . '/comprovantes_pagamentos/'. $nomearquivo);
					if (copy($_FILES['comprovante']['tmp_name'], $this->system->getUploadPath() . '/comprovantes_pagamentos/' . $nomearquivo)) {
						$this->system->professores->atualizarCampos($id, 
							array('comprovante' => $nomearquivo, 'status' => '1'));
						$retorno['sucesso'] = 'Comprovante enviado com sucesso.';
						$retorno['id'] = $id;
					} else {
						$retorno['msg'][] = 'Erro ao fazer o upload do comprovante!';
					}
				}
			}
		}

		echo json_encode($retorno);
	}
}
// ===================================================================