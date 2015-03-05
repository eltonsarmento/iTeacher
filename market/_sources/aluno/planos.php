<?php

require_once(dirname(__FILE__).'/../global/planos.global.php');
// ===================================================================
class Planos extends PlanosGlobal {
	
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			case 'listar':	$this->doListar(); break;
			default: 		$this->pagina404(); break;
		}	
	}

	// ===============================================================
	private function doListar() {
		$this->listagem();
		$this->system->admin->topo('planos','planos-listar');
		$this->system->view->display('aluno/planos_listar.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	private function listagem() {		
		$aluno_id = $this->system->session->getItem('session_cod_usuario');
		$planos_alunos = $this->system->planos->getPlanosAluno("usuario_id = " . $aluno_id." ");
		if (!empty($planos_alunos)) {
			foreach ($planos_alunos as $key => $item) {
				$plano =  $this->system->planos->getPlano($item['plano_id']);				
				$planos_alunos[$key]['nome'] = $plano['plano'];
				$planos_alunos[$key]['meses'] = $plano['meses'];
				$tempoTermino = date('d/m/Y H:i:s', strtotime($planos_alunos[$key]['data_expiracao']));					
				$planos_alunos[$key]['data_periodo']   = $this->system->func->converteDataMysqlParaPhp($planos_alunos[$key]['data_periodo']);
				$planos_alunos[$key]['data_expiracao'] = $this->system->func->converteDataMysqlParaPhp($planos_alunos[$key]['data_expiracao']);
								
				if ($tempoTermino > date('d/m/Y H:i:s')) {
					$planos_alunos[$key]['status'] = 1;
				} 
				else {
					$planos_alunos[$key]['status'] = 0;
				}								
			}
		}
		$this->system->view->assign('planos', $planos_alunos);
		$this->system->view->assign('url_site', $this->system->getUrlSite());
	}
}	
// ===================================================================