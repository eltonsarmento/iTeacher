<?php
// ===================================================================
class Home {
	// ===============================================================
	protected $system = null;
	private $limit = '';
	
	// ===============================================================
	public function __construct(&$system) {
		$this->system = $system;
	}
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			case 'index': 	$this->doIndex(); break;
			default: 		$this->pagina404(); break;
		}	
	}
	// ===============================================================
	protected function doIndex() {

		/*$enviar = $this->system->input['enviar'];		
		if($enviar){
			
			$erro_msg = $this->validarDados();				
			if ($erro_msg) {
				$this->system->view->assign('msg_alert', $erro_msg['msg']);
				$this->system->view->assign('formulario', $this->system->input);
			} else {
				$to 	  = "elton@kmf.com.br";
				$titulo   = "Pré-cadastro Iteacher";
				$deNome   = $this->system->input['deNome'];
				$deEmail  = $this->system->input['deEmail'];
				$mensagem = "Necessidade : <br><br>" . $this->system->input['mensagem'] . "<br><br><br><br>
				Remetente : ".$deNome ." <br> 				
				E-mail    : ".$deEmail ." <br>
				Número    : ".$this->system->input['telefone'];
				

				$this->system->func->sendMail($to, $titulo, $mensagem, $deNome, $deEmail);

				$this->system->view->assign('msg_alert_sucesso', "Dados enviados com sucesso!!");
			}
		}
		
		$this->system->view->assign(array(
			'usuario_id'		=> $this->system->session->getItem('session_cod_usuario'),
			'usuario_nome'		=> $this->system->session->getItem('session_nome'),
			'usuario_categoria'	=> $this->system->session->getItem('session_nivel_categoria'),
			'url_site'			=> $this->system->getUrlSite(),
			'tituloPagina'		=> $tituloPagina
		));        
		$this->system->view->display('site/indexTemp.tpl');*/




		$this->system->site->topo();
		$this->system->view->display('site/index.tpl');
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
	protected function validarDados() {
		$retorno = array();
        //Nome
        if($this->system->input['deNome'] == '') 
            $retorno['msg'][] = "O campo nome está vázio.";
        //Email
        if ($this->system->input['deEmail'] == '')
        	$retorno['msg'][] = "O campo E-mail está vázio";
        elseif(!$this->system->func->checkEmail($this->system->input['deEmail']))
        	$retorno['msg'][] = "O campo E-mail é inválido";               
        //MENSAGEM
        if ($this->system->input['mensagem'] == '')
        	$retorno['msg'][] = "O campo Mensagem está vázio";
        //Telefone
        if ($this->system->input['telefone'] == '')
        	$retorno['msg'][] = "O campo Telefone está vázio";

		if (count($retorno) > 0)
			$retorno['msg'] = implode("<br/>",$retorno['msg']);

	        return $retorno;
	}
}
// ===================================================================