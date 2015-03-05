<?php
// ===================================================================
require(dirname(__FILE__) . '/../_sources/libraries/class.system.php');
$system = new System(true, false);

$system->setSistema(2);
var_dump($system->getSistemaID());
die;
// ===================================================================