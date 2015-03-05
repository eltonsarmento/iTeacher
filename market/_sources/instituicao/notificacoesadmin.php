<?php
require(dirname(__FILE__).'/../global/notificacoesadmin.global.php');
// ===================================================================
class Notificacoesadmin extends NotificacoesadminGlobal{

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
				//Salvar
				if ($id) {
					$this->system->notificacoes->atualizar($this->system->input, 2);
					$this->system->view->assign('msg_alert', 'Notificação atualizada com sucesso!');
					$this->doListar();
					exit();
				}
				else {
					$id = $this->system->notificacoes->cadastrar($this->system->input, 2);
					$this->system->view->assign('msg_alert', 'Notificação cadastrada com sucesso!');
					//$this->system->email_model->envioNotificacoes($this->system->input['titulo'], $this->system->input['conteudo'], $this->system->input['destinatario_nivel'], $this->system->input['cursos']);
					$this->doListar();
					exit();
				}

				if (!$this->system->input['nova']) 
					$this->system->func->redirecionar('/notificacoesadmin/nova/');
				else 	
					$this->doListar();
					exit();	
			}
		} else {
			//Carregar conteudo
			if ($id) 
			    $this->system->view->assign('notificacao', $this->system->notificacoes->getNotificacao($id));
		}

		$this->system->view->assign('administrador', false);
		$this->system->view->assign('cursos', $this->system->cursos->getCursos());
		$this->system->admin->topo('notificacoes','notificacoes-nova');
		$this->system->view->display('global/notificacao_edicao.tpl');
		$this->system->admin->rodape();
	}
}
// ===================================================================
