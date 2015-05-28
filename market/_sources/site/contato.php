<?php
// ===================================================================
class Contato {
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
			case 'index': 	$this->doContato(); break;
			default: 		$this->pagina404(); break;
		}	
	}
	// ===============================================================
	protected function doContato() {
		$contato = $this->system->input['contato'];
		if($contato){			
			$msg_error = $this->validarDados();	
			if ($msg_error) {											
				$this->system->view->assign('msg_error', $msg_error['msg']);
				$this->system->view->assign('nome', $this->system->input['nome']);
				$this->system->view->assign('telefone', $this->system->input['telefone']);				
				$this->system->view->assign('email', $this->system->input['email']);
				$this->system->view->assign('mensagem', $this->system->input['mensagem']);				
			}else {						
				$deNome      = $this->system->input['nome'];
				$deEmail   = $this->system->input['email'];
				$mensagem  = "Meu Telefone: ".$this->system->input['telefone']." <br><br><br>".$this->system->input['mensagem'] ;
				$to 	   = "eltonsarmento@hotmail.com";
				$titulo    = $nome." Entrou em Contato de iTeacher"; 
				//$this->system->func->sendMail($to, $titulo, $mensagem, $deNome, $deEmail);
				require_once(dirname(__FILE__)."/phpmailer/class.phpmailer.php");
				// Inicia a classe PHPMailer
				$mail = new PHPMailer();
				$mail->IsSMTP();
		        try {					           
			
					$mail->AddAddress($to);
					$mail->SetFrom($deEmail, $deNome);
					
					$mail->Subject = $titulo;
					$mail->MsgHTML($mensagem);
					foreach ($anexos as $anexo)
						$mail->AddAttachment($anexo);      // attachment
					
					$mail->Send();
					$this->system->view->assign('msg_sucesso', 'Sua mensagem foi enviada com sucesso!');	
				} catch (phpmailerException $e) {
		  			echo $e->errorMessage(); //Pretty error messages from PHPMailer
				} catch (Exception $e) {
		  			echo $e->getMessage(); //Boring error messages from anything else!
				}
							
			}				

		}
		

		$this->system->site->topo(6);
		$this->system->view->display('site/contato.tpl');
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
        if ($this->system->input['nome'] == '') 
            $retorno['msg'][] = "O campo Nome está vázio.";        
        //Email
        if ($this->system->input['email'] == '')
        	$retorno['msg'][] = "O campo E-mail está vázio";
        elseif(!$this->system->func->checkEmail($this->system->input['email']))
        	$retorno['msg'][] = "O campo E-mail  é inválido";        
        //telefone        
	    if ($this->system->input['telefone'] == '')
	        $retorno['msg'][] = "O campo Telefone está vázio";
	    //mensagem        
	    if ($this->system->input['mensagem'] == '')
	        $retorno['msg'][] = "O campo mensagem precisa está vazio";
       
		if (count($retorno) > 0)
		   $retorno['msg'] = implode('<br/>', $retorno['msg']);
        return $retorno;
	}
}
// ===================================================================