<?php
require_once(dirname(__FILE__).'/../global/certificados.global.php');
// ===================================================================
class Certificados extends CertificadosGlobal {
	// ===============================================================
	public function autoRun() {
		$this->system->view->assign('categoria', $this->system->admin->getCategoria());
		switch($this->system->input['do']) {
			case 'listar': 			$this->doListar(); break;
			case 'certificado': 	$this->doCertificado(); break;
			default: 				$this->pagina404(); break;
		}
	}

	// ===============================================================
	protected function doListar() {
		$sql = ' AND aluno_id = ' . $this->system->session->getItem('session_cod_usuario');
		$certificados = $this->system->certificados->getCertificados($palavra, $limit, $sql);
		$this->system->view->assign('certificados', $certificados);
		$this->system->admin->topo('certificados');
		$this->system->view->display('aluno/certificados.tpl');
		$this->system->admin->rodape();
	}
	// ================================================================
	public function doCertificado() {
		$matriculaID = $this->system->input['id'];
		$usuarioId = $this->system->session->getItem('session_cod_usuario');
		$cursoAluno = end($this->system->cursos->getCursosAlunos(" and usuario_id = '" . $usuarioId . "' and id = '" . $matriculaID . "'", '', '', false));
		
		if (!$cursoAluno['id']) $this->system->func->redirecionar('/cursos/listar');
		$curso = $this->system->cursos->getCurso($cursoAluno['curso_id']);
		
		//gera o certificado se não tiver gerado
		$this->system->certificados_model->gerarCertificado($matriculaID);
		$certificadoDigital = $this->system->certificados->getCertificadoCondicao(' and matricula_curso_id = ' . $matriculaID . ' and tipo_certificado = 1');
		$certificadoConfiguracao = $this->system->configuracoesgerais->getCertificadoCompleto();
		
		// recupera a frase do certificado e substitui os shortcodes
		$fraseInicialCertificado  = $certificadoConfiguracao['texto'];	
		$shortcodes = array("[[aluno_nome]]", "[[curso_nome]]", "[[data_conclusao]]","[[carga_horaria]]");
		$substitui   = array($certificadoDigital['aluno_nome'], $curso['curso'],date('d/m/Y', strtotime($certificadoDigital['data_solicitacao'])), $certificadoDigital['carga']);
		$fraseFinalCertificado = str_replace($shortcodes, $substitui, $fraseInicialCertificado);
		
		if ($certificadoDigital['id']) {
			//Gera o PDF
			$this->system->view->assign(array(
				'assinatura'		=> $certificadoConfiguracao['img_assinatura'],
				'autenticacao'		=> $certificadoConfiguracao['autenticacao'],
				'url_site'			=> $this->system->getUrlSite(),
				'data_emissao'	  	=> date('d', strtotime($certificadoDigital['data_emissao'])) . ' de ' . utf8_encode($this->system->arrays->getMes(date('m', strtotime($certificadoDigital['data_emissao'])))) . ' de ' . date('Y', strtotime($certificadoDigital['data_emissao'])),
				'frase_certificado' => $fraseFinalCertificado,
			));
			//Modelo Runrun
			if ($certificadoDigital['curso_id'] == 78) {
				$html = $this->system->view->fetch('global/modelo_certificado_runrun.tpl');
			} else { //Modelo Padrão	
				$html = $this->system->view->fetch('global/modelo_certificado.tpl');
			}
			$this->system->func->htmlToPdf($html, 'A4-L', true);
		} else {
			$this->system->session->addItem('msg_alert', 'Certificado não disponível. Certifique-se que completou a carga mínima de ' . $certificadoConfig['certificado_porcentagem'] . '% para obter o certificado!');
			$this->system->func->redirecionar('/cursos/verCurso/' . $matriculaID);		
		}
	}
	// ===============================================================
}
// ===================================================================