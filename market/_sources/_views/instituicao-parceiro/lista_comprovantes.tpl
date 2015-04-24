<section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="dashboard.html"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Comprovantes</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-8">
                        
                        <a data-toggle="modal" href="#novoComprovante" class="btn btn-success"><i class="fa fa-plus-circle"></i> Novo comprovante</a>
                            
                        <section class="btn-group">
                            
                            <button data-toggle="dropdown" class="btn btn-white dropdown-toggle" type="button"><i class="fa fa-download"></i> Exportar Dados <span class="caret"></span></button>
                            
                            <ul role="menu" class="dropdown-menu">
                                
                                <li><a target="_blank" href="{$admin_url}/relatorios/relatorio/?tipo=pdf&dados=comprovantes">Exportar em PDF</a></li>
                                <li><a target="_blank" href="{$admin_url}/relatorios/relatorio/?tipo=xls&dados=comprovantes">Exportar em XLS</a></li>
                                
                            </ul>
                            
                        </section><!-- /btn-group -->

                    </section><!-- /col-lg-8 -->
                    
                    <section class="col-lg-4">
                        <form method="post">
                            <section class="input-group m-bot15">
                                    
                                <input type="text" class="form-control" name="palavra_busca">
                                    
                                <span class="input-group-btn"><button type="submit" class="btn btn-white"><i class="fa fa-search"></i></button></span>
                                    
                            </section><!-- /input-group -->
                        </form>    
                    </section><!-- /col-lg-4 -->

                </section><!-- /row -->
                
                <br/>
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Comprovantes</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-calendar"></i> Mês</th>
                                            <th><i class="fa fa-money"></i> Total</th>
                                            <th><i class="fa fa-comment"></i> Observações</th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach from=$comprovantes item=comprovante}
                                        <tr>
                                            
                                            <td>{$comprovante.mes}</td>
                                            <td>R$ {$comprovante.valor_total}</td>
                                            <td><a data-toggle="modal" href="#visualizarObservacoes" onclick="javascript:setaObservacao({$comprovante.id})">Visualizar Observações</a></td>
                                            
                                        </tr>
                                        {foreachelse}
                                        <tr><td>Não contém comprovantes</td></tr>
                                        {/foreach}

                                        
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen --> 
                        
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row --> 
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <a data-toggle="modal" href="#novoComprovante" class="btn btn-success"><i class="fa fa-plus-circle"></i> Novo comprovante</a>

                        <section class="text-center">
                            
                            <ul class="pagination">
                                {$paginacao.anterior}
                                {$paginacao.page_string}
                                {$paginacao.proxima}    
                            </ul>
                            
                        </section><!-- /text-center -->

                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
 
        <!-- Modal - Novo Comprovante -->
        
        <section class="modal fade" id="novoComprovante" tabindex="-1" role="dialog" aria-labelledby="novoComprovante" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Novo Comprovante</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                         <div id="mensagem_de_erro_sucesso">

                        </div>
                                    
                        <form class="form-horizontal tasi-form"  method="post" enctype="multipart/form-data" id="form_novo_comprovante" action="{$admin_url}/comprovantes/novo">
                            
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">Mês</label>
                                
                                <section class="col-lg-10">
                                    
                                    <input type="text" class="form-control" name="mes" data-mask="99/9999" required>
                                
                                </section><!-- /col-lg-10 -->
                            
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">Total</label>
                                
                                <section class="col-lg-4">
                                    
                                    <section class="input-group">
                                        
                                        <span class="input-group-addon">R$</span>
                                        <input type="text" name="valor" class="form-control" required>
                                        
                                    </section><!-- /input-group -->
                                
                                </section><!-- /col-lg-10 -->
                            
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">Anexo</label>
                                
                                <section class="controls col-lg-10">
                                            
                                    <section class="fileupload fileupload-new" data-provides="fileupload">
                                        
                                        <span class="btn btn-white btn-file">
                                            
                                            <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Selecione o Arquivo</span>
                                            <span class="fileupload-exists"><i class="fa fa-undo"></i> Alterar</span>
                                            <input type="file" name="anexo" class="default" />
                                            
                                        </span>
                                        
                                        <span class="fileupload-preview" style="margin-left:5px;"></span>
                                        
                                        <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                                        
                                    </section><!-- /fileupload -->
                                    
                                </section><!-- /controls -->
                            
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">Observações</label>
                                
                                <section class="col-lg-10">
                                      
                                    <textarea class="form-control" name="observacao" cols="30" rows="5"></textarea>
                                    
                                </section><!-- /col-lg-10 -->
                            
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                          
                                <section class="col-lg-offset-2 col-lg-10">
                                      
                                    <button class="btn btn-success" id="BotaoForm" onclick="javascript:enviaFormulario(this);"><i class="fa fa-check-circle"></i> Enviar</button>
                                    
                                </section><!-- /col-lg-offset-2 col-lg-10 --> 
                                  
                            </section><!-- /form-group -->
                        
                        </form>
                    
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button" onclick="redirecionar();">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
        
        <!-- Modal - Visualizar Observações -->
        
        <section class="modal fade" id="visualizarObservacoes" tabindex="-1" role="dialog" aria-labelledby="visualizarObservacoes" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Visualizar Observações</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <p id="observacao"></p>
                    
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button" >Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
    </section><!-- /container -->
{literal}
<script type="text/javascript">

function setaObservacao(id_comprovante){
    $.post('{/literal}{$admin_url}{literal}/comprovantes/observacao', {id:id_comprovante}, function html(json) {
        dados = jQuery.parseJSON(json);
        if(dados[0].observacao){
            $('#observacao').html('<strong>'+dados[0].observacao+'</strong>');
        }else{
            $('#observacao').html('<strong>"Não comtém observação"</strong>');
        }
    });
}



function enviaFormulario(form) {
    jQuery('#BotaoForm').html('<i class="fa fa-check-circle">Aguarde...</i>');
    jQuery('#BotaoForm').attr('disabled', 'disabled');
    
    var options = { 
        //target:       '#vazio',
        success:    atualizaListagem,
        //clearForm:    true,
        resetForm:  true,
        type:       'post',
        url:        '{/literal}{$admin_url}{literal}/comprovantes/novo'
    };
    jQuery('#form_novo_comprovante').ajaxSubmit(options); 
    return false;
}

function atualizaListagem(retorno) {
    
    var data = jQuery.parseJSON(retorno);
    if (data.msg){
        jQuery("#mensagem_de_erro_sucesso").html(data.msg);
        jQuery('#BotaoForm').html('<i class="fa fa-check-circle">Pronto!</i>');
        
    }
}

function redirecionar(){
    window.location.href = "{/literal}{$admin_url}{literal}/comprovantes/listar";
}

</script>



{/literal}   


