<?php
// ===================================================================
class AreasGlobal extends AdminModules {
	// ===============================================================
	public function __construct() {
		parent::__construct();
		$this->system->load->dao('areas');
	}
	// ===============================================================
	public function autoRun() {
	switch($this->system->input['do']) {
			case 'listar':
			case 'buscar':	$this->doListar(); break;
			case 'nova': 
			case 'editar': 	$this->doEdicao(); break;
			case 'apagar':	$this->doDeletar(); break;
			case 'salvar':	$this->doSalvarPosicoes(); break;		
			default: 		$this->pagina404(); break;
		}
	}
	// ===============================================================
	protected function doEdicao() {
		$id = intval($this->system->input['id']);
		$editar = intval($this->system->input['editar']);		
		if ($editar) {
			$this->system->input['url'] = $this->system->func->stringToUrl($this->system->input['area']);
			$erro_msg = $this->validarDados();
			if ($erro_msg) {
				$this->system->view->assign('msg_alert', $erro_msg['msg']);
			} 
			else {	
				if ($id) {
					$this->system->areas->atualizar($this->system->input);
					$this->system->view->assign('msg_alert', 'Área alterada com sucesso!');
					$this->doListar();
					die;
				}
				else {
					$id = $this->system->areas->cadastrar($this->system->input);
					$this->system->view->assign('msg_alert', 'Área cadastrada com sucesso!');
					$this->doListar();
					die;
				}
				$this->system->input = array();
				unset($id);
			}
			$this->system->view->assign('area', array(
			   	'id' 	=> $id,
			    'area' 	=> $this->system->input['area'],
			    'pai'	=> intval($this->system->input['area_pai_id']),
			));
		} 
		else {
			if ($id) {
	            $area = $this->system->areas->getArea($id);	            
			    $this->system->view->assign('area', array(
			    	'id' 	=> $area['id'],
				    'area' 	=> $area['area'],
				    'pai'	=> $area['area_pai_id'],
				));
			}
		}
		$this->limit = 0;
		$this->listagem();
		$this->system->view->assign('areas_pais', $this->system->areas->getAreasPais());
		$this->system->admin->topo($this->system->admin->posicoesMenusGlobais('areas'));
		$this->system->view->display('global/areas_edicao.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function validarDados() {
		$retorno = array();
        $categoria = $this->system->input['categoria'];
        $url = $this->system->input['url'];
        if($categoria == '') 
            $retorno['msg'][] = "O campo de categoria está vazio.";
        elseif (!$this->system->func->isUnique('areas', 'url', $url,  ' and excluido = 0 and sistema_id=' . $this->system->getSistemaID() . ($this->system->input['id'] ? ' and id != ' . $this->system->input['id'] : '')))
        	$retorno['msg'][] = "Já existe uma categoria com esse nome, por favor usar outro nome, pois as urls são os nomes das categorias.";
		if(count($retorno) > 0){
		   $retorno['msg'] = implode("<br/>",$retorno['msg']);
		}
        return $retorno;
	}
	// ===============================================================
	protected function doListar() {
		$this->listagem();
		$this->system->admin->topo('cursos', 'areas-listar');
		$this->system->view->display('global/areas_gerenciar.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function listagem() {
		$palavra = $this->system->session->getItem('palavra_busca');
		if ($palavra) $this->system->session->deleteItem('palavra_busca');
		$this->system->view->assign('areas', $this->system->areas->getAreas($palavra, $this->limit));
		//$this->system->view->assign('areas_pais', $this->system->areas->getAreasPais());
		
		$areas = array();
		foreach($this->system->areas->getAreasPais('ordem') as $key => $pais) {
			$areas[$key] = $pais;
			$editar = '../areas/editar/';
			$areas[$key]['filhas'] = $this->system->areas->getAreasFilhasPorPaiID($pais['id'], $editar);
		}
		
		$this->system->view->assign('areas_listagem', $areas);
		$this->system->view->assign('url_site', $this->system->getUrlSite());
	}
	// ===============================================================
	protected function doDeletar() {
		$id = intval($this->system->input['id']);
		$area = $this->system->areas->getArea($id);
		if ($area['id']) {
			$this->system->areas->deletar($id);	
			$this->system->view->assign('msg_alert', 'Área ' . $area['area'] . ' excluída com sucesso');
		}
		$this->doListar();
		die;
	}
	// ===============================================================
	private function parseJsonArray($jsonArray, $parentID = 0) {
		$return = array();
		foreach ($jsonArray as $subArray) {
			$returnSubSubArray = array();
			if (isset($subArray['children']))
				$returnSubSubArray = $this->parseJsonArray($subArray['children'], $subArray['id']);
			$return[] = array('id' => $subArray['id'], 'area_pai_id' => $parentID);
			$return = array_merge($return, $returnSubSubArray);
		}
		return $return;
	}
	// ===============================================================
	protected function doSalvarPosicoes() {
		$posicoes = trim($_POST['posicoes']);
		if ($posicoes) {
			$posicoes_array = json_decode($posicoes, true, 64);
			$array_final = $this->parseJsonArray($posicoes_array);
			foreach ($array_final as $ordem => $area) {
				if (is_array($area))
					$this->system->areas->salvarPaiID($area['id'], $area['area_pai_id'], $ordem);
			}
		}
	}
	// ===============================================================
}
// ===================================================================