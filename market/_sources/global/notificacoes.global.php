<?php
// ===================================================================
class NotificacoesGlobal {
	// ===============================================================
	protected $system = null;
	protected $redir = '';
	// ===============================================================
	public function __construct(&$system) {
		$this->system = $system;
		$this->system->load->dao('notificacoes');
	}
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			case 'listar': $this->doListar(); break;
			case 'ler': $this->doLer(); break;
			default: $this->pagina404(); break;
		}
	}	
	// ===============================================================
	protected function doListar() {
		$this->listagem();
		$this->system->admin->topo("notificacoes", "notificacoes-listar");
		$this->system->view->display('global/notificacoes_listar.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	private function listagem() {
		$notificacaoID = $this->system->input['id'];
		if ($notificacaoID) {
			$this->system->session->deleteItem('notificacoes_topo');
			$notificacao = $this->system->notificacoes->getNotificacao($notificacaoID);
			$this->system->notificacoes->marcarLida($notificacao['id']);

			$notificacoes[0] = $notificacao;
			$notificacoes[0]['resumo'] = utf8_decode(substr(strip_tags(html_entity_decode($notificacao['conteudo'])), 0, 200));
			$notificacoes[0]['conteudo'] = utf8_decode($notificacao['conteudo']);
			$notificacoes[0]['lida'] = true;
			$notificacoes[0]['remetente'] = $notificacao['titulo'];			
			$notificacoes[0]['data'] = date('d/m/Y H:i', strtotime($notificacao['data_hora']));
				
			$this->system->view->assign('notificacoes', $notificacoes);
			$this->system->view->assign('url_site', $this->system->getUrlSite());	
					
		}else{
			$vIDS = array();
			$id = $this->system->session->getItem('session_cod_usuario');		
			//notificacão aberta			
			if ($id) {				
				$notificacoes = $this->system->notificacoes->getNotificacoes($id);				
				if(!empty($notificacoes)){					
					foreach ($notificacoes as $key => $notificacao) {
						$vIDS[] = $notificacao->id; 						
						$notificacoes[$key]['resumo'] = utf8_decode(substr(strip_tags(html_entity_decode($notificacao['conteudo'])), 0, 200));
						$notificacoes[$key]['conteudo'] = utf8_decode($notificacao['conteudo']);	
						if(count($notificacoes) == ($key+1)){
							$notificacoesNaoLidas = $this->system->notificacoes->getNaoLidas($id);				
							foreach ($notificacoesNaoLidas['resultado'] as $key2 => $item){
								if(!in_array($item->id, $vIDS)){
									$notificacoes[$key+($key2+1)] = $item;
									$notificacoes[$key+($key2+1)]['conteudo'] = utf8_decode($item['conteudo']);	
									$notificacoes[$key+($key2+1)]['resumo'] = utf8_decode(substr(strip_tags(html_entity_decode($item['conteudo'])), 0, 200));
								}
							}						
						}				
					}
				}				
				$this->system->view->assign('notificacoes', $notificacoes);
				$this->system->view->assign('url_site', $this->system->getUrlSite());			
			}
		}
	}
	// ===============================================================
	protected function pagina404() {		
		$this->system->admin->topo(0);
		$this->system->view->display('global/pagina404.tpl');
		$this->system->admin->rodape();
	}

	// ===============================================================
	protected function doLer() {		
		$this->system->session->deleteItem('notificacoes_topo');
		$notificacao = $this->system->input['notificacao'];
		$conteudoNotificacao = array();
		$this->system->notificacoes->marcarLida($notificacao);
		$notificacao = $this->system->notificacoes->lerNotificacao($notificacao);
		//$this->system->session->deleteItem('notificacoes_topo');
		if ($notificacao['id']) {
			$conteudo = explode("\n", $notificacao['conteudo']);
			$msg = "";
			foreach ($conteudo as $linha) {
				$msg .=  $linha ;
			}
			$conteudoNotificacao['msg'] = $msg;
			$conteudoNotificacao['titulo'] = $notificacao['titulo'];
			echo json_encode($conteudoNotificacao);
			//echo "<script type='text/javascript'>jAlert(" . $msg . ",'" . $notificacao['titulo'] . "')</script>";
		}
	}
}
// ===================================================================
