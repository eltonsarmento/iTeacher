<?php
// ===================================================================
class RelatoriosGlobal extends AdminModules {
	protected $mostrar = 10;
	// ===============================================================
	public function __construct() {
		parent::__construct();
		$this->system->load->dao('comprovantes');		
		$this->system->load->dao('alunos');
		$this->system->load->dao('areas');
		$this->system->load->dao('certificados');
		$this->system->load->dao('cursos');
		$this->system->load->dao('cupons');	
		$this->system->load->dao('vendas');
		$this->system->load->dao('financeiro');
		$this->system->load->dao('instituicoes');
		$this->system->load->dao('paginas');		
		$this->system->load->dao('parceiros');
		$this->system->load->dao('professores');
		$this->system->load->dao('usuarios');
		$this->system->load->dao('planos');

		$this->system->load->model('email_model');
	}
	// ===============================================================
	public function autoRun() {
    	switch($this->system->input['do']) {
    		//relatorio
    		case 'relatorio': 							$this->doGerarRelatorio(); break;
    		//Alunos
    		case 'aluno':								$this->doRelatorioAluno();	break;
    		case 'alunosNoDia': 						$this->doAlunosCadastradosByDia(); break;
    		case 'alunosRelatorioPdf': 					$this->doAlunosCadastradosPdf(); break;
    		case 'alunosRelatorioXls': 					$this->doAlunosCadastradosXls(); break;
    		case 'alunosRelatorioGerenciarPdf': 		$this->doAlunosGerenciarPdf(); break;    
    		case 'alunosRelatorioGerenciarXls': 		$this->doAlunosGerenciarXls(); break;        		

    		//Assinaturas
    		case 'assinaturas':							$this->doRelatorioAssinaturas();	break;  
    		case 'obterAlunosByPlano':					$this->doObterAlunosByPlano();	break;  
    		case 'assinaturasRelatorioPdf': 			$this->doAssinaturasCadastradosPdf(); break;
    		case 'assinaturasRelatorioXls': 			$this->doAssinaturasCadastradosXls(); break;    		
    		
    		//Vendas
    		case 'venda':								$this->doRelatorio();	break;
    		case 'carregaDadosVendaPorDia': 			$this->docarregaDadosVendaPorDia(); break;
			case 'carregaDadosVendaPorMes': 			$this->docarregaDadosVendaPorMes(); break;
			case 'carregaDadosVendaPorProdutos': 		$this->docarregaDadosVendaPorProdutos(); break;
			case 'carregaDadosVendaMaisVendidos': 		$this->docarregaDadosVendaPorMaisVendidos(); break;
			case 'carregaDadosVendaTopConsumidores': 	$this->docarregaDadosVendaTopConsumidores(); break;
			case 'carregaDadosVendaPorCategorias': 		$this->docarregaDadosVendaPorAreas(); break;
			case 'carregaDadosVendaCupons': 			$this->docarregaDadosVendaCupons(); break;
			case 'carregaDadosCertificados': 			$this->docarregaDadosCertificados(); break;
			case 'carregaDadosAssinatura':				$this->doCarregaDadosAssinatura(); break;
			case 'cursosByVenda': 						$this->doRecuperarCursoByIdVenda(); break;
			//Saques
			case 'saques':								$this->doRelatorioSaque(); break;
			case 'saquesRelatorioPdf':					$this->doSaquesEfetuadosPdf(); break;
			case 'saquesRelatorioXls':					$this->doSaquesEfetuadosXls(); break;
			//Cupons
			case 'cupons':								$this->doRelatorioCupons(); break;
			case 'cuponsRelatorioPdf':					$this->doCuponsCadastradosPdf(); break;
			case 'cuponsRelatorioXls':					$this->doCuponsCadastradosXls(); break;
			//Comprovantes
			case 'comprovantesRelatorioPdf':			$this->doRelatorioComprovantesPdf(); break;
			case 'comprovantesRelatorioXls':			$this->doRelatorioComprovantesXls(); break;
			//Instituicoes
			case 'instituicoes':						$this->doRelatorioInstituicao(); break;
			case 'buscarValoresInstituicao':			$this->doBuscarValoresInstituicao(); break;
			case 'instituicoesRelatorioGerenciarPdf': 	$this->doInstituicoesGerenciarPdf(); break;    
    		case 'instituicoesRelatorioGerenciarXls': 	$this->doInstituicoesGerenciarXls(); break;        		
    		//RepassesFinanceiros Instituições
    		case 'repassesFinanceirosGerenciarPdf': 	$this->doRepassesFinanceirosGerenciarPdf(); break;        		
    		case 'repassesFinanceirosGerenciarXls': 	$this->doRepassesFinanceirosGerenciarXls(); break;        		
    		//Professores
			case 'professores':							$this->doRelatorioProfessor(); break;
			case 'buscarValoresProfessor':				$this->doBuscarValoresProfessor(); break;
			case 'professoresRelatorioGerenciarPdf': 	$this->doProfessoresGerenciarPdf(); break;   			
    		case 'professoresRelatorioGerenciarXls': 	$this->doProfessoresGerenciarXls(); break;   
    		case 'professoresAutomonosGerenciarPdf': 	$this->doProfessoresAutomonosGerenciarPdf(); break;   			
    		//Certificados
    		case 'certificadoGerenciarPdf': 			$this->doCertificadoGerenciarPdf(); break;    
    		case 'certificadoGerenciarXls': 			$this->doCertificadoGerenciarXls(); break;   
    		//Cursos
			case 'cursos':								$this->doRelatorioCursos(); break;
			case 'buscarValoresCursos':					$this->doBuscarValoresCursos(); break;
			case 'cursosRelatorioGerenciarPdf': 		$this->doCursosGerenciarPdf(); break;    
    		case 'cursosRelatorioGerenciarXls': 		$this->doCursosGerenciarXls(); break;   

    		//default
			default: 									$this->pagina404(); break;
		}
	}

	// ===============================================================
	public function doRelatorioComprovantesPdf() {
		$comprovantes = $this->system->comprovantes->getComprovantes();
		$this->system->view->assign('comprovantes', $comprovantes);
		$html = $this->system->view->fetch('relatorios/comprovantes_cadastrados_pdf.tpl');
		$this->system->func->htmlToPdf($html);
	}
	// ===============================================================
	public function doRelatorioComprovantesXls() {
		$comprovantes = $this->system->comprovantes->getComprovantes();
		$this->system->view->assign('comprovantes', $comprovantes);
		$html = $this->system->view->fetch('relatorios/comprovantes_cadastrados_xls.tpl');
		
		header("Content-type: application/msexcel; charset=ISO-8859-1");
		header("Content-Disposition: attachment; filename=relatorioComprovantesCadastrados.xls");
		echo $html;
	}
	// ===============================================================
	private function  alunosCadastradosPorData($sql) {
		$lista_cadastro = array();
		$cadastros = $this->system->alunos->getCadastrosAlunos($sql);
		foreach($cadastros as $key => $cadastro) {
			$data = strtotime(substr($cadastro['data_cadastro'], 2,8));
			$dia = date('d/m/Y',$data);
			$lista_cadastro[$dia]++;
		}
		ksort($lista_cadastro);	
		$dadosAlunos = array(
			'total_alunos' 				=> $this->system->alunos->countAlunos(),
			'total_alunos_cadastros' 	=> $lista_cadastro
		);
		return $dadosAlunos;
	}
	// ===============================================================
	protected function doRelatorioAluno() {
		$filtrarPorData = $this->system->input['filtrar'];
		if ($filtrarPorData) {
			$dataDe = $this->system->func->converteData($this->system->input['de']);
			$dataAte = $this->system->func->converteData($this->system->input['ate']);
			$sql = " and data_cadastro between '".$dataDe."' and '".$dataAte."'";
			$dadosAlunos = $this->alunosCadastradosPorData($sql);			
			$this->system->view->assign($dadosAlunos);
			$this->system->view->assign('data_de', $dataDe);
			$this->system->view->assign('data_ate', $dataAte);	
		} 
		else {
			$sql = " and data_cadastro like '".date('Y-m')."%'";
			$dadosAlunos = $this->alunosCadastradosPorData($sql);		
			$this->system->view->assign($dadosAlunos);	
		}
		
		$this->system->admin->topo('relatorios','relatorios-aluno');
		$this->system->view->display('professor/relatorio_alunos.tpl');
		$this->system->admin->rodape();		
	}

