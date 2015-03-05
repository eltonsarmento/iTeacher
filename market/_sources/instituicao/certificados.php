<?php
require_once(dirname(__FILE__).'/../global/certificados.global.php');
// ===================================================================
class Certificados extends CertificadosGlobal {
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			case 'editar': 		$this->doEdicao(); 	break;
			case 'listar': 			$this->doListar(); break;
			default: 			$this->pagina404(); break;
		}
   	}
	// ===============================================================
	protected function doListar() {
		//$sql = ' AND aluno_id = ' . $this->system->session->getItem('session_cod_usuario');
		$palavra = $this->system->input['palavra_busca'];

		$filtrar = $this->system->input['filtrar'];
		$de = $this->system->func->converteData($this->system->input['de']);
		$ate = $this->system->func->converteData($this->system->input['ate']);
		$vCurso = $this->system->input['cursos'];

		$dataMenos1Mes = date('d/m/Y', strtotime("-1 month"));
		$dataAtual = date('d/m/Y');
		
		if ($filtrar) {
			foreach ($vCurso as $key => $item) 
				$curso_id = $item;			
			
			if($de && $ate && $curso_id) {				
				$sql = " AND data_emissao BETWEEN '".$de."' AND '".$ate."' and curso_id = '".$curso_id."'";
				$certificados = $this->system->certificados->getCertificados($palavra,$limit,$sql);
			}elseif ($de && $ate && !$curso) {
				$sql = " AND data_emissao BETWEEN '".$de."' AND '".$ate."'";
				$certificados = $this->system->certificados->getCertificados($palavra,$limit,$sql);
			}

		}else{

			$certificados = $this->system->certificados->getCertificados($palavra, $limit, $sql);	
		}
		
		$this->system->view->assign('certificados', $certificados);
		$this->system->view->assign('palavra_busca', $palavra);
		$this->system->view->assign('dataAtual', $dataAtual);
		$this->system->view->assign('dataMenos1Mes', $dataMenos1Mes);
		$this->system->view->assign('cursos', $this->system->cursos->getCursos());		
		$this->system->admin->topo('certificados');
		$this->system->view->display('instituicao/certificados_gerenciar.tpl');
		$this->system->admin->rodape();
	}
}
// ===================================================================

