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
    <link href="{$url_site}{$admin_dir}common/market/css/tasks.css" rel="stylesheet">
    <link href="{$url_site}{$admin_dir}common/market/assets/bootstrap-select/selectize.bootstrap.css" rel="stylesheet">

    <script src="{$url_site}{$admin_dir}common/market/js/jquery.js"></script>
    
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
            
            <section class="nav notify-row" id="top_menu">
                
                <ul class="nav top-menu">
                    
                    <li id="header_notification_bar" class="dropdown">
                        
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="fa fa-bell-o"></i><span class="badge bg-warning">{$notificacoes_topo.total}</span></a>
                        
                        <ul class="dropdown-menu extended notification">
                            
                            <section class="notify-arrow notify-arrow-yellow"></section>
                            
                            <li><p class="yellow">Você tem <strong>{$notificacoes_topo.total}</strong> novas notificações</p></li>                            
                            {foreach item=notificacao from=$notificacoes_topo.resultado}      
                                <li>
                                    
                                    <a href="{$admin_url}/notificacoes/listar/{$notificacao.id}">
                                        
                                        <span class="photo">
                                            <img alt="avatar" src="{$url_site}market/uploads/avatar/{$notificacao.avatar}" width="35">
                                        </span>
                                        
                                        <span class="subject">
                                            <span class="from">{$notificacao.remetente}</span>
                                        </span>
                                        
                                    </a>
                                    
                                </li>                                
                            {/foreach}
                            <li><a href="{$admin_url}/notificacoes/listar">Todas as Notificações</a></li>
                        </ul>
                        
                    </li>
                    
                </ul>
                
            </section><!-- /notify-row -->
            <section class="top-nav">
                
                <ul class="nav pull-right top-menu">
                    {if $visao_adm eq true}
                        <li><a href="{$admin_url}/dashboard/mudarAdministrador" class="dashboard-temp"><i class="fa fa-user"></i> Acessar Administrador</a></li>
                    {/if}

                    <li><a href="{$site}" target="_blank" class="dashboard-temp hidden-xs"><i class="fa fa-home"></i> Visualizar Site</a></li>
                    
                    <li class="dropdown">
                        
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <img alt="" src="{$url_site}market/uploads/avatar/{$usuario_avatar}" width="30">
                            <span class="username">{$usuario_nome}</span>
                            <b class="caret"></b>
                        </a>
                        
                        <ul class="dropdown-menu extended logout">
                            <section class="log-arrow-up"></section>
                            <li><a href="{$admin_url}/perfil/visualizar/{$usuario_id}"><i class="fa fa-user"></i>Perfil</a></li>
                            {if $visao_adm eq false}
                                <li><a href="{$admin_url}/financeiro/gerenciar"><i class="fa fa-dollar"></i> Financeiro</a></li>
                            {else}
                                <li><a href="{$admin_url}/cursos/listar"><i class="fa fa-dollar"></i> Cursos</a></li>
                            {/if}
                            <li><a href="{$admin_url}/notificacoes/listar"><i class="fa fa-dashboard"></i> Notificações</a></li>
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
                            
                            <li {if $submenu eq 'alunos-listar'} class="active"{/if} ><a href="{$admin_url}/alunos/listar">Todos os Alunos</a></li>
                            {if $visao_adm eq false}
                                <li {if $submenu eq 'alunos-novo'}class="active"{/if}><a href="{$admin_url}/alunos/novo">Adicionar Novo</a></li>
                            {/if}    
                            <li class="divider"></li>
                            <li {if $submenu eq 'depoimentos-listar'}class="active"{/if}><a href="{$admin_url}/depoimentos/listar">Ger. Depoimentos</a></li>
                            
                        </ul>
                        
                    </li>
                    
                    <li class="sub-menu">
                        
                        <a {if $menu eq 'professor'} class="active"{/if} href="javascript:;"><i class="fa fa-briefcase"></i> <span>Ger. Professores</span></a>
                        
                        <ul class="sub">
                            
                            <li><a {if $submenu eq 'professor-listar'} class="active"{/if} href="{$admin_url}/professor/listar">Todos os Professores</a></li>
                            {if $visao_adm eq false}
                                <li><a {if $submenu eq 'professor-novo'} class="active"{/if} href="{$admin_url}/professor/novo">Adicionar Novo</a></li<li class="divider"></li>
                                <li><a {if $submenu eq 'gerenciar-pagamentos'} class="active"{/if} href="{$admin_url}/professor/gerenciar-pagamentos">Ger. Pagamentos</a></li>
                            {/if}
                        </ul>
                        
                    </li>
                    
                    {if $visao_adm eq false}
                        <li class="sub-menu">
                            
                            <a {if $menu == 'relatorios'}class="active"{/if}  href="javascript:;"><i class="fa fa-bar-chart-o"></i> <span>Relatórios</span></a>
                            
                            <ul class="sub">
                                
                                <li {if $submenu eq 'relatorios-venda'}class="active"{/if} ><a href="{$admin_url}/relatorios/venda">Vendas</a></li>
                                <li {if $submenu eq 'relatorios-cupons'}class="active"{/if}><a href="{$admin_url}/relatorios/cupons">Cupons</a></li>
                                
                            </ul>
                            
                        </li>
                    {/if}
                    <li><a {if $menu == 'certificados'}class="active"{/if}  href="{$admin_url}/certificados/listar"><i class="fa fa-certificate"></i> <span>Ger. Certificados</span></a></li>
                    
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
                    
                    <li class="sub-menu">
                        
                        <a {if $menu eq 'coordenadores'}class="active"{/if} href="javascript:;"><i class="fa fa-archive"></i> <span>Ger. Coordenadores</span></a>
                        
                        <ul class="sub">
                            
                            <li {if $submenu eq 'coordenadores-listar'} class="active"{/if}><a href="{$admin_url}/coordenadores/listar">Todos os Coordenadores</a></li>
                            {if $visao_adm eq false}
                                <li {if $submenu eq 'coordenadores-novo'} class="active"{/if}><a href="{$admin_url}/coordenadores/novo">Adicionar Novo</a></li>
                            {/if}
                        </ul>
                        
                    </li>

                    <li class="sub-menu">
                        
                        <a {if $menu eq 'parceiros'}class="active"{/if} href="javascript:;"><i class="fa fa-coffee"></i> <span>Ger. Parceiros</span></a>
                        
                        <ul class="sub">
                            
                            <li {if $submenu eq 'parceiros-listar'}class="active"{/if}><a href="{$admin_url}/parceiros/listar">Todos os Parceiros</a></li>
                            {if $visao_adm eq false}
                                <li {if $submenu eq 'parceiros-novo'}class="active"{/if}><a href="{$admin_url}/parceiros/novo">Adicionar Novo</a></li>
                                <li class="divider"></li>
                                <li {if $submenu eq 'repasses-financeiros'} class="active"{/if}><a href="{$admin_url}/parceiros/repasses">Repasses Financeiros</a></li>
                            {/if}
                        </ul>
                        
                    </li>
                    {if $visao_adm eq false}
                        <li><a {if $menu eq 'configuracoestemas'}class="active"{/if}  href="{$admin_url}/temas/gerenciar-temas"><i class="fa fa-laptop"></i> <span>Ger. Temas</span></a></li>
                    
                        <li ><a {if $menu eq 'paginas'}class="active"{/if} href="{$admin_url}/paginas/listar"><i class="fa fa-file"></i> <span>Ger. Páginas</span></a></li>
                    {/if}
                    <li class="sub-menu">
                        
                        <a {if $menu eq 'cursos'}class="active"{/if} href="javascript:;"><i class="fa fa-book"></i> <span>Ger. Cursos</span></a>
                        
                        <ul class="sub">
                            
                            <li {if $submenu eq 'cursos-listar'}class="active"{/if}><a href="{$admin_url}/cursos/listar">Todos os Cursos</a></li>
                            {if $visao_adm eq false}
                                <li {if $submenu eq 'cursos-novo'}class="active"{/if}><a href="{$admin_url}/cursos/novo">Adicionar Novo</a></li>
                                <li class="divider"></li>
                                <li {if $submenu eq 'areas-listar'}class="active"{/if}><a href="{$admin_url}/areas/listar">Ger. Categorias</a></li>
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
                        <li class="sub-menu">
                            
                            <a {if $menu eq 'configuracoes'}class="active"{/if} href="javascript:;"><i class="fa fa-cogs"></i> <span>Config. Gerais</span></a>
                            
                            <ul class="sub">
                                
                                <li {if $submenu eq 'emails-listar'}class="active"{/if}><a href="{$admin_url}/emails/listar">Modelos de E-mails</a></li>
                                <li class="divider"></li>
                                <li {if $submenu eq 'configuracoesemails-novo'}class="active"{/if}><a href="{$admin_url}/configuracoesemail/novo">Config. de E-mail</a></li>
                                <li {if $submenu eq 'configuracoesgerais-pagamentos'}class="active"{/if}><a href="{$admin_url}/configuracoesgerais/pagamentos">Config. de Pagamento</a></li>
                                <li {if $submenu eq 'configuracoesgerais-servidores'}class="active"{/if}><a href="{$admin_url}/configuracoesgerais/servidores">Config. de Servidor</a></li>
                                <li {if $submenu eq 'configuracoesgerais-periodoAcesso'}class="active"{/if}><a href="{$admin_url}/configuracoesgerais/periodoAcesso">Config. Período de Acesso</a></li>
                                <li {if $submenu eq 'configuracoesgerais-certificados'}class="active"{/if}><a href="{$admin_url}/certificados/editar">Config. de Certificado</a></li>
                                
                            </ul>
                            
                        </li>
                    {/if}
                    <li><a {if $menu eq 'materialmarketing'}class="active"{/if} href="{$admin_url}/materialmarketing/listar"><i class="fa fa-download"></i> <span>Material Marketing</span></a></li>
                    
                </ul>
                
            </section><!-- /sidebar -->
            
        </aside>