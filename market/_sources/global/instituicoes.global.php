<?php
// ===================================================================
class InstituicoesGlobal extends AdminModules {
	protected $mostrar = 10;
	// ===============================================================
	public function __construct() {

		parent::__construct();
		$this->system->load->dao('instituicoes');
		$this->system->load->dao('administrativos');
	}
	// ===============================================================
	public function autoRun() {
    	switch($this->system->input['do']) {
			case 'listar':
			case 'buscar':			$this->doListar(); 	break;
			case 'novo':
			case 'editar': 			$this->doEdicao(); 	break;
			case 'apagar': 			$this->doDeletar(); break;
			case 'ativar':			$this->doAtivar();	break;
			case 'desativar': 		$this->doDesativar(); break;
			case 'visualizar': 		$this->doVisualizar(); break;
			case 'validarAcesso':	$this->doValidarAcessoInstituicao(); break;
			case 'financeiro':		$this->doFinanceiro(); break;
			default: 				$this->pagina404(); break;
		}
	}
	// ===============================================================
	protected function doListar() {
		$this->listagem();
		$instituicoes = $this->system->instituicoes->getInstituicoes();
		$this->system->admin->topo('instituicoes', 'listar');
		$this->system->view->display('administrador/todas_instituicoes.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function listagem() {
		$palavra = $this->system->input['palavra_busca'];
		$base_url = ($palavra ? $this->system->func->baseurl('/alunos/buscar&palavra_busca=' . $palavra) : $this->system->func->baseurl('/alunos/listar'));
		$total = $this->system->instituicoes->getInstituicoes($palavra, 'padrao', 0, '', true);
		$paginacao = $this->system->func->paginacao($this->pagina, $this->mostrar, $total, $base_url);
		$instituicoes = $this->system->instituicoes->getInstituicoes($palavra, 'padrao', $this->inicial . ',' . $this->mostrar);
		foreach ($instituicoes as $key => $instituicao) {	
			$instituicoes[$key]['cep'] = $this->system->instituicoes->getValorExtra($instituicao['id'], 'cep');
			$instituicoes[$key]['endereco'] = $this->system->instituicoes->getValorExtra($instituicao['id'], 'endereco');
			$instituicoes[$key]['bairro'] = $this->system->instituicoes->getValorExtra($instituicao['id'], 'bairro');
			$instituicoes[$key]['cidade'] = $this->system->instituicoes->getValorExtra($instituicao['id'], 'cidade');
			$instituicoes[$key]['estado'] = $this->system->instituicoes->getValorExtra($instituicao['id'], 'estado');
			$instituicoes[$key]['cnpj'] = $this->system->instituicoes->getValorExtra($instituicao['id'], 'cnpj');
			$instituicoes[$key]['telefone'] = $this->system->instituicoes->getValorExtra($instituicao['id'], 'telefone');
			$instituicoes[$key]['nome_responsavel'] = $this->system->instituicoes->getValorExtra($instituicao['id'], 'nome_responsavel');
			$instituicoes[$key]['email_secundario'] = $this->system->instituicoes->getValorExtra($instituicao['id'], 'email_secundario');
		}
		$this->system->view->assign('instituicoes', $instituicoes);
		$this->system->view->assign('paginacao', $paginacao);
		$this->system->view->assign('palavra_busca', $palavra);
		$this->system->view->assign('url_site', $this->system->getUrlSite());
	}
	// ===============================================================
	protected function doEdicao() {
		$id = $this->system->input['id'];
		$editar = $this->system->input['editar'];
		if ($editar) {
			$msg_error = $this->validarDados();	
			if ($msg_error) {
				$this->system->view->assign('msg_error', $msg_error['msg']);			
				$instituicao = $this->system->input;
			} else {	
				if ($id) {
					$this->system->instituicoes->atualizar($this->system->input);
					$this->system->view->assign('msg_sucesso', 'Atualizado com sucesso!');
					$this->system->view->assign('instituicao', $this->system->input);	
				} 
				else {
					$id = $this->system->instituicoes->cadastrar($this->system->input);
					$this->system->view->assign('msg_sucesso', 'Cadastrado com sucesso!');
					$this->system->view->assign('instituicao', $this->system->input);
				}
				if (is_uploaded_file($_FILES['logo_instituicao']['tmp_name'])) {	
					$extensao = substr($_FILES['logo_instituicao']['name'], -3);
					$nomearquivo = 'logo_instituicao_' . $id . '.' . $extensao;
					if (file_exists($this->system->getUploadPath() . '/logos_instituicao/' . $nomearquivo))
						unlink($this->system->getUploadPath() . '/logos_instituicao/' . $nomearquivo);
					copy($_FILES['logo_instituicao']['tmp_name'], $this->system->getUploadPath() . '/logos_instituicao/' . $nomearquivo);
					$this->system->instituicoes->atualizarLogotipo($id, $nomearquivo);
				}		
			}
		} else {
			$instituicao = $this->system->instituicoes->getInstituicao($id, true);
		}
		$this->system->view->assign('instituicao', $instituicao);
		$this->system->admin->topo('instituicoes', 'novo');
		$this->system->view->display('administrador/editar_instituicao.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function doFinanceiro() {
		$id = $this->system->input['id'];
		$this->system->admin->topo('instituicoes', 'financeiro');
		$this->system->view->display('administrador/financeiro_instituicoes.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function doHistoricoFinanceiro() {
		$this->system->admin->topo('instituicoes', 'financeiro');
		$this->system->view->display('administrador/financeiro_instituicao.tpl');
		$this->system->admin->rodape();	
	}
	// ===============================================================
	protected function validarDados() {
		$retorno = array();	
        //Nome
        if ($this->system->input['nome'] == '') 
            $retorno['msg'][] = "O campo Nome está vázio.";
        //Razão social
        if ($this->system->input['razao_social'] == '') 
            $retorno['msg'][] = "O campo Razão Social está vázio.";
        //CNPJ
        if ($this->system->input['cnpj'] == '') 
            $retorno['msg'][] = "O campo CNPJ Social está vázio.";
        //Nome do responsavel
        if ($this->system->input['nome_responsavel'] == '') 
            $retorno['msg'][] = "O campo Responsável está vázio.";
        //Email 
        if ($this->system->input['email'] == '')
        	$retorno['msg'][] = "O campo E-mail esta vázio";
        elseif(!$this->system->func->checkEmail($this->system->input['email']))
        	$retorno['msg'][] = "O campo E-mail é inválido";
        elseif($this->system->administrativos->checkEmailCadastrado($this->system->input['id'], $this->system->input['email'], $this->system->getSistemaID()))        	
        		$retorno['msg'][] = "Já existe um usuário cadastrado com esse e-mail";	
        	//Email Secundário
        if ($this->system->input['email_secundario'] == '')
        	$retorno['msg'][] = "O campo E-mail Responsável esta vázio";
        elseif(!$this->system->func->checkEmail($this->system->input['email_secundario']))
        	$retorno['msg'][] = "O campo E-mail Responsável é inválido";
        elseif($this->system->administrativos->checkEmailCadastrado($this->system->input['id'], $this->system->input['email_secundario'], $this->system->getSistemaID()))        	
        		$retorno['msg'][] = "Já existe um usuário cadastrado com esse e-mail";	
		//Telfone responsavel
        if ($this->system->input['telefone_responsavel'] == '') 
            $retorno['msg'][] = "O campo Telefone Responsável está vázio.";        
        //Inscrição municipal
        if ($this->system->input['inscricao_municipal'] == '') 
            $retorno['msg'][] = "O campo Inscrição Municipal está vázio.";
        //Inscrição estadual
        if ($this->system->input['inscricao_estadual'] == '') 
            $retorno['msg'][] = "O campo Inscrição Estadual está vázio.";
        //Cep
        if ($this->system->input['cep'] == '') 
            $retorno['msg'][] = "O campo Cep está vázio.";
        //endereço
        if ($this->system->input['endereco'] == '') 
            $retorno['msg'][] = "O campo Endereço está vázio.";
        //Comeplemento
        if ($this->system->input['complemento'] == '') 
            $retorno['msg'][] = "O campo Complemento está vázio.";
        //Bairro
        if ($this->system->input['bairro'] == '') 
            $retorno['msg'][] = "O campo Bairro está vázio.";
        //Estado
        if ($this->system->input['estado'] == '') 
            $retorno['msg'][] = "O campo Estado está vázio.";
        //Cidade
        if ($this->system->input['cidade'] == '') 
            $retorno['msg'][] = "O campo cidade está vázio.";
        //Site
        if ($this->system->input['site'] == '') 
            $retorno['msg'][] = "O campo site está vázio.";
        //Área atuação
        if ($this->system->input['area_atuacao'] == '') 
            $retorno['msg'][] = "O campo Área de atuação está vázio.";
        //Senha
        if ($this->system->input['id'] == '') {
	        if ($this->system->input['senha'] == '')
	        	$retorno['msg'][] = "O campo Senha esta vázio";
	        elseif (strlen($this->system->input['senha']) < 5)
	        	$retorno['msg'][] = "O campo Senha deve ter pelo menos 5 digitos.";
	    }
        //Logotipo
		if (is_uploaded_file($_FILES['logo_instituicao']['tmp_name'])) {
			$extensao = end(explode('.', $_FILES['logo_instituicao']['name']));
			if (in_array($extensao, array('jpg', 'gif', 'png'))) {
				//ainda não existe esses campos abaixo no banco de dados
				/*$configPerfil = $this->system->configuracoesgerais->getImagensPerfil();
				if (($_FILES['avatar']['size'] / 1024) > $configPerfil['imagem_perfil_tamanho']) {
					$retorno['msg'][] = 'A Imagem do destaque está com mais de ' . $configPerfil['imagem_perfil_tamanho'] . 'kb';
				}*/
			} 
			else {
				$retorno['msg'][] = 'Formato de Logotipo inválido';
			}
		}
		if (count($retorno) > 0)
		   $retorno['msg'] = implode('<br/>', $retorno['msg']);
        return $retorno;
	}

	// ==============================================================
	protected function doDesativar() {
		$id = $this->system->input['id'];
		$this->system->instituicoes->desativarInstituicao($id);
		$this->doListar();
	}
	// ==============================================================
	protected function doAtivar() {
		$id = $this->system->input['id'];
		$this->system->instituicoes->ativarInstituicao($id);
		$this->doListar();
	}
// ====================================================================================
}
// ===================================================================