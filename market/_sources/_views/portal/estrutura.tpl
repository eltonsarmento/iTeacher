<!DOCTYPE html>
<html lang="pt-br">
<head>

	<!-- ========== META TAG ========== -->
	<meta charset="utf-8">

	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="description" content="">
    <meta name="author" content="{$nomeInstituicao} - Plataforma Educacional (www.iteacher.com.br)">
    <meta name="keywords" content="">
    <meta name="robots" content="index,follow">

    <!-- ========== FAVICON ========== -->

	<!-- ========== TITLE ========== -->
	<title>{$nomeInstituicao}</title>

	<!-- ========== CSS ========== -->
	<link rel="stylesheet" type="text/css" href="{$url_site}market/common/portal/assets/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="{$url_site}market/common/portal/assets/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="{$url_site}market/common/portal/assets/css/style.css">


	<!-- ========== CSS tema ========== -->
	{if $configuracoesTema.cor_primaria}
		<style TYPE="text/css">			
			.btn-dark {			  
			  background-color: {$configuracoesTema.cor_primaria};
			  box-shadow: 0 2px 0 {$configuracoesTema.cor_primaria};
			}
			.navbar-menu {
			  background-color: {$configuracoesTema.cor_primaria};
			}
			.footer-secundary{ background-color:{$configuracoesTema.cor_primaria};}
			.form-control:focus{ border-color:{$configuracoesTema.cor_primaria};}			
			.panel-default>.panel-heading, .page .panel-heading, .panel-dark > .panel-heading { background-color:{$configuracoesTema.cor_primaria};}

			/**/
		</style>
	{/if}
	{if $configuracoesTema.cor_secundaria}
		<style TYPE="text/css">
			.bar-top { background-color:{$configuracoesTema.cor_secundaria};}
			.bar-search-cart { background-color:{$configuracoesTema.cor_secundaria};}			
			.footer-primary { background-color:{$configuracoesTema.cor_secundaria};}
			/**/
		</style>
	{/if}
	<!-- CTA -->
	{if $configuracoesTema.cor_btn_compra}
		<style TYPE="text/css">
			.btn-success { background-color:{$configuracoesTema.cor_btn_compra};}
			.price { background-color:{$configuracoesTema.cor_btn_compra};}
			/**/
		</style>
	{/if}

	<!-- FIMCTA -->
	<!-- HOVER-CTA -->
	{if $configuracoesTema.cor_hover_btn_compra}
		<style TYPE="text/css">
			.btn-success:hover,
			 .btn-success:focus,
			 .btn-success:active,
			 .btn-success.active,
			 .open .dropdown-toggle.btn-success { background-color:{$configuracoesTema.cor_hover_btn_compra};}

			/**/
		</style>
	{/if}
	<!-- FIM HOVER-CTA -->

	<!-- BORDA-CTA -->
	{if $configuracoesTema.cor_borda_btn_compra}
		<style TYPE="text/css">
			.btn-success { box-shadow: 0 2px 0 {$configuracoesTema.cor_borda_btn_compra};}
			/**/
		</style>
	{/if}
	<!-- FIM BORDA-CTA -->

	<!-- BORDA-CTA -->
	{if $configuracoesTema.cor_hover_btn_geral}
		<style TYPE="text/css">
			.btn-dark:hover,
			.btn-dark:focus,
			.btn-dark:active,
			.btn-dark.active,
			.open .dropdown-toggle.btn-dark { background-color:{$configuracoesTema.cor_hover_btn_geral};}
			/**/
		</style>
	{/if}
	<!-- FIM BORDA-CTA -->

	<!-- HOVER-NAVBAR-MENU (HOVER NOS LINKS) -->
	{if $configuracoesTema.cor_hover_linkmenu}
		<style TYPE="text/css">
			.navbar-menu li:hover a { background-color:{$configuracoesTema.cor_hover_linkmenu};}
			/**/
		</style>
	{/if}
	<!-- FIM HOVER-NAVBAR-MENU (HOVER NOS LINKS) -->


	<!-- FONTES -->
	{if $configuracoesTema.cor_fonte_primaria}
		<style TYPE="text/css">
			.btn-dark { color:{$configuracoesTema.cor_fonte_primaria};}
			.navbar-menu li a { color:{$configuracoesTema.cor_fonte_primaria};}
			.footer-secundary { color:{$configuracoesTema.cor_fonte_primaria};}
			.panel-default>.panel-heading, .page .panel-heading, .panel-dark > .panel-heading { color:{$configuracoesTema.cor_fonte_primaria};}
			/**/
		</style>
	{/if}

	{if $configuracoesTema.cor_fonte_secundaria}
		<style TYPE="text/css">
			.bar-top .registre { color:{$configuracoesTema.cor_fonte_secundaria};}
			.bar-search-cart .pull-right { color:{$configuracoesTema.cor_fonte_secundaria};}
			.footer-primary { color:{$configuracoesTema.cor_fonte_secundaria};}
			.bar-top { color:{$configuracoesTema.cor_fonte_secundaria};}
			.bar-top .user { color:{$configuracoesTema.cor_fonte_secundaria};}

			/**/
		</style>
	{/if}

	{if $configuracoesTema.cor_fonte_botao}
		<style TYPE="text/css">
			.btn-success{ color:{$configuracoesTema.cor_fonte_botao};}
			.price{ color:{$configuracoesTema.cor_fonte_botao};}
			/**/
		</style>
	{/if}

	{if $configuracoesTema.fonte}
		<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family={$configuracoesTema.fonte}">
		<style TYPE="text/css">
			body { font-family: {$configuracoesTema.fonte};}
			/**/
		</style>
	{/if}

	<!--  -->

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
					{if $usuario_nome}
						Olá <strong>{$usuario_nome}</strong>, seja bem-vindo. 											
						<a href="{$url_portal}portal/conta/logout" data-toggle="modal" class="btn btn-success"><i class="fa fa-user"></i> Sair</a>
					{else}
						<a href="{$url_portal}portal/conta/cadastro" class="btn registre"><b>Cadastre-se</b> agora!</a>
					{/if}
					

				</section><!-- /.col-lg-6 -->

				<section class="col-lg-6 col-sm-6 col-xs-12">

					<span class="pull-right">
						{if $usuario_categoria eq 'aluno'}
							{if $cliente.nivel eq 5}
								
							{/if}
						{/if}
						<a  href="#certificate-consult" data-toggle="modal" class="btn btn-dark">Consultar Certificado</a>
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

						<a href="{$url_portal}" title="{$nomeInstituicao}">
							{if $configuracoesTema.logo}
								<figure><img src="{$url_site}market/uploads/logos_temas/{$configuracoesTema.logo}" class="img-responsive" alt="{$nomeInstituicao}" title="{$nomeInstituicao}"></figure>
							{else}
								<figure><img src="/market/common/market/img/logo-iteacher.png" class="img-responsive" alt="{$nomeInstituicao}" title="{$nomeInstituicao}"></figure>
							{/if}

						
						</a>

					</section><!-- /.logo -->

				</section><!-- /.col-lg-3 -->

				<section class="col-lg-9 col-sm-12 col-xs-12">

					<nav class="menu" role="navigation">

						<a href="{$url_portal}portal/planos/" class="btn">Assinaturas</a>
						<a href="{$url_portal}portal/pagina/Quem-Somos" class="btn">Quem Somos</a>
						<a href="{$url_portal}portal/pagina/Termos-e-Condições" class="btn">Termos e Condições</a>
						<a href="{$url_portal}portal/pagina/10-Razões-para-estudar" class="btn">10 Razões para estudar</a>
						<a href="{$url_portal}portal/pagina/Guia-de-Carreira" class="btn">Guia de Carreira</a>
						<a href="{$url_portal}portal/pagina/Cursos-Online" class="btn">Cursos Online</a>
						<a href="{$url_portal}portal/pagina/Suporte" class="btn">Suporte</a>

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
		        		<li><a href="{$url_portal}portal/categorias/{$categoria.url}/{$categoria.id}">{$categoria.area}</a></li>
		        	{/foreach}
		        </ul>
			        
		</section><!-- /.container -->
	
	</nav>
	<section class="bar-search-cart">

		<section class="container">

			<section class="row">

				<section class="col-lg-4 col-sm-6 col-xs-12">

					<form action="{$url_portal}portal/busca/" method="get">

						<section class="input-group">

	      					<input type="text" class="form-control" name="palavra" placeholder="O que você procura?" autocomplete="off" required>

					      	<span class="input-group-btn">

					        	<button class="btn btn-dark" type="submit"><i class="fa fa-search"></i></button>

					      	</span>

	    				</section><!-- /.input-group -->

    				</form>

				</section><!-- /.col-lg-6 -->

				<section class="col-lg-8 col-sm-6 col-xs-12">

					<span class="pull-right">
						Carrinho de Compras - <b>{$carrinhoTotal} Itens</b> <a href="{$url_portal}portal/carrinho/ver" class="btn btn-dark btn-cart"><i class="fa fa-shopping-cart"></i></a>
					</span>

				</section><!-- /.col-lg-6 -->

			</section><!-- /.row -->

		</section><!-- /.container -->

	</section><!-- /.bar-search-cart -->