	// ====================================================================================
	protected function doAlunosCadastradosByDia() {
		$data = $this->system->input['data_cadastro'];
		$alunos = $this->system->alunos->getAlunosByDia($data);
		echo json_encode($alunos);
	}
	//PDF
	// ====================================================================================	
	protected function doAlunosCadastradosPdf() {
		$dataDe = $this->system->input['data_de'];
		$dataAte = $this->system->input['data_ate'];
		if ($dataAte && $dataDe) {
			$sql = " and data_cadastro between '".$dataDe."' and '".$dataAte."'";
			$dadosAlunos = $this->alunosCadastradosPorData($sql);
			$this->system->view->assign($dadosAlunos);
			$this->system->view->assign('periodo1', $this->system->func->converteDataMysqlParaPhp($dataDe));
			$this->system->view->assign('periodo2', $this->system->func->converteDataMysqlParaPhp($dataAte));
			$this->system->view->assign('dir_site', $this->system->getRootPath());
			$html = $this->system->view->fetch('relatorios/alunos_cadastrados_pdf.tpl');
		}
		else {
			$sql = " and data_cadastro like '".date('Y-m')."%'";
			$dadosAlunos = $this->alunosCadastradosPorData($sql);
			$this->system->view->assign($dadosAlunos);
			$this->system->view->assign('dir_site', $this->system->getRootPath());
			$html = $this->system->view->fetch('relatorios/alunos_cadastrados_pdf.tpl');	
		}
		$this->system->func->htmlToPdf($html);
	}
	// ====================================================================================	
	protected function doAssinaturasCadastradosPdf() {
		$dataDe = $this->system->input['data_de'];
		$dataAte = $this->system->input['data_ate'];
		if ($dataAte && $dataDe) {
			$sqlExtra = " and pa.data_cadastro between '".$dataDe."' and '".$dataAte."'";
			$dadosAssinaturas = $this->system->planos->getPlanosRelatorio($sqlExtra);
			$this->system->view->assign('assinaturas',$dadosAssinaturas);
			$this->system->view->assign('periodo1', $this->system->func->converteDataMysqlParaPhp($dataDe));
			$this->system->view->assign('periodo2', $this->system->func->converteDataMysqlParaPhp($dataAte));
			$this->system->view->assign('dir_site', $this->system->getRootPath());
			$html = $this->system->view->fetch('relatorios/assinaturas_cadastrados_pdf.tpl');
		}
		else {
			$sqlExtra = " and pa.data_cadastro like '".date('Y-m')."%'";
			$dadosAssinaturas = $this->system->planos->getPlanosRelatorio($sqlExtra);
			$this->system->view->assign('assinaturas',$dadosAssinaturas);
			$this->system->view->assign('dir_site', $this->system->getRootPath());
			$html = $this->system->view->fetch('relatorios/assinaturas_cadastrados_pdf.tpl');	
		}
		$this->system->func->htmlToPdf($html);
	}
	// ===================================================================================
	protected function doSaquesEfetuadosPdf() {
		$dataDe = $this->system->input['data_de'];
		$dataAte = $this->system->input['data_ate'];
		$status = $this->system->input['status'];
		$sql = " and data between '".$dataDe."' and '".$dataAte."'";
		if ($dataAte && $dataDe) {
			if($status)
				$sql = " and status = '".$status."' and data between '".$dataDe."' and '".$dataAte."'";
			else
				$sql = " and data between '".$dataDe."' and '".$dataAte."'";
	
			$saquesEfetuados = $this->system->financeiro->getSaques($sql);	
			$this->system->view->assign('periodo1', $this->system->func->converteDataMysqlParaPhp($dataDe));
			$this->system->view->assign('periodo2', $this->system->func->converteDataMysqlParaPhp($dataAte));
			$this->system->view->assign('dir_site', $this->system->getRootPath());
		}
		else {
			$saquesEfetuados = $this->system->financeiro->getSaques();	
			$this->system->view->assign('periodo1', $this->system->func->converteDataMysqlParaPhp($dataDe));
			$this->system->view->assign('periodo2', $this->system->func->converteDataMysqlParaPhp($dataAte));
			$this->system->view->assign('dir_site', $this->system->getRootPath());
		}
		$this->system->view->assign('saques_efetuados', $saquesEfetuados);
		$html = $this->system->view->fetch('relatorios/saques_efetuados_pdf.tpl');
		$this->system->func->htmlToPdf($html);
	}
	// =================================================================================
	protected function doCuponsCadastradosPdf() {
		$tipo = $this->system->input['tipo_cupom'];
		$ativo = $this->system->input['ativo'];
		$palavra = $this->system->input['palavra_busca'];
		$cupons = $this->system->cupons->getCupons($palavra,'','t1.excluido = 0 and ','');
		if ($tipo && $ativo == "") {
			$cupons = $this->system->cupons->getCupons('','',"t1.tipo = '".$tipo."' and");	
			$this->system->view->assign('tipo', $tipo);
			$this->system->view->assign('ativo', $ativo);
		} 
		elseif ($ativo != "" && $tipo == "") {
			$cupons = $this->system->cupons->getCupons('','',"t1.ativo = '".$ativo."' and");	
			$this->system->view->assign('tipo', $tipo);
			$this->system->view->assign('ativo', $ativo);
		}
		elseif (($tipo) && ($ativo != "")) {
			$cupons = $this->system->cupons->getCupons('','',"t1.ativo = '".$ativo."' and t1.tipo = '".$tipo."' and");	
			$this->system->view->assign('tipo', $tipo);
			$this->system->view->assign('ativo', $ativo);
		}	
		foreach ($cupons as $key => $cupom) {
			$cupons[$key]['utilizacao'] = $this->system->vendas->getUtilizacaoCupom($cupom['id']);
		}
		
		$this->system->view->assign('cupons', $cupons);
		$html = $this->system->view->fetch('relatorios/cupons_cadastrados_pdf.tpl');
		$this->system->func->htmlToPdf($html);
	}
	// =================================================================================
	protected function doAlunosGerenciarPdf() {
		$palavra = $this->system->input['palavra_busca'];						
		$alunos = $this->system->alunos->getAlunos($palavra, 'padrao', $this->inicial . ',' . $this->mostrar);
		foreach ($alunos as $key => $aluno) {
			$alunos[$key]['cep'] = $this->system->alunos->getValorExtra($aluno['id'], 'cep');
			$alunos[$key]['endereco'] = $this->system->alunos->getValorExtra($aluno['id'], 'endereco');
			$alunos[$key]['bairro'] = $this->system->alunos->getValorExtra($aluno['id'], 'bairro');
			$alunos[$key]['cidade'] = $this->system->alunos->getValorExtra($aluno['id'], 'cidade');
			$alunos[$key]['estado'] = $this->system->alunos->getValorExtra($aluno['id'], 'estado');
			$alunos[$key]['cpf'] = $this->system->alunos->getValorExtra($aluno['id'], 'cpf');
			$alunos[$key]['telefone'] = $this->system->alunos->getValorExtra($aluno['id'], 'telefone');
		}
		$this->system->view->assign('alunos', $alunos);		
		$html = $this->system->view->fetch('relatorios/alunos_gerenciados_pdf.tpl');
		$this->system->func->htmlToPdf($html);
	}	

