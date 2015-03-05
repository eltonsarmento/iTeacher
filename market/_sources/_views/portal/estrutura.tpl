<!DOCTYPE html>
<html lang="pt-br">
<head>

	<!-- ========== META TAG ========== -->
	<meta charset="utf-8">

	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="description" content="">
    <meta name="author" content="iTeacher - Plataforma Educacional (www.iteacher.com.br)">
    <meta name="keywords" content="">
    <meta name="robots" content="index,follow">

    <!-- ========== FAVICON ========== -->

	<!-- ========== TITLE ========== -->
	<title>iTeacher - Theme Light</title>

	<!-- ========== CSS ========== -->
	<link rel="stylesheet" type="text/css" href="{$url_site}market/common/portal/assets/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="{$url_site}market/common/portal/assets/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="{$url_site}market/common/portal/assets/css/style.css">

	<!-- ========== jQuery ========== -->
	<script src="{$url_site}market/common/portal/assets/js/jquery-1.11.1.min.js"></script>

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="assets/js/html5shiv.js"></script>
      <script src="assets/js/respond.min.js"></script>
    <![endif]-->

	<!-- ========== AREA FOR ZOPIM ========== -->
	<!-- ========== AREA FOR HUBSPOT ========== -->

</head>
<body>

	<section class="bar-top">

		<section class="container">

			<section class="row">

				<section class="col-lg-6 col-sm-6 col-xs-12">

					<a href="{$url_portal}portal/conta/cadastro" class="btn registre"><b>Cadastre-se</b> agora!</a>

				</section><!-- /.col-lg-6 -->

				<section class="col-lg-6 col-sm-6 col-xs-12">

					<span class="pull-right">
						{if $cliente.nivel eq 5}
							<a href="{$url_portal}portal/certificado" data-toggle="modal" class="btn btn-dark">Consultar Certificado</a>
						{/if}
						<a href="{$url_site}market" data-toggle="modal" class="btn btn-success"><i class="fa fa-user"></i> Área do Aluno</a>

					</span>

				</section><!-- /.col-lg-6 -->

			</section><!-- /.row -->

		</section><!-- /.container -->

	</section><!-- /.bar-top -->

	<header class="header">

		<section class="container">

			<section class="row">

				<section class="col-lg-3 col-sm-12 col-xs-12">

					<section >

						<a href="{$url_portal}" title="iTeacher - Theme Light">
						
							<img src="{$url_site}market/common/portal/assets/img/logo-default.png" class="img-responsive" alt="iTeacher - Theme Light" title="iTeacher - Theme Light">
						
						</a>

					</section><!-- /.logo -->

				</section><!-- /.col-lg-3 -->

				<section class="col-lg-9 col-sm-12 col-xs-12">

					<nav class="menu" role="navigation">

						<a href="{$url_portal}portal/pagina/index/Assinaturas" class="btn">Assinaturas</a>
						<a href="{$url_portal}portal/pagina/index/Quem-Sou" class="btn">Quem Sou</a>
						<a href="{$url_portal}portal/pagina/index/Termos-e-Condições" class="btn">Termos e Condições</a>
						<a href="{$url_portal}portal/pagina/index/10-Razões-para-estudar" class="btn">10 Razões para estudar</a>
						<a href="{$url_portal}portal/pagina/index/Guia-de-Carreira" class="btn">Guia de Carreira</a>
						<a href="{$url_portal}portal/pagina/index/Cursos-Online" class="btn">Cursos Online</a>
						<a href="{$url_portal}portal/pagina/index/Suporte" class="btn">Suporte</a>

					</nav>

				</section><!-- /.col-lg-9 -->

			</section><!-- /.row -->

		</container><!-- /.logo -->

	</header><!-- /.header -->

	<nav class="navbar navbar-menu" role="navigation">

		<section class="container">

			<section class="navbar-header">

		        <button type="button" class="navbar-toggle tooltips" data-toggle="collapse" data-target="#navbar" data-toggle="tooltip" data-placement="left" title="Expandir Menu">

			        <span class="sr-only">Expandir Menu</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>

		        </button>

			</section><!-- /.navbar-header -->
			
			<section class="collapse navbar-collapse" id="navbar">

		        <ul class="nav navbar-nav">
		        	{foreach item=categoria from=$categorias}
		        		<li><a href="{$url_portal}portal/categorias/index/{$categoria.id}">{$categoria.area}</a></li>
		        	{/foreach}
		        </ul>
			        <!-- <li><a href="{$url_site}portal/categorias">Categoria</a></li>
			        <li><a href="{$url_site}portal/categorias">Categoria</a></li>
			        <li><a href="{$url_site}portal/categorias">Categoria</a></li>
			        <li><a href="{$url_site}portal/categorias">Categoria</a></li>
			        <li><a href="{$url_site}portal/categorias">Categoria</a></li>
			        <li><a href="{$url_site}portal/categorias">Categoria</a></li>
			        <li><a href="{$url_site}portal/categorias">Categoria</a></li>
			        <li><a href="{$url_site}portal/categorias">Categoria</a></li>
			        <li><a href="{$url_site}portal/categorias">Categoria</a></li>
			        <li><a href="{$url_site}portal/categorias">Categoria</a></li>
			        <li><a href="{$url_site}portal/categorias">Categoria</a></li>
			        <li><a href="{$url_site}portal/categorias">Categoria</a></li>
	        	</ul>

			</section><!-- /.navbar-collapse -->
			
		</section><!-- /.container -->
	
	</nav>
	<section class="bar-search-cart">

		<section class="container">

			<section class="row">

				<section class="col-lg-4 col-sm-6 col-xs-12">

					<form action="" method="">

						<section class="input-group">

	      					<input type="text" class="form-control" placeholder="O que você procura?" autocomplete="off" required>

					      	<span class="input-group-btn">

					        	<button class="btn btn-dark" type="submit"><i class="fa fa-search"></i></button>

					      	</span>

	    				</section><!-- /.input-group -->

    				</form>

				</section><!-- /.col-lg-6 -->

				<section class="col-lg-8 col-sm-6 col-xs-12">

					<span class="pull-right">
						{if $carrinhoTotal eq 0}
                    		Ops, seu carrinho esta vazio! :( <a href="{$url_portal}portal/carrinho/ver" class="btn btn-dark btn-cart"><i class="fa fa-shopping-cart"></i></a>
                    	{else}
                    		Carrinho de Compras - <b>{$carrinhoTotal} Itens</b> <a href="{$url_portal}portal/carrinho/ver" class="btn btn-dark btn-cart"><i class="fa fa-shopping-cart"></i></a>
                    	{/if}
						

					</span>

				</section><!-- /.col-lg-6 -->

			</section><!-- /.row -->

		</section><!-- /.container -->

	</section><!-- /.bar-search-cart -->