        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Gerenciar Depoimentos</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        {if $visao_adm eq false}
                            <a href="{$admin_url}/depoimentos/todosDepoimentos/" class="btn btn-info"><i class="fa fa-comment"></i> Todos os depoimentos</a>
                        {/if}
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <br/>
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        {if $msg_alert}
                            <div class="alert alert-info">{$msg_alert}</div>
                        {/if}
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Gerenciar Depoimentos</strong></header>
                            
                            <section class="panel-body">


                                {foreach from=$depoimentos key=k item=depoimento}
                                <article class="media">
                                    
                                    <a class="pull-left thumb p-thumb"><img src="{$url_site}market/uploads/avatar/{$depoimento.aluno.avatar}"></a>
                                    
                                    <section class="media-body">
                                        
                                        <a data-toggle="modal" href="#editDepoimento" class="cmt-head">{$depoimento.aluno.nome}</a>
                                        <p><i class="fa fa-clock-o"></i> {$depoimento.tempo_cadastrado}</p>
                                        
                                        <p>{$depoimento.mensagem}</p>
                                        {if $visao_adm eq false}
                                            <a href="{$admin_url}/depoimentos/aceitar/{$depoimento.id}" class="btn btn-success btn-xs"><i class="fa fa-check"></i> Aprovar</a> 
                                            <a data-toggle="modal" href="#editDepoimento" onclick="setarValores({$depoimento.id})" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i> Editar</a>
                                            <a data-toggle="modal" href="#excluirDepoimento" onclick="javascript:setaRecusar({$depoimento.id});" class="btn btn-danger btn-xs"><i class="fa fa-times"></i> Excluir</a>
                                        {/if}
                                    </section><!-- /media-body -->
                                    
                                </article><!-- /media -->
                                <hr/>
                                {/foreach}
                                
                                
                               
                            
                            </section><!-- /panel-body --> 
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
        
        <!-- Modal - Editar Depoimento -->
        <section class="modal fade" id="editDepoimento" tabindex="-1" role="dialog" aria-labelledby="editDepoimento" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Adriano Gianini</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        <p id="retorno_ajax_modal"></p>
                        <form role="form" action="" onsubmit="return false;" id="formModal">
                            <input type="hidden" value="1" name="editar"/>
                            <input type="hidden" value="" name="id" id="depoimento_id"/>
                            <section class="form-group">
                                
                                <textarea class="form-control" cols="30" rows="6" name="mensagem" id="depoimentoModal"></textarea>
                                
                            </section><!-- /form-group -->

                            <button class="btn btn-success" onclick="editarDepoimento(); return false;"><i class="fa fa-check-circle"></i> Salvar</button>
                            
                        </form>
                    
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
        
        <!-- Modal - Recusar Depoimento -->
        
        <section class="modal fade modal-alert" id="excluirDepoimento" tabindex="-1" role="dialog" aria-labelledby="excluirDepoimento" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Recusar Depoimento</h4>
                        <input type="hidden" value="" id="id_recusar" name="id" />
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">Você deseja fazer isso?</section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Não</button>
                        <button class="btn btn-danger" onclick="javascript:confirmaRecusar();">Sim</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
    </section><!-- /container -->
<div id="retorno_ajax"></div>
{literal}
<script type="text/javascript">



//Delete
function setaRecusar(id) {
    $('#id_recusar').val(id);
}

//recusar
function confirmaRecusar() {
    window.location.href='{/literal}{$admin_url}{literal}/depoimentos/recusar/' + $('#id_recusar').val();
}

//seta valores para edição
function setarValores(id) {
    {/literal}
    jQuery.post('{$admin_url}/depoimentos/buscarDepoimento/' + id, function html(html) {ldelim} jQuery('#retorno_ajax').html(html); {rdelim});
    {literal}
    jQuery('#depoimento_id').val(id);
}

//editar
function editarDepoimento() {
    {/literal}
    jQuery.post('{$admin_url}/depoimentos/editar/', jQuery('#formModal').serialize() , function html(html) {ldelim} jQuery('#retorno_ajax_modal').html(html); {rdelim});
    {literal}
}
</script>
{/literal}
