<?php
// ===================================================================
class Carrinho {
	// ===============================================================
	protected $system = null;
	private $limit = '';
	
	// ===============================================================
	public function __construct(&$system) {
		$this->system = $system;
		$this->system->load->dao('cursos');
		$this->system->load->dao('cupons');
	}
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			case 'index': 			$this->doIndex(); break;			
			case 'utilizarCupom': 	$this->doUtilizarCupom(); break;
			case 'deletarCurso': 	$this->doDeletarCurso(); break;
			default: 				$this->pagina404(); break;						
		}	
	}
	// ===============================================================
	protected function doIndex() {
		$id_para_apagar = $this->system->input['curso_id']; 
		$curso_id = $this->system->input['parametro']; 
		if($curso_id)
			$curso = $this->system->cursos->getCursoSemSistemaId($curso_id,$campos = '*');
	
		
		//$this->system->session->deleteItem('carrinho_cursos');		
		$vCursos  = $this->system->session->getItem('carrinho_cursos');
		
		if(!empty($id_para_apagar)){
			foreach ($vCursos as $key => $curso) {	
				if($curso['id'] == $id_para_apagar){						
					$vCursos['valor_total'] -=  intval($curso['valor']);					
					$vCursos['total_carrinho']--;					
					unset($vCursos[$key]);
					$this->system->session->deleteItem('carrinho_cursos');
					$this->system->session->addItem('carrinho_cursos', $vCursos);										
				}
			}			
			
			die();
		}else{				
			$temNoCarrinho = 0;
			if(!empty($vCursos)){				
				foreach ($vCursos as $key => $cursos) {	
					//$vCursos['valor_total'] +=  $cursos['valor'];					
					if($curso['id'] == $cursos['id']){
						$temNoCarrinho = 1;								
					}				
						
				}
				
			}
			
			if((!$temNoCarrinho) or empty($vCursos)){
				if(!empty($curso)){
					$vCursos[$curso['id']] = $curso;
					$vCursos['total_carrinho']++;
					$vCursos['valor_total'] += intval($curso['valor']);
					$this->system->session->addItem('carrinho_cursos', $vCursos);		
				}
			}
		}
		$this->system->view->assign('cursos', $vCursos);		
		$this->system->view->assign('valor_total', ($vCursos['valor_total'] ? $vCursos['valor_total'] : '0'));
		$this->system->site->topo();
		$this->system->view->display('portal/carrinho.tpl');
		$this->system->site->rodape();
	}
	
	// ===============================================================
	protected function doUtilizarCupom() {
		$valorCupom = $this->system->input['valorCupom']; 
		if($valorCupom)
			$cupom = $this->system->cursos->
		echo "ok";		
	}
	// ===============================================================
	protected function pagina404() {
		$url = end(explode($this->system->getUrlSite(), $_SERVER['REQUEST_URI']));
		$this->system->view->assign('url', $url);
		$this->system->site->topo(0);
		$this->system->view->display('site/pagina404.tpl');
		$this->system->site->rodape();
	}
}
// ===================================================================