	// ===============================================================
	protected function doRelatorioAssinaturas() {
		$filtrarPorData = $this->system->input['filtrar'];

		if ($filtrarPorData) {
			$dataDe = $this->system->func->converteData($this->system->input['de']);
			$dataAte = $this->system->func->converteData($this->system->input['ate']);
			$sqlExtra = " and pa.data_cadastro between '".$dataDe."' and '".$dataAte."'";
			$dadosAssinaturas = $this->system->planos->getPlanosRelatorio($sqlExtra);			
			$this->system->view->assign('planos',$dadosAssinaturas);	
			$this->system->view->assign('data_de', $dataDe);
			$this->system->view->assign('data_ate', $dataAte);	
		} 
		else {
			$sqlExtra = " and pa.data_cadastro like '".date('Y-m')."%'";
			$dadosAssinaturas = $this->system->planos->getPlanosRelatorio($sqlExtra);			
			$this->system->view->assign('planos',$dadosAssinaturas);	
		}
		$this->system->view->assign('dataAtual', date('d/m/Y'));
		$this->system->admin->topo('relatorios','relatorios-assinaturas');
		$this->system->view->display('professor/relatorio_assinaturas.tpl');
		$this->system->admin->rodape();		
	}
	// ===============================================================
	protected function doObterAlunosByPlano() {
		$plano_id = $this->system->input['plano_id'];
		if ($plano_id) {
			$dadosAlunos = $this->system->planos->getUsuariosByPlano($plano_id);						
			echo json_encode($dadosAlunos);
		} 				
	}
	// =================================================================================
	protected function doInstituicoesGerenciarPdf() {
		$palavra = $this->system->input['palavra_busca'];								
		$instituicoes = $this->system->instituicoes->getInstituicoes($palavra,'padrao',$this->inicial . ',' . $this->mostrar, false);		
		foreach ($instituicoes as $key => $instituicao) {		
			$instituicoes[$key]['cnpj'] = $this->system->alunos->getValorExtra($instituicao['id'], 'cnpj');
			$instituicoes[$key]['telefone'] = $this->system->alunos->getValorExtra($instituicao['id'], 'telefone_responsavel');
			$instituicoes[$key]['nome_responsavel'] = $this->system->alunos->getValorExtra($instituicao['id'], 'nome_responsavel');
			$instituicoes[$key]['email_responsavel'] = $this->system->alunos->getValorExtra($instituicao['id'], 'email_secundario');
		}				
		$this->system->view->assign('instituicoes', $instituicoes);		
		$html = $this->system->view->fetch('relatorios/instituicoes_gerenciados_pdf.tpl');
		$this->system->func->htmlToPdf($html);
	}
	protected function doRepassesFinanceirosGerenciarPdf(){
		$palavra = $this->system->input['palavra_busca'];
		$repasses = $this->system->parceiros->getRepassesFinanceiros($palavra,$this->inicial, $this->mostrar,false);	
		$this->system->view->assign('repasses', $repasses);	
		$html = $this->system->view->fetch('relatorios/repasses_financeiros_gerenciados_pdf.tpl');
		$this->system->func->htmlToPdf($html);
	}
	// =================================================================================
	protected function doProfessoresGerenciarPdf() {
		$palavra = $this->system->input['palavra_busca'];								
		$professores = $this->system->professores->getProfessores($palavra,'padrao',$this->inicial . ',' . $this->mostrar, false);		
		foreach ($professores as $key => $professor) {		
			$professores[$key]['cep'] = $this->system->alunos->getValorExtra($professor['id'], 'cep');
			$professores[$key]['telefone'] = $this->system->alunos->getValorExtra($professor['id'], 'telefone');
			$professores[$key]['cpf'] = $this->system->alunos->getValorExtra($professor['id'], 'cpf');
			$professores[$key]['mes_atual'] = "Mês Atual";		
			$total_professor = $this->system->financeiro->getTotalByProfessor($professor['id'], $professor['nivel']);	
			$total_venda_mes = $this->system->financeiro->getTotalMesAtualProfessor($professor['sistema_id']);
			//recuperando o valor da venda total
			if ($total_professor)
				$professores[$key]['total'] = $total_professor;	
			else
				$professores[$key]['total'] = '0.00';	
			//recuperando o valor da venda total por mês
			if ($total_venda_mes)
				$professores[$key]['total_venda_mes'] = $total_venda_mes;
			else
				$professores[$key]['total_venda_mes'] = '0.00';
		}				
		$this->system->view->assign('professores', $professores);		
		$html = $this->system->view->fetch('relatorios/professores_gerenciados_pdf.tpl');
		$this->system->func->htmlToPdf($html);
	}
	// =================================================================================
	protected function doProfessoresAutomonosGerenciarPdf() {
		$palavra = $this->system->input['palavra_busca'];								
		$professores = $this->system->professores->getProfessoresAutonomos($palavra,'padrao',$this->inicial . ',' . $this->mostrar, false);		
		foreach ($professores as $key => $professor) {		
			$professores[$key]['cep'] = $this->system->alunos->getValorExtra($professor['id'], 'cep');
			$professores[$key]['telefone'] = $this->system->alunos->getValorExtra($professor['id'], 'telefone');
			$professores[$key]['cpf'] = $this->system->alunos->getValorExtra($professor['id'], 'cpf');
			$professores[$key]['mes_atual'] = "Mês Atual";		
			$total_professor = $this->system->financeiro->getTotalByProfessor($professor['id'], $professor['nivel']);	
			$total_venda_mes = $this->system->financeiro->getTotalMesAtualProfessor($professor['sistema_id']);
			//recuperando o valor da venda total
			if ($total_professor)
				$professores[$key]['total'] = $total_professor;	
			else
				$professores[$key]['total'] = '0.00';	
			//recuperando o valor da venda total por mês
			if ($total_venda_mes)
				$professores[$key]['total_venda_mes'] = $total_venda_mes;
			else
				$professores[$key]['total_venda_mes'] = '0.00';
		}				
		$this->system->view->assign('professores', $professores);		
		$html = $this->system->view->fetch('relatorios/professores_gerenciados_pdf.tpl');
		$this->system->func->htmlToPdf($html);
	}
	// =================================================================================
	protected function doCertificadoGerenciarPdf() {
		$palavra = $this->system->input['palavra_busca'];								
		$certificados = $this->system->certificados->getCertificados($palavra, $limit, $sql);

		$this->system->view->assign('certificados', $certificados);		
		$html = $this->system->view->fetch('relatorios/certificados_emitidos_pdf.tpl');
		$this->system->func->htmlToPdf($html);
	}	
	// =================================================================================
	protected function doCursosGerenciarPdf() {
		$cursos = $this->system->cursos->getCursosRelatorio($palavra,'padrao', '','', false);			
		foreach ($cursos as $key => $curso) {
			// get usuário que cadastrou o curso
			$cadastradoPor = $this->system->usuarios->getUsuario($curso['usuario_id'],false);
			if ($cadastradoPor['nivel'] == 3)
				$nivel = "Professor";
			elseif ($cadastradoPor['nivel'] == 5)
				$nivel = "Instituição";
			$cursos[$key]['nivel_usu_cadastrador'] = $nivel;
			$cursos[$key]['cadastrado_por'] = $cadastradoPor['nome'];
			// fim get usuário que cadastrou o curso
			// get vendas por curso
			$qtdVendasByCurso = $this->system->vendas->countVendasPorCurso($curso['id']);
			$cursos[$key]['vendas_deste_curso'] = $qtdVendasByCurso;
			// fim vendas por curso
			// get valor total das vendas do curso
			$valorTotalVendasCurso = $this->system->vendas->getValorTotalVendasPorCurso($curso['id']);
			$cursos[$key]['total_valor_venda'] = $valorTotalVendasCurso;
			// fim get valor total das vendas do curso
			// get areas do curso 
			$areasRelacionadasAoCurso = $this->system->cursos->getAreasByCurso($curso['id'],false, false);
			$cursos[$key]['areas_curso'] = $areasRelacionadasAoCurso;
			// fim get areas do curso
		}
		$this->system->view->assign('cursos', $cursos);		
		$html = $this->system->view->fetch('relatorios/cursos_cadastrados_pdf.tpl');
		$this->system->func->htmlToPdf($html);
	}
	//XLS - EXCEL
	// ===============================================================
	protected function doAlunosCadastradosXls() {
		$dataDe = $this->system->input['data_de'];
		$dataAte = $this->system->input['data_ate'];
		if ($dataAte && $dataDe) {
			$sql = " and data_cadastro between '".$dataDe."' and '".$dataAte."'";
			$dadosAlunos = $this->alunosCadastradosPorData($sql);
			$this->system->view->assign($dadosAlunos);
			$this->system->view->assign('periodo1', $this->system->func->converteDataMysqlParaPhp($dataDe));
			$this->system->view->assign('periodo2', $this->system->func->converteDataMysqlParaPhp($dataAte));
			$this->system->view->assign('dir_site', $this->system->getRootPath());
			$html = $this->system->view->fetch('relatorios/alunos_cadastrados_xls.tpl');
		}
		else {
			$sql = " and data_cadastro like '".date('Y-m')."%'";
			$dadosAlunos = $this->alunosCadastradosPorData($sql);
			$this->system->view->assign($dadosAlunos);
			$this->system->view->assign('data_atual', date(strtotime('d/m/Y')));
			$this->system->view->assign('dir_site', $this->system->getRootPath());
			$html = $this->system->view->fetch('relatorios/alunos_cadastrados_xls.tpl');	
		}
		header("Content-type: application/msexcel; charset=ISO-8859-1");
		header("Content-Disposition: attachment; filename=relatorioAlunosCadastradoPorData.xls");
		echo $html;
	}
	protected function doAssinaturasCadastradosXls() {
		$dataDe = $this->system->input['data_de'];
		$dataAte = $this->system->input['data_ate'];
		if ($dataAte && $dataDe) {
			$sqlExtra = " and pa.data_cadastro between '".$dataDe."' and '".$dataAte."'";
			$dadosAssinaturas = $this->system->planos->getPlanosRelatorio($sqlExtra);		
			$this->system->view->assign('planos',$dadosAssinaturas);
			$this->system->view->assign('periodo1', $this->system->func->converteDataMysqlParaPhp($dataDe));
			$this->system->view->assign('periodo2', $this->system->func->converteDataMysqlParaPhp($dataAte));
			$this->system->view->assign('dir_site', $this->system->getRootPath());
			$html = $this->system->view->fetch('relatorios/assinaturas_cadastrados_xls.tpl');
		}
		else {
			$sqlExtra = " and pa.data_cadastro like '".date('Y-m')."%'";
			$dadosAssinaturas = $this->system->planos->getPlanosRelatorio($sqlExtra);	
			$this->system->view->assign('planos',$dadosAssinaturas);
			$this->system->view->assign('data_atual', date(strtotime('d/m/Y')));
			$this->system->view->assign('dir_site', $this->system->getRootPath());
			$html = $this->system->view->fetch('relatorios/assinaturas_cadastrados_xls.tpl');
		}
		header("Content-type: application/msexcel; charset=ISO-8859-1");
		header("Content-Disposition: attachment; filename=relatorioAssinaturasCadastradoPorData.xls");
		echo $html;
	}
	
