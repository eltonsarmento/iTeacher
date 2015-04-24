<?php
// ===================================================================
class Email_modelMODEL {
	// ===============================================================
	protected $system = null;
	private $shortcode = array(
		
		'[[nome_aluno]]'			=> '',
		'[[email_aluno]]'			=> '',
		'[[senha_aluno]]'			=> '',
		'[[data_compra]]'			=> '',
		'[[data_expiracao]]'		=> '',
		'[[nome_curso]]'			=> '',
		'[[numero_pedido]]'			=> '',
		'[[nome_plano]]'			=> '',

		'[[nome_professor]]' 		=> '',
		'[[email_professor]]'		=> '',
		'[[senha_professor]]'		=> '',
		'[[titulo_duvida]]'			=> '',
		'[[mensagem_duvida]]'		=> '',

		'[[nome_administrativo]]'	=> '',
		'[[email_administrativo]]'	=> '',
		'[[senha_administrativo]]'	=> '',
		'[[numero_certificado]]'	=> '',

		'[[nome_parceiro]]'			=> '',
		'[[email_parceiro]]' 		=> '',
		'[[senha_parceiro]]'		=> '',
		'[[mes]]'					=> '',
		'[[ano]]'					=> '',

		'[[nome_coordenador]]'		=> '',
		'[[email_coordenador]]'		=> '',
		'[[senha_coordenador]]'		=> '',

		'[[titulo_notificacao]]'	=> '',
		'[[mensagem_notificacao]]'	=> '',

		'[[email_usuario]]'			=> '',
		'[[senha_usuario]]'			=> '',

	);
	// ===============================================================
	public function __construct() {
		$this->system =& getInstancia();		
		$this->system->load->dao('emails');
		$this->system->load->dao('usuarios');
		$this->system->load->dao('notificacoes');
		$this->system->load->dao('alunos');
		$this->system->load->dao('cursos');
		//$this->system->load->dao('planos');
		$this->system->load->dao('professores');
		$this->system->load->dao('sistemas');
		$this->system->load->dao('configuracoesEmail');
	}
	// ===============================================================
	public function testarEmail($input,$configuracoes) {
		$titulo = $input['titulo'];
		$mensagem = html_entity_decode($input['mensagem']);			

		$this->envio($input['email'], $titulo, $mensagem);		

	}
	// ===============================================================
	// Administrativo
	// ===============================================================
	public function vendaRealizadaAdministrativo($numero = '00000') {
		$titulo = $this->system->emails->getValorPorId(15);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(16));

		$this->system->load->dao('administrativos');
		$administrativos = $this->system->administrativos->getAdministrativos();

		//Setar campos
		$this->setarValor('numero_pedido', $numero);

