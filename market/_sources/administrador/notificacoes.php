<?php
require(dirname(__FILE__).'/../global/notificacoesadmin.global.php');
// ===================================================================
class Notificacoes extends NotificacoesadminGlobal {

	// ===============================================================
	public function autoRun() {
		parent::autoRun();
	}
	// ===============================================================
	protected function doEdicao() {
		$id = intval($this->system->input['id']);
		$editar = intval($this->system->input['editar']);
		
		if ($editar) {
			$erro_msg = $this->validarDados();			
			if ($erro_msg) {
				$this->system->view->assign('msg_alert', $erro_msg['msg']);
				$this->system->view->assign('notificacao', $this->system->input);
			} else {				
				$nivel = $this->system->input['destinatario_nivel'];
				//Salvar
				if ($id){
					$this->system->notificacoes->atualizar($this->system->input, $nivel);
					$this->system->view->assign('msg_alert', 'Notificação atualizada com sucesso!');
					$this->doListar();
					exit();
				}
				else {
					$id = $this->system->notificacoes->cadastrar($this->system->input, $nivel);
					$this->system->view->assign('msg_alert', 'Notificação cadastrada com sucesso!');
					//$this->system->email_model->envioNotificacoes($this->system->input['titulo'], $this->system->input['conteudo'], $this->system->input['destinatario_nivel'], $this->system->input['cursos']);
					$this->doListar();
					exit();
				}

				if (!$this->system->input['nova']) 
					$this->system->func->redirecionar('/notificacoes/nova/');
				else 	
					$this->doListar();
					exit();
			}
		} else {
			//Carregar conteudo
			if ($id) 
			    $this->system->view->assign('notificacao', $this->system->notificacoes->getNotificacao($id));
		}
				
		$this->system->admin->topo('notificacoes','notificacoes-nova');
		$this->system->view->display('administrador/notificacoes_edicao.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function doListar() {
		$this->listagem();
		$this->system->admin->topo('notificacoes','notificacoes-listar');
		$this->system->view->display('administrador/notificacoes_gerenciar.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	private function listagem() {
		$palavra = $this->system->session->getItem('palavra_busca');
		if ($palavra) $this->system->session->deleteItem('palavra_busca');
		$notificacoes = $this->system->notificacoes->getNotificacoesAdm($palavra, $this->limit);
		$this->system->view->assign('notificacoes', $notificacoes);
		$this->system->view->assign('url_site', $this->system->getUrlSite());
	}
	// ===============================================================
	protected function doBuscarNotificacao(){
		$id = $this->system->input['id'];
		$notificacao = $this->system->notificacoes->getNotificacao($id);
		
		$conteudo =  htmlspecialchars_decode($notificacao['conteudo']);
	
		echo json_encode($conteudo);
		/*echo '<script>jQuery("#notificacaoTituloSpan").html("' . $notificacao['titulo'] . '")</script>';
		echo "<script>jQuery('#notificacaoConteudoSpan').html('" . $texto. "')</script>";*/
	}
}
// ===================================================================
