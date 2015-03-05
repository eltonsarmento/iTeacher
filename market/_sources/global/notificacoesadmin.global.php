<?php
// ===================================================================
class NotificacoesadminGlobal extends AdminModules{
	// ===============================================================
	public function __construct(&$system) {
		parent::__construct($system);
		$this->system->load->dao('notificacoes');
		$this->system->load->dao('alunos');
		$this->system->load->dao('cursos');
		$this->system->load->model('email_model');
	}
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			case 'nova': 	$this->doEdicao(); break;
			case 'editar': 	$this->doEdicao(); break;
			case 'buscar': 	$this->doListar(); break;
			case 'listar': 	$this->doListar(); break;
			case 'buscarNotificacao': 	$this->doBuscarNotificacao(); break;		
			case 'apagar': 	$this->doDeletar(); break;
			default: $this->pagina404(); break;
		}
	}
	// ===============================================================
	protected function validarDados() {
		//Titulo
        if ($this->system->input['titulo'] == '' )
        	$retorno['msg'][] = "O campo título deve ser preenchido";
        //Destinatario
        //if (($this->system->input['destinatario_nivel'] == 0) && ($this->system->admin->getCategoria() != 'professor'))
        //	$retorno['msg'][] = "O campo destinatário deve ser preenchido";
        //Curso
        if ($this->system->input['destinatario_nivel'] == 2 && count($this->system->input['cursos']) == 0)
        	$retorno['msg'][] = "O campo cursos deve ter uma opção selecionada";
		//Conteudo
        if ($this->system->input['conteudo'] == '' )
        	$retorno['msg'][] = "O campo notificação deve ser preenchido";
		if (count($retorno) > 0)
		   $retorno['msg'] = implode("<br/>",$retorno['msg']);
        return $retorno;
	}
	// ===============================================================
	protected function doListar() {
		$this->listagem();
		$this->system->admin->topo('notificacoes','notificacoes-listar');
		$this->system->view->display('global/todas_as_notificacoes.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	private function listagem() {
		$palavra = $this->system->input['palavra_busca'];
		//if ($palavra) $this->system->session->deleteItem('palavra_busca');
		$notificacoes = $this->system->notificacoes->getNotificacoesGeral($palavra, $this->limit);
		$this->system->view->assign('notificacoes', $notificacoes);
		$this->system->view->assign('url_site', $this->system->getUrlSite());
	}
	// ===============================================================
	protected function doBuscarNotificacao() {
		$id = $this->system->input['id'];
		$notificacao = $this->system->notificacoes->getNotificacao($id);
		echo '<script>jQuery("#notificacaoTituloSpan").html("' . $notificacao['titulo'] . '")</script>';
		echo "<script>jQuery('#notificacaoConteudoSpan').html('" . $notificacao['conteudo']. "')</script>";
	}
	// ===============================================================
	private function doDeletar() {
		$id = intval($this->system->input['id']);
		if ($id) {
			$this->system->notificacoes->deletar($id);
			$this->system->view->assign('msg_alert', 'Notificação excluída com sucesso!');
		}
		$this->doListar();
	}
}
// ===================================================================

