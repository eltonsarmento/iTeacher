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
                        
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="fa fa-dollar"></i><span class="badge bg-success">{$solicitacoes_saque.qtd_saques}</span></a>
                        
                        <ul class="dropdown-menu extended notification">
                            
                            <section class="notify-arrow notify-arrow-green"></section>
                            
                            <li><p class="green">Você tem <strong>{$solicitacoes_saque.qtd_saques}</strong> solitações de saque</p></li>
                            {foreach from=$solicitacoes_saque.solicitantes item=solicitante}
                            <li>
                                
                                <a href="">{$solicitante.solicitante}</a>
                                
                            </li>
                            {/foreach}
                            <li><a href="{$admin_url}/financeiro/saques">Todas as solicitações</a></li>
                            
                        </ul>
                        
                    </li>
                    
                </ul>
                
            </section><!-- /notify-row -->
            
            <section class="top-nav">
                
                <ul class="nav pull-right top-menu">
                    
                    <li><a href="#" target="_blank" class="dashboard-temp hidden-xs"><i class="fa fa-home"></i> Visualizar Site</a></li>
                    
                    <li class="dropdown">
                        
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <img alt="" src="{$url_site}market/uploads/avatar/{$usuario_avatar}" width="30">
                            <span class="username">{$usuario_nome}</span>
                            <b class="caret"></b>
                        </a>
                        
                        <ul class="dropdown-menu extended logout">
                            <section class="log-arrow-up"></section>
                            <li><a href="{$admin_url}/perfil/visualizar/{$usuario_id}"><i class="fa fa-user"></i> Perfil</a></li>
                            <li><a href="{$admin_url}/financeiro/saques"><i class="fa fa-dollar"></i> Financeiro</a></li>
                            <li><a href="{$admin_url}/ranking/listar"><i class="fa fa-signal"></i> Ranking</a></li>
                            <li><a href="{$admin_url}/login/logout"><i class="fa fa-key"></i> Sair</a></li>
                        </ul>
                        
                    </li>
                    
                </ul>
                
            </section><!-- /top-nav -->
            
        </header>

        <aside>
          
            <section id="sidebar"  class="nav-collapse ">
            
                <ul class="sidebar-menu" id="nav-accordion">
                  
                    <li><a {if $menu == 'dashboard'}class="active"{/if}  href="{$admin_url}/dashboard/home"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
                    
                    <li class="sub-menu">
                        
                        <a {if $menu eq 'professores'} class="active"{/if} href="javascript:;"><i class="fa fa-users"></i> <span>Ger. Professores</span></a>
                        
                        <ul class="sub">
                            
                            <li {if $submenu eq 'gerenciar'} class="active"{/if}><a href="{$admin_url}/professor/listar">Todos os professores</a></li>
                            <li {if $submenu eq 'professor-novo'} class="active"{/if}><a href="{$admin_url}/professor/novo">Adicionar novo</a></li>
                            
                        </ul>
                        
                    </li>
                    
                    <li class="sub-menu">
                            
                        <a {if $menu eq 'instituicoes'} class="active"{/if} href="javascript:;"><i class="fa fa-briefcase"></i> <span>Ger. Instituições</span></a>
                        
                        <ul class="sub">
                            
                            <li {if $submenu eq 'listar'} class="active"{/if}><a  href="{$admin_url}/instituicoes/listar">Todas as instituições</a></li>
                            <li {if $submenu eq 'novo'} class="active"{/if}><a href="{$admin_url}/instituicoes/novo">Adicionar nova</a></li>
                            <li {if $submenu eq 'financeiro'} class="active"{/if}><a href="{$admin_url}/instituicoes/financeiro">Financeiro</a></li>
                            <li class="divider"></li>
                            <li {if $submenu eq 'planos-listar'} class="active"{/if}><a href="{$admin_url}/planos/listar-planos-instituicoes">Todos os Planos</a></li>
                            <li {if $submenu eq 'planos-novo'} class="active"{/if}><a href="{$admin_url}/planos/novo-plano-instituicao">Adicionar Novo</a></li>
                            
                        </ul>
                        
                    </li>
                    
                    <li class="sub-menu">
                        
                        <a {if $menu eq 'materialmarketing'} class="active"{/if} href="javascript:;"><i class="fa fa-download"></i> <span>Material Marketing</span></a>
                        
                        <ul class="sub">
                            
                            <li {if $submenu eq 'materialmarketing-novo'} class="active"{/if}><a href="{$admin_url}/materialmarketing/listar">Ger. Material</a></li>
                            <li {if $submenu eq 'categorias_gerenciar'} class="active"{/if}><a href="{$admin_url}/materialmarketing/listarCategorias">Ger. Categorias</a></li>
                            
                        </ul>
                        
                    </li>
                    
                    <li class="sub-menu">
                        
                        <a {if $menu eq 'financeiro'} class="active"{/if} href="javascript:;"><i class="fa fa-dollar"></i> <span>Ger. Financeiro</span></a>
                        
                        <ul class="sub">
                            
                            <li {if $submenu eq 'totais'} class="active"{/if}><a href="{$admin_url}/financeiro/totais">Totais</a></li>
                            <li {if $submenu eq 'saques'} class="active"{/if}><a href="{$admin_url}/financeiro/saques">Solicitações de Saques</a></li>
                            
                        </ul>
                        
                    </li>
                    
                    <li class="sub-menu">
                        
                        <a {if $menu eq 'relatorios'} class="active"{/if} href="javascript:;"><i class="fa fa-bar-chart-o"></i> <span>Relatórios</span></a>
                        
                        <ul class="sub">
                            
                            <li {if $submenu eq 'relatorios-instituicoes'} class="active"{/if}><a href="{$admin_url}/relatorios/instituicoes">Instituições</a></li>
                            <li {if $submenu eq 'relatorios-professores'} class="active"{/if}><a href="{$admin_url}/relatorios/professores">Professores</a></li>
                            <li {if $submenu eq 'relatorios-cursos'} class="active"{/if}><a href="{$admin_url}/relatorios/cursos">Cursos</a></li>
                            
                        </ul>
                        
                    </li>
                    
                    <li><a {if $menu == 'ranking'}class="active"{/if}  href="{$admin_url}/ranking/listar"><i class="fa fa-signal"></i> <span>Ranking</span></a></li>
                    
                    <li><a {if $menu == 'notificacoes'}class="active"{/if} href="{$admin_url}/notificacoes/listar"><i class="fa fa-bell"></i> <span>Ger. Notificações</span></a></li>
                    
                    <li class="sub-menu">
                        
                        <a {if $menu == 'administrador'}class="active"{/if} href="javascript:;"><i class="fa fa-suitcase"></i> <span>Ger. Administradores</span></a>
                        
                        <ul class="sub">
                            
                            <li {if $submenu == 'administrador-listar'}class="active"{/if} ><a  href="{$admin_url}/administrador/listar">Todos os Administradores</a></li>
                            <li {if $submenu == 'administrador-novo'}class="active"{/if}><a href="{$admin_url}/administrador/novo">Adicionar novo</a></li>
                            
                        </ul>
                        
                    </li>
                    <li class="sub-menu">
                        
                        <a {if $menu == 'configuracoes'}class="active"{/if} href="javascript:;" ><i class="fa fa-cogs"></i> <span>Config. Gerais</span></a>
                        
                        <ul class="sub">
                            
                            <li {if $submenu == 'emails-listar'}class="active"{/if}><a href="{$admin_url}/emails/listar">Modelos de E-mails</a></li>
                            <li class="divider"></li>
                            <li {if $submenu == 'configuracoesemails-novo'}class="active"{/if}><a href="{$admin_url}/configuracoesemail/novo">Config. de E-mails</a></li>
                            
                        </ul>
                    
                    </li> 
                    
                </ul>
                
            </section><!-- /sidebar -->
            
        </aside>