<?php
// ===================================================================
//session_name('sessionsystem');
//session_save_path(dirname(__FILE__).'/_sources/libraries/session/');
session_set_cookie_params(0, '/', '.localmarket.com');
session_start();

require(dirname(__FILE__) . '/_sources/libraries/class.system.php');
$system = new System();

$system->admin->Load($system->input['module']);

$system->admin->Run();
die;
// ===================================================================