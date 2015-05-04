<?php
// ===================================================================
class CuponsGlobal extends AdminModules {
	// ===============================================================
	public function __construct() {
		parent::__construct();
		$this->system->load->dao('cupons');
		$this->system->load->dao('cursos');
		$this->system->load->dao('vendas');
	}
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			case 'home':
			case 'listar':
			case 'buscar':			$this->doListar();		break;
			case 'novo':
			case 'editar': 			$this->doEdicao(); 		break;
			case 'apagar': 			$this->doDeletar(); 	break;
			case 'relatorio':		$this->doRelatorio();	break;
			case 'consultaCupom':	$this->doRecuperarHistoricoDeCupom();	break;
			default:			$this->pagina404(); 	break;
		}	
	}
	// ===============================================================
	protected function doEdicao() {
		$id = intval($this->system->input['id']);
		$editar = intval($this->system->input['editar']);
		$cursos = $this->system->cursos->getCursos('', '', '', 'id ,curso');		
		if ($editar) {
			$erro_msg = $this->validarDados();
			if ($erro_msg) {
				$this->system->view->assign('msg_alert', $erro_msg['msg']);
				$this->system->view->assign('cupom', $this->system->input);
			} 
			else {
				if ($id) {
					
					$this->system->cupons->atualizar($this->system->input);
					$this->system->view->assign('msg_alert', 'Cupom atualizado com sucesso!');
				} 
				else {					

					$id = $this->system->cupons->cadastrar($this->system->input);
					$this->system->view->assign('msg_alert', 'Cupom cadastrado com sucesso!');
				}
				if ($this->system->input['nova']) 
					$this->system->func->redirecionar('/cupons/novo/');
				else 
					$this->system->func->redirecionar('/cupons/listar/');
			}
		} 
		else {
			if ($id){
				$this->system->view->assign('cupom', $this->system->cupons->getCupom($id));
			} 	    
		}
		//Listar conteudo cadastrado
		$this->system->view->assign('cursos', $cursos);
		$this->system->admin->topo(4);
		$this->system->view->display('global/cupons_edicao.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function validarDados() {
		$retorno = array();
		$id = intval($this->system->input['id']);
		if($this->system->input['nome'] == '') 
            $retorno['msg'][] = "O campo Nome está vazio.";
        elseif(!$this->system->func->isUnique('cupons', 'nome', $this->system->input['nome'], "and excluido = '0' " . ($id ? "and id != '" . $id .  "'" : ''))) 
			$retorno['msg'][] = "Já existe um cupom com esse nome.";
		if ($this->system->input['tipo'] == 0)
        	$retorno['msg'][] = "O campo Tipo está vazio";
		if ($this->system->input['tipo'] == 2) {
			if($this->system->input['tempo_de'] == '') 
				$retorno['msg'][] = "O campo Tempo De está vazio.";
			elseif (!$this->system->func->checkDate($this->system->input['tempo_de'], false))
				$retorno['msg'][] = "O campo Tempo De é inválido.";
			if($this->system->input['tempo_ate'] == '') 
				$retorno['msg'][] = "O campo Tempo Até está vázio.";
			elseif (!$this->system->func->checkDate($this->system->input['tempo_ate'], true))
				$retorno['msg'][] = "O campo Tempo Até é inválido.";
		}
		if ($this->system->input['tipo'] == 3) {
			if ($this->system->input['quantidade'] == '')
				$retorno['msg'][] = "O campo Quantidade está vazio";
		}
		if ($this->system->input['valor'] == '')
        	$retorno['msg'][] = "O campo Valor está vazio";
        if($this->system->input['cursos'] == '')
			$retorno['msg'][] = "O campo Curso Específico está vazio";	   		
		if (count($retorno))
		   $retorno['msg'] = implode('<br/>', $retorno['msg']);
        return $retorno;
	}
	// ===============================================================
	protected function doListar() {
		$this->listagem();
		$categoria = $this->system->admin->categoria;
		if($categoria == "professor-administrativo")
			$this->system->admin->topo('cupons');
		else
			$this->system->admin->topo('administrativos','cupons-listar');	
		$this->system->view->display('global/cupons_gerenciar.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function listagem() {
		$palavra = $this->system->input['palavra_busca'];
		$cupons = $this->system->cupons->getCupons($palavra);
		foreach ($cupons as $key => $cupom) {
			$cupons[$key]['utilizacao'] = $this->system->vendas->getUtilizacaoCupom($cupom['id']);
		}
		$this->system->view->assign('cupons', $cupons);
		$this->system->view->assign('url_site', $this->system->getUrlSite());
	}
	// ===============================================================
	protected function doDeletar() {
		$id = intval($this->system->input['id']);
		if ($id) {
			$this->system->cupons->deletar($id);
			$this->system->view->assign('msg_alert', 'Cupom excluído com sucesso!');
		}
		$this->doListar();
	}
	// ===============================================================
	protected function doRelatorio() {
		$this->system->view->assign('cupons', $this->system->cupons->relatorioUso());
		$this->system->admin->topo($this->system->func->posicoesMenusGlobais('cupons'));
		$this->system->view->display('global/cupons_relatorio.tpl');
		$this->system->admin->rodape();
	}
	//================================================================
	protected function doRecuperarHistoricoDeCupom() {
		//id do cupom
		$id = $this->system->input['id'];
		//recuperando vendas por aluno
		$usuarioByCupom = $this->system->cupons->consultaUsoCupom($id);

		echo json_encode($usuarioByCupom);
	}
}
// ===================================================================