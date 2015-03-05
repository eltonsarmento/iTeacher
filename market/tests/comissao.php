<?php
// ===================================================================
require(dirname(__FILE__) . '/../_sources/libraries/class.system.php');
$system = new System(true, false);

$system->load->model('saldo_model');
$system->saldo_model->adicionarVenda(1);
$system->saldo_model->removerVenda(1);
die;
// ===================================================================