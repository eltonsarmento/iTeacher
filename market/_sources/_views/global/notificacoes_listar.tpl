
        
        <section id="main-content">
          
            <section class="wrapper site-min-height">
                    
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Notificações</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Notificações</strong></header>   

                            {foreach item=notificacao from=$notificacoes}

                                <article id="notificacao_{$notificacao.id}" class="media-notification {if $notificacao.lida eq true} old {else} new {/if}">                                    
                                    <a class="pull-left thumb p-thumb"><img src="{$url_site}/market/uploads/avatar/{$notificacao.avatar}"></a>
                                    <section class="media-body">                                        
                                        <strong>{$notificacao.titulo}</strong><br>
                                        <strong>Remetente: {$notificacao.remetente}</strong>
                                        <p><i class="fa fa-clock-o"></i> {$notificacao.data}</p>                                        
                                        <p>
                                            <a href="#visualizarNotificacao" onclick="abrirMensagem({$notificacao.id});" 
                                            data-toggle="modal">
                                                {$notificacao.resumo}
                                            </a>                                            
                                        </p>                                    
                                    </section><!-- /media-body -->                                    
                                </article><!-- /media -->
                            {/foreach}
                                                      
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
        
        <!-- Modal - Visualizar Notificação -->
    
        <section class="modal fade modal-primary" id="visualizarNotificacao" tabindex="-1" role="dialog" aria-labelledby="visualizarNotificacao" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="tituloModal" ></h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <p id="conteudoModal"></p>
                    
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" id="fechar" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
    </section><!-- /container -->        

<div id="retorno_notificacao"></div>
{literal}
<script type="text/javascript">
    function abrirMensagem(id) {     
        jQuery.post('{/literal}{$admin_url}{literal}/notificacoes/ler', {notificacao:id}, function html(json) {
            dados = jQuery.parseJSON(json);
            console.log(dados);
            jQuery('#tituloModal').html(dados.titulo);
            jQuery('#conteudoModal').html(dados.msg);

        });
        jQuery('#notificacao_'+id).addClass('media-notification old');        
    }
    /*$("#fechar").onclick(function(e){
        {/literal}$this->system->session->deleteItem('notificacoes_topo');{literal}
    });*/

</script>
{/literal}