	// =================================================================================
	protected function doAlunosGerenciarXls() {
		$palavra = $this->system->input['palavra_busca'];
		$alunos = $this->system->alunos->getAlunos($palavra, 'padrao', $this->inicial . ',' . $this->mostrar);
		foreach ($alunos as $key => $aluno) {
			$alunos[$key]['cep'] = $this->system->alunos->getValorExtra($aluno['id'], 'cep');
			$alunos[$key]['endereco'] = $this->system->alunos->getValorExtra($aluno['id'], 'endereco');
			$alunos[$key]['bairro'] = $this->system->alunos->getValorExtra($aluno['id'], 'bairro');
			$alunos[$key]['cidade'] = $this->system->alunos->getValorExtra($aluno['id'], 'cidade');
			$alunos[$key]['estado'] = $this->system->alunos->getValorExtra($aluno['id'], 'estado');
			$alunos[$key]['cpf'] = $this->system->alunos->getValorExtra($aluno['id'], 'cpf');
			$alunos[$key]['telefone'] = $this->system->alunos->getValorExtra($aluno['id'], 'telefone');
		}
		$this->system->view->assign('alunos', $alunos);		
		$html = $this->system->view->fetch('relatorios/alunos_gerenciados_xls.tpl');		
		header("Content-type: application/msexcel; charset=ISO-8859-1");
		header("Content-Disposition: attachment; filename=relatorioAlunosCadastrados.xls");
		echo $html;
	}
	// =================================================================================
	protected function doInstituicoesGerenciarXls() {
		$palavra = $this->system->input['palavra_busca'];								
		$instituicoes = $this->system->instituicoes->getInstituicoes($palavra,'padrao',$this->inicial . ',' . $this->mostrar, false);		
		foreach ($instituicoes as $key => $instituicao) {		
			$instituicoes[$key]['cnpj'] = $this->system->alunos->getValorExtra($instituicao['id'], 'cnpj');
			$instituicoes[$key]['telefone'] = $this->system->alunos->getValorExtra($instituicao['id'], 'telefone_responsavel');
			$instituicoes[$key]['nome_responsavel'] = $this->system->alunos->getValorExtra($instituicao['id'], 'nome_responsavel');
			$instituicoes[$key]['email_responsavel'] = $this->system->alunos->getValorExtra($instituicao['id'], 'email_secundario');
		}				
		$this->system->view->assign('instituicoes', $instituicoes);												
		$html = $this->system->view->fetch('relatorios/instituicoes_gerenciados_xls.tpl');		
		header("Content-type: application/msexcel; charset=ISO-8859-1");
		header("Content-Disposition: attachment; filename=relatorioInstituicoesCadastradas.xls");
		echo $html;
	}
	// =================================================================================
	protected function doProfessoresGerenciarXls() {
		$palavra = $this->system->input['palavra_busca'];								
		$professores = $this->system->professores->getProfessoresAutonomos($palavra,'padrao',$this->inicial . ',' . $this->mostrar, false);		
		foreach ($professores as $key => $professor) {		
			$professores[$key]['cep'] = $this->system->alunos->getValorExtra($professor['id'], 'cep');
			$professores[$key]['telefone'] = $this->system->alunos->getValorExtra($professor['id'], 'telefone');
			$professores[$key]['cpf'] = $this->system->alunos->getValorExtra($professor['id'], 'cpf');
			$professores[$key]['mes_atual'] = "Mês Atual";			
			$total_professor = $this->system->financeiro->getTotalByProfessor($professor['id'], $professor['nivel']);	
			$total_venda_mes = $this->system->financeiro->getTotalMesAtualProfessor($professor['sistema_id']);
			//recuperando o valor da venda total
			if ($total_professor)
				$professores[$key]['total'] = $total_professor;	
			else
				$professores[$key]['total'] = '0.00';	
			//recuperando o valor da venda total por mês
			if ($total_venda_mes)
				$professores[$key]['total_venda_mes'] = $total_venda_mes;
			else
				$professores[$key]['total_venda_mes'] = '0.00';
		}		
		$this->system->view->assign('professores', $professores);												
		$html = $this->system->view->fetch('relatorios/professores_gerenciados_xls.tpl');		
		header("Content-type: application/msexcel; charset=ISO-8859-1");
		header("Content-Disposition: attachment; filename=relatorioProfessoresCadastrados.xls");
		echo $html;
	}	
	// =================================================================================
	protected function doCertificadoGerenciarXls() {
		$palavra = $this->system->input['palavra_busca'];								
		$certificados = $this->system->certificados->getCertificados($palavra, $limit, $sql);			
		$this->system->view->assign('certificados', $certificados);												
		$html = $this->system->view->fetch('relatorios/certificados_emitidos_xls.tpl');		
		header("Content-type: application/msexcel; charset=ISO-8859-1");
		header("Content-Disposition: attachment; filename=relatorioCertificadosEmitidos.xls");
		echo $html;
	}
	// ======================================================================
	protected function doSaquesEfetuadosXls() {	
		$dataDe = $this->system->input['data_de'];
		$dataAte = $this->system->input['data_ate'];
		$status = $this->system->input['status'];
		$sql = " and data between '".$dataDe."' and '".$dataAte."'";
		if ($dataAte && $dataDe) {
			if ($status)
				$sql = " and status = '".$status."' and data between '".$dataDe."' and '".$dataAte."'";
			else
				$sql = " and data between '".$dataDe."' and '".$dataAte."'";
			$saquesEfetuados = $this->system->financeiro->getSaques($sql);	
			$this->system->view->assign('periodo1', $this->system->func->converteDataMysqlParaPhp($dataDe));
			$this->system->view->assign('periodo2', $this->system->func->converteDataMysqlParaPhp($dataAte));
			$this->system->view->assign('dir_site', $this->system->getRootPath());
		}
		else {
			$saquesEfetuados = $this->system->financeiro->getSaques();	
			$this->system->view->assign('periodo1', $this->system->func->converteDataMysqlParaPhp($dataDe));
			$this->system->view->assign('periodo2', $this->system->func->converteDataMysqlParaPhp($dataAte));
			$this->system->view->assign('dir_site', $this->system->getRootPath());
		}
		$this->system->view->assign('saques_efetuados', $saquesEfetuados);
		$html = $this->system->view->fetch('relatorios/saques_efetuados_xls.tpl');
		header("Content-type: application/msexcel; charset=ISO-8859-1");
		header("Content-Disposition: attachment; filename=relatorioSaquesEfetuados.xls");
		echo $html;
	}
	// ======================================================================
	protected function doCuponsCadastradosXls() {
		$tipo = $this->system->input['tipo_cupom'];
		$ativo = $this->system->input['ativo'];		
		$cupons = $this->system->cupons->getCupons('','','');
		if ($tipo && $ativo == "") {
			$cupons = $this->system->cupons->getCupons('','',"t1.tipo = '".$tipo."' and");	
			$this->system->view->assign('tipo', $tipo);
			$this->system->view->assign('ativo', $ativo);
		}
		elseif ($ativo != "" && $tipo == "") {
			$cupons = $this->system->cupons->getCupons('','',"t1.ativo = '".$ativo."' and");	
			$this->system->view->assign('tipo', $tipo);
			$this->system->view->assign('ativo', $ativo);
		}
		elseif (($tipo) && ($ativo != "")) {
			$cupons = $this->system->cupons->getCupons('','',"t1.ativo = '".$ativo."' and t1.tipo = '".$tipo."' and");	
			$this->system->view->assign('tipo', $tipo);
			$this->system->view->assign('ativo', $ativo);
		}		
		foreach ($cupons as $key => $cupom) {
			$cupons[$key]['utilizacao'] = $this->system->vendas->getUtilizacaoCupom($cupom['id']);
		}
		$this->system->view->assign('cupons', $cupons);
		$html = $this->system->view->fetch('relatorios/cupons_cadastrados_xls.tpl');
		header("Content-type: application/msexcel; charset=ISO-8859-1");
		header("Content-Disposition: attachment; filename=relatorioCuponsCadastrados.xls");
		echo $html;
	}
	// ======================================================================
	protected function doCursosGerenciarXls() {
		$cursos = $this->system->cursos->getCursosRelatorio($palavra,'padrao', $this->inicial . ',' . $this->mostrar,'', false);	
			foreach ($cursos as $key => $curso) {
				// get usuário que cadastrou o curso
				$cadastradoPor = $this->system->usuarios->getUsuario($curso['usuario_id'],false);
				if($cadastradoPor['nivel'] == 3)
					$nivel = "Professor";
				elseif ($cadastradoPor['nivel'] == 5)
					$nivel = "Instituição";
				$cursos[$key]['nivel_usu_cadastrador'] = $nivel;
				$cursos[$key]['cadastrado_por'] = $cadastradoPor['nome'];
				// fim get usuário que cadastrou o curso
				// get vendas por curso
				$qtdVendasByCurso = $this->system->vendas->countVendasPorCurso($curso['id']);
				$cursos[$key]['vendas_deste_curso'] = $qtdVendasByCurso;
				// fim vendas por curso
				// get valor total das vendas do curso
				$valorTotalVendasCurso = $this->system->vendas->getValorTotalVendasPorCurso($curso['id']);
				$cursos[$key]['total_valor_venda'] = $valorTotalVendasCurso;
				// fim get valor total das vendas do curso
				// get areas do curso 
				$areasRelacionadasAoCurso = $this->system->cursos->getAreasByCurso($curso['id'],false, false);
				$cursos[$key]['areas_curso'] = $areasRelacionadasAoCurso;
				// fim get areas do curso
			}
		
		$this->system->view->assign('cursos', $cursos);
		$html = $this->system->view->fetch('relatorios/cursos_cadastrados_xls.tpl');
		header("Content-type: application/msexcel; charset=ISO-8859-1");
		header("Content-Disposition: attachment; filename=relatorioCuponsCadastrados.xls");
		echo $html;
	}
	protected function doRepassesFinanceirosGerenciarXls(){
		$palavra = $this->system->input['palavra_busca'];
		$repasses = $this->system->parceiros->getRepassesFinanceiros($palavra,$this->inicial, $this->mostrar,false);	

		$this->system->view->assign('repasses', $repasses);	
		$html = $this->system->view->fetch('relatorios/repasses_financeiros_gerenciados_xls.tpl');
		header("Content-type: application/msexcel; charset=ISO-8859-1");
		header("Content-Disposition: attachment; filename=relatorioRepassesfinanceirosParceiros.xls");
		echo $html;
	}
	// ===================================================================
	protected function doGerarRelatorio() {
		$do = $this->system->input['do'];
		$tipo = $this->system->input['tipo'];
		$tipo_cupom = $this->system->input['tipo_cupom'];
		$ativo = $this->system->input['ativo'];
		$tipoDados = $this->system->input['dados'];
		$dataDe = $this->system->input['data_de'];
		$dataAte = $this->system->input['data_ate'];
		$palavra = $this->system->input['palavra_busca'];
		//relatorio dos alunos cadastrados
		
		if ($tipoDados == "aluno") {
			if ($tipo == 'pdf')
				echo '<script type="text/javascript">window.open("'.$this->system->getUrlSite().'market/'.$this->system->admin->getCategoria().'/relatorios/alunosRelatorioPdf/?data_de='.$dataDe.'&data_ate='.$dataAte.'")</script>';
			elseif($tipo == 'xls')
				echo '<script type="text/javascript">window.open("'.$this->system->getUrlSite().'market/'.$this->system->admin->getCategoria().'/relatorios/alunosRelatorioXls/?data_de='.$dataDe.'&data_ate='.$dataAte.'")</script>';	
		}
		if ($tipoDados == "assinatura") {
			if ($tipo == 'pdf')
				echo '<script type="text/javascript">window.open("'.$this->system->getUrlSite().'market/'.$this->system->admin->getCategoria().'/relatorios/assinaturasRelatorioPdf/?data_de='.$dataDe.'&data_ate='.$dataAte.'")</script>';
			elseif($tipo == 'xls')
				echo '<script type="text/javascript">window.open("'.$this->system->getUrlSite().'market/'.$this->system->admin->getCategoria().'/relatorios/assinaturasRelatorioXls/?data_de='.$dataDe.'&data_ate='.$dataAte.'")</script>';	
		}
		if ($tipoDados == "alunoGerenciar"){
			if ($tipo == 'pdf')
				echo '<script type="text/javascript">window.open("'.$this->system->getUrlSite().'market/'.$this->system->admin->getCategoria().'/relatorios/alunosRelatorioGerenciarPdf/?palavra_busca='.$palavra.'")</script>';
			elseif($tipo == 'xls')
				echo '<script type="text/javascript">window.open("'.$this->system->getUrlSite().'market/'.$this->system->admin->getCategoria().'/relatorios/alunosRelatorioGerenciarXls/?palavra_busca='.$palavra.'")</script>';
		}
		//relatorio de saques
		if($tipoDados == "saques"){
			if($tipo == 'pdf')
				echo '<script type="text/javascript">window.open("'.$this->system->getUrlSite().'market/'.$this->system->admin->getCategoria().'/relatorios/saquesRelatorioPdf/?data_de='.$dataDe.'&data_ate='.$dataAte.'")</script>';
			elseif($tipo == 'xls')
				echo '<script type="text/javascript">window.open("'.$this->system->getUrlSite().'market/'.$this->system->admin->getCategoria().'/relatorios/saquesRelatorioXls/?data_de='.$dataDe.'&data_ate='.$dataAte.'")</script>';			
		}
		//relatorio de cupons
		if($tipoDados == "cupons"){
			if($tipo == 'pdf')
				echo '<script type="text/javascript">window.open("'.$this->system->getUrlSite().'market/'.$this->system->admin->getCategoria().'/relatorios/cuponsRelatorioPdf/?tipo_cupom='.$tipo_cupom.'&ativo='.$ativo.'&palavra_busca='.$palavra.'")</script>';
			elseif($tipo == 'xls')
				echo '<script type="text/javascript">window.open("'.$this->system->getUrlSite().'market/'.$this->system->admin->getCategoria().'/relatorios/cuponsRelatorioXls/?tipo_cupom='.$tipo_cupom.'&ativo='.$ativo.'&palavra_busca='.$palavra.'"</script>';
		}
		//relatorio de comprovantes
		if($tipoDados == "comprovantes"){
			if($tipo == 'pdf')
				echo '<script type="text/javascript">window.open("'.$this->system->getUrlSite().'market/'.$this->system->admin->getCategoria().'/relatorios/comprovantesRelatorioPdf")</script>';
			elseif($tipo == 'xls')
				echo '<script type="text/javascript">window.open("'.$this->system->getUrlSite().'market/'.$this->system->admin->getCategoria().'/relatorios/comprovantesRelatorioXls")</script>';	
		}
		//relatorio de instituições
		if($tipoDados == "instituicoesGerenciar"){
			if($tipo == 'pdf')
				echo '<script type="text/javascript">window.open("'.$this->system->getUrlSite().'market/'.$this->system->admin->getCategoria().'/relatorios/instituicoesRelatorioGerenciarPdf/?palavra_busca='.$palavra.'")</script>';
			elseif($tipo == 'xls')
				echo '<script type="text/javascript">window.open("'.$this->system->getUrlSite().'market/'.$this->system->admin->getCategoria().'/relatorios/instituicoesRelatorioGerenciarXls/?palavra_busca='.$palavra.'")</script>';
		}
		//relatorio de professores
		if($tipoDados == "professoresGerenciar"){
			if($tipo == 'pdf')
				echo '<script type="text/javascript">window.open("'.$this->system->getUrlSite().'market/'.$this->system->admin->getCategoria().'/relatorios/professoresRelatorioGerenciarPdf/?palavra_busca='.$palavra.'")</script>';
			elseif($tipo == 'xls')
				echo '<script type="text/javascript">window.open("'.$this->system->getUrlSite().'market/'.$this->system->admin->getCategoria().'/relatorios/professoresRelatorioGerenciarXls/?palavra_busca='.$palavra.'")</script>';	
		}

		//relatorio de professores
		if($tipoDados == "cursos"){
			if($tipo == 'pdf')
				echo '<script type="text/javascript">window.open("'.$this->system->getUrlSite().'market/'.$this->system->admin->getCategoria().'/relatorios/cursosRelatorioGerenciarPdf/")</script>';
			elseif($tipo == 'xls')
				echo '<script type="text/javascript">window.open("'.$this->system->getUrlSite().'market/'.$this->system->admin->getCategoria().'/relatorios/cursosRelatorioGerenciarXls/")</script>';
		}

		//relatorio de professores
		if($tipoDados == "repassesFinanceiros"){
			if($tipo == 'pdf')
				echo '<script type="text/javascript">window.open("'.$this->system->getUrlSite().'market/'.$this->system->admin->getCategoria().'/relatorios/repassesFinanceirosGerenciarPdf/?palavra_busca='.$palavra.'")</script>';
			elseif($tipo == 'xls')
				echo '<script type="text/javascript">window.open("'.$this->system->getUrlSite().'market/'.$this->system->admin->getCategoria().'/relatorios/repassesFinanceirosGerenciarXls/?palavra_busca='.$palavra.'")</script>';
		}
		//certificados(instituição)
		if($tipoDados == "certificadosGerenciar"){
			if($tipo == 'pdf')
				echo '<script type="text/javascript">window.open("'.$this->system->getUrlSite().'market/'.$this->system->admin->getCategoria().'/relatorios/certificadoGerenciarPdf/?palavra_busca='.$palavra.'")</script>';
			elseif($tipo == 'xls')
				echo '<script type="text/javascript">window.open("'.$this->system->getUrlSite().'market/'.$this->system->admin->getCategoria().'/relatorios/certificadoGerenciarXls/?palavra_busca='.$palavra.'")</script>';
		}
		
		
	}
	
