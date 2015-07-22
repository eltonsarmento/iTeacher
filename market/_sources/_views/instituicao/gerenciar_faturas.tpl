<section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Gerenciar Financeiro</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <section class="panel-heading"><strong>Gerenciar Financeiro</strong></section><!-- /panel-heading -->
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-calendar"></i> Data Vencimento</th>
                                            <th class="hidden-xs"><i class="fa fa-signal"></i> Status</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>                                        

                                        {foreach from=$faturas  item=fatura}
                                        
                                            <tr>
                                                
                                                <td><strong>{$fatura.data_pagamento|date_format:"%d/%m/%Y"}</strong></td>
                                                <td>
                                                    {if $fatura.status eq 1}
                                                        <span class="label label-success">Paga</span>
                                                    {elseif $fatura.status eq 2}
                                                        <span class="label label-primary">Vencimento Próximo</span>
                                                    {elseif $fatura.status eq 3}
                                                        <span class="label label-warning">Vencida</span>
                                                    {elseif $fatura.status eq 4}
                                                        <span class="label label-danger">Bloqueada</span>
                                                    {elseif $fatura.status eq 5}
                                                        <span class="label label-warning">Trial</span>
                                                    {/if}
                                                
                                                </td>
                                                <td>
                                                    {if $fatura.status != 1 and $fatura.status != 5}
                                                        <a data-toggle="modal" onClick="buscaValores({$fatura.id})" href="#editarPagamento" class="btn btn-success btn-xs tooltips" data-original-title="Comprovante" data-placement="bottom"><i class="fa fa-download"></i></a>
                                                    {/if}
                                                    <!-- <a href="#" class="btn btn-default btn-xs tooltips" data-original-title="Emitir Boleto" data-placement="bottom"><i class="fa fa-barcode"></i></a> -->
                                                    
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
                            <input type="hidden" id="idFatura" name="id"/>
                                                         
                            <section class="form-group">
                                <div style="display: block;" id="msgRetorno"></div> 
                                <label class="control-label col-lg-2">Comprovante</label>
                                <section class="controls col-lg-10">                                            
                                    <section class="fileupload fileupload-new" data-provides="fileupload">                                        
                                        <span class="btn btn-white btn-file">                                            
                                            <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Selecione o Arquivo</span>
                                            <span class="fileupload-exists"><i class="fa fa-undo"></i> Alterar</span>
                                            <input type="file" class="default" />
                                            <input type="file" name="comprovante" class="default" />                                            
                                        </span>                                        
                                        <span class="fileupload-preview" id="comprovanteNome" style="margin-left:5px;"></span>                                        
                                        <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                                    </section><!-- /fileupload -->
                                </section><!-- /controls -->                    
                            </section><!-- /form-group -->
                            
                            
                            
                            <section class="form-group">
                                          
                                <section class="col-lg-offset-2 col-lg-10">
                                                                          
                                    <button id="BotaoForm"  class="btn btn-success" onclick="javascript:enviaFormulario(this);"><i class="fa fa-check-circle"></i> Enviar</button>
                                    
                                </section><!-- /col-lg-offset-2 col-lg-10 --> 
                                  
                            </section><!-- /form-group -->
                        
                        </form>
                    
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" onClick="limpaCamposModal();" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->

{literal}
<script type="text/javascript">
function buscaValores(id){

    limpaCamposModal();
    $.post('{/literal}{$admin_url}{literal}/financeiro/buscar-fatura/'+id, function(json){
        dados = jQuery.parseJSON(json);
        $('#idFatura').val(dados.id);
    
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
        url:        '{/literal}{$admin_url}{literal}/financeiro/atualiza-comprovante/'
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
    jQuery('#comprovanteNome').html('');
    
        
}
function reload(){
     window.location.href='{/literal}{$admin_url}{literal}/Financeiro/gerenciar-financeiro/';
}
</script>
{/literal}