<!DOCTYPE html>
<html lang="pt-br">
<head>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="keyword" content="">
    <link rel="shortcut icon" href="{$url_site}{$admin_dir}common/market/img/favicon.png">

    <title>iTeacher</title>

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

            <a href="{$admin_url}/dashboard/home" class="logo"><img src="{$url_site}{$admin_dir}common/market/img/logo-iteacher.png" style="width: 100px;"></a>
          
            <section class="nav notify-row" id="top_menu">
                
                <ul class="nav top-menu">
                    
                    <li id="header_notification_bar" class="dropdown">
                        
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="fa fa-bell-o"></i><span class="badge bg-warning">{$notificacoes_topo.total}</span></a>
                        
                        <ul class="dropdown-menu extended notification">
                            
                            <section class="notify-arrow notify-arrow-yellow"></section>
                            
                            <li><p class="yellow">Você tem <strong>{$notificacoes_topo.total}</strong> novas notificações</p></li>
                            {foreach from=$notificacoes_topo.resultado item=notificacao}
                            <li>
                                
                                <a href="{$admin_url}/notificacoes/listar/{$notificacao.id}">
                                    
                                    <span class="photo"><img alt="avatar" width="35" src="{$url_site}market/uploads/avatar/{$notificacao.avatar}"></span>
                                    
                                    <span class="subject">
                                        <span class="from"><span class="from">{$notificacao.remetente|truncate:29:"...":true}</span>
                                    </span>                                    
                                    
                                </a>
                                
                            </li>
                            {/foreach}
                            
                            <li><a href="{$admin_url}/notificacoes/listar">Todas as Notificações</a></li>
                            
                        </ul>
                        
                    </li>
                    
                    <li id="header_inbox_bar" class="dropdown">
                        
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="fa fa-question-circle"></i><span class="badge bg-important">{$duvidas_topo.total}</span></a>
                        
                        <ul class="dropdown-menu extended inbox">
                            
                            <section class="notify-arrow notify-arrow-red"></section>
                            
                            <li><p class="red">Você tem <strong>{$duvidas_topo.total}</strong> nova(s) dúvida(s)</p></li>
                            {foreach from=$duvidas_topo.resultado item=duvidas}
                            <li>
                                
                                <a href="{$admin_url}/duvidas/listar/{$duvidas.duvida_id}">
                                    
                                    <span class="photo"><img alt="avatar" src="{$url_site}market/uploads/avatar/{$duvidas.remetente_avatar}"></span>
                                    
                                    <span class="subject">
                                        <span class="from">{$duvidas.remetente}</span>
                                    </span>
                                    
                                    <span class="message">
                                        {$duvidas.curso.curso}
                                    </span>
                                    
                                </a>
                                
                            </li>
                            {/foreach}
                      
                            <li><a href="{$admin_url}/duvidas/listar">Todas as dúvidas</a></li>
                        
                        </ul>
                        
                    </li>
                    
                </ul>
                
            </section><!-- /notify-row -->
            
            <section class="top-nav">
                
                <ul class="nav pull-right top-menu">
                    
                    <li><a href="{$site}" target="_blank" class="dashboard-temp hidden-xs"><i class="fa fa-home"></i> Visualizar Site</a></li>
                    
                    <li class="dropdown">
                        
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <img alt="" src="{$url_site}market/uploads/avatar/{$usuario_avatar}" width="35">
                            <span class="username">{$usuario_nome}</span>
                            <b class="caret"></b>
                        </a>
                        
                        <ul class="dropdown-menu extended logout">
                            <section class="log-arrow-up"></section>
                            <li><a href="{$admin_url}/perfil/visualizar/{$usuario_id}"><i class="fa fa-user"></i>Perfil</a></li>
                            <li><a href="{$admin_url}/duvidas/listar"><i class="fa fa-question-circle"></i> Dúvidas</a></li>
                            <li><a href="{$admin_url}/pedidos/listar"><i class="fa fa-shopping-cart"></i> Pedidos</a></li>                    
                            <li><a href="{$admin_url}/login/logout"><i class="fa fa-key"></i> Sair</a></li>
                        </ul>
                        
                    </li>
                    
                </ul>
                
            </section><!-- /top-nav -->
            
        </header>

        <aside>
          
            <section id="sidebar"  class="nav-collapse ">
            
                <ul class="sidebar-menu" id="nav-accordion">
                  
                    <li><a {if $menu == 'dashboard'}class="active"{/if} href="{$admin_url}/dashboard/home"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
                    
                    <li><a {if $menu == 'cursos'}class="active"{/if} href="{$admin_url}/cursos/listar"><i class="fa fa-book"></i> <span>Cursos</span></a></li>
                    
                    <li><a {if $menu == 'certificados'}class="active"{/if} href="{$admin_url}/certificados/listar"><i class="fa fa-certificate"></i> <span>Certificados</span></a></li>
                    
                    <li><a {if $menu == 'duvidas'}class="active"{/if} href="{$admin_url}/duvidas/listar"><i class="fa fa-question-circle"></i> <span>Dúvidas</span></a></li>
                    
                    <li><a {if $menu == 'notificacoes'}class="active"{/if} href="{$admin_url}/notificacoes/listar"><i class="fa fa-bell"></i> <span>Notificações</span></a></li>
                    
                    <li><a {if $menu == 'planos'}class="active"{/if} href="{$admin_url}/planos/listar"><i class="fa fa-credit-card"></i> <span>Assinaturas</span></a></li>
                    
                    <li><a {if $menu == 'pedidos'}class="active"{/if} href="{$admin_url}/pedidos/listar"><i class="fa fa-shopping-cart"></i> <span>Pedidos</span></a></li>
                    
                    <li><a {if $menu == 'estatisticas'}class="active"{/if} href="{$admin_url}/cursos/estatisticas"><i class="fa fa-bar-chart-o"></i> <span>Estatísticas</span></a></li>
                    
                </ul>
                
            </section><!-- /sidebar -->
            
        </aside>