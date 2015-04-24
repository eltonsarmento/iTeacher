<?php
// ===================================================================
class Parceiros extends AdminModules {
	protected $mostrar = 10;
	// ===============================================================
	public function __construct() {
		parent::__construct();
		$this->system->load->dao('parceiros');
		$this->system->load->dao('paginas');
		$this->system->load->model('email_model');
	}
	// ===============================================================
	public function autoRun() {
    	switch($this->system->input['do']) {
			case 'listar':
			case 'buscar':					$this->doListar(); 	break;
			case 'novo':					$this->doNovo(); 	break;
			case 'editar': 					$this->doEdicao(); 	break;
			case 'apagar': 					$this->doDeletar(); break;
			case 'visualizar': 				$this->doVisualizar(); break;
			case 'alunos':					$this->doVisualizarAlunosByCurso(); break;
			case 'editarnavisualizacao': 	$this->doEditarNaVisualizacao(); break;
			case 'repasses': 				$this->doRepassesFinanceiros(); break;
			default: 						$this->pagina404(); break;
		}
	}
	// ===============================================================
	protected function doListar($view = 'instituicao/listar_parceiros.tpl') {		
		$this->listagem();	
		$this->system->admin->topo('parceiros','parceiros-listar');
		$this->system->view->display($view);
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function listagem() {
		$parceiros = $this->system->parceiros->getParceiros($palavra, 'padrao');
		foreach ($parceiros as $key => $parceiro) {
			$parceiros[$key]['cep'] = $this->system->parceiros->getValorExtra($parceiro['id'], 'cep');
			$parceiros[$key]['cidade'] = $this->system->parceiros->getValorExtra($parceiro['id'], 'cidade');
			$parceiros[$key]['estado'] = $this->system->parceiros->getValorExtra($parceiro['id'], 'estado');
			$parceiros[$key]['cpf'] = $this->system->parceiros->getValorExtra($parceiro['id'], 'cpf');
			$parceiros[$key]['cnpj'] = $this->system->parceiros->getValorExtra($parceiro['id'], 'cnpj');
			$parceiros[$key]['telefone'] = $this->system->parceiros->getValorExtra($parceiro['id'], 'telefone');
			$parceiros[$key]['tipo_pessoa'] = $this->system->parceiros->getValorExtra($parceiro['id'], 'tipo_pessoa');
			$parceiros[$key]['email_secundario'] = $this->system->parceiros->getValorExtra($parceiro['id'], 'email_secundario');
		}
		$this->system->view->assign('parceiros', $parceiros);
	}
	// ===============================================================
	protected function doNovo() {
		$editar = $this->system->input['editar'];
		$pessoaFisica = $this->system->input['pessoa_fisica'];
		$pessoaJuridica = $this->system->input['pessoa_juridica'];
		if($editar){
			if($pessoaFisica){
				$erro_msg = $this->validarDados();
				if($erro_msg){
					$this->system->view->assign('msg_alert', $erro_msg['msg']);
					$this->system->view->assign('parceiro', $this->system->input);
				} 
				else {
					// tipo: 1 - pessoa fisica | 2 - pessoa juridica
					$tipo = 1;
					$id = $this->system->parceiros->cadastrar($this->system->input, $tipo);
					$this->system->view->assign('msg_alert', 'Parceiro (Pessoa fisica) cadastrado com sucesso!');
				}	
			}
			elseif ($pessoaJuridica) {
				$erro_msg = $this->validarDados();
				if ($erro_msg) {
					$this->system->view->assign('msg_alert', $erro_msg['msg']);
					$this->system->view->assign('parceiro', $this->system->input);
				} 
				else {
					// tipo: 1 - pessoa fisica | 2 - pessoa juridica
					$tipo = 2;
					$id = $this->system->parceiros->cadastrar($this->system->input, $tipo);
					$this->system->view->assign('msg_alert', 'Parceiro (Pessoa juridica) cadastrado com sucesso!');
				}
			}
		}
		$this->system->admin->topo('parceiros','parceiros-novo');
		$this->system->view->display('instituicao/novo_parceiro.tpl');
		$this->system->admin->rodape();	
	}
	// ===============================================================
	public function doEdicao() {
		$id = intval($this->system->input['id']);
		$tipo = $this->system->input['tipo'];
		$editarPF = $this->system->input['editarPF'];
		$editarPJ = $this->system->input['editarPJ'];
		if ($id) {
			if ($tipo) {
				if ($tipo == "PF") {
					$parceiro = $this->system->parceiros->getParceiro($id,true);
					$this->system->view->assign("parceiro", $parceiro);
					$tipo = 1;
					if ($editarPF) {
						if ($erro_msg) {
							$this->system->view->assign('msg_alert', $erro_msg['msg']);
							$this->system->view->assign('parceiro', $this->system->input);
						} 
						else {
							$this->system->parceiros->atualizarDados($this->system->input, $tipo);
							$this->system->view->assign('msg_alert', 'Parceiro (Pessoa fisica) atualizado com sucesso!');
							if ($this->system->input['nova']) {
								$this->doNovo();
								die;
							}

							$this->listagem();	
							$this->system->admin->topo('parceiros','parceiros-listar');
							$this->system->view->display('instituicao/listar_parceiros.tpl');
							$this->system->admin->rodape();
						}
					}
					$this->system->admin->topo('parceiros');
					$this->system->view->display('instituicao/editar_parceiro_pessoa_fisica.tpl');
					$this->system->admin->rodape();
				}
				elseif ($tipo == "PJ") {
					$parceiro = $this->system->parceiros->getParceiro($id,true);
					$this->system->view->assign("parceiro", $parceiro);
					$tipo = 2;
					if ($editarPJ) {
						if ($erro_msg) {
							$this->system->view->assign('msg_alert', $erro_msg['msg']);
							$this->system->view->assign('parceiro', $this->system->input);
						} 
						else {
							$this->system->parceiros->atualizarDados($this->system->input, $tipo);
							$this->system->view->assign('msg_alert', 'Parceiro (Pessoa juridica) atualizado com sucesso!');

							if ($this->system->input['nova']) {
								$this->doNovo();
								die;
							}

							$this->listagem();	
							$this->system->admin->topo('parceiros','parceiros-listar');							
							$this->system->view->display('instituicao/listar_parceiros.tpl');
							$this->system->admin->rodape();
						}
					}
					$this->system->admin->topo('parceiros');
					$this->system->view->display('instituicao/editar_parceiro_pessoa_juridica.tpl');
					$this->system->admin->rodape();

				}
			}	
		}
	}
	// ===============================================================
	protected function validarDados() {
		$email = "";
		if ($this->system->input['email']) {
			if ($this->system->input['email_responsavel'] == "") {
				$email = $this->system->input['email'];
			} 
			else {
				$email = $this->system->input['email_responsavel'];
			}
		}
		elseif ($this->system->input['email_responsavel']) {
			if ($this->system->input['email'] == "")
				$email = $this->system->input['email_responsavel'];
			else
				$email = $this->system->input['email'];				
		}
		$retorno = array();
        //Nome
        if($this->system->input['nome'] == '') 
            $retorno['msg'][] = "O campo nome está vázio.";
        //Email
        if ($email == '')
        	$retorno['msg'][] = "O campo E-mail está vázio";
        elseif (!$this->system->func->checkEmail($email))
        	$retorno['msg'][] = "O campo E-mail é inválido";
        elseif ($this->system->alunos->checkEmailCadastrado($this->system->input['id'], $email, $this->system->getSistemaID()))
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
	        if ($this->system->input['senha'] == '') {
	        	$retorno['msg'][] = "O campo Senha está vázio";
	        } elseif (strlen($this->system->input['senha']) < 5) {
	        	$retorno['msg'][] = "O campo Senha deve ter pelo menos 5 digitos.";
	        }
			if ($this->system->input['senha2'] == '')
	        	$retorno['msg'][] = "O campo Confirme a Senha está vázio";
	        elseif (strlen($this->system->input['senha2']) < 5)
	        	$retorno['msg'][] = "O campo Confirme a Senha deve ter pelo menos 5 digitos.";
	        if ($this->system->input['senha'] != $this->system->input['senha2'])
	        	$retorno['msg'][] = "Os campos Senha e Confirme a Senha não estão iguais.";
	    } 
	    //Senha Atualizar
        if ($this->system->input['id'] != '') {
        	if (($this->system->input['senha'] != '') && ($this->system->input['senha2'] != '')){	        	
	        	if (strlen($this->system->input['senha']) < 5)
	        		$retorno['msg'][] = "O campo Senha deve ter pelo menos 5 digitos.";
	        	if (strlen($this->system->input['senha2']) < 5)
	        		$retorno['msg'][] = "O campo Confirme a Senha deve ter pelo menos 5 digitos.";	      	
	        	if ($this->system->input['senha'] != $this->system->input['senha2'])
	        		$retorno['msg'][] = "Os campos Senha e Confirme a Senha não estão iguais.";
	    	}
		}
		//Arquivo destaque
		if (is_uploaded_file($_FILES['avatar']['tmp_name'])) {
			$extensao = end(explode('.', $_FILES['avatar']['name']));
			if (in_array($extensao, array('jpg', 'gif', 'png'))) {
				//ainda não existe esses campos abaixo no banco de dados
				/*$configPerfil = $this->system->configuracoesgerais->getImagensPerfil();
				if (($_FILES['avatar']['size'] / 1024) > $configPerfil['imagem_perfil_tamanho']) {
					$retorno['msg'][] = 'A Imagem do destaque está com mais de ' . $configPerfil['imagem_perfil_tamanho'] . 'kb';
				}*/
			}
			else {
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
			$parceiro = $this->system->parceiros->getParceiro($id);
			if ($parceiro['nivel'] == 7) {
				$this->system->parceiros->deletar($id);
				$this->system->view->assign('msg_alert', 'Parceiro excluído com sucesso!');
			} else {
				$this->system->view->assign('msg_alert', 'Não foi possível excluir esse parceiro!');	
			}
		}
		$this->doListar();
	}
	// ===============================================================
	protected function doVisualizar() {
		$id = intval($this->system->input['id']);
		if ($id) {
			$parceiro = $this->system->parceiros->getParceiro($id,true);
			echo json_encode($parceiro);
		}	
		else
			echo "Não foi possível retornar o parceiro.";
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
		} else {
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
	// ===============================================================
	protected function doRepassesFinanceiros() {		
		
		$palavra = $this->system->input['palavra_busca'];

		$repasses = $this->system->parceiros->getRepassesFinanceiros($palavra,$this->inicial, $this->mostrar,false);

		$base_url = ($palavra ? $this->system->func->baseurl('/parceiros/repasses&palavra_busca=' . $palavra) : $this->system->func->baseurl('/parceiros/repasses'));
		$total = $this->system->parceiros->getRepassesFinanceiros("","","",true);

		$paginacao = $this->system->func->paginacao($this->pagina, $this->mostrar, $total, $base_url);
		
		$this->system->view->assign('paginacao',$paginacao);
		$this->system->view->assign('repasses', $repasses);
		$this->system->view->assign('palavra_busca', $palavra);
		$this->system->admin->topo('parceiros','repasses-financeiros');							
		$this->system->view->display('instituicao/repasses_financeiros.tpl');
		$this->system->admin->rodape();
	}
// ====================================================================================
}
// ===================================================================