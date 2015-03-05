<?php
// ===================================================================
require(dirname(__FILE__) . '/../_sources/libraries/class.system.php');
$system = new System(true, false);

$system->load->dao('alunos');

$system->setSistemaID(1);
$senha = $system->func->criptografar('kmf2014');

echo $senha;
$dados = array(
	'id'			=> 31,
	'nome'			=> 'Teste',
	'email'			=> 'teste@kmf.com.br',
	'ativo'			=> '1',
	'senha'			=> $senha,
	'cep'			=> '11111',
	'cpf'           => '11111',
    'endereco'      => '11111',
    'complemento'	=> '11111',
    'bairro'        => '11111',
    'cidade'        => '11111',
    'estado'        => '11111',
    'telefone'      => '11111'
);


$system->alunos->atualizar($dados);
die;
// ===================================================================