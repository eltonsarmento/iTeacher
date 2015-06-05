<?php
require(dirname(__FILE__).'/../global/professor.global.php');
// ===================================================================
class professor extends ProfessorGlobal {

	public function __construct() {
		parent::__construct();
		$this->system->load->dao('sistemas');
	}
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			case 'listar':		
			case 'buscar':							$this->doListar(); 	break;
			case 'novo':		
			case 'editar':							$this->doEdicao(); 	break;
			case 'ativar':							$this->doAtivar(); 	break;
			case 'desativar':						$this->doDesativar(); 	break;
			case 'listar-professor-instituicao':	$this->doListarProfessoresInstituicao(); break;			
			case 'validarAcessoProfessor':	        $this->doValidarAcessoProfessor(); break;
			default: 								$this->pagina404(); break;
		}
   	}

   	// ===============================================================
   	protected function doListarProfessoresInstituicao() {
   		$sistema_id = $this->system->input['id'];
   		
   		if ($this->system->session->getItem('estrutura') == 'acesso_instituicao') {
   			$this->system->admin->topo('professores','gerenciar');
   			$this->system->view->display('administrador/acesso_instituicao/professores.tpl');
   			$this->system->admin->rodape();
   		}
   		
   	}

   	// ===============================================================
   	protected function doListar() {
   		$this->listagemAdministrador();
   		$this->system->admin->topo('professores','gerenciar');
   		$this->system->view->display('administrador/todos_professores.tpl');
   		$this->system->admin->rodape();
   	}

   	// ===============================================================
   	private function listagemAdministrador() {
   		$palavra = $this->system->input['palavra_busca'];
		$base_url = ($palavra ? $this->system->func->baseurl('/professor/buscar&palavra_busca=' . $palavra) : $this->system->func->baseurl('/professor/listar'));
		$total = $this->system->professores->getProfessoresAutonomos($palavra, 'padrao', 0, '', true);
		$paginacao = $this->system->func->paginacao($this->pagina, $this->mostrar, $total, $base_url);
		$professores = $this->system->professores->getProfessoresAutonomos($palavra, 'padrao', $this->inicial . ',' . $this->mostrar);		
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
			} else {
				if ($id) {
					$this->system->professores->atualizar($this->system->input);										
					if (is_uploaded_file($_FILES['avatar']['tmp_name'])) {
						$extensao = end(explode('.', $_FILES['avatar']['name']));
						$nomearquivo = 'avatar_' . $id . '.' . $extensao;
						if (file_exists($this->system->getUploadPath() . '/avatar/' . $nomearquivo))
							unlink($this->system->getUploadPath() . '/avatar/' . $nomearquivo);
						copy($_FILES['avatar']['tmp_name'], $this->system->getUploadPath() . '/avatar/' . $nomearquivo);
						$this->system->usuarios->atualizarImagem($id, $nomearquivo);
					}		
					$this->system->view->assign('msg_alert_sucesso', 'Professor atualizado com sucesso!');
				} else {	
					/*$id = $this->system->professores->cadastrar($this->system->input);
					if (is_uploaded_file($_FILES['avatar']['tmp_name'])) {
						$extensao = end(explode('.', $_FILES['avatar']['name']));
						$nomearquivo = 'avatar_' . $id . '.' .$extensao;
						if (file_exists($this->system->getUploadPath() . '/avatar/' . $nomearquivo))
							unlink($this->system->getUploadPath() . '/avatar/' . $nomearquivo);
						copy($_FILES['avatar']['tmp_name'], $this->system->getUploadPath() . '/avatar/' . $nomearquivo);
						$this->system->usuarios->atualizarImagem($id, $nomearquivo);
					}	
					$this->system->view->assign('msg_alert', 'Professor cadastrado com sucesso!');*/
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
		} else {
			if ($this->system->session->getItem('session_nivel_categoria') == 'administrador') {
				if ($id)
					$this->system->view->assign('professor', $this->system->professores->getProfessorAutonomo($id, true));		
			}
			else {
				if ($id)
					$this->system->view->assign('professor', $this->system->professores->getProfessor($id, true)); 
			}
		}
		if($this->system->input['do'] == 'editar')
			$this->system->admin->topo('professores','professor-editar');
		else
			$this->system->admin->topo('professores','professor-novo');
		
		$this->system->view->display('administrador/editar_professor.tpl');
		$this->system->admin->rodape();
	}

	// ===============================================================
	protected function doDesativar() {
		$id = $this->system->input['id'];
		$this->system->professores->desativarProfessor($id);
		$this->doListar();
	}
	// ===============================================================
	protected function doAtivar() {
		$id = $this->system->input['id'];
		$this->system->professores->ativarProfessor($id);
		$this->doListar();	
	}
	// ===============================================================
	protected function doValidarAcessoProfessor() {
		$this->system->load->dao('login');
		$id = intval($this->system->input['id']); 
		$dados = $this->system->professores->getProfessorAutonomo($id, true);
		$this->system->session->addItem('session_administrador', true);
		$this->system->session->addItem('session_cod_usuario_administrador', $this->system->session->getItem('session_cod_usuario'));
		$this->system->session->addItem('session_cod_empresa_administrador', $this->system->session->getItem('session_cod_empresa'));
		$this->system->session->addItem('session_nivel_administrador', $this->system->session->getItem('session_nivel'));
		$this->system->session->addItem('session_cod_usuario', 	$dados['id']);
		$this->system->session->addItem('session_cod_empresa', 	$dados['sistema_id']);				
		$this->system->session->addItem('session_nivel', 		$dados['nivel']);		
		$this->system->session->addItem('session_nome_usuario', $dados['nome']);	
		$categorias = $this->system->arrays->getArrayCategorias();
		$this->system->session->addItem('session_nivel_categoria', $categorias[$dados['nivel']]);						
       	$this->system->func->redirecionar('/dashboard/home');
	}
}
// ===================================================================