	// ======================================================================
	// Relatórios de Vendas	
	// ===============================================================
	protected function doRelatorio() {				
		$ultimas_10_vendas = $this->system->vendas->getVendas('', 10);
		foreach ($ultimas_10_vendas as $key => $vendas) {
			$ultimas_10_vendas[$key]['cliente'] = $this->system->alunos->getAluno($vendas['aluno_id']);
			$cursos = array();
			foreach ($this->system->vendas->getCursosByVenda($vendas['id']) as $curso) {
				$cursos[] = end($this->system->cursos->getCurso($curso['curso_id'], false));
			}
			$plano = $this->system->vendas->getPlanoVenda($vendas['id']);
			//$certificados = $this->system->vendas->getCertificadosVenda($vendas['id']);
			$ultimas_10_vendas[$key]['cursos']			= $cursos;
			$ultimas_10_vendas[$key]['plano'] 			= $plano;
			//$ultimas_10_vendas[$key]['certificados'] 	= $certificados;
		}
		$this->system->view->assign(array(			
			'data1'					=> date('d/m/Y'),
			'data2'					=> date('d/m/Y'),
			'mes'					=> date('m'),
			'ano'					=> date('Y'),
			'areas'					=> $this->system->areas->getAreas(),
			'cursos'				=> $this->system->cursos->getCursos(),
			'total_vendas' 			=> number_format($this->system->vendas->getTotalVendas(" and status = 1 and data_cadastro like '" . date('Y') ."-" . date('m') . "-%'"), 2, ',', '.'),
			'total_pedidos' 		=> $this->system->vendas->getTotalPedidos(" and data_cadastro like '" . date('Y') ."-" . date('m') . "-%'"),
			'total_itens_pedidos' 	=> $this->system->vendas->getTotalItensPedidos(" and t1.data_cadastro like '" . date('Y') ."-" . date('m') . "-%'"),
			'media_vendas' 			=> number_format(($this->system->vendas->getTotalVendas(" and status = 1 and data_cadastro like '" . date('Y') ."-" . date('m') . "-%'") / $this->system->vendas->getTotalPedidos(" and status = 1 and data_cadastro like '" . date('Y') ."-" . date('m') . "-%'")), 2, ',', '.'),
			'descontos_usados'		=> number_format($this->system->vendas->getTotalDescontosUsados(" and status = 1  and data_cadastro like '" . date('Y') ."-" . date('m') . "-%'"), 2, ',', '.'),
			'ultimas_10_vendas'		=> $ultimas_10_vendas,
		));
		
		// pego todas as vendas do mês atual
		$sql = " and data_cadastro like '".date('Y-m')."%'";
		$vendas = $this->system->vendas->getVendas($sql, 0);
		foreach ($vendas as $key => $venda) {
			// pego todos os cursos da venda
			foreach($this->system->vendas->getCursosByVenda($venda['id']) as $curso) {
				// pego as categorias do curso
				$curso_dados = $this->system->cursos->getCurso($curso['curso_id'], true);
				// percorro as categorias do curso
				foreach($curso_dados['areas'] as $key2 => $area_id) {
					$area[$area_id]['total'] += $venda['valor_total'];
					$area[$area_id]['id'] = $area_id;
				}
				
			}
		}
		arsort($area);
		$area = array_slice($area, 0, 1);
		$dados_area = $this->system->areas->getArea($area[0]['id']);
		$this->system->view->assign(array(
			'nome_area_mais_vendida' 	=> $dados_area['area'],
			'valor_area_mais_vendida' 	=> $area[0]['total']
		));
		
		$lista_cadastro = array();
		$sql = " and data_cadastro like '".date('Y-m')."%'";
		$cadastros = $this->system->alunos->getCadastrosAlunos($sql);
		foreach ($cadastros as $key => $cadastro) {
			$dia = substr($cadastro['data_cadastro'], 8, 2);
			$lista_cadastro[$dia]++;
		}
		ksort($lista_cadastro);
		$this->system->view->assign(array(
			'total_clientes' => $this->system->vendas->getTotalClientes(),
			'total_clientes_vendas' => $this->system->vendas->getTotalClientesVendas(),
			'total_clientes_cadastros' => $lista_cadastro
		));
		$this->system->admin->topo('relatorios','relatorios-venda');
		$this->system->view->display('global/relatorio_vendas.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================
	protected function docarregaDadosVendaPorDia() {
		$data1 = $this->system->input['data1'];
		$data2 = $this->system->input['data2'];
		if (!$data1 || !$data2)
			$data1 = $data2 = date('d/m/Y');
		if ($data1 == $data2)
			$vendas_periodo = $data1;
		else
			$vendas_periodo = 'de ' . $data1 . ' até ' . $data2;
		$data1 = $this->system->func->converteData($data1);
		$data2 = $this->system->func->converteData($data2);
		$sql_dia = " and id in (SELECT venda_id FROM vendas_cursos) and (data_cadastro >= '".$data1." 00:00:00' and data_cadastro <= '".$data2." 23:59:59')";
		$total_vendas_dia = number_format($this->system->vendas->getTotalVendas($sql_dia), 2, ',', '.');
		$total_pedidos_dia = $this->system->vendas->getTotalPedidos($sql_dia);
		$total_itens_pedidos = $this->system->vendas->getTotalItensPedidos(" AND t1.data_cadastro  BETWEEN '".$data1." 00:00:00' AND '".$data2." 23:59:59'");
		$ultimas_10_vendas_dia = $this->system->vendas->getVendas($sql_dia, 10);
		foreach ($ultimas_10_vendas_dia as $key => $vendas) {
			$ultimas_10_vendas_dia[$key]['cliente'] = $this->system->alunos->getAluno($vendas['aluno_id']);
			$cursos = array();
			foreach ($this->system->vendas->getCursosByVenda($vendas['id']) as $curso) {
				$curso_dados = end($this->system->cursos->getCurso($curso['curso_id'], false));
				$cursos[] = $curso_dados['curso'];
			}
			$ultimas_10_vendas_dia[$key]['cursos'] = implode('<br/>', $cursos);
		}
		echo json_encode(array('total_itens_pedidos' => $total_itens_pedidos,'total_vendas_dia' => $total_vendas_dia, 'total_pedidos_dia' => $total_pedidos_dia, 'ultimas_10_vendas_dia' => $ultimas_10_vendas_dia, 'vendas_periodo' => $vendas_periodo));
	}
	// ===============================================================
	protected function docarregaDadosVendaPorMes() {
		$mes = (int)$this->system->input['mes'];
		$ano = (int)$this->system->input['ano'];
		$professor = (int)$this->system->input['professor'];
		
		if (!$mes || !$ano) {
			$mes = date('m');
			$ano = date('Y');
		}
		elseif ($mes < 10) $mes = '0'.$mes;
		$vendas_periodo = $mes . "/" . $ano;
		$sql_mes = "  and status = 1 and data_cadastro like '".$ano."-".$mes."%'";
		if ($professor) 
			$sql_mes .= " and id IN (SELECT venda_id FROM `vendas_cursos` WHERE professor_id = '" . $professor . "')";
		$ultimas_10_vendas_mes = $this->system->vendas->getVendas($sql_mes, 0);
		foreach ($ultimas_10_vendas_mes as $key => $vendas) {
			$ultimas_10_vendas_mes[$key]['cliente'] = $this->system->alunos->getAluno($vendas['aluno_id']);
			$produtos = array();
			foreach ($this->system->vendas->getCursosByVenda($vendas['id']) as $curso) {
				$curso_dados = end($this->system->cursos->getCurso($curso['curso_id'], false));
				$produtos[] = $curso_dados['curso'];
			}
			//Plano
			$plano = $this->system->vendas->getPlanoVenda($vendas['id']);
			$produtos[] = $plano['plano'];
			//Certificado
			//$certificados = $this->system->vendas->getCertificadosVenda($vendas['id']);
			//foreach ($certificados as $certificado) {
			//	$produtos[] = $certificado['curso']	;
			//}
			$ultimas_10_vendas_mes[$key]['cursos'] = implode('<br/>', $produtos);
		}
		echo json_encode(array('ultimas_10_vendas_mes' => $ultimas_10_vendas_mes, "vendas_periodo" => $vendas_periodo));
	}
	// ===============================================================
	protected function docarregaDadosVendaPorMaisVendidos() {
		$data1 = $this->system->input['data1'];
		$data2 = $this->system->input['data2'];
		
		if (!$data1 || !$data2)
			$data1 = $data2 = date('d/m/Y');

		$dataMaisVendidosDeAte = $data1 ." - ". $data2;
		$data1 = $this->system->func->converteData($data1);
		$data2 = $this->system->func->converteData($data2);
		$sql = " and (t2.data_cadastro >= '".$data1." 00:00:00' and t2.data_cadastro <= '".$data2." 23:59:59')";
		$ultimas = $this->system->vendas->getVendasCursoMaisVendido($sql, 0);		
		$lista_produtos = array();
		foreach($ultimas as $key => $curso) {
			$curso_dados = end($this->system->cursos->getCurso($curso['curso_id'], false));			
			$lista_produtos[$key]['curso'] = $curso_dados['curso'];
			$lista_produtos[$key]['quantidade'] = $curso['total'];
			$lista_produtos[$key]['total'] = number_format(($curso_dados['valor'] * $curso['total']), 2, ',', '.');
		}
		echo json_encode(array('lista_produtos' => $lista_produtos, 'dataMaisVendidosDeAte' => $dataMaisVendidosDeAte));
	}
	// ===============================================================
	protected function docarregaDadosVendaTopConsumidores() {
		$mes = (int)$this->system->input['mes'];
		$ano = (int)$this->system->input['ano'];
		if (!$mes || !$ano) {
			$mes = date('m');
			$ano = date('Y');
		}
		elseif ($mes < 10) $mes = '0'.$mes;
		$dataTopVendas = $mes . "/" . $ano;
		$sql = " and t1.data_cadastro like '".$ano."-".$mes."%'";
		$ultimas_vendas = $this->system->vendas->getVendasTopConsumidores($sql, 0);
		foreach ($ultimas_vendas as $key => $vendas) {
			$vendas_usuario = $this->system->vendas->getVendas("and aluno_id = '".$vendas['id']."' and data_cadastro like '".$ano."-".$mes."%'");
			foreach ($vendas_usuario as $key1 => $venda_usuario) {
				$ultimas_vendas[$key]['total_cursos'] += $this->system->vendas->getTotalCursoByCursoId($venda_usuario['id']);
			}
		}
		echo json_encode(array('ultimas_vendas' => $ultimas_vendas, 'dataTopVendas' =>$dataTopVendas));
	}
	// ===============================================================
	protected function docarregaDadosVendaPorAreas() {
		$mes = (int)$this->system->input['mes'];
		$ano = (int)$this->system->input['ano'];
		$categoria_id = (int)$this->system->input['categoria'];
		if (!$mes || !$ano) {
			$mes = date('m');
			$ano = date('Y');
		}
		elseif ($mes < 10) $mes = '0'.$mes;
		$dados_area = $this->system->areas->getArea($categoria_id);		
		$sql = " and t1.data_cadastro like '".$ano."-".$mes."%'";
		$ultimas_vendas = $this->system->vendas->getVendasPorAreas($categoria_id, $sql);
		foreach ($ultimas_vendas as $key => $vendas) {
			$ultimas_vendas[$key]['cliente'] = $this->system->alunos->getAluno($vendas['aluno_id']);
			$cursos = array();
			foreach ($this->system->vendas->getCursosByVenda($vendas['id']) as $curso) {
				$curso_dados = end($this->system->cursos->getCurso($curso['curso_id'], false));
				$cursos[] = $curso_dados['curso'];
			}
			$ultimas_vendas[$key]['cursos'] = implode('<br/>', $cursos);
		}
		echo json_encode(array('ultimas_vendas' => $ultimas_vendas, 'area_venda' => $dados_area['area']));
	}
	// ===============================================================
	protected function docarregaDadosVendaCupons() {
		$data1 = $this->system->input['data1'];
		$data2 = $this->system->input['data2'];	
		if (!$data1 || !$data2)
			$data1 = $data2 = date('d/m/Y');
		$data1 = $this->system->func->converteData($data1);
		$data2 = $this->system->func->converteData($data2);
		$cupons['total_vendas'] = $this->system->cupons->getTotalPedidosComCupom(" and (data_cadastro >= '".$data1." 00:00:00' and data_cadastro <= '".$data2." 23:59:59')");
		$cupons['total_cupons'] = $this->system->cupons->getTotalCupons(" and (data_cadastro >= '".$data1." 00:00:00' and data_cadastro <= '".$data2." 23:59:59')");
		$cupons['porcentagem'] = ($cupons['total_vendas'] / $this->system->vendas->getTotalPedidos(" and (data_cadastro >= '".$data1." 00:00:00' and data_cadastro <= '".$data2." 23:59:59')")) * 100;
		$cupons['mais_usados'] =  $this->system->cupons->getCuponsMaisUsados(" and (t1.data_cadastro >= '".$data1." 00:00:00' and t1.data_cadastro <= '".$data2." 23:59:59')");
		echo json_encode($cupons);
	}		
	// ===============================================================
	protected function doRecuperarCursoByIdVenda() {
		$id = $this->system->input['id'];
		//recuperando o aluno da venda
		$aluno = $this->system->vendas->getAlunoByVendas($id);
		//recuperando os cursos da venda
		$cursos = $this->system->vendas->getCursosByVendas($id);
		//recuperando o numero da venda
		$numero = $this->system->vendas->getNumeroVendaById($id);
		//inserindo o aluno no array
		$cursos[0]['aluno'] = $aluno;
		//inserindo o numero da venda no array
		$cursos[0]['numero_venda'] = $numero;		
		echo json_encode($cursos);
	}
	// ===============================================================
	protected function docarregaDadosVendaPorProdutos() {
		$curso_id = (int)$this->system->input['curso_id'];
		if (!$curso_id) return;	
		$lista_produtos = array();
		$cursoSelecionado = $this->system->cursos->getCurso($curso_id);
		$vendas_produtos = $this->system->vendas->getVendasPorCurso($curso_id, " and data_cadastro like '".date('Y')."-%'", 0);
		$valorTotalVendas   = 0;
		$TotalDeVendas      = 0;
		$nomeCurso          = $cursoSelecionado['curso'];
		foreach ($vendas_produtos as $item => $vendas) {
			$cursos = $this->system->vendas->getCursosByVenda($vendas['venda_id']);
			$TotalDeVendas ++;
			$totalProduto = 0;			
			foreach ($cursos as $curso) {				
				if ($curso['curso_id'] == $curso_id){					
					$totalProduto  = $curso['preco_total'] - $curso['preco_desconto'];
					$valorTotalVendas += ($curso['preco_total'] - $curso['preco_desconto']);
				}
				
			}
			$mes = substr($vendas['data_cadastro'], 5, 2);
			$lista_produtos[$mes]['mes'] = $mes;
			$lista_produtos[$mes]['total'] += $totalProduto;
			$lista_produtos[$mes]['quantidade']++;
		}		
		ksort($lista_produtos);
		if (count($lista_produtos)){
			echo json_encode(array('lista_produtos' 			=> $lista_produtos, 
								   'valor_total_venda_curso' 	=> $valorTotalVendas,
								   'total_venda_curso' 			=> $TotalDeVendas, 
								   'curso' 						=> $nomeCurso));
		}

	}
	// =================================================================
	// SAQUES
	protected function doRelatorioSaque() {
		$filtrar = $this->system->input['filtrar'];
		$dataDe = $this->system->func->converteData($this->system->input['de']);
		$dataAte = $this->system->func->converteData($this->system->input['ate']);
		$status = $this->system->input['status'];
		$sql = " and data between '".$dataDe."' and '".$dataAte."'";
		//busca
		$palavra = $this->system->input['palavra_busca'];
		$base_url = ($palavra ? $this->system->func->baseurl('/relatorios/saques/&palavra_busca=' . $palavra) : $this->system->func->baseurl('/vendas/saques' ));
		if ($filtrar) {
			if ($status) $sql = " and status = '".$status."' and data between '".$dataDe."' and '".$dataAte."'";
			else $sql = " and data between '".$dataDe."' and '".$dataAte."'";
			$saquesEfetuados = $this->system->financeiro->getSaques($sql,$palavra);	
			$this->system->view->assign('data_de', $dataDe);
			$this->system->view->assign('data_ate', $dataAte);
			$this->system->view->assign('status', $status);	
		}
		else {
			$saquesEfetuados = $this->system->financeiro->getSaques('',$palavra);	
		}
		$this->system->view->assign('saques_efetuados', $saquesEfetuados);
		$this->system->admin->topo('relatorios','relatorios-saque');
		$this->system->view->display('professor/relatorio_saques.tpl');
		$this->system->admin->rodape();
	}
	// =================================================================
	// CUPONS
	protected function doRelatorioCupons() {
		$filtrar = $this->system->input['filtrar'];
		$tipo = $this->system->input['tipo'];
		$ativo = $this->system->input['ativo'];
		$palavra = $this->system->input['palavra_busca'];
		$base_url = ($palavra ? $this->system->func->baseurl('/relatorios/saques/&palavra_busca=' . $palavra) : $this->system->func->baseurl('/vendas/cupons' ));
		$cupons = $this->system->cupons->getCupons($palavra,'','t1.excluido=0 and','');
		if ($filtrar) {
			if ($tipo && $ativo == "") {
				$cupons = $this->system->cupons->getCupons($palavra,'',"t1.tipo = '".$tipo."' and",'');	
				$this->system->view->assign('tipo', $tipo);
				$this->system->view->assign('ativo', $ativo);				
			}
			elseif ($ativo != "" && $tipo == "") {
				$cupons = $this->system->cupons->getCupons($palavra,'',"t1.ativo = '".$ativo."' and",'');	
				$this->system->view->assign('tipo', $tipo);
				$this->system->view->assign('ativo', $ativo);
			}
			elseif (($tipo) && ($ativo != "")) {
				$cupons = $this->system->cupons->getCupons($palavra,'',"t1.ativo = '".$ativo."' and t1.tipo = '".$tipo."' and",'');	
				$this->system->view->assign('tipo', $tipo);
				$this->system->view->assign('ativo', $ativo);
			}
		}
		foreach ($cupons as $key => $cupom) {
			$cupons[$key]['utilizacao'] = $this->system->vendas->getUtilizacaoCupom($cupom['id']);
		}
		$this->system->view->assign('cupons', $cupons);
		$this->system->view->assign('palavra_busca', $palavra);
		$this->system->admin->topo('relatorios', 'relatorios-cupons');
		$this->system->view->display('global/relatorio_cupons.tpl');
		$this->system->admin->rodape();
	}
	// =================================================================
	// Instituicoes
	protected function doRelatorioInstituicao(){
		$filtrar = $this->system->input['filtrar'];
		$tipo = $this->system->input['tipo'];
		$ativo = $this->system->input['ativo'];
		$palavra = $this->system->input['palavra_busca'];
		$base_url = ($palavra ? $this->system->func->baseurl('/relatorios/instituicoes/&palavra_busca=' . $palavra) : $this->system->func->baseurl('/relatorios/instituicoes' ));
		$total = $this->system->instituicoes->getInstituicoes($palavra, 'padrao', 0, '', true);
		$instituicoes = $this->system->instituicoes->getInstituicoes($palavra,'padrao','','', false);
		$paginacao = $this->system->func->paginacao($this->pagina, $this->mostrar, $total, $base_url);
		foreach ($instituicoes as $key => $instituicao) {
			$detalhes = $this->system->instituicoes->getInstituicao($instituicao['id'], true);
			$instituicoes[$key]['cnpj'] = $detalhes['cnpj'];
			$instituicoes[$key]['responsavel'] = $detalhes['nome_responsavel'];
			$instituicoes[$key]['email_responsavel'] = $detalhes['email_secundario'];
		}
		$this->system->view->assign('instituicoes', $instituicoes);
		$this->system->view->assign('paginacao', $paginacao);
		$this->system->view->assign('palavra_busca', $palavra);
		$this->system->view->assign('url_site', $this->system->getUrlSite());
		$this->system->admin->topo('relatorios', 'relatorios-instituicoes');
		$this->system->view->display('administrador/relatorio_instituicoes.tpl');
		$this->system->admin->rodape();
	}

	// ===============================================================		
	protected function doBuscarValoresInstituicao() {
		$instituicao_id = $this->system->input['instituicao'];
		$dados = array();
		$instituicao = $this->system->instituicoes->getInstituicao($instituicao_id, true);
		echo json_encode($instituicao);
	}
	// =================================================================
	// Instituicoes
	protected function doRelatorioProfessor() {
		$filtrar = $this->system->input['filtrar'];
		$tipo = $this->system->input['tipo'];
		$ativo = $this->system->input['ativo'];
		$palavra = $this->system->input['palavra_busca'];
		$base_url = ($palavra ? $this->system->func->baseurl('/relatorios/professores/&palavra_busca=' . $palavra) : $this->system->func->baseurl('/relatorios/instituicoes' ));
		$total = $this->system->professores->getProfessores($palavra, 'padrao', 0, 'nome', true, 3);
		$professores = $this->system->professores->getProfessores($palavra,'padrao','','', false, 3);
		$paginacao = $this->system->func->paginacao($this->pagina, $this->mostrar, $total, $base_url);
		foreach ($professores as $key => $professor) {
			$detalhes = $this->system->professores->getProfessor($professor['id'], true, 'autonomo');
			$total_professor = $this->system->financeiro->getTotalByProfessor($professor['id'], $professor['nivel']);	
			$total_venda_mes = $this->system->financeiro->getTotalMesAtualProfessor($professor['sistema_id']);
			//recuperando o valor da venda total
			if ($total_professor)
				$professores[$key]['total'] = $total_professor;	
			else
				$professores[$key]['total'] = '0.00';	
			//recuperando o valor da venda total por mês
			if ($total_venda_mes)
				$professores[$key]['total_venda_mes'] = $total_venda_mes;
			else
				$professores[$key]['total_venda_mes'] = '0.00';
			$professores[$key]['cpf'] = $detalhes['cpf'];
			$professores[$key]['cep'] = $detalhes['cep'];
			$professores[$key]['telefone'] = $detalhes['telefone'];
		}
		$this->system->view->assign('professores', $professores);
		$this->system->view->assign('paginacao', $paginacao);
		$this->system->view->assign('palavra_busca', $palavra);
		$this->system->view->assign('url_site', $this->system->getUrlSite());
		$this->system->admin->topo('relatorios', 'relatorios-professores');
		$this->system->view->display('administrador/relatorio_professores.tpl');
		$this->system->admin->rodape();
	}
	// ===============================================================		
	protected function doBuscarValoresProfessor() {
		$professor_id = $this->system->input['professor'];
		$dados = array();
		$professor = $this->system->professores->getProfessorAutonomo($professor_id, true);
		echo json_encode($professor);
	}
	// ===============================================================
	protected function doRelatorioCursos() {
		/* campos do filtro */
		$filtrar = $this->system->input['filtrar'];
		/* campos do filtro fim*/
		$palavra = $this->system->input['palavra_busca'];
		$base_url = ($palavra ? $this->system->func->baseurl('/relatorios/cursos/&palavra_busca=' . $palavra) : $this->system->func->baseurl('/relatorios/cursos'));
		if ($filtrar) {
			$instituicoes = $this->system->input['instituicoes'];
			$professores = $this->system->input['professores'];
			if ($instituicoes && $professores == "") {
				$total = $this->system->cursos->getCursosRelatorio($palavra, 'padrao', '', 'curso', true, 'instituicao');
				$paginacao = $this->system->func->paginacao($this->pagina, $this->mostrar, $total, $base_url);
				$cursos = $this->system->cursos->getCursosRelatorio($palavra,'padrao', $this->inicial . ',' . $this->mostrar,'', false, 'instituicao');	
				foreach ($cursos as $key => $curso) {
					// get usuário que cadastrou o curso
					$cadastradoPor = $this->system->usuarios->getUsuario($curso['usuario_id'],false);
					if($cadastradoPor['nivel'] == 3)
						$nivel = "Professor";
					elseif ($cadastradoPor['nivel'] == 5)
						$nivel = "Instituição";
					$cursos[$key]['nivel_usu_cadastrador'] = $nivel;
					$cursos[$key]['cadastrado_por'] = $cadastradoPor['nome'];
					// fim get usuário que cadastrou o curso
					// get vendas por curso
					$qtdVendasByCurso = $this->system->vendas->countVendasPorCurso($curso['id']);
					$cursos[$key]['vendas_deste_curso'] = $qtdVendasByCurso;
					// fim vendas por curso
					// get valor total das vendas do curso
					$valorTotalVendasCurso = $this->system->vendas->getValorTotalVendasPorCurso($curso['id']);
					$cursos[$key]['total_valor_venda'] = $valorTotalVendasCurso;
					// fim get valor total das vendas do curso
					// get areas do curso 
					$areasRelacionadasAoCurso = $this->system->cursos->getAreasByCurso($curso['id'],false, false);
					$cursos[$key]['areas_curso'] = $areasRelacionadasAoCurso;
					// fim get areas do curso
				}

			} 
			elseif ($professores && $instituicoes == "") {
				$total = $this->system->cursos->getCursosRelatorio($palavra, 'padrao', '', 'curso', true, 'professor');
				$paginacao = $this->system->func->paginacao($this->pagina, $this->mostrar, $total, $base_url);
				$cursos = $this->system->cursos->getCursosRelatorio($palavra,'padrao', $this->inicial . ',' . $this->mostrar,'', false, 'professor');
				foreach ($cursos as $key => $curso) {
					// get usuário que cadastrou o curso
					$cadastradoPor = $this->system->usuarios->getUsuario($curso['usuario_id'],false);
					if($cadastradoPor['nivel'] == 3)
						$nivel = "Professor";
					elseif ($cadastradoPor['nivel'] == 5)
						$nivel = "Instituição";
					$cursos[$key]['nivel_usu_cadastrador'] = $nivel;
					$cursos[$key]['cadastrado_por'] = $cadastradoPor['nome'];
					// fim get usuário que cadastrou o curso
					// get vendas por curso
					$qtdVendasByCurso = $this->system->vendas->countVendasPorCurso($curso['id']);
					$cursos[$key]['vendas_deste_curso'] = $qtdVendasByCurso;
					// fim vendas por curso
					// get valor total das vendas do curso
					$valorTotalVendasCurso = $this->system->vendas->getValorTotalVendasPorCurso($curso['id']);
					$cursos[$key]['total_valor_venda'] = $valorTotalVendasCurso;
					// fim get valor total das vendas do curso
					// get areas do curso 
					$areasRelacionadasAoCurso = $this->system->cursos->getAreasByCurso($curso['id'],false, false);
					$cursos[$key]['areas_curso'] = $areasRelacionadasAoCurso;
					// fim get areas do curso
				}
			} 
			elseif ($professores && $instituicoes) {
				$total = $this->system->cursos->getCursosRelatorio($palavra, 'padrao', '', 'curso', true);
				$paginacao = $this->system->func->paginacao($this->pagina, $this->mostrar, $total, $base_url);
				$cursos = $this->system->cursos->getCursosRelatorio($palavra,'padrao', $this->inicial . ',' . $this->mostrar,'', false);	
				foreach ($cursos as $key => $curso) {
					// get usuário que cadastrou o curso
					$cadastradoPor = $this->system->usuarios->getUsuario($curso['usuario_id'],false);
					if($cadastradoPor['nivel'] == 3)
						$nivel = "Professor";
					elseif ($cadastradoPor['nivel'] == 5)
						$nivel = "Instituição";
					$cursos[$key]['nivel_usu_cadastrador'] = $nivel;
					$cursos[$key]['cadastrado_por'] = $cadastradoPor['nome'];
					// fim get usuário que cadastrou o curso
					// get vendas por curso
					$qtdVendasByCurso = $this->system->vendas->countVendasPorCurso($curso['id']);
					$cursos[$key]['vendas_deste_curso'] = $qtdVendasByCurso;
					// fim vendas por curso
					// get valor total das vendas do curso
					$valorTotalVendasCurso = $this->system->vendas->getValorTotalVendasPorCurso($curso['id']);
					$cursos[$key]['total_valor_venda'] = $valorTotalVendasCurso;
					// fim get valor total das vendas do curso
					// get areas do curso 
					$areasRelacionadasAoCurso = $this->system->cursos->getAreasByCurso($curso['id'],false, false);
					$cursos[$key]['areas_curso'] = $areasRelacionadasAoCurso;
					// fim get areas do curso
				}
			}
		} 
		else {
			$total = $this->system->cursos->getCursosRelatorio($palavra, 'padrao', '', 'curso', true);
			$paginacao = $this->system->func->paginacao($this->pagina, $this->mostrar, $total, $base_url);
			$cursos = $this->system->cursos->getCursosRelatorio($palavra,'padrao', $this->inicial . ',' . $this->mostrar,'', false);
			foreach ($cursos as $key => $curso) {
				// get usuário que cadastrou o curso
				$cadastradoPor = $this->system->usuarios->getUsuario($curso['usuario_id'],false);
				if($cadastradoPor['nivel'] == 3)
					$nivel = "Professor";
				elseif ($cadastradoPor['nivel'] == 5)
					$nivel = "Instituição";
				$cursos[$key]['nivel_usu_cadastrador'] = $nivel;
				$cursos[$key]['cadastrado_por'] = $cadastradoPor['nome'];
				// fim get usuário que cadastrou o curso
				// get vendas por curso
				$qtdVendasByCurso = $this->system->vendas->countVendasPorCurso($curso['id']);
				$cursos[$key]['vendas_deste_curso'] = $qtdVendasByCurso;
				// fim vendas por curso
				// get valor total das vendas do curso
				$valorTotalVendasCurso = $this->system->vendas->getValorTotalVendasPorCurso($curso['id']);
				$cursos[$key]['total_valor_venda'] = $valorTotalVendasCurso;
				// fim get valor total das vendas do curso
				// get areas do curso 
				$areasRelacionadasAoCurso = $this->system->cursos->getAreasByCurso($curso['id'],false, false);
				$cursos[$key]['areas_curso'] = $areasRelacionadasAoCurso;
				// fim get areas do curso
			}
		}
		$this->system->view->assign('cursos', $cursos);
		$this->system->view->assign('paginacao', $paginacao);
		$this->system->view->assign('palavra_busca', $palavra);
		$this->system->view->assign('url_site', $this->system->getUrlSite());
		$this->system->admin->topo('relatorios', 'relatorios-cursos');
		$this->system->view->display('administrador/relatorio_cursos.tpl');
		$this->system->admin->rodape();	
	}
	
}
// =====================================================================