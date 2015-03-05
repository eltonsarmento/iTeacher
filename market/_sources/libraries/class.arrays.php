<?php
// ===================================================================
class Arrays {
	// ===============================================================
	public function getArrayCategorias() {
		return array(
			1 => 'administrador',
			2 => 'aluno',
			3 => 'professor',
			4 => 'professor-administrativo',
			5 => 'instituicao',
			6 => 'instituicao-coordenador',
			7 => 'instituicao-parceiro',
			8 => 'instituicao-professor',
			9 => 'administrador/acesso_instituicao'
		);
	}
	// ===============================================================
	public function getMes($mes) {
		$meses = array(
			'01' 	=> 'Janeiro',
			'02' 	=> 'Fevereiro',
			'03' 	=> 'Março',
			'04' 	=> 'Abril',
			'05' 	=> 'Maio',
			'06' 	=> 'Junho',
			'07' 	=> 'Julho',
			'08' 	=> 'Agosto',
			'09' 	=> 'Setembro',
			'10' 	=> 'Outubro',
			'11' 	=> 'Novembro',
			'12' 	=> 'Dezembro'
		);
		return $meses[$mes];
	}
	// ===============================================================
}
// ===================================================================