		foreach($administrativos as $administrativo) {
			if($administrativo['ativo']) {
				$this->envio($administrativo['email'], $titulo, $mensagem);
				//$this->gravarNotificacoes($administrativo['email'], $titulo, $mensagem);
			}
		}
	}
	// ===============================================================
	public function alteradoStatusVendaAdministrativo($numero = '00000') {
		$titulo = $this->system->emails->getValorPorId(15);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(16));
		
		$this->system->load->dao('administrativos');
		$administrativos = $this->system->administrativos->getAdministrativos();

		//Setar campos
		$this->setarValor('numero_pedido', $numero);

		foreach($administrativos as $administrativo) {
			if($administrativo['ativo']) {
				$this->envio($administrativo['email'], $titulo, $mensagem);
				//$this->gravarNotificacoes($administrativo['email'], $titulo, $mensagem);
			}
		}
	}
	// ===============================================================
	public function certificadoEmitidoAdministrativo($numero_certificado) {
		$titulo = $this->system->emails->getValorPorId(19);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(20));
		

		$this->system->load->dao('administrativos');
		$administrativos = $this->system->administrativos->getAdministrativos();

		//Setar campos
		$this->setarValor('numero_certificado', $numero_certificado);

		foreach($administrativos as $administrativo) {
			if($administrativo['ativo']) {
				$this->envio($administrativo['email'], $titulo, $mensagem);
				//$this->gravarNotificacoes($administrativo['email'], $titulo, $mensagem);
			}
		}	
	}
	// ===============================================================
	// Aluno 
	// ===============================================================
	public function cadastroAluno($email, $nome = '', $senha = '') {

		$nivel = $this->system->session->getItem('session_nivel');

		if($nivel == "5"){
			$idTitulo = 43;
			$idTexto = 44;
		}elseif ($nivel == "3") {
			$idTitulo = 1;
			$idTexto = 2;
		}
		$titulo = $this->system->emails->getValorPorId($idTitulo);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId($idTexto));

		//Setar campos
		$this->setarValor('nome_aluno', $nome);
		$this->setarValor('email_aluno', $email);
		$this->setarValor('senha_aluno', $senha);


		$this->envio($email, $titulo, $mensagem);
		$this->gravarNotificacoes($email, $titulo, $mensagem);
	}
	// ===============================================================
	//Desativado
	/*public function contaAprovadaAluno($alunoID) {
		$this->system->load->dao('alunos');
		$aluno = $this->system->alunos->getAluno($alunoID);

		$titulo = $this->system->emails->getValorPorId(42);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(43));

		//Setar campos
		$this->setarValor('nome_aluno', $aluno['nome']);
		$this->setarValor('email_aluno', $aluno['email']);


		$this->envio($aluno['email'], $titulo, $mensagem);
		$this->gravarNotificacoes($aluno['email'], $titulo, $mensagem);
	}*/
	// ===============================================================
	public function assinaturaContratadaAluno($alunoID, $plano) {
		$aluno = $this->system->alunos->getAluno($alunoID);

		$titulo = $this->system->emails->getValorPorId(70);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(71));

		//Setar campos
		$this->setarValor('nome_aluno', $aluno['nome']);
		$this->setarValor('nome_plano', $plano);

		$this->envio($aluno['email'], $titulo, $mensagem);
		$this->gravarNotificacoes($aluno['email'], $titulo, $mensagem);	
	}
	// ===============================================================
	public function expiraAssinatura10DiaAluno($alunoId, $planoId) {
		$plano = $this->system->planos->getPlano($planoId);
		$aluno = $this->system->alunos->getAluno($alunoId);

		$titulo = $this->system->emails->getValorPorId(72);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(73));

		//Setar campos
		$this->setarValor('nome_plano', $plano['plano']);
		$this->setarValor('nome_aluno', $aluno['nome']);
		
		$this->envio($aluno['email'], $titulo, $mensagem);
		$this->gravarNotificacoes($aluno['email'], $titulo, $mensagem);
	}
	// ===============================================================
	public function expiraAssinatura5DiaAluno($alunoId, $planoId) {
		$plano = $this->system->planos->getPlano($planoId);
		$aluno = $this->system->alunos->getAluno($alunoId);

		$titulo = $this->system->emails->getValorPorId(74);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(75));

		//Setar campos
		$this->setarValor('nome_plano', $plano['plano']);
		$this->setarValor('nome_aluno', $aluno['nome']);
		
		$this->envio($aluno['email'], $titulo, $mensagem);
		$this->gravarNotificacoes($aluno['email'], $titulo, $mensagem);
	}
	// ===============================================================
	public function expiraAssinatura1DiaAluno($alunoId, $planoId) {
		$plano = $this->system->planos->getPlano($planoId);
		$aluno = $this->system->alunos->getAluno($alunoId);

		$titulo = $this->system->emails->getValorPorId(76);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(77));

		//Setar campos
		$this->setarValor('nome_plano', $plano['plano']);
		$this->setarValor('nome_aluno', $aluno['nome']);
		
		$this->envio($aluno['email'], $titulo, $mensagem);
		$this->gravarNotificacoes($aluno['email'], $titulo, $mensagem);
	}
	// ===============================================================
	public function assinaturaRenovadaAluno($alunoID, $plano) {
		$aluno = $this->system->alunos->getAluno($alunoID);

		$titulo = $this->system->emails->getValorPorId(78);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(79));

		//Setar campos
		$this->setarValor('nome_aluno', $aluno['nome']);
		$this->setarValor('nome_plano', $plano);

		$this->envio($aluno['email'], $titulo, $mensagem);
		$this->gravarNotificacoes($aluno['email'], $titulo, $mensagem);		
	}
	// ===============================================================
	public function assinaturaNaoRenovadaAluno($alunoID, $plano) {
		$aluno = $this->system->alunos->getAluno($alunoID);

		$titulo = $this->system->emails->getValorPorId(80);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(81));

		//Setar campos
		$this->setarValor('nome_aluno', $aluno['nome']);
		$this->setarValor('nome_plano', $plano);

		$this->envio($aluno['email'], $titulo, $mensagem);
		$this->gravarNotificacoes($aluno['email'], $titulo, $mensagem);		
	}
	// ===============================================================
	public function vendaAprovadaAluno($alunoID, $numero = '00000', $dataExpiracao = '') {
		$aluno = $this->system->alunos->getAluno($alunoID);

		$titulo = $this->system->emails->getValorPorId(46);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(47));

		//Setar campos
		$this->setarValor('nome_aluno', $aluno['nome']);
		$this->setarValor('numero_pedido', $numero);
		$this->setarValor('data_expiracao', $dataExpiracao);

		$this->envio($aluno['email'], $titulo, $mensagem);
		$this->gravarNotificacoes($aluno['email'], $titulo, $mensagem);
	}
	// ===============================================================
	//Não usado ainda
	public function alterarStatusPedido($alunoID, $numero = '00000') {
		$aluno = $this->system->alunos->getAluno($alunoID);

		$titulo = $this->system->emails->getValorPorId(48);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(49));

		//Setar campos
		$this->setarValor('nome_aluno', $aluno['nome']);
		$this->setarValor('numero_pedido', $numero);	

		$this->envio($email, $titulo, $mensagem);
		$this->gravarNotificacoes($email, $titulo, $mensagem);	
	}
	// ===============================================================
	public function iniciarCurso($alunoID, $cursoID, $dataExpiracao = '') {
		$aluno = $this->system->alunos->getAluno($alunoID);
		$curso = $this->system->curso->getCurso($cursoID);

		$titulo = $this->system->emails->getValorPorId(50);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(51));

		//Setar campos
		$this->setarValor('nome_aluno', $aluno['nome']);
		$this->setarValor('nome_curso',$curso['curso']);
		$this->setarValor('data_expiracao', $dataExpiracao);	

		$this->envio($aluno['email'], $titulo, $mensagem);
		$this->gravarNotificacoes($aluno['email'], $titulo, $mensagem);	
	}
	// ===============================================================
	public function certificadoEmitidoAluno($alunoID, $curso) {
		$aluno = $this->system->alunos->getAluno($alunoID);

		$titulo = $this->system->emails->getValorPorId(56);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(57));

		//Setar campos
		$this->setarValor('nome_aluno', $aluno['nome']);
		$this->setarValor('nome_curso', $curso);	

		$this->envio($aluno['email'], $titulo, $mensagem);
		$this->gravarNotificacoes($aluno['email'], $titulo, $mensagem);	
	}
	// ===============================================================
	public function alteradoStatusCertificadoAluno($alunoId, $cursoId) {
		$curso = $this->system->curso->getCurso($cursoId);
		$aluno = $this->system->alunos->getAluno($alunoId);

		$titulo = $this->system->emails->getValorPorId(58);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(59));

		//Setar campos
		$this->setarValor('nome_curso', $curso['curso']);
		$this->setarValor('nome_aluno', $aluno['nome']);

		$this->envio($aluno['email'], $titulo, $mensagem);
		$this->gravarNotificacoes(0, $aluno['email'], $titulo, $mensagem);
	}
	// ===============================================================
	public function respostaDuvidaAluno($professorId, $alunoId, $tituloDuvida, $comentario) {
		$professor = $this->system->professores->getProfessor($professorId);
		$aluno = $this->system->alunos->getAluno($alunoId, true);

		$titulo = $this->system->emails->getValorPorId(52);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(53));


		//Setar campos
		$this->setarValor('nome_professor', $professor['nome']);
		$this->setarValor('nome_aluno', $aluno['nome']);
		$this->setarValor('titulo_duvida', $tituloDuvida);
		$this->setarValor('mensagem_duvida', $comentario);
		
		$titulo = $tituloDuvida;
		$mensagem = $comentario;

		$this->envio($aluno['email'], $titulo, $mensagem);
		$this->gravarNotificacoes($aluno['email'], $titulo, $mensagem);
	}
	// ===============================================================
	public function expiraCursoHojeAluno($alunoId, $cursoId, $expira) {
		$curso = $this->system->curso->getCurso($cursoId);
		$aluno = $this->system->alunos->getAluno($alunoId);

		$titulo = $this->system->emails->getValorPorId(66);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(67));

		//Setar campos
		$this->setarValor('nome_curso', $curso['curso']);
		$this->setarValor('nome_aluno', $aluno['nome']);
		$this->setarValor('data_expiracao', $expira);
		
		$this->envio($aluno['email'], $titulo, $mensagem);
		$this->gravarNotificacoes($aluno['email'], $titulo, $mensagem);

	}
	// ===============================================================
	public function expiraCurso1DiaAluno($alunoId, $cursoId, $expira) {
		$curso = $this->system->curso->getCurso($cursoId);
		$aluno = $this->system->alunos->getAluno($alunoId);

		$titulo = $this->system->emails->getValorPorId(64);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(65));

		//Setar campos
		$this->setarValor('nome_curso', $curso['curso']);
		$this->setarValor('nome_aluno', $aluno['nome']);
		$this->setarValor('data_expiracao', $expira);
		
		$this->envio($aluno['email'], $titulo, $mensagem);
		$this->gravarNotificacoes($aluno['email'], $titulo, $mensagem);
	}
	// ===============================================================
	public function expiraCurso15DiaAluno($alunoId, $cursoId, $expira) {
		$curso = $this->system->curso->getCurso($cursoId);
		$aluno = $this->system->alunos->getAluno($alunoId);

		$titulo = $this->system->emails->getValorPorId(62);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(63));

		//Setar campos
		$this->setarValor('nome_curso', $curso['curso']);
		$this->setarValor('nome_aluno', $aluno['nome']);
		$this->setarValor('data_expiracao', $expira);
		
		$this->envio($aluno['email'], $titulo, $mensagem);
		$this->gravarNotificacoes($aluno['email'], $titulo, $mensagem);
	}
	// ===============================================================
	public function expiraCurso30DiaAluno($alunoId, $cursoId, $expira) {
		$curso = $this->system->curso->getCurso($cursoId);
		$aluno = $this->system->alunos->getAluno($alunoId);

		$titulo = $this->system->emails->getValorPorId(60);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(61));

		//Setar campos
		$this->setarValor('nome_curso', $curso['curso']);
		$this->setarValor('nome_aluno', $aluno['nome']);
		$this->setarValor('data_expiracao', $expira);
		
		$this->envio($aluno['email'], $titulo, $mensagem);
		$this->gravarNotificacoes($aluno['email'], $titulo, $mensagem);
	}
	// ===============================================================
	// Professor
	// ===============================================================
	public function cadastroProfessor($email, $nome, $senha) {
		$titulo = $this->system->emails->getValorPorId(21);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(22));
		
		//Setar campos
		$this->setarValor('nome_professor', $nome);
		$this->setarValor('email_professor', $email);
		$this->setarValor('senha_professor', $senha);	

		$this->envio($email, $titulo, $mensagem);
		$this->gravarNotificacoes($email, $titulo, $mensagem);
	}
	// ===============================================================
	public function vendaCursoProfessor($curso, $numero = '00000') {
		$curso = $this->system->cursos->getCurso($curso);
		$professor = $this->system->professores->getProfessor($curso['professor_id']);

		$titulo = $this->system->emails->getValorPorId(33);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(34));

		//Setar campos
		$this->setarValor('nome_professor', $professor['nome']);
		$this->setarValor('nome_curso',$curso['curso']);
		$this->setarValor('numero_pedido', $numero);
		
		$this->envio($curso['professor']['email'], $titulo, $mensagem);
		//$this->gravarNotificacoes($curso['professor']['email'], $titulo, $mensagem);
	}
	// ==============================================================
	public function novaDuvidaProfessor($cursoId, $professorId, $alunoId, $tituloDuvida, $comentario) {
		
		$curso = $this->system->cursos->getCurso($cursoId);		
		$professor = $this->system->professores->getProfessor($professorId);		
		$aluno = $this->system->alunos->getAluno($alunoId);
		
		$titulo = $this->system->emails->getValorPorId(23);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(24));
	
		//Setar campos
		$this->setarValor('nome_professor', $professor['nome']);
		$this->setarValor('nome_curso',$curso['curso']);
		$this->setarValor('nome_aluno', $aluno['nome']);
		$this->setarValor('titulo_duvida', $tituloDuvida);
		$this->setarValor('mensagem_duvida', $comentario);
		
		//$this->envio($professor['email'], $titulo, $mensagem);
		$this->gravarNotificacoes($professor['email'], $titulo, $mensagem);
	}
	// ==============================================================
	public function duvidaNaoRespondida6Professor($cursoId, $professorId, $alunoId, $tituloDuvida, $comentario) {
		$curso = $this->system->curso->getCurso($cursoId);
		$professor = $this->system->professores->getProfessor($professorId);
		$aluno = $this->system->alunos->getAluno($alunoId);

		$titulo = $this->system->emails->getValorPorId(25);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(26));

		//Setar campos
		$this->setarValor('nome_professor', $professor['nome']);
		$this->setarValor('nome_curso',$curso['curso']);
		$this->setarValor('nome_aluno', $aluno['nome']);
		$this->setarValor('titulo_duvida', $tituloDuvida);
		$this->setarValor('mensagem_duvida', $comentario);
		
		$this->envio($professor['email'], $titulo, $mensagem);
		//$this->gravarNotificacoes($professor['email'], $titulo, $mensagem);
	}
	// ==============================================================
	public function duvidaNaoRespondida12Professor($cursoId, $professorId, $alunoId, $tituloDuvida, $comentario) {
		$curso = $this->system->curso->getCurso($cursoId);
		$professor = $this->system->professores->getProfessor($professorId);
		$aluno = $this->system->alunos->getAluno($alunoId);

		$titulo = $this->system->emails->getValorPorId(27);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(28));

		//Setar campos
		$this->setarValor('nome_professor', $professor['nome']);
		$this->setarValor('nome_curso',$curso['curso']);
		$this->setarValor('nome_aluno', $aluno['nome']);
		$this->setarValor('titulo_duvida', $tituloDuvida);
		$this->setarValor('mensagem_duvida', $comentario);
		
		$this->envio($professor['email'], $titulo, $mensagem);
		//$this->gravarNotificacoes($professor['email'], $titulo, $mensagem);
	}
	// ==============================================================
	public function duvidaNaoRespondida24Professor($cursoId, $professorId, $alunoId, $tituloDuvida, $comentario) {
		$curso = $this->system->curso->getCurso($cursoId);
		$professor = $this->system->professores->getProfessor($professorId);
		$aluno = $this->system->alunos->getAluno($alunoId);

		$titulo = $this->system->emails->getValorPorId(29);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(30));

		//Setar campos
		$this->setarValor('nome_professor', $professor['nome']);
		$this->setarValor('nome_curso',$curso['curso']);
		$this->setarValor('nome_aluno', $aluno['nome']);
		$this->setarValor('titulo_duvida', $tituloDuvida);
		$this->setarValor('mensagem_duvida', $comentario);
		
		$this->envio($professor['email'], $titulo, $mensagem);
		//$this->gravarNotificacoes($professor['email'], $titulo, $mensagem);
	}
	// ==============================================================
	public function duvidaNaoRespondida48Professor($cursoId, $professorId, $alunoId, $tituloDuvida, $comentario) {
		$curso = $this->system->curso->getCurso($cursoId);
		$professor = $this->system->professores->getProfessor($professorId);
		$aluno = $this->system->alunos->getAluno($alunoId);

		$titulo = $this->system->emails->getValorPorId(31);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(32));

		//Setar campos
		$this->setarValor('nome_professor', $professor['nome']);
		$this->setarValor('nome_curso',$curso['curso']);
		$this->setarValor('nome_aluno', $aluno['nome']);
		$this->setarValor('titulo_duvida', $tituloDuvida);
		$this->setarValor('mensagem_duvida', $comentario);
		
		$this->envio($professor['email'], $titulo, $mensagem);
		//$this->gravarNotificacoes($professor['email'], $titulo, $mensagem);
	}
	// ===============================================================
	public function pagamentoRealizadoProfessor($nome, $email) {
		$titulo = $this->system->emails->getValorPorId(37);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(38));

		//Setar campos
		$this->setarValor('nome_professor', $nome);

		
		$this->envio($email, $titulo, $mensagem);
	}
	// ===============================================================
	// Coordenadores
	// ===============================================================
	public function cadastroCoordenador($email, $nome, $senha) {
		$titulo = $this->system->emails->getValorPorId(91);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(92));
		
		//Setar campos
		$this->setarValor('nome_coordenador', $nome);
		$this->setarValor('email_coordenador', $email);
		$this->setarValor('senha_coordenador',$senha);

		//$this->envio($email, $titulo, $mensagem);
		$this->gravarNotificacoes($email, $titulo, $mensagem);
	}
	// ===============================================================
	// Parceiros
	// ===============================================================
	public function cadastroParceiro($email, $nome, $senha) {
		$titulo = $this->system->emails->getValorPorId(85);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(86));
		
		//Setar campos
		$this->setarValor('nome_parceiro', $nome);
		$this->setarValor('email_parceiro', $email);
		$this->setarValor('senha_parceiro',$senha);

		$this->envio($email, $titulo, $mensagem);
		//$this->gravarNotificacoes($email, $titulo, $mensagem);
	}
	// ===============================================================
	public function cursoCadastradoParceiro($email, $curso) {
		$titulo = "Curso cadastrado por Parceiro";
		$mensagem = html_entity_decode("Olá, acabei de cadastrar um curso. Curso nome: ". $curso['curso'] ." . Espero que o mesmo seja liberado para proseguir com as vendas!");

		$this->envio($email, $titulo, $mensagem);
		$this->gravarNotificacoes($email, $titulo, $mensagem);
	}	
	// ===============================================================
	public function relatorioFechado($email, $nome, $mes, $ano) {
		$titulo = $this->system->emails->getValorPorId(87);
		$mensagem = html_entity_decode($this->system->emails->getValorPorId(88));

		//Setar campos
		$this->setarValor('nome_parceiro', $nome);
		$this->setarValor('mes', $mes);
		$this->setarValor('ano', $ano);

		$this->envio($email, $titulo, $mensagem);
	}
	// ===============================================================
	// Notificações
	// ===============================================================
	public function envioNotificacoes($titulo, $conteudo, $usuarioNivel, $cursos) {
		$usuarios = $this->system->usuarios->getUsuariosByNivel($usuarioNivel);

		if ($usuarioNivel == 2) { //Coordenadores
			$titulo = $this->system->emails->getValorPorId(3);
			$mensagem = html_entity_decode($this->system->emails->getValorPorId(4));
		}

		if ($usuarioNivel == 3) { //Professor
			$titulo = $this->system->emails->getValorPorId(39);
			$mensagem = html_entity_decode($this->system->emails->getValorPorId(40));
		}

		if ($usuarioNivel == 4) { //Aluno
			$this->system->load->dao('curso');
		
			$titulo = $this->system->emails->getValorPorId(54);
			$mensagem = html_entity_decode($this->system->emails->getValorPorId(55));
			$usuarios = array();
			foreach ($cursos as $curso) {
				$alunos = $this->system->curso->alunosByCurso($curso);
				$usuarios = array_merge_recursive($usuarios, $alunos);
			}
				
		}

		if ($usuarioNivel == 5) { //Parceiros
			$titulo = $this->system->emails->getValorPorId(89);
			$mensagem = html_entity_decode($this->system->emails->getValorPorId(90));
		}

		if ($usuarioNivel == 6) { //Administrativo
			$titulo = $this->system->emails->getValorPorId(13);
			$mensagem = html_entity_decode($this->system->emails->getValorPorId(14));
		}

		$this->setarValor('titulo_notificacao', html_entity_decode($titulo));
		$this->setarValor('mensagem_notificacao', html_entity_decode($conteudo));
		
		foreach ($usuarios as $usuario) {
			$this->setarValor('nome_aluno', $usuario['nome']);
			$this->setarValor('nome_professor', $usuario['nome']);
			$this->setarValor('nome_administrativo', $usuario['nome']);
			$this->setarValor('nome_parceiro', $usuario['nome']);
			$this->setarValor('nome_coordenador', $usuario['nome']);

			$this->envio($usuario['email'], $titulo, $mensagem);
		}
	}
	// ===============================================================
	private function setarValor($key, $value) {
		$this->shortcode['[[' . $key . ']]'] = $value;
	}
	// ===============================================================
	private function envio($email, $titulo, $conteudo) {
		$usuario = $this->system->usuarios->getUsuarioByEmail($email);
		if ($usuario['id']) {
			$this->setarValor('email_usuario', $email);
			$this->setarValor('senha_usuario', $usuario['senha']);	
		}
		
		$configuracoesEmail = $this->system->configuracoesEmail->getConfiguracoesGeraisEmail($this->system->getSistemaID());
		
		$deNome = $configuracoesEmail['nome'];
		$deEmail = $configuracoesEmail['email'];

		$conteudo = str_replace(array_keys($this->shortcode), array_values($this->shortcode), $conteudo);
		$this->system->view->assign(array(
			'url_site'		=> $this->system->getUrlSite(),
			'imagem_header'	=> $this->system->getUrlSite().'market/uploads/configuracoes_email/'.$configuracoesEmail['imagem_cabecalho'],
			'titulo'		=> $titulo,
			'mensagem'		=> $conteudo,
			'texto_rodape' 	=> html_entity_decode($configuracoesEmail['texto_rodape'])
		));

		$mensagem = $this->system->view->fetch('global/modelo_email.tpl');
		$this->system->func->sendMail($email, $titulo, $mensagem, $deNome, $deEmail,$configuracoesEmail);
		sleep(1);
	}
	// ===============================================================
	public function gravarNotificacoes($email, $titulo, $conteudo) {

		$usuario = $this->system->usuarios->getUsuarioByEmail($email);		
		
		/*$sistemaID = $this->system->usuarios->getSistemaID($id);
		$responsavel = $this->system->sistemas->getResponsavelSistema($sistemaID);		
		$remetenteID = $responsavel['id'];	*/
		
		if ($usuario['id']) {
			$conteudo = str_replace(array_keys($this->shortcode), array_values($this->shortcode), $conteudo);
			$this->system->notificacoes->notificacaoEmail($usuario['id'], $titulo, $conteudo, $remetenteID);
		}
	}
	// ===============================================================
	public function enviarContato($nome, $email, $mensagem) {
		$to = $this->system->getEmail();
		$titulo = 'Contato iTeacher';

		$this->system->view->assign(array(
			'url_site'		=> $this->system->getUrlSite(),
			'imagem_header'	=> $this->system->getUrlSite().'market/uploads/imagens/'.$this->system->emails->getValorPorId(86),
			'titulo'		=> $titulo,
			'mensagem'		=> 'Nome:' . $nome . '<br/>' . $mensagem,
			'texto_rodape' 	=> html_entity_decode($this->system->emails->getValorPorId(87))
		));
		$mensagem = $this->system->view->fetch('global/modelo_email.tpl');

		$configuracoesEmail = $this->system->configuracoesEmail->getConfiguracoesGeraisEmail($this->system->getSistemaID());

		$this->system->func->sendMail($to, $titulo, $mensagem, $nome, $email, $configuracoesEmail);
	}
	// Grafica
	// ===============================================================
	public function emailGrafica($certificado, $aluno, $curso, $emailGrafica, $anexos = array()) {
		$to = $emailGrafica;
		$titulo = 'Olá Gráfica, temos um novo certificado para impressão (' .  $certificado . ')';

		$deNome = $this->system->emails->getValorPorId(84);
		$deEmail = $this->system->emails->getValorPorId(85);

		$mensagem = 'CERTIFICADO: ' . $certificado . '<br/>';
		$mensagem .= 'NOME: ' . $aluno . '<br/>';
		$mensagem .= 'CURSO: ' . $curso;
		$this->system->view->assign(array(
			'url_site'		=> $this->system->getUrlSite(),
			'imagem_header'	=> $this->system->getUrlSite().'market/uploads/imagens/'.$this->system->emails->getValorPorId(86),
			'titulo'		=> $titulo,
			'mensagem'		=> $mensagem,
			'texto_rodape' 	=> html_entity_decode($this->system->emails->getValorPorId(87))
		));
		$mensagem = $this->system->view->fetch('global/modelo_email.tpl');

		$configuracoesEmail = $this->system->configuracoesEmail->getConfiguracoesGeraisEmail($this->system->getSistemaID());

		$this->system->func->sendMail($to, $titulo, $mensagem, $deNome, $deEmail, $configuracoesEmail, $anexos);
	}
	// Portal
	// ===============================================================
	public function sejaUmProfessor($nome, $email, $minicurriculo, $cursos, $emailDestino) {
		$to = $emailDestino;
		$titulo = 'Seja um Professor iTeacher';
		$mensagem = '<strong>Nome:</strong> ' . $nome . '<br/>';
		$mensagem .= '<strong>Email:</strong> ' . $email . '<br/>';
		$mensagem .= '<strong>Mini-curriculo:</strong> ' . $minicurriculo . '<br/>';
		$mensagem .= '<strong>Cursos:</strong> ' . $cursos . '<br/>';

		$this->system->view->assign(array(
			'url_site'		=> $this->system->getUrlSite(),
			'imagem_header'	=> $this->system->getUrlSite().'market/uploads/imagens/'.$this->system->emails->getValorPorId(86),
			'titulo'		=> $titulo,
			'mensagem'		=> $mensagem,
			'texto_rodape' 	=> html_entity_decode($this->system->emails->getValorPorId(87))
		));
		$mensagem = $this->system->view->fetch('global/modelo_email.tpl');

		$configuracoesEmail = $this->system->configuracoesEmail->getConfiguracoesGeraisEmail($this->system->getSistemaID());

		$this->system->func->sendMail($to, $titulo, $mensagem, $nome, $email, $configuracoesEmail);
	}
	// ==============================================================
	public function sejaUmRevendedor($nome, $email, $site, $atuacao, $telefone, $mensagemTexto, $emailDestino) {
		$to = $emailDestino;
		$titulo = 'Seja um Revendedor iTeacher';
		$mensagem = '<strong>Nome:</strong> ' . $nome . '<br/>';
		$mensagem .= '<strong>Email:</strong> ' . $email . '<br/>';
		$mensagem .= '<strong>Site:</strong> ' . $site . '<br/>';
		$mensagem .= '<strong>Área de atuação:</strong> ' . $atuacao . '<br/>';
		$mensagem .= '<strong>Telefone:</strong> ' . $telefone . '<br/>';
		$mensagem .= '<strong>Mensagem:</strong> ' . $mensagemTexto . '<br/>';

		$this->system->view->assign(array(
			'url_site'		=> $this->system->getUrlSite(),
			'imagem_header'	=> $this->system->getUrlSite().'market/uploads/imagens/'.$this->system->emails->getValorPorId(86),
			'titulo'		=> $titulo,
			'mensagem'		=> $mensagem,
			'texto_rodape' 	=> html_entity_decode($this->system->emails->getValorPorId(87))
		));
		$mensagem = $this->system->view->fetch('global/modelo_email.tpl');

		$configuracoesEmail = $this->system->configuracoesEmail->getConfiguracoesGeraisEmail($this->system->getSistemaID());

		$this->system->func->sendMail($to, $titulo, $mensagem, $nome, $email, $configuracoesEmail);	
	}
	// ===============================================================
	public function lembrarSenha($nome, $email, $id_md5) {
		$to = $email;
		$link = $this->system->getUrlSite() . 'conta/redefinirSenha/' . $id_md5;
		$titulo = 'Lembrar Senha - Cursos iTeacher';
		$mensagem = 'Olá <strong>' . $nome . '</strong><br/><br/>';
		$mensagem .= 'Você solicitou que sua senha fosse alterada. Para dá continuidade acesse o link abaixo: <br/><br/>';
		$mensagem .= '<a href="' . $link  . '">' . $link . '</a><br/>';

		

		$this->system->view->assign(array(
			'url_site'		=> $this->system->getUrlSite(),
			'imagem_header'	=> $this->system->getUrlSite().'market/uploads/imagens/'.$this->system->emails->getValorPorId(86),
			'titulo'		=> $titulo,
			'mensagem'		=> $mensagem,
			'texto_rodape' 	=> html_entity_decode($this->system->emails->getValorPorId(87))
		));

		$configuracoesEmail = $this->system->configuracoesEmail->getConfiguracoesGeraisEmail($this->system->getSistemaID());

		$mensagem = $this->system->view->fetch('global/modelo_email.tpl');
		
		$this->system->func->sendMail($to, $titulo, $mensagem, $configuracoesEmail);
	}

}
// ===================================================================