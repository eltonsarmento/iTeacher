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
    <script src="{$url_site}{$admin_dir}common/market/js/jquery.js"></script>
    <script language="JavaScript" type="text/javascript" src="{$url_site}{$admin_dir}common/market/js/jquery.base64.js"></script>
    
    <script language="JavaScript" type="text/javascript" src="{$url_site}{$admin_dir}common/market/js/kmf.jquery.js"></script>
    
    
</head>

<body>

    <section id="container">
        
        <header class="header white-bg">
          
            <section class="sidebar-toggle-box"><section data-original-title="Menu" data-placement="right" class="fa fa-bars tooltips"></section></section>

            <a href="index.html" class="logo" >Cursos<span>IAG</span></a>
            
            <section class="top-nav">
                
                <ul class="nav pull-right top-menu">
                    
                    <li><a href="{$admin_url}/dashboard/instituicao" class="dashboard-temp"><i class="fa fa-user"></i> Acessar Administrador</a></li>
                    
                    <li><a href="#" target="_blank" class="dashboard-temp hidden-xs"><i class="fa fa-home"></i> Visualizar Site</a></li>
                    
                    <li class="dropdown">
                        
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <img alt="" src="../img/avatar1_small.jpg">
                            <span class="username">Adriano Gianini</span>
                            <b class="caret"></b>
                        </a>
                        
                        <ul class="dropdown-menu extended logout">
                            <section class="log-arrow-up"></section>
                            <li><a href="perfil.html"><i class="fa fa-user"></i>Perfil</a></li>
                            <li><a href="todos-os-cursos.html"><i class="fa fa-book"></i> Cursos</a></li>
                            <li><a href="dashboard.html"><i class="fa fa-dashboard"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/login/logout"><i class="fa fa-key"></i> Sair</a></li>
                        </ul>
                        
                    </li>
                    
                </ul>
                
            </section><!-- /top-nav -->
            
        </header>

        <aside>
          
            <section id="sidebar"  class="nav-collapse ">
            
                <ul class="sidebar-menu" id="nav-accordion">
                  
                    <li><a class="active" href="{$admin_url}/dashboard/home/{$sistema_id}"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>

                    <li class="sub-menu">
                        
                        <a href="javascript:;"><i class="fa fa-users"></i> <span>Ger. Alunos</span></a>
                        
                        <ul class="sub">
                            
                            <li><a href="{$admin_url}/alunos/listar/{$sistema_id}">Todos os Alunos</a></li>
                            <li><a href="{$admin_url}/alunos/depoimentos/{$sistema_id}">Ger. Depoimentos</a></li>
                            
                        </ul>
                        
                    </li>
                    
                    <li class="sub-menu">
                        
                        <a href="javascript:;"><i class="fa fa-briefcase"></i> <span>Ger. Professores</span></a>
                        
                        <ul class="sub">
                            
                            <li><a href="{$admin_url}/professor/listar-professor-instituicao/{$sistema_id}">Todos os Professores</a></li>
                            
                        </ul>
                        
                    </li>
                    
                    <li><a href="gerenciar-certificados.html"><i class="fa fa-certificate"></i> <span>Ger. Certificados</span></a></li>
                    
                    <li class="sub-menu">
                        
                        <a href="javascript:;"><i class="fa fa-money"></i> <span>Ger. Administrativo</span></a>
                        
                        <ul class="sub">
                            
                            <li><a href="todos-os-administrativos.html">Todos os Administrativos</a></li>
                            <li><a href="gerenciar-cupons.html">Ger. Cupons</a></li>
                            
                        </ul>
                        
                    </li>
                    
                    <li class="sub-menu">
                        
                        <a href="javascript:;"><i class="fa fa-archive"></i> <span>Ger. Coordenadores</span></a>
                        
                        <ul class="sub">
                            
                            <li><a href="todos-os-coordenadores.html">Todos os Coordenadores</a></li>
                            
                        </ul>
                        
                    </li>

                    <li class="sub-menu">
                        
                        <a href="javascript:;"><i class="fa fa-coffee"></i> <span>Ger. Parceiros</span></a>
                        
                        <ul class="sub">
                            
                            <li><a href="todos-os-parceiros.html">Todos os Parceiros</a></li>
                            
                        </ul>
                        
                    </li>
                    
                    <li class="sub-menu">
                        
                        <a href="javascript:;"><i class="fa fa-book"></i> <span>Ger. Cursos</span></a>
                        
                        <ul class="sub">
                            
                            <li><a href="todos-os-cursos.html">Todos os Cursos</a></li>
                            
                        </ul>
                        
                    </li>
                    
                    <li class="sub-menu">
                        
                        <a href="javascript:;"><i class="fa fa-credit-card"></i> <span>Ger. Planos</span></a>
                        
                        <ul class="sub">
                            
                            <li><a href="todos-os-planos.html">Todos os Planos</a></li>
                            
                        </ul>
                        
                    </li>
                    
                    <li class="sub-menu">
                        
                        <a href="javascript:;"><i class="fa fa-bell"></i> <span>Ger. Notificações</span></a>
                        
                        <ul class="sub">
                            
                            <li><a href="todas-as-notificacoes.html">Todas as Notificações</a></li>
                            
                        </ul>
                        
                    </li>
                    
                    <li><a href="material-marketing.html"><i class="fa fa-download"></i> <span>Material Marketing</span></a></li>
                    
                </ul>
                
            </section><!-- /sidebar -->
            
        </aside>