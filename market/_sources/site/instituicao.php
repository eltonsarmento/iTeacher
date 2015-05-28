<?php
// ===================================================================
class Instituicao {
	// ===============================================================
	protected $system = null;
	private $limit = '';
	// ===============================================================
	public function __construct(&$system) {
		$this->system = $system;
		$this->system->load->dao('instituicoes');		
	}
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			case 'index': 	    $this->doCatalogoDePlanos(); break;
			case 'cadastrar': 	$this->doCadastro(); break;
			default: 		$this->pagina404(); break;
		}	
	}
	// ===============================================================
	protected function doCatalogoDePlanos() {
		$this->system->site->topo(4);
		$this->system->view->display('site/instituicao.tpl');
		$this->system->site->rodape();
	}
	// ===============================================================
	protected function pagina404() {
		$url = end(explode($this->system->getUrlSite(), $_SERVER['REQUEST_URI']));
		$this->system->view->assign('url', $url);
		$this->system->site->topo(0);
		$this->system->view->display('site/pagina404.tpl');
		$this->system->site->rodape();
	}
	// ===============================================================
	protected function doCadastro() {		
		$cadastrar = $this->system->input['cadastrar'];
		if($cadastrar){			
			$msg_error = $this->validarDados();	
			if ($msg_error) {											
				$this->system->view->assign('msg_error', $msg_error['msg']);
				$this->system->view->assign('nome', $this->system->input['nome']);
				$this->system->view->assign('razaosocial', $this->system->input['razaosocial']);
				$this->system->view->assign('cnpj', $this->system->input['cnpj']);
				$this->system->view->assign('email', $this->system->input['email']);
				$this->system->view->assign('senha', $this->system->input['senha']);
				$this->system->view->assign('termo', $this->system->input['termo']);
			}else {						
				$id = $this->system->instituicoes->cadastrarBySite($this->system->input);
				$this->system->view->assign('msg_sucesso', 'Cadastrado com sucesso!');				
			}				

		}
		

		$this->system->site->topo(0);
		$this->system->view->display('site/instituicao_cadastrar.tpl');
		$this->system->site->rodape();
	}
	// ===============================================================
	protected function validarDados() {
		$retorno = array();	
        //Nome
        if ($this->system->input['nome'] == '') 
            $retorno['msg'][] = "O campo Nome está vázio.";
        //RAZAO SOCIAL
        if ($this->system->input['razaosocial'] == '') 
            $retorno['msg'][] = "O campo Razao Social está vázio.";
        //CNPJ        
        if ($this->system->input['cnpj'] == '') 
            $retorno['msg'][] = "O campo CNPJ está vázio.";
        //Email
        if ($this->system->input['email'] == '')
        	$retorno['msg'][] = "O campo E-mail esta vázio";
        elseif(!$this->system->func->checkEmail($this->system->input['email']))
        	$retorno['msg'][] = "O campo E-mail  é inválido";        
        //Senha        
	    if ($this->system->input['senha'] == '')
	        $retorno['msg'][] = "O campo Senha esta vázio";
	    //Senha        
	    if (count($this->system->input['termo']) == 0)
	        $retorno['msg'][] = "O campo Termos e Condições precisa está marcado";
       
		if (count($retorno) > 0)
		   $retorno['msg'] = implode('<br/>', $retorno['msg']);
        return $retorno;
	}
}
// ===================================================================