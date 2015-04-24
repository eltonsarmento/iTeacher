        
        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/depoimentos/listar/">Depoimentos</a></li>
                            <li class="active">Todos os Depoimentos</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        {if $msg_alert}
                            <div class="alert alert-info">{$msg_alert}</div>
                        {/if}
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Todos os Depoimentos</strong></header>    
                                
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-user"></i> Aluno</th>
                                            <th><i class="fa fa-comment"></i> Depoimento</th>
                                            <th><i class="fa fa-book"></i> Curso</th>
                                            <th class="hidden-xs"><i class="fa fa-calendar"></i> Postado em</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach from=$depoimentos key=k item=depoimento}
                                        <tr>
                                            
                                            <td>{$depoimento.aluno.nome}</td>
                                            <td><a data-toggle="modal" href="#visualizarDepoimento" onclick="setarValores({$depoimento.id})">Visualizar Depoimento</a></td>
                                            <td>{$depoimento.curso.curso}</td>
                                            <td class="hidden-xs">{$depoimento.data_cadastro|date_format:"%d/%m/%Y"}</td>
                                            <td>                                                
                                                <a data-toggle="modal" href="#editDepoimento" onclick="setarValores({$depoimento.id})" class="btn btn-primary btn-xs tooltips" data-original-title="Editar" data-placement="bottom"><i class="fa fa-pencil"></i></a>
                                                <a data-toggle="modal" href="#excluirDepoimento" onclick="javascript:setaExcluir({$depoimento.id});" class="btn btn-danger btn-xs tooltips" data-original-title="Excluir" data-placement="bottom"><i class="fa fa-trash-o"></i></a>
                                                
                                            </td>
                                            
                                        </tr>
                                        {/foreach}
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen -->
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
               
        <!-- Modal - Editar Depoimento -->
        
        <section class="modal fade" id="visualizarDepoimento" tabindex="-1" role="dialog" aria-labelledby="visualizarDepoimento" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Adriano Gianini</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <span id="depoimentoSpan"></span> 
                    
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
        
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
                        <h4 class="modal-title">Excluir Depoimento</h4>
                        <input type="hidden" value="" id="id_excluir" name="id" />
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">Você deseja fazer isso?</section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Não</button>
                        <button class="btn btn-danger" onclick="javascript:confirmaExcluir();">Sim</button>
                        
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
    window.location.href='{/literal}{$admin_url}{literal}/depoimentos/excluir/' + $('#id_excluir').val();
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
    