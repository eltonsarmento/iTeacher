
        
        <section id="main-content">
          
            <section class="wrapper site-min-height">
              
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Notificações</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                                        
                    {if $visao_adm eq false}
                        <section class="col-lg-12">
                            <section class="col-lg-8">                                                 
                                <a href="{$admin_url}/notificacoesadmin/nova" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar novo</a>
                            </section><!-- /col-lg-6 -->
                            
                            <section class="col-lg-4">
                                <form>
                                    <section class="input-group m-bot15">
                                            
                                        <input type="text" name="palavra_busca" class="form-control">
                                            
                                        <span class="input-group-btn"><button type="submit" class="btn btn-white"><i class="fa fa-search"></i></button></span>
                                            
                                    </section><!-- /input-group -->
                                </form>
                            </section>    
                        </section><!-- /col-lg-12 -->
                    {else}
                        <section class="col-lg-4">
                                <form>
                                    <section class="input-group m-bot15">
                                            
                                        <input type="text" name="palavra_busca" class="form-control">
                                            
                                        <span class="input-group-btn"><button type="submit" class="btn btn-white"><i class="fa fa-search"></i></button></span>
                                            
                                    </section><!-- /input-group -->
                                </form>
                        </section>   
                    {/if}
                </section><!-- /row -->
                
                <br/>
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        {if $msg_alert}
                            <div class="alert alert-info">{$msg_alert}</div>
                        {/if}
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Todas as Notificações</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-bell"></i> Notificaçãos</th>
                                            <th><i class="fa fa-book"></i> Destinatário</th>
                                            <th><i class="fa fa-book"></i> Curso</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach from=$notificacoes key=k item=notificacao}
                                        <tr>
                                            
                                            <td><a data-toggle="modal" href="#visualizarNotificacao" onclick="setarValores({$notificacao.id})">{$notificacao.titulo}</a></td>
                                            <td class="hidden-xs">{$notificacao.destinatario}</td>
                                            <td class="hidden-xs">
                                                {foreach from=$notificacao.cursos key=j item=curso}
                                                    &nbsp;
                                                    {$curso}
                                                {/foreach}
                                            </td>
                                            
                                            <td>
                                                
                                                <a data-toggle="modal" href="#visualizarNotificacao" onclick="setarValores({$notificacao.id})" class="btn btn-success btn-xs tooltips" data-original-title="Visualizar" data-placement="bottom"><i class="fa fa-search"></i></a> 
                                                {if $visao_adm eq false}
                                                    <a href="{$admin_url}/notificacoesadmin/editar/{$notificacao.id}" class="btn btn-primary btn-xs tooltips" data-original-title="Editar" data-placement="bottom"><i class="fa fa-pencil"></i></a>                                                
                                                    <a data-toggle="modal" href="#deletarNotificacao" onclick="javascript:setaExcluir({$notificacao.id});" class="btn btn-danger btn-xs tooltips" data-original-title="Excluir" data-placement="bottom"><i class="fa fa-trash-o"></i></a>
                                                {/if}
                                            </td>
                                            
                                        </tr>
                                        {/foreach}
                                        
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen --> 
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row --> 
                {if $visao_adm eq false}
                    <section class="row">
                        
                        <section class="col-lg-12">
                                
                            <a href="{$admin_url}/notificacoesadmin/nova" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar nova</a>

                        </section><!-- /col-lg-12 -->
                    
                    </section><!-- /row -->
                {/if}
            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
       
        
        <!-- Modal - Deletar Notificação -->
        
        <section class="modal fade modal-alert" id="deletarNotificacao" tabindex="-1" role="dialog" aria-labelledby="deletarNotificacao" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Deletar Notificação</h4>
                        <input type="hidden" value="" id="id_excluir" name="id" />
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">Você deseja fazer isso?</section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Não</button>
                        <button class="btn btn-danger" onclick="confirmaExcluir();" >Sim</button>
                        
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
                        <h4 class="modal-title"><span id="notificacaoTituloSpan"></span></h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <span id="notificacaoConteudoSpan"></span>
                    
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
    </section><!-- /container -->
    <div id="retorno_ajax"></div>
    {literal}
        <script type="text/javascript">

            //Delete
            function setaExcluir(id) {
                $('#id_excluir').val(id);
            }

            //recusar
            function confirmaExcluir() {
                window.location.href='{/literal}{$admin_url}{literal}/notificacoesadmin/apagar/' + $('#id_excluir').val();
            }

            //seta valores para edição
            function setarValores(id) {
                {/literal}
                jQuery.post('{$admin_url}/notificacoesadmin/buscarNotificacao/' + id, function html(html) {ldelim} jQuery('#retorno_ajax').html(html); {rdelim});
                {literal}
                jQuery('#depoimento_id').val(id);
            }

        </script>

    {/literal}

   
