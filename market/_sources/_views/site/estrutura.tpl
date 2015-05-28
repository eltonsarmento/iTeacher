<!DOCTYPE html>
<html lang="pt-br">
<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="Mosaddek">
	<meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
	<link rel="shortcut icon" href="{$url_site}market/common/site/img/favicon.png">

	<title>iTeacher LMS - Plataforma de Ensino a Distância para Empresas e Professores Freelancers</title>

	<!-- Bootstrap core CSS -->
	<link href="{$url_site}market/common/site/css/bootstrap.min.css" rel="stylesheet">
	<link href="{$url_site}market/common/site/css/theme.css" rel="stylesheet">
	<link href="{$url_site}market/common/site/css/bootstrap-reset.css" rel="stylesheet">

	<!--external css-->
	<link href="{$url_site}market/common/site/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
	<link rel="stylesheet" href="{$url_site}market/common/site/css/flexslider.css"/>
	<link href="{$url_site}market/common/site/assets/bxslider/jquery.bxslider.css" rel="stylesheet" />
	<link href="{$url_site}market/common/site/assets/fancybox/source/jquery.fancybox.css" rel="stylesheet" />

	<link rel="stylesheet" href="{$url_site}market/common/site/assets/revolution_slider/css/rs-style.css" media="screen">
	<link rel="stylesheet" href="{$url_site}market/common/site/assets/revolution_slider/rs-plugin/css/settings.css" media="screen">

	<!-- Custom styles for this template -->
	<link href="{$url_site}market/common/site/css/style.css" rel="stylesheet">
	<link href="{$url_site}market/common/site/css/style-responsive.css" rel="stylesheet" />

	
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
	<!--[if lt IE 9]>
	  <script src="js/html5shiv.js"></script>
	  <script src="js/respond.min.js"></script>
	<![endif]-->
	
  </head>

  <body>
  
	<header class="header-frontend">
	
		<div class="navbar navbar-default navbar-static-top">
			
			<div class="container">
				
				<div class="navbar-header">
				
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="fa fa-bars"></span></button>
					
					<a href="{$url_site}"><img class="navbar-brand" src="{$url_site}market/common/site/img/logo.png" alt="Logo iTeacher"></a>
				
				</div><!-- /navbar-header -->
				
				<div class="navbar-collapse collapse">
					
					<ul class="nav navbar-nav">
						
						<li{if $ativo eq 1} class="active"{/if}><a href="{$url_site}">Home</a></li>
						<li{if $ativo eq 2} class="active"{/if}><a href="{$url_site}sobre/index">Sobre o iTeacher</a></li>
						<li{if $ativo eq 3} class="active"{/if}><a href="{$url_site}professor/index">Professor</a></li>
						<li{if $ativo eq 4} class="active"{/if}><a href="{$url_site}instituicao/index">Instituição</a></li>
						<li{if $ativo eq 5} class="active"{/if}><a href="{$url_site}clientes/index">Clientes</a></li>
						<li{if $ativo eq 6} class="active"{/if}><a href="#">Blog</a></li>
						<li{if $ativo eq 7} class="active"{/if}><a href="{$url_site}contato/index">Contato</a></li>
						<li class="divider"></li>
						<li class="login"><a href="{$url_site}market"><i class="fa fa-lock"></i> Login</a></li>
					
					</ul>
				
				</div><!-- /navbar-collapse -->
			
			</div><!-- /container -->
			
		</div><!-- /navbar -->
	
	</header>