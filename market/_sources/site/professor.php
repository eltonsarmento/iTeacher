<?php
// ===================================================================
class Professor {
	// ===============================================================
	protected $system = null;
	private $limit = '';
	// ===============================================================
	public function __construct(&$system) {
		$this->system = $system;
		$this->system->load->dao('professores');
		$this->system->load->model('email_model');
	}
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			case 'index': 	$this->doCadastroProfessor(); break;			
			default: 		$this->pagina404(); break;
		}	
	}
	// ===============================================================
	protected function doCadastroProfessor() {	
		$cadastrar = $this->system->input['cadastrar'];
		if($cadastrar){			
			$msg_error = $this->validarDados();	
			if ($msg_error) {											
				$this->system->view->assign('msg_error', $msg_error['msg']);
				$this->system->view->assign('nome', $this->system->input['nome']);							
				$this->system->view->assign('email', $this->system->input['email']);
				$this->system->view->assign('senha', $this->system->input['senha']);
				$this->system->view->assign('termo', $this->system->input['termo']);
			}else {										
				$id = $this->system->professores->cadastrarBySite($this->system->input);
				$this->system->email_model->cadastroBySite('Professor',$this->system->input['email'], $this->system->input['nome']);
				$this->system->view->assign('msg_sucesso', 'Cadastrado com sucesso!');				
				$this->system->view->assign('nome', '');							
				$this->system->view->assign('email', '');
				$this->system->view->assign('senha', '');
				$this->system->view->assign('termo', '');
			}				
		}
		
		$this->system->site->topo(3);
		$this->system->view->display('site/professor.tpl');
		$this->system->site->rodape();
	}
	// ===============================================================
	protected function validarDados() {
		$retorno = array();	
        //Nome
        if ($this->system->input['nome'] == '') 
            $retorno['msg'][] = "O campo Nome está vázio.";        
        //Email
        if ($this->system->input['email'] == '')
        	$retorno['msg'][] = "O campo E-mail esta vázio";
        elseif(!$this->system->func->checkEmail($this->system->input['email']))
        	$retorno['msg'][] = "O campo E-mail  é inválido";
        elseif($this->system->professores->checkEmailCadastrado(0, $this->system->input['email'], 0))        	
        		$retorno['msg'][] = "Já existe um usuário cadastrado com esse e-mail";			
        //Senha        
	    if ($this->system->input['senha'] == '')
	        $retorno['msg'][] = "O campo Senha esta vázio";
	    //TERMO        
	    if (count($this->system->input['termo']) == 0)
	        $retorno['msg'][] = "O campo Termos e Condições precisa está marcado";
       
		if (count($retorno) > 0)
		   $retorno['msg'] = implode('<br/>', $retorno['msg']);
        return $retorno;
	}
}
// ===================================================================