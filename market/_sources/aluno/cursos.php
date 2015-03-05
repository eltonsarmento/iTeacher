<?php
require(dirname(__FILE__).'/../global/cursos.global.php');
// ===================================================================
class Cursos extends CursosGlobal {
	
	
	// ===============================================================
	public function autoRun() {
		switch($this->system->input['do']) {
			case 'listar':
			case 'buscar': 			$this->doListar(); break;
			case 'verCurso': 		$this->doVerCurso(); break;
			case 'avancar': 		$this->doAvancar(); break;
			case 'aula': 			$this->doAula(); break;
			case 'buscarLink':		$this->doBuscarLink(); break;
			case 'duvida':			$this->doDuvida(); break;
			case 'estatisticas':	$this->doEstatisticas(); break;
			case 'aulaByCapitulo':	$this->doAulaPorCapitulo(); break;
			default: 				$this->pagina404(); break;
		}
   	}
   	// ===============================================================

   	protected function doListar() {
   		$cursos = $this->system->cursos->getCursosByAluno($this->system->session->getItem('session_cod_usuario'), $palavra);		
		$concluidos = array();
		$andamento = array();
		//$certificado = $this->system->configuracoesgerais->getProdutosCertificados();
		foreach ($cursos as $curso) {
			//ultima aula
			$ultimaAula = $this->system->aulas->getAula($curso['ultima_aula']);
			if ($ultimaAula['aula_id']) $curso['aula'] = $ultimaAula['nome'];
			//professor
			$professor = $this->system->professores->getProfessor($curso['professor_id']);
			if ($professor['id']) $curso['professor'] = $professor['nome'];
			//ultimo acesso N/a
			if($curso['ultimo_acesso'] == "0000-00-00") $curso['ultimo_acesso'] = "";
			//porcentagem
			if ($curso['aulas_assistidas']) {
				$curso['porcentagem'] = round(($curso['aulas_assistidas']/$curso['aulas_total'])*100);
			} 
			else { 
				$curso['porcentagem'] = 0;
			}
			if ($curso['aulas_assistidas'] >= $curso['aulas_total'])
				$concluidos[] = $curso;
			else 
				$andamento[] = $curso;
		}
		$this->system->view->assign(array(
			'url_site'		=> 	$this->system->getUrlSite(),
			'concluidos'	=>	$concluidos,
			'andamento'		=>	$andamento,
			'certificado'	=> ($certificado['produtos_certificado_tipo'] == 0 ? false: true)
		));
   		$this->system->admin->topo('cursos');
   		$this->system->view->display('aluno/listar_cursos.tpl');
   		$this->system->admin->rodape();
   	}

   	// ===============================================================
	private function doAvancar() {
		$aulaId = $this->system->input['id'];
		$cursoId = $this->system->aulas->getCursoIdByAula($aulaId);
		$relacionamentoId = $this->verificaAcessoCurso(0, $cursoId);
		$usuarioId = $this->system->session->getItem('session_cod_usuario');

		if (!$this->system->aulas->checarAulaLiberada($aulaId, $relacionamentoId)) {
			$this->system->session->addItem('msg_alert', 'Essa aula ainda não está liberada. Para libera-la complete as aulas anteriores!');
			$this->system->func->redirecionar('/cursos/verCurso/' . $relacionamentoId);
		}

		$this->system->aulas->liberarAvancar($aulaId, $relacionamentoId);
		//verifica se existe quiz
		$quiz = $this->system->quiz->getQuizCondicao("and aula_id = '" . $aulaId .  "'");
		if ($quiz['id']) {
			$this->system->func->redirecionar('/cursos/quiz/' . $aulaId);
		}
		else {
			//conclui aula
			$this->system->aulas->concluiAula($aulaId, $relacionamentoId);
			//libera e avança para proxima aula
			$proximaAula = $this->system->aulas->buscarProximaAula($cursoId, $aulaId);
			if ($proximaAula) {
				//checa se esta liberada
				if (!$this->system->aulas->checarAulaLiberada($proximaAula, $relacionamentoId)) 
					$this->system->aulas->liberarAula($proximaAula, $relacionamentoId, $usuarioId);	

				$this->system->func->redirecionar('/cursos/aula/' . $proximaAula);
			} 
			else {
				//não existe proxima aula
				$this->system->session->addItem('msg_alert', 'Curso concluído!');
				$this->system->func->redirecionar('/cursos/verCurso/' . $relacionamentoId);		
			}	
		}
	}
	// ===================================================================

   	private function doVerCurso() {
		$relacionamentoId = $this->system->input['id'];
		$usuarioId = $this->system->session->getItem('session_cod_usuario');
		$this->verificaAcessoCurso($relacionamentoId);

		$this->system->cursos->atualizarCursoAluno(array('ultimo_acesso' => date('Y-m-d')), $relacionamentoId);
		//msg_alert

		$msg_alert = $this->system->session->getItem('msg_alert');
		$this->system->session->deleteItem('msg_alert');

		//curso
		$cursoAluno = end($this->system->cursos->getCursosAlunos(" and usuario_id = '" . $usuarioId . "' and id = '" . $relacionamentoId . "'"));
		$curso = $this->system->cursos->getCurso($cursoAluno['curso_id']);
		//professor
		$professor = $this->system->professores->getProfessor($curso['professor_id']);
		$professor['minicurriculo'] = $this->system->professores->getValorExtra($professor['id'], 'minicurriculo');
		//porcentagem
		$totalAulas = $this->system->aulas->countAulasCurso($curso['id']);
		$aulasAssistidas = $this->system->aulas->countAulasAssistidas($relacionamentoId);
		$totalQuizRespondido = $this->system->aulas->countQuizRespondido($relacionamentoId);
		if ($aulasAssistidas)
			$completo = ($aulasAssistidas/$totalAulas)*100;
		else 
			$completo = 0;
		//gerar certificado se atingiu o minimo para obter o certificado.
		$certificadoConfig = $this->system->configuracoesgerais->getCertificadoPorcentagem();
		if(!empty($certificadoConfig['id'])){
			if ($completo >= $certificadoConfig['percentual_conclusao']) {
				if($curso['certificado'])
					$this->system->certificados_model->gerarCertificado($relacionamentoId);
			}
		}
		// duvida
		$totalDuvidas = $this->system->duvidas->countTotalDuvidas("and aluno_id = '" . $usuarioId . "' and curso_id = '" . $curso['id'] . "'");
		$totalDuvidasRespondidas = $this->system->duvidas->countTotalRespondida(" and aluno_id = '" . $usuarioId . "' and curso_id = '" . $curso['id'] . "'");	
		//aulas
		//caso não tenha aula cadastradas (Primeiro acesso), cadastra a primeira aula como aula atual
		if ($this->system->cursos->primeiroAcessso($relacionamentoId)) {
			$proximaAula = $this->system->aulas->buscarProximaAula($curso['id'], 0);
			if ($proximaAula)
				$this->system->aulas->liberarAula($proximaAula, $relacionamentoId, $usuarioId);
		}
		$aulasCompletadas = $this->system->aulas->obterAulasCompletadas($relacionamentoId);
		//Buscar aulas de Materias Extras (Liberar)
		$aulasExtras = $this->system->aulas->getAulas(" and curso_id = '" . $curso['id'] . "' and tipo = 5");
		foreach ($aulasExtras as $aulaExtra)  {
			if (!in_array($aulaExtra['aula_id'], $aulasCompletadas)) {
				$this->system->aulas->liberarAula($aulaExtra['aula_id'], $relacionamentoId, $usuarioId);
				$this->system->aulas->liberarAvancar($aulaExtra['aula_id'], $relacionamentoId);
				$this->system->aulas->concluiAula($aulaExtra['aula_id'], $relacionamentoId);
				$aulasCompletadas[] = $aulaExtra['aula_id'];
			}
		}

		$aulaAtual = $this->system->aulas->obterAulaAtual($relacionamentoId);
		//capitulos/aulas
		$capitulos = $this->system->aulas->getCapitulosByCurso($curso['id']);
		foreach ($capitulos as $key=>$capitulo) {
			$status = 0; //Não visto
			//atual
			foreach ($capitulo['aulas'] as $aula) {
				if ($aula['aula_id'] == $aulaAtual) {
					$status = 1;//atual
					break;
				}
			}

			if ($status == 0) {
				foreach ($capitulo['aulas'] as $aula) {
					if (in_array($aula['aula_id'], $aulasCompletadas)) {
						$status = 2;//visto
						break;
					}
				}
			}
			$capitulos[$key]['status'] = $status;
		}
		$this->system->view->assign(array(
			'url_site'					=> $this->system->getUrlSite(),
			'curso'						=> $curso,
			'cursoAluno'				=> $cursoAluno,
			'capitulos' 				=> $capitulos,
			'professor'					=> $professor,
			'completo' 					=> round($completo),
			'faltando'					=> round(100 - $completo),
			'aulasCompletadas' 			=> $aulasCompletadas,
			'aulaAtual'					=> $aulaAtual,
			'msg_alert'					=> $msg_alert,
			'totalQuizRespondido'		=> $totalQuizRespondido,
			'totalDuvidas'				=> $totalDuvidas,
			'totalDuvidasRespondidas' 	=> $totalDuvidasRespondidas
		));
		$this->system->admin->topo('cursos');
		$this->system->view->display('aluno/curso.tpl');
		$this->system->admin->rodape();
	}
	// ==============================================================//
	private function doAula() {
		$aulaId = $this->system->input['id'];
		$cursoId = $this->system->aulas->getCursoIdByAula($aulaId);
		$relacionamentoId = $this->verificaAcessoCurso(0, $cursoId);
		$usuarioId = $this->system->session->getItem('session_cod_usuario');
		if ($this->system->cursos->primeiroAcessso($relacionamentoId)) {
			$proximaAula = $this->system->aulas->buscarProximaAula($cursoId, 0);
			if ($proximaAula)
				$this->system->aulas->liberarAula($proximaAula, $relacionamentoId, $usuarioId);
		}
		if (!$this->system->aulas->checarAulaLiberada($aulaId, $relacionamentoId)) {
			$this->system->session->addItem('msg_alert', 'Essa aula ainda não está liberada. Para libera-la complete as aulas anteriores!');
			$this->system->func->redirecionar('/cursos/verCurso/' . $relacionamentoId);
		}
		$this->system->cursos->atualizarCursoAluno(array('ultima_aula' => $aulaId), $relacionamentoId);
		$cursoAluno = end($this->system->cursos->getCursosAlunos(" and id = '" . $relacionamentoId . "'"));
		//Lista Aulas
		$capitulos = $this->system->aulas->getCapitulosByCurso($cursoId);
		//curso
		$curso = $this->system->cursos->getCurso($cursoId);
		//Aula Atual
		$aula = $this->system->aulas->getAula($aulaId);	
		if ($aula['tipo'] == 1) { //video aula
			if ($curso['servidor'] == 1)//amazon
				$aula['video'] = $aula['amazon'];
			elseif ($curso['servidor'] == 2)
				$aula['video'] = $aula['vimeo'];
			else {
				$this->system->load->dao('configuracoesgerais');
				$servidor = $this->system->configuracoesgerais->getServidor();
				if ($servidor['servidor_padrao'] == 1) 	//amazon
					$aula['video'] = $aula['amazon'];
				else  									//vimeo
					$aula['video'] = $aula['vimeo'];	
			}
			$aula['video'] = base64_encode(urldecode($aula['video']));
		} elseif ($aula['tipo'] == 2 || $aula['tipo'] == 3) { //ppt ou pdf
			$aula['arquivo'] = $aula['amazon'];
		} elseif ($aula['tipo'] == 4 || $aula['tipo'] == 5) { //texto ou materias extras
			// trabalha com o resumo
		}
		//Bloquear aula por tempo
		$bloqueio['bloqueado'] = false;
		if ($aula['tipo'] == 1) {
			$cursoAlunoAula = $this->system->aulas->getAulaAluno($aulaId, $relacionamentoId);
			if ($cursoAlunoAula['liberar_avancar'] == 0) {
				$bloqueio['bloqueado'] = true;
				list($horas, $minutos, $segundos) = explode(':', $aula['duracao']);
				$bloqueio['tempo'] = 0;
				$bloqueio['tempo'] += intval($segundos) * 1000;
				$bloqueio['tempo'] += intval($minutos) * 60 * 1000;
				$bloqueio['tempo'] += intval($horas) * 60 * 60 * 1000;
				$bloqueio['link'] = base64_encode(urldecode($this->system->getUrlSite() . 'lms/aluno/cursos/avancar/' . $aula['aula_id']));
			}
		}
		//porcentagem
		$totalAulas = $this->system->aulas->countAulasCurso($cursoId);
		$aulasAssistidas = $this->system->aulas->countAulasAssistidas($relacionamentoId);
		if ($aulasAssistidas)
			$porcentagem = ($aulasAssistidas/$totalAulas)*100;
		else 
			$porcentagem = 0;
		/*$certificadoConfig = $this->system->configuracoesgerais->getCertificadoPorcentagem();
		if ($porcentagem >= $certificadoConfig['certificado_porcentagem']) {
			$this->system->certificados_model->gerarCertificado($relacionamentoId);
		}
		*/
		//capitulo a aulas anteriores/proximas
		$capitulo = $this->system->cursos->getCapitulo($aula['capitulo_id']);
		$aulaAnterior = $this->system->aulas->buscarAulaAnterior($cursoId, $aulaId);
		$proximaAula = $this->system->aulas->buscarProximaAula($cursoId, $aulaId);
			
		$this->system->view->assign(array(
			'url_site'			=> $this->system->getUrlSite(),
			'capitulo' 			=> $capitulo,
			'capitulos' 		=> $capitulos,
			'aula'				=> $aula,
			'curso'				=> $curso,
			'relacionamentoId'	=> $relacionamentoId,
			'aulaAnterior'		=> $aulaAnterior,
			'proximaAula'		=> $proximaAula,
			'linkAvancar'		=> base64_encode(urldecode($this->system->getUrlSite() . 'market/aluno/cursos/avancar/' . $aula['aula_id'])),
			'suporte'			=> $cursoAluno['suporte'],
			'porcentagem'		=> round($porcentagem),
			'bloqueio'			=> $bloqueio,
			'matricula_curso'   => $cursoAluno['id']
		));

		$this->system->admin->topo('cursos');
		$this->system->view->display('aluno/aula.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	private function verificaAcessoCurso($relacionamento = 0, $curso = 0) {
		$usuarioId = $this->system->session->getItem('session_cod_usuario');
		if ($relacionamento) {
			if ($this->system->cursos->checarCursoAtivo($relacionamento, $usuarioId)){
				return $relacionamento;
			}
			$this->system->func->redirecionar('/cursos/listar');
			exit();
		} elseif ($curso) {
			$cursoAluno = end($this->system->cursos->getCursosAlunos(" and curso_id = '" . $curso . "' and usuario_id = '" . $usuarioId . "'"));

			if ($cursoAluno['id'])
				return $cursoAluno['id'];
		}

		$this->system->func->redirecionar('/cursos/listar');
		exit();
	}
	// ==============================================================
	private function doBuscarLink() {
		$aula = $this->system->input['aula_id'];
		echo base64_encode(urldecode($this->system->getUrlSite() . 'market/aluno/cursos/avancar/' . $aula));
	}
	// ===============================================================
	private function doDuvida() {
		$relacionamentoId = $this->system->input['id'];
		$usuarioId = $this->system->session->getItem('session_cod_usuario');
		$titulo = $this->system->input['titulo'];
		$duvida = $this->system->input['duvida'];
		$id_capitulo = $this->system->input['capitulo'];
		$id_aula = $this->system->input['aula'];
		$enviar = $this->system->input['enviar'];
		if ($enviar) {
			$this->system->load->dao('duvidas');
			$cursoAluno = end($this->system->cursos->getCursosAlunos(" and usuario_id = '" . $usuarioId . "' and id = '" . $relacionamentoId . "'"));
			if ($cursoAluno['id']) {
				$curso = $this->system->cursos->getCurso($cursoAluno['curso_id']);
				$campos['titulo'] 		= $titulo;
				$campos['curso_id'] 	= $curso['id'];
				$campos['professor_id'] = $curso['professor_id'];
				$campos['capitulo_id'] 	= $id_capitulo;
				$campos['aula_id'] 		= $id_aula;
				$campos['comentario'] 	= $duvida;
				
				$this->system->duvidas->cadastrar($campos);
				echo "Duvida cadastrada com sucesso!";
			}			
		}
	}
	// ===============================================================
	protected function doAulaPorCapitulo() {
		$id = $this->system->input['id'];
		$sql = " and capitulo_id = '".$id."'";
		$aulas = $this->system->aulas->getAulas($sql);
		echo json_encode($aulas);
	}
	// ===============================================================
	protected function doEstatisticas() {
		$cursos = $this->system->cursos->getCursosByAluno($this->system->session->getItem('session_cod_usuario'), $palavra);		
		foreach ($cursos as $key => $curso) {	
			$relacionamentoId = end($this->system->cursos->getCursosAlunos(" and curso_id = '" .$curso['curso_id']. "' and usuario_id = '" . $this->system->session->getItem('session_cod_usuario') . "'"));
			$totalAulas = $this->system->aulas->countAulasCurso($curso['curso_id']);
			$aulasAssistidas = $this->system->aulas->countAulasAssistidas($relacionamentoId['id']);			
			$cursos[$key]['porcentagem'] = $aulasAssistidas/$totalAulas * 100;
			$cursos[$key]['aulas_assistidas'] = $aulasAssistidas;
		}
		$this->system->view->assign('cursos', $cursos);
		$this->system->admin->topo('estatisticas');
		$this->system->view->display('aluno/estatisticas.tpl');
		$this->system->admin->rodape();
	}
}
// ===================================================================