<!DOCTYPE html>
<html lang="pt-br">
<head>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="keyword" content="">
    <link rel="shortcut icon" href="{$url_site}{$admin_dir}common/market/img/favicon.png">

    <title>Cursos IAG</title>

    <!-- Bootstrap core CSS -->
      
    <link href="{$url_site}{$admin_dir}common/market/css/bootstrap.min.css" rel="stylesheet">
    <link href="{$url_site}{$admin_dir}common/market/css/bootstrap-reset.css" rel="stylesheet">
      
    <!-- External CSS -->

    <link rel="stylesheet" type="text/css" href="{$url_site}{$admin_dir}common/market/assets/font-awesome/css/wfont-aesome.css"  />  
    <link rel="stylesheet" type="text/css" href="{$url_site}{$admin_dir}common/market/assets/font-awesome/css/font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="{$url_site}{$admin_dir}common/market/assets/nestable/jquery.nestable.css" />
    <link rel="stylesheet" type="text/css" href="{$url_site}{$admin_dir}common/market/assets/bootstrap-wysihtml5/bootstrap-wysihtml5.css" />
    <link rel="stylesheet" type="text/css" href="{$url_site}{$admin_dir}common/market/assets/bootstrap-fileupload/bootstrap-fileupload.css" />
    <link rel="stylesheet" type="text/css" href="{$url_site}{$admin_dir}common/market/assets/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="{$url_site}{$admin_dir}common/market/assets/bootstrap-datetimepicker/css/datetimepicker.css" />

    <!-- Custom Styles -->

    <link href="{$url_site}{$admin_dir}common/market/css/style.css" rel="stylesheet">
    <link href="{$url_site}{$admin_dir}common/market/css/style-responsive.css" rel="stylesheet" />
    <script src="{$url_site}{$admin_dir}common/market/js/jquery.js"></script>
    
    <link href="{$url_site}{$admin_dir}common/market/css/tasks.css" rel="stylesheet">

    <link href="{$url_site}{$admin_dir}common/market/assets/bootstrap-select/selectize.bootstrap.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
      <script src="{$url_site}{$admin_dir}common/market/js/html5shiv.js"></script>
      <script src="{$url_site}{$admin_dir}common/market/js/respond.min.js"></script>
      
    <![endif]-->
</head>
<body>

    <section id="container">
        
        <header class="header white-bg">
          
            <section class="sidebar-toggle-box"><section data-original-title="Menu" data-placement="right" class="fa fa-bars tooltips"></section></section>

            <a href="{$admin_url}/dashboard/home" class="logo"><img src="{$url_site}{$admin_dir}common/market/img/logo-iteacher.png" style="width: 100px;"></a>
            
            <section class="top-nav">
                
                <ul class="nav pull-right top-menu">
                    
                    <li><a href="{$url_site}" target="_blank" class="dashboard-temp hidden-xs"><i class="fa fa-home"></i> Visualizar Site</a></li>
                    
                    <li class="dropdown">
                        
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <img alt="" src="{$url_site}market/uploads/avatar/{$usuario_avatar}" width="28">
                            <span class="username">{$usuario_nome}</span>
                            <b class="caret"></b>
                        </a>
                        
                        <ul class="dropdown-menu extended logout">
                            <section class="log-arrow-up"></section>
                            <li><a href="{$admin_url}/administrativos/visualizar/{$usuario_id}"><i class="fa fa-user"></i>Perfil</a></li>
                            <li><a href="{$admin_url}/alunos"><i class="fa fa-users"></i> Alunos</a></li>
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-dashboard"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/login/logout"><i class="fa fa-key"></i> Sair</a></li>
                        </ul>
                        
                    </li>
                    
                </ul>
                
            </section><!-- /top-nav -->
            
        </header>

        <aside>
          
            <section id="sidebar"  class="nav-collapse ">
            
                <ul class="sidebar-menu" id="nav-accordion">
                  
                    <li><a {if $menu eq 'dashboard'}class="active"{/if} href="{$admin_url}/dashboard/home"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>

                    <li><a {if $menu eq 'alunos'}class="active"{/if} href="{$admin_url}/alunos/listar"><i class="fa fa-users"></i> <span>Alunos</span></a>
                        
                    <li><a {if $menu eq 'cupons'}class="active"{/if} href="{$admin_url}/cupons/listar"><i class="fa fa-tag"></i> Cupons</a></li>
                    
                    <li><a {if $menu eq 'vendas'}class="active"{/if} href="{$admin_url}/vendas/listarTodas"><i class="fa fa-shopping-cart"></i> <span>Vendas</span></a></li>
                    
                </ul>
                
            </section><!-- /sidebar -->
            
        </aside>
        