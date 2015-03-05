        <section id="main-content">
          
            <section class="wrapper site-min-height">

                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Solicitações de Saques</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                    
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-8">
                        
                        <a data-toggle="modal" href="#filtrarRelatorio" class="btn btn-info"><i class="fa fa-filter"></i> Filtrar Relatório</a>
                        
                    </section><!-- /col-lg-8 -->
                    
                    <section class="col-lg-4">
                        
                        <section class="input-group m-bot15">
                            <form>    
                                <input type="text" name="palavra_chave" class="form-control">
                                    
                                <span class="input-group-btn"><button type="submit" class="btn btn-white"><i class="fa fa-search"></i></button></span>
                            </form>   
                        </section><!-- /input-group -->
                        
                    </section><!-- /col-lg-4 -->
                    
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            {if $msg_alert}
                            <div class="alert alert-info">{$msg_alert}</div>
                            {/if}
                            <header class="panel-heading"><strong>Solicitações de Saques</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-calendar"></i> Data</th>
                                            <th><i class="fa fa-barcode"></i> Código</th>
                                            <th><i class="fa fa-signal"></i> Status</th>
                                            <th><i class="fa fa-money"></i> Valor</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach from=$saques item=saque}
                                        <tr>
                                            
                                            <td>{$saque.data|date_format:"%d/%m/%Y"}</td>
                                            <td>{$saque.codigo} - <a href="{$admin_url}/financeiro/detalhes/?codigo={$saque.codigo}">Ver detalhes</a></td>
                                            <td><span class="label label-{if $saque.status eq 0}primary{else if $saque.status eq 1}success{else}danger{/if}"><i class="fa fa-{if $saque.status eq 0}exclamation-circle{else if $saque.status eq 1}check{else}times{/if}"></i> {if $saque.status eq 0}Aguardando pagamento{else if $saque.status eq 1}Transferência concluída{else}Solicitação cancelada{/if}</span></td>
                                            <td>R$ {$saque.valor}</td>
                                            <td>
                                                
                                                <a data-toggle="modal" href="#alterarStatus" onclick="setarDados({$saque.id})" class="btn btn-success btn-xs tooltips" data-original-title="Status" data-placement="bottom"><i class="fa fa-refresh"></i></a>
                                                <a data-toggle="modal" href="#enviarComprovante" onclick="setaIdSaque({$saque.id})" class="btn btn-info btn-xs tooltips" data-original-title="Comprovante" data-placement="bottom"><i class="fa fa-upload"></i></a>
                                                <a data-toggle="modal" href="#enviarNFe" onclick="setarDadosNF({$saque.id})" class="btn btn-primary btn-xs tooltips" data-original-title="NFe" data-placement="bottom"><i class="fa fa-file"></i></a>
                                            
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

        <!-- Modal - Comprovante -->
    
        <section class="modal fade modal-primary" id="enviarComprovante" tabindex="-1" role="dialog" aria-labelledby="enviarComprovante" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Comprovante</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <form action="{$admin_url}/financeiro/atualiza-comprovante" onsubmit="return false;" class="form-horizontal tasi-form" method="post"  enctype="multipart/form-data" id="form_comprovante_edicao">
                            <input type="hidden" value="1" name="editar"/>
                            <input type="hidden" id="idSaque" name="id"/>

                            <section class="form-group">
                                <div style="display: block;" id="msgRetorno"></div>  
                                <label class="control-label col-lg-2">Comprovante</label>
                                
                                <section class="controls col-lg-10">
                                            
                                    <section class="fileupload fileupload-new" data-provides="fileupload">
                                        
                                        <span class="btn btn-white btn-file">
                                            
                                            <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Selecione o arquivo</span>
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
                                
                                <section class="col-lg-offset-2 col-lg-10">
                                    
                                    <button class="btn btn-success" onclick="javascript:enviaFormulario(this);"><i class="fa fa-check-circle"></i> Enviar</button>
                                    
                                </section><!-- /col-lg-10 -->
                                
                            </section><!-- /form-group -->
                            
                        </form>
                    
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
        <!-- Modal - Nota Fiscal Eletrônica -->
    
        <section class="modal fade modal-primary" id="enviarNFe" tabindex="-1" role="dialog" aria-labelledby="enviarNFe" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Nota Fiscal Eletrônica</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        <form method="post" class="form-horizontal tasi-form">
                            <input type="hidden" name="id_nf" id="id_nf" value="">
                            <input type="hidden" name="editarNF" id="editarNF" value="">
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">Nfe</label>
                                
                                <section class="col-lg-10">
        
                                    <input class="form-control" id="nfe" name="nfe" type="text">
                                        
                                </section><!-- /col-lg-9 -->
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <section class="col-lg-offset-2 col-lg-10">
                                    
                                    <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Enviar</button>
                                    
                                </section><!-- /col-lg-10 -->
                                
                            </section><!-- /form-group -->
                            
                        </form>
                    
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
        <!-- Modal - Filtrar Relatorio -->
    
        <section class="modal fade modal-primary" id="filtrarRelatorio" tabindex="-1" role="dialog" aria-labelledby="filtrarRelatorio" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Filtrar Relatório</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <form method="post" class="form-horizontal tasi-form">
                            <input type="hidden" name="filtrar" value="1">
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">De</label>
                                
                                <section class="col-lg-9">
        
                                    <section data-date-format="dd/mm/yyyy" data-date="18/03/2014" class="input-append date dpYears">
                                    
                                        <input type="text" readonly="" name='de' value="18/03/2014" size="16" class="form-control">
                                        
                                        <span class="input-group-btn add-on">
                                            
                                            <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                            
                                        </span>
                                        
                                    </section><!-- /date-->
                                        
                                </section><!-- /col-lg-9 -->
                                
                            </section><!-- /form-group -->
                                
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">Até</label>
                                
                                <section class="col-lg-9">
        
                                    <section data-date-format="dd/mm/yyyy" data-date="18/03/2014" class="input-append date dpYears">
                                    
                                        <input type="text" readonly="" name="ate" value="18/03/2014" size="16" class="form-control">
                                        
                                        <span class="input-group-btn add-on">
                                            
                                            <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                            
                                        </span>
                                        
                                    </section><!-- /date-->
                                        
                                </section><!-- /col-lg-9 -->
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">Status</label>
                                
                                <section class="col-lg-10">
        
                                    <select class="form-control" name="status">
                                        
                                        <option value="" selected>Selecione</option>
                                        <option value="aguardando">Aguardando pagamento</option>
                                        <option value="pago">Transferência concluída</option>
                                        <option value="cancelado">Solicitação cancelada</option>
                                        
                                    </select>
                                        
                                </section><!-- /col-lg-10 -->
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <section class="col-lg-offset-2 col-lg-10">
                                    
                                    <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Filtrar</button>
                                    
                                </section><!-- /col-lg-10 -->
                                
                            </section><!-- /form-group -->
                            
                        </form>
                    
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
        <!-- Modal - Alterar Status -->
    
        <section class="modal fade modal-primary" id="alterarStatus" tabindex="-1" role="dialog" aria-labelledby="alterarStatus" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Alterar Status</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <p>Código: <strong><span id="codigo"></span></strong></p>
                        
                        <hr/>
                        
                        <form action="#" method="post" class="form-horizontal tasi-form" >
                            <input type="hidden" name="id" id="id_saque" value="">
                            <input type="hidden" name="editar" id="editar" value="">
                            <input type="hidden" name="valor" id="valor" value="">
                            <input type="hidden" name="usuario" id="usuario_id" value="">

                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">Status</label>
                                
                                <section class="col-lg-10">
        
                                    <select class="form-control" id="status_select" name="status">
                                        
                                        <option id="status">Status</option>
                                        <option id="concluida" value="1">Transferência concluída</option>
                                        <option id="cancelada" value="2">Solicitação cancelada</option>
                                    
                                    </select>
                                        
                                </section><!-- /col-lg-9 -->
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <section class="col-lg-offset-2 col-lg-10">
                                    
                                    <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Salvar</button>
                                    
                                </section><!-- /col-lg-10 -->
                                
                            </section><!-- /form-group -->
                            
                        </form>
                    
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
    </section><!-- /container -->
{literal}
<script type="text/javascript">
    function setarDados(id){
        $.post('{/literal}{$admin_url}{literal}/financeiro/get-dados/'+id, function(json){
            dados = jQuery.parseJSON(json);
            $('#codigo').html(dados.codigo);
            $('#id_saque').val(dados.id);
            $('#valor').val(dados.valor);
            $('#usuario_id').val(dados.usuario_id);
            $('#editar').val(1);
            if (dados.status == 0) {
                $('#status').attr('selected', 'selected');
            }else if(dados.status == 1){
                $('#concluida').attr('selected', 'selected');
            }else{
                $('#cancelada').attr('selected', 'selected');
            }
        });
    }

    function setarDadosNF(id){
        $.post('{/literal}{$admin_url}{literal}/financeiro/get-dados-nf/'+id, function(json){
            dados = jQuery.parseJSON(json);
            console.log(dados);
            $('#id_nf').val(dados.id);
            $('#nfe').val(dados.nfe);
            $('#editarNF').val(1);

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
            //jQuery('#uploadComprovante').modal('hide');        
        }        
    }
    function limpaCamposModal(){
        jQuery('#BotaoForm').html('Enviar');
        jQuery('#BotaoForm').removeAttr('disabled');
        jQuery('#msgRetorno').html(" ");
        jQuery('#msgRetorno').removeClass();
        jQuery('#campoArquivo').html('');
        
    }

    function setaIdSaque(id){
        $('#idSaque').val(id);
    }

    function alterarStatus() {
        window.location.href='{/literal}{$admin_url}{literal}/financeiro/alterar-status/' + $('#id_saque').val() +'?editar='+$('#editar').val()+'&status='+$('#status_select').val();
    }
</script>
{/literal}
