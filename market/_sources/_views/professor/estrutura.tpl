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
</head>

<body>

    <section id="container">
        
        <header class="header white-bg">
          
            <section class="sidebar-toggle-box"><section data-original-title="Menu" data-placement="right" class="fa fa-bars tooltips"></section></section>

            <a href="{$admin_url}/dashboard/home" class="logo"><img src="{$url_site}{$admin_dir}common/market/img/logo-iteacher.png" style="width: 100px;"></a>
          
            {if $visao_adm eq false}
                <section class="nav notify-row" id="top_menu">
                    
                    <ul class="nav top-menu">
                        
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
            {/if}
            <section class="top-nav">
                
                <ul class="nav pull-right top-menu">
                    
                    {if $visao_adm eq false}
                        <li><a href="{$admin_url}/dashboard/mudarHome" class="dashboard-temp"><i class="fa fa-user"></i> Acessar Professor</a></li>
                    {else}<li><a href="{$admin_url}/dashboard/mudarAdministrador" class="dashboard-temp"><i class="fa fa-user"></i> Acessar Administrador</a></li>
                    {/if}
                    
                    <li><a href="#" target="_blank" class="dashboard-temp hidden-xs"><i class="fa fa-home"></i> Visualizar Site</a></li>
                    
                    <li class="dropdown">
                        
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <img alt="" src="{$url_site}market/uploads/avatar/{$usuario_avatar}" width="30">
                            <span class="username">{$usuario_nome}</span>
                            <b class="caret"></b>
                        </a>
                        
                        <ul class="dropdown-menu extended logout">
                            <section class="log-arrow-up"></section>
                            <li><a href="{$admin_url}/perfil/visualizar/{$usuario_id}"><i class="fa fa-user"></i>Perfil</a></li>
                            <li><a href="{$admin_url}/financeiro/gerenciar"><i class="fa fa-dollar"></i> Financeiro</a></li>
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
                  
                    <li><a {if $menu == 'dashboard'}class="active"{/if} href="{$admin_url}/dashboard/home"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>

                    <li class="sub-menu">
                        
                        <a {if $menu eq 'alunos'}class="active"{/if} href="javascript:;"><i class="fa fa-users"></i> <span>Ger. Alunos</span></a>
                        
                        <ul class="sub">
                            
                            <li {if $submenu eq 'alunos-listar'}class="active"{/if}><a href="{$admin_url}/alunos/listar">Todos os Alunos</a></li>
                            {if $visao_adm eq false}                            
                                <li {if $submenu eq 'alunos-novo'}class="active"{/if}><a href="{$admin_url}/alunos/novo">Adicionar Novo</a></li>
                            {/if}
                            <li class="divider"></li>
                            <li {if $submenu eq 'depoimentos-listar'}class="active"{/if}><a href="{$admin_url}/depoimentos/listar">Ger. Depoimentos</a></li>
                            
                        </ul>
                        
                    </li>
                    
                    <li class="sub-menu">
                        
                        <a {if $menu eq 'relatorios'}class="active"{/if} href="javascript:;"><i class="fa fa-bar-chart-o"></i> <span>Relatórios</span></a>
                        
                        <ul class="sub">
                            
                            <li {if $submenu eq 'relatorios-aluno'}class="active"{/if}><a href="{$admin_url}/relatorios/aluno">Alunos</a></li>
                            <li {if $submenu eq 'relatorios-venda'}class="active"{/if}><a href="{$admin_url}/relatorios/venda">Vendas</a></li>
                            <li><a href="relatorios-assinaturas.html">Assinaturas</a></li>
                            <li {if $submenu eq 'relatorios-cupons'}class="active"{/if}><a href="{$admin_url}/relatorios/cupons">Cupons</a></li>
                            <li {if $submenu eq 'relatorios-saque'}class="active"{/if}><a href="{$admin_url}/relatorios/saques">Saques</a></li>
                            
                        </ul>
                        
                    </li>
                    
                    <li class="sub-menu">
                        
                        <a {if $menu eq 'administrativos'}class="active"{/if} href="javascript:;"><i class="fa fa-money"></i> <span>Ger. Administrativo</span></a>
                        
                        <ul class="sub">
                            
                            <li {if $submenu eq 'administrativos-listar'}class="active"{/if}><a href="{$admin_url}/administrativos/listar">Todos os Administrativos</a></li>
                            {if $visao_adm eq false}
                                <li {if $submenu eq 'administrativos-novo'} class="active"{/if}><a href="{$admin_url}/administrativos/novo">Adicionar Novo</a></li>
                            {/if}
                            <li class="divider"></li>
                            <li {if $submenu eq 'cupons-listar'} class="active"{/if}><a href="{$admin_url}/cupons/listar">Ger. Cupons</a></li>
                            
                        </ul>
                        
                    </li>
                    
                    {if $visao_adm eq false}
                        <li><a {if $menu eq 'temas'}class="active"{/if} href="#"><i class="fa fa-laptop"></i> <span>Ger. Temas</span></a></li>
                    
                        <li><a {if $menu eq 'paginas'}class="active"{/if} href="{$admin_url}/paginas/listar"><i class="fa fa-file"></i> <span>Ger. Páginas</span></a></li>                    
                    {/if}

                    
                    
                    <li class="sub-menu">
                        
                        <a {if $menu eq 'cursos'}class="active"{/if} href="javascript:;"><i class="fa fa-book"></i> <span>Ger. Cursos</span></a>
                        
                        <ul class="sub">
                            
                            <li {if $submenu eq 'cursos-listar'}class="active"{/if}><a href="{$admin_url}/cursos/listar">Todos os Cursos</a></li>
                            {if $visao_adm eq false}
                                <li {if $submenu eq 'cursos-novo'}class="active"{/if}><a href="{$admin_url}/cursos/novo">Adicionar Novo</a></li>
                                <li class="divider"></li>
                                <li {if $submenu eq 'areas-listar'}class="active"{/if}><a href="{$admin_url}/areas/listar">Ger. Áreas</a></li>
                            {/if}
                            
                        </ul>
                        
                    </li>
                    
                    <li class="sub-menu">
                        
                        <a {if $menu eq 'planos'}class="active"{/if} href="javascript:;"><i class="fa fa-credit-card"></i> <span>Ger. Planos</span></a>
                        
                        <ul class="sub">
                            
                            <li {if $submenu eq 'planos-listar'}class="active"{/if}><a href="{$admin_url}/planos/listar">Todos os Planos</a></li>
                            {if $visao_adm eq false}
                                <li {if $submenu eq 'planos-novo'}class="active"{/if}><a href="{$admin_url}/planos/novo">Adicionar Novo</a></li>
                            {/if}
                            
                        </ul>
                        
                    </li>
                    
                    {if $visao_adm eq false}
                        <li><a {if $menu eq 'vendas'}class="active"{/if} href="{$admin_url}/vendas/listar"><i class="fa fa-shopping-cart"></i> <span>Ger. Vendas</span></a></li>                    
                    {/if}
                    
                    
                    <li class="sub-menu">
                        
                        <a {if $menu eq 'notificacoes'}class="active"{/if} href="javascript:;"><i class="fa fa-bell"></i> <span>Ger. Notificações</span></a>
                        
                        <ul class="sub">
                            
                            <li {if $submenu eq 'notificacoes-listar'}class="active"{/if}><a href="{$admin_url}/notificacoesadmin/listar">Todas as Notificações</a></li>
                            {if $visao_adm eq false}
                                <li {if $submenu eq 'notificacoes-nova'}class="active"{/if}><a href="{$admin_url}/notificacoesadmin/nova">Adicionar Nova</a></li>
                            {/if}
                            
                        </ul>
                        
                    </li>
                    
                    {if $visao_adm eq false}
                        <li><a {if $menu eq 'financeiros'}class="active"{/if} href="{$admin_url}/financeiro/gerenciar"><i class="fa fa-dollar"></i> <span>Ger. Financeiro</span></a></li>
                    {/if}
                    
                    
                    <li class="sub-menu">
                        
                        <a {if $menu eq 'configuracoes'}class="active"{/if} href="javascript:;"><i class="fa fa-cogs"></i> <span>Config. Gerais</span></a>
                        
                        <ul class="sub">
                            {if $visao_adm eq false}
                                <li {if $submenu eq 'emails-listar'}class="active"{/if}><a href="{$admin_url}/emails/listar">Modelos de E-mails</a></li>
                            {/if}
                            <li class="divider"></li>
                            <li {if $submenu eq 'configuracoesemails-novo'}class="active"{/if}><a href="{$admin_url}/configuracoesemail/novo">Config. de E-mail</a></li>
                            <li {if $submenu eq 'configuracoesgerais-pagamentos'}class="active"{/if}><a href="{$admin_url}/configuracoesgerais/listarPagamentos">Config. de Pagamento</a></li>
                            <li {if $submenu eq 'configuracoesgerais-servidores'}class="active"{/if}><a href="{$admin_url}/configuracoesgerais/servidores">Config. de Servidor</a></li>
                            
                        </ul>
                        
                    </li>
                    
                    <li><a {if $menu eq 'materialmarketing'}class="active"{/if} href="{$admin_url}/materialmarketing/listar"><i class="fa fa-download"></i> <span>Material Marketing</span></a></li>
                    
                </ul>
                
            </section><!-- /sidebar -->
            
        </aside>