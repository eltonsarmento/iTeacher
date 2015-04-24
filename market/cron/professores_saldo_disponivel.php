<?php
// ===================================================================
require(dirname(__FILE__) . '/../_sources/libraries/class.system.php');
$system = new System(true, false);
$system->load->model('saldo_model');
$system->load->model('email_model');
$system->load->dao('sistemas');

$vendas = $system->saldo_model->liberarSaldoDisponivel();
foreach ($vendas as $venda)  {
	if ($venda['concluido']) {
		//$responsavel = $system->sistemas->getResponsavelSistema($venda['sistema_id']);

		//Enviar email para o responsável se tiver(se tiver)
	}
}


die;
// ===================================================================