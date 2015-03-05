<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="keyword" content="">
    <link rel="shortcut icon" href="{$url_site}/common/market/professor_temp/img/favicon.png">

    <title>iTeacher</title>

    <!-- Bootstrap core CSS -->
      
    <link href="{$url_site}market/common/market/professor_temp/css/bootstrap.min.css" rel="stylesheet">
    <link href="{$url_site}market/common/market/professor_temp/css/bootstrap-reset.css" rel="stylesheet">
      
    <!-- External CSS -->
      
    <link href="{$url_site}market/common/market/professor_temp/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <!-- Custom Styles -->
      
    <link href="{$url_site}market/common/market/professor_temp/css/style.css" rel="stylesheet">
    <link href="{$url_site}market/common/market/professor_temp/css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
      <script src="{$url_site}market/common/market/professor_temp/js/html5shiv.js"></script>
      <script src="{$url_site}market/common/market/professor_temp/js/respond.min.js"></script>
    <![endif]-->
      
</head>

<body class="full-width">

    <section id="container">
      
        <header class="header white-bg">
          
            <a href="{$admin_url}/dashboard/home" class="logo">I<span>TEACHER</span></a>
            
            <section class="top-nav">
                
                <ul class="nav pull-right top-menu">
                    
                    <li><a href="{$admin_url}/dashboard/home" class="dashboard-temp hidden-xs"><i class="fa fa-dashboard"></i> Dashboard</a></li>
                    
                    <li class="dropdown">
                        
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <img alt="" width="45" src="{$url_site}market/uploads/avatar/{$usuario_avatar}">
                            <span class="username">{$usuario_nome}</span>
                            <b class="caret"></b>
                        </a>
                        
                        <ul class="dropdown-menu extended logout">
                            <section class="log-arrow-up"></section>
                            <li><a href="{$admin_url}/perfil/editar/{$usuario_id}"><i class="fa fa-user"></i>Perfil</a></li>
                            <li><a href="{$admin_url}/emails/listar"><i class="fa fa-cog"></i> Config.</a></li>
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-dashboard"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/login/logout"><i class="fa fa-key"></i> Sair</a></li>
                        </ul>
                        
                    </li>
                    
                </ul>
                
            </section><!-- /top-nav -->
          
        </header>
        
        <section id="main-content">
            
            <section class="wrapper">
                
                <h2 class="text-center">Olá, <strong>{$usuario_nome}</strong>. O que você deseja fazer?</h2><br/>

                <section class="row screen-temp">

                    <section class="col-lg-6"><a href="{$admin_url}/cursos/novo" class="btn btn-shadow btn-primary btn-lg btn-block">Publique seu primeiro curso</a></section><!-- /col-lg-6 -->
                  
                    <section class="col-lg-6"><a href="{$admin_url}/materialmarketing/listar" class="btn btn-shadow btn-info btn-lg btn-block">Aprenda a vender seus cursos</a></section><!-- /col-lg-6 -->

                    <section class="col-lg-12"><p class="text-center divider-temp">ou</p></section><!-- /col-lg-12 -->

                    <section class="col-lg-12"><a href="{$admin_url}/dashboard/home" class="btn btn-shadow btn-danger btn-lg btn-block"><i class="fa fa-dashboard"></i> Ir para o Dashboard</a></section><!-- /col-lg-12 -->
                  
                </section><!-- /row -->
                
            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
    </section><!-- /container -->

    <!-- JS -->
    
    <script src="{$url_site}market/common/market/professor_temp/js/jquery.js"></script>
    <script src="{$url_site}market/common/market/professor_temp/js/bootstrap.min.js"></script>
    
</body>
</html>
