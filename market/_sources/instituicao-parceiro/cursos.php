<?php
require(dirname(__FILE__).'/../global/cursos.global.php');
// ===================================================================
class Cursos extends CursosGlobal {
	// ===============================================================
	public function autoRun() {
		parent::autoRun();
   	}
   	// ===============================================================
   	protected function doListar() {
		$sql = "and usuario_id = '".$this->system->session->getItem('session_cod_usuario')."'";
		$cursos = $this->system->cursos->getCursosCondicao($sql);
		foreach ($cursos as $key => $curso) {
			//Professor
			$professor = $this->system->professores->getProfessor($curso['professor_id']);
			$cursos[$key]['professor'] = $professor['nome'];
			//Categorias
			$categorias = $this->system->cursos->getAreasByCurso($curso['id']);
			$cursos[$key]['categorias'] = $categorias;
			//Alunos
			$cursos[$key]['alunos'] = $this->system->cursos->getTotalAlunos($curso['id']);
			//Quiz
			$cursos[$key]['qt_quiz'] = $this->system->quiz->getTotalQuiz($curso['id']);
		}
		
		$this->system->view->assign('usuario_nivel', $this->system->session->getItem('session_nivel'));
		$this->system->view->assign('cursos', $cursos);
		$this->system->view->assign('url_site', $this->system->getUrlSite());
		$this->system->admin->topo('cursos','cursos-listar');
		$this->system->view->display('global/cursos_gerenciar.tpl');
		$this->system->admin->rodape();
	}
}
// ===================================================================