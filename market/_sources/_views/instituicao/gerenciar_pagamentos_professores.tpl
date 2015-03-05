        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Gerenciar Pagamentos</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Gerenciar Pagamentos</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-user"></i> Professor</th>
                                            <th><i class="fa fa-calendar"></i> Mês faturado</th>
                                            <th><i class="fa fa-calendar"></i> Data pagamento</th>
                                            <th><i class="fa fa-money"></i> Valor</th>
                                            <th><i class="fa fa-refresh"></i> Status</th>
                                            <th><i class="fa fa-comment"></i> Observações</th>
                                            <th></th>
                                            
                                        </tr>

                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach item=pagamento from=$pagamentos}                                        
                                            <tr>                                            
                                                <td>{$pagamento.nome_professor}</td>
                                                <td>{$pagamento.mes_faturado}</td>
                                                <td>{$pagamento.data_pagamento}</td>
                                                <td>R$ {$pagamento.valor}</td>
                                                <td id="status_{$pagamento.id}">
                                                    <span  class="label 
                                                    {if $pagamento.status eq 1}label-success
                                                    {else}label-danger{/if}"><i class="fa fa-check"></i>
                                                    {if $pagamento.status eq 1}Pago
                                                    {else}À Pagar{/if}</span></td>
                                                <td><a href="#visualizarObservacoes" onClick="buscaObservacoes({$pagamento.id})"data-toggle="modal">Visualizar Observações</a></td>
                                                <td>
                                                    <a data-toggle="modal" href="#editarPagamento" onClick="buscaValores({$pagamento.id})" class="btn btn-primary btn-xs tooltips" data-original-title="Editar" data-placement="bottom"><i class="fa fa-pencil"></i></a>
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
        
       
        
        <!-- Modal - Visualizar Observações -->
        
        <section class="modal fade" id="visualizarObservacoes" tabindex="-1" role="dialog" aria-labelledby="visualizarObservacoes" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Visualizar Observações</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body" id="observacao_conteudo">
                        
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque vitae aliquet felis, nec suscipit odio. Ut tempor porta sapien. Quisque vitae gravida risus. Curabitur molestie placerat nibh vel lacinia. Phasellus laoreet purus in arcu sodales eleifend. Sed ac orci vulputate, vestibulum lorem id, euismod quam. Integer faucibus luctus tempus. Sed enim nisl, accumsan at bibendum ut, dictum id lorem.</p>
                    
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
        
        <!-- Modal - Editar Pagamento -->
        
        <section class="modal fade" id="editarPagamento" tabindex="-1" role="dialog" aria-labelledby="editarPagamento" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Editar Pagamento</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <form action="{$admin_url}/professor/atualiza-comprovante" onsubmit="return false;" class="form-horizontal tasi-form" method="post"  enctype="multipart/form-data" id="form_comprovante_edicao">
                            <input type="hidden" value="1" name="editar"/>
                            <input type="hidden" id="idPagamento" name="id"/>
                            
                            <section class="form-group">
                                <div style="display: block;" id="msgRetorno"></div> 
                                
                                <label class="control-label col-lg-2">Professor</label>
                                
                                <section class="col-lg-4">
                                    
                                    <section class="input-group">
                                        
                                        <p class="form-control-static" id="modal_nomeProfessor"><strong>Adriano Gianini</strong></p>
                                        
                                    </section><!-- /input-group -->
                                
                                </section><!-- /col-lg-10 -->
                            
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">Mês faturado</label>
                                
                                <section class="col-lg-10">
                                    
                                    <p class="form-control-static" id="modal_mes_faturado"><strong>05/2014</strong></p>
                                
                                </section><!-- /col-lg-10 -->
                            
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">Total</label>
                                
                                <section class="col-lg-4">
                                    
                                    <section class="input-group">
                                        
                                        <p class="form-control-static" id="modal_total"><strong>R$ 300,00</strong></p>
                                        
                                    </section><!-- /input-group -->
                                
                                </section><!-- /col-lg-10 -->
                            
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                <label class="control-label col-lg-2">Comprovante</label>
                                <section class="controls col-lg-10">                                            
                                    <section class="fileupload fileupload-new" data-provides="fileupload">                                        
                                        <span class="btn btn-white btn-file">                                            
                                            <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Selecione o Arquivo</span>
                                            <span class="fileupload-exists"><i class="fa fa-undo"></i> Alterar</span>
                                            <input type="file" class="default" />
                                            <input type="file" name="comprovante" class="default" />                                            
                                        </span>                                        
                                        <span class="fileupload-preview" style="margin-left:5px;"></span>                                        
                                        <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                                    </section><!-- /fileupload -->
                                </section><!-- /controls -->                    
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">Observações</label>
                                
                                <section class="col-lg-10">
                                      
                                    <textarea class="form-control" cols="30" rows="5" id="modal_observacoes"></textarea>
                                    
                                </section><!-- /col-lg-10 -->
                            
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                          
                                <section class="col-lg-offset-2 col-lg-10">
                                                                          
                                    <button id="BotaoForm"  class="btn btn-success" onclick="javascript:enviaFormulario(this);"><i class="fa fa-check-circle"></i> Enviar</button>
                                    
                                </section><!-- /col-lg-offset-2 col-lg-10 --> 
                                  
                            </section><!-- /form-group -->
                        
                        </form>
                    
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    <!--  onclick="reload();"    -->
    </section><!-- /container -->


{literal}
<script type="text/javascript">
function buscaObservacoes(id){
    $.post('{/literal}{$admin_url}{literal}/professor/visualizarObservacoes/'+id, function(json){
            dados = jQuery.parseJSON(json);        
            $('#observacao_conteudo').html('<p>'+dados.observacoes+'</p>');            
        });
}
function buscaValores(id){
    limpaCamposModal();
    $.post('{/literal}{$admin_url}{literal}/professor/visualizarObservacoes/'+id, function(json){
        dados = jQuery.parseJSON(json);
        
        $('#modal_nomeProfessor').html('<strong>'+dados.nome_professor+'</strong>');            
        $('#modal_mes_faturado').html('<strong> '+dados.mes_faturado+'</strong>');
        $('#modal_total').html('<strong>R$ '+dados.valor+'</strong>');
        $('#modal_observacoes').html(dados.observacoes);
        $('#idPagamento').val(dados.id);
    
    });
}


function enviaFormulario(form) {
    limpaCamposModal();
    jQuery('#BotaoForm').html('Aguarde...');
    jQuery('#BotaoForm').attr('disabled', 'disabled');        
    var options = { 
        //target:       '#vazio',
        success:    atualizaMensagem,
        //clearForm:    true,
        //resetForm:  true,
        type:       'post',
        url:        '{/literal}{$admin_url}{literal}/professor/atualiza-comprovante/'
    };
    jQuery('#form_comprovante_edicao').ajaxSubmit(options); 
    return false;
}

function atualizaMensagem(retorno) {
    
    var data = jQuery.parseJSON(retorno);
    if (data.msg) {
        jQuery('#BotaoForm').html('Enviar');
        jQuery('#BotaoForm').removeAttr('disabled');
        jQuery('#msgRetorno').addClass("alert alert-danger");
        jQuery('#msgRetorno').html(data.msg);
    }
    if (data.sucesso) {
        var id = data.id;
        jQuery('#status_'+id).html('<span  class="label label-success"><i class="fa fa-check"></i> Pago </span></td>');
        jQuery('#BotaoForm').html('Enviar');
        jQuery('#BotaoForm').removeAttr('disabled');
        jQuery('#msgRetorno').addClass("alert alert-success");
        jQuery('#msgRetorno').html(data.sucesso);                
    }        
}
function limpaCamposModal(){
    jQuery('#BotaoForm').html('Enviar');
    jQuery('#BotaoForm').removeAttr('disabled');
    jQuery('#msgRetorno').html(" ");
    jQuery('#msgRetorno').removeClass();
    jQuery('#campoArquivo').html('');
        
}
function reload(){
     window.location.href='{/literal}{$admin_url}{literal}/professor/alterar-status/';
}
</script>
{/literal}