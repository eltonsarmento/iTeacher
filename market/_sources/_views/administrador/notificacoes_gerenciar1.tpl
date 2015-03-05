
        
        <section id="main-content">
          
            <section class="wrapper site-min-height">
              
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Gerenciar Notificações</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                            
                        <a href="{$admin_url}/notificacoes/nova" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar nova</a>

                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <br/>
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Todas as Notificações</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-bell"></i> Noficação</th>
                                            <th><i class="fa fa-envelope"></i> Destinatário</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        
                                        {foreach item=notificacao from=$notificacoes}
                                            <tr>
                                                
                                                <td><a data-toggle="modal" href="#visualizarNotificacao">{$notificacao.titulo}</a></td>
                                                <td class="hidden-xs">$notificacao.destinatario}</td>
                                                <td>
                                                    
                                                    <a data-toggle="modal" href="#visualizarNotificacao" class="btn btn-success btn-xs tooltips" data-original-title="Visualizar" data-placement="bottom"><i class="fa fa-search"></i></a> 
                                                    <a href="{$admin_url}/notificacoes/editar/{$notificacao.id}" class="btn btn-primary btn-xs tooltips" data-original-title="Editar" data-placement="bottom"><i class="fa fa-pencil"></i></a>
                                                    <a data-toggle="modal" href="#deletarNotificacao" class="btn btn-danger btn-xs tooltips" data-original-title="Excluir" data-placement="bottom"><i class="fa fa-trash-o"></i></a>
                                                    
                                                </td>
                                                
                                            </tr>
                                        {/foreach}
                                        
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen --> 
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row --> 
                
                <section class="row">
                    
                    <section class="col-lg-12">
                            
                        <a href="{$admin_url}/notificacoes/nova" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar nova</a>

                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
        
        
        <!-- Modal - Deletar Notificação -->
        
        <section class="modal fade modal-alert" id="deletarNotificacao" tabindex="-1" role="dialog" aria-labelledby="deletarNotificacao" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Deletar Notificação</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">Você deseja fazer isso?</section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Não</button>
                        <button class="btn btn-danger" type="submit">Sim</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
        
        <!-- Modal - Visualizar Notificação -->
        
        <section class="modal fade modal-primary" id="visualizarNotificacao" tabindex="-1" role="dialog" aria-labelledby="visualizarNotificacao" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Visualizar Notificação</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas mattis, tortor id malesuada congue, orci velit pretium justo, at tristique lectus libero et lectus. Fusce tincidunt suscipit lectus, sed dignissim eros pellentesque et. Mauris at dignissim felis. Praesent luctus laoreet risus eget ullamcorper. In mattis magna vitae lorem blandit fermentum. Suspendisse potenti. Quisque dolor lectus, porta eget fringilla eu, consequat in sapien.
                    
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
    </section><!-- /container -->

    