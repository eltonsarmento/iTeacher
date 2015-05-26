<?php
// ===================================================================
//session_name('session_system');
//session_save_path(dirname(__FILE__).'/lms/_sources/libraries/session/');

//session_set_cookie_params(0, '/', '.localmarket.com');
session_start();

if (!$_GET['categoria']) $_GET['categoria'] = 'site';
if (!$_GET['module']) {
	$_GET['module'] = 'home';	
	$_GET['do'] = 'index';
}

require(dirname(__FILE__) . '/market/_sources/libraries/class.system.php');

$system = new System((($_GET['categoria'] == 'site' || $_GET['categoria'] == 'portal' || $_GET['cliente'] == '') ? false : true), ($_GET['categoria'] == 'portal' || $_GET['cliente'] != '' ? true : false));

/*
if ($_GET['cliente']) {
	$cliente = $system->session->getItem('session_empresa_cliente');

	if ($_GET['cliente'] != $cliente) {
		$system->session->addItem('session_empresa_cliente',$_GET['cliente']);	
		//$system->session->deleteItem('session_cod_empresa');
	}			
}
*/

/*
echo '<br>';
echo "cliente : ".$system->session->getItem('session_empresa_cliente');
echo '<br>';
echo "Sistema_id : ".$system->session->getItem('session_cod_empresa');
*/

$system->site->Load($system->input['module']);
$system->site->Run();
die;
// ===================================================================