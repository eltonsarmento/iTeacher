
        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/perfil/visualizar/{$usuario_id}">Perfil</a></li>
                            <li class="active">Contas Bancárias</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel tasks-widget">
                            
                            <header class="panel-heading">
                                {if $msg_alert}
                                    <div class="alert alert-info">{$msg_alert}</div>
                                {/if}
                                <strong>Contas Bancárias</strong>
                            </header>
                            
                            <section class="panel-body">

                                <form role="form">
                                        
                                    <section class="task-content">
                                        
                                        <ul class="task-list">
                                            {foreach from=$contas key=k item=conta}
                                            <li>
                                                
                                                <section class="task-title">
                                                    
                                                    <span class="task-title-sp">{$conta.nome}</span>
                                                    {if $conta.status eq 1}
                                                        <span class="badge badge-sm label-success">Verificada</span>
                                                    {else}
                                                        <span class="badge badge-sm label-warning">Aguardando Verificação</span>
                                                    {/if}
                                                    
                                                    <section class="pull-right">
                                                        
                                                        <a href="#detalhesConta" onclick="buscarValores({$conta.id});" data-toggle="modal" class="btn btn-primary btn-xs tooltips" data-original-title="Detalhes" data-placement="bottom"><i class="fa fa-plus"></i></a>
                                                        <a data-toggle="modal" href="#deletarConta" class="btn btn-danger btn-xs tooltips" data-original-title="Excluir" onclick="setaExcluir({$conta.id})" data-placement="bottom"><i class="fa fa-trash-o"></i></a>
                                                        
                                                    </section><!-- /pull-right -->
                                                
                                                </section><!-- /task-title -->
                                                
                                            </li>
                                            {/foreach}                  
                                        </ul>
                                        
                                    </section><!-- /task-content -->

                                    <section class="form-group">
                                        
                                        <a data-toggle="modal" href="#novaConta" class="btn btn-info" type="submit"><i class="fa fa-plus-circle"></i> Adicionar Nova</a>
                           
                                    </section><!-- /form-group -->
                                    
                                 </form>
                                
                            </section><!-- /panel-body -->
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
       
        
        <!-- Modal - Nova conta -->
        
        <section class="modal fade modal-primary" id="novaConta" tabindex="-1" role="dialog" aria-labelledby="novaConta" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Adicionar nova conta bancária</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        <div id="retorno-form"></div>
                        
                        <form class="form-horizontal" role="form" id="form-cadastro" onsubmit="salvarCampos();return false;">
                            
                            <section class="form-group">
                                
                                <label class="col-lg-2 control-label">Banco</label>
                                
                                <section class="col-lg-10">
                                    
                                    <input type="text" name="nome" class="form-control" required>
                                    
                                </section><!-- /col-lg-10 -->
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="col-lg-2 control-label">Agência</label>
                                
                                <section class="col-lg-10">
                                    
                                    <input type="text" name="agencia" class="form-control" data-mask="9999-9" required>
                                    
                                </section><!-- /col-lg-10 -->
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="col-lg-2 control-label">Conta</label>
                                
                                <section class="col-lg-10">
                                    
                                    <input type="text" name="conta" class="form-control" data-mask="99.999-9" required>
                                    
                                </section><!-- /col-lg-10 -->
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="col-lg-2 control-label">Tipo</label>
                                
                                <section class="col-lg-10">
                                    
                                    <select class="form-control" name="tipo" required>
                                        
                                        <option value="" selected>Selecione</option>
                                        <option value="1">Conta Corrente</option>
                                        <option value="2">Conta Poupança</option>
                                        
                                    </select>
                                    
                                </section><!-- /col-lg-10 -->
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <section class="col-lg-offset-2 col-lg-10">
                                    
                                    <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Salvar</button>
                                    
                                </section><!-- /col-lg-10 -->
                                
                            </section><!-- /form-group -->

                        </form>
                    
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button" id="recarregar">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
        
        <!-- Modal - Deletar Conta -->
        
        <section class="modal fade modal-alert" id="deletarConta" tabindex="-1" role="dialog" aria-labelledby="deletarConta" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Deletar Conta</h4>
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
        
        <!-- Modal - Detalhes conta -->
    
        <section class="modal fade modal-primary" id="detalhesConta" tabindex="-1" role="dialog" aria-labelledby="detalhesConta" aria-hidden="true">
            
            <section class="modal-dialog modal-lg">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Detalhes Conta</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <form class="form-horizontal" role="form" method="post" enctype="multipart/form-data" id="form_envio_comprovante" action="{$admin_url}/contas/enviarDocumentos">
                            <input type="hidden" id="id" name="id" value=""/>
                            
                            <section class="form-group">
                                
                                <label class="col-lg-2 control-label">Banco</label>
                                
                                <section class="col-lg-10">
                                    
                                    <p class="form-control-static" id="banco"><strong>Santander</strong></p>
                                    
                                </section><!-- /col-lg-10 -->
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="col-lg-2 control-label">Agência</label>
                                
                                <section class="col-lg-10">
                                    
                                    <p class="form-control-static" id="agencia"><strong>0000-0</strong></p>
                                    
                                </section><!-- /col-lg-10 -->
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="col-lg-2 control-label">Conta</label>
                                
                                <section class="col-lg-10">
                                    
                                    <p class="form-control-static" id="conta"><strong>00.000-0</strong></p>
                                    
                                </section><!-- /col-lg-10 -->
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="col-lg-2 control-label">Tipo</label>
                                
                                <section class="col-lg-10">
                                    
                                    <p class="form-control-static" id="tipo"><strong>Conta Corrente</strong></p>
                                    
                                </section><!-- /col-lg-10 -->
                                
                            </section><!-- /form-group -->
                            
                            <hr/>
                            
                            <h4>Verificação de Conta</h4>
                            
                            <section class="form-group">
                                
                                <label class="col-lg-2 control-label">Cópia CPF</label>
                                
                                <section class="controls col-lg-10">
                                            
                                    <section class="fileupload fileupload-new" data-provides="fileupload">
                                        
                                        <span class="btn btn-white btn-file">
                                            
                                            <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Selecione o Arquivo</span>
                                            <span class="fileupload-exists"><i class="fa fa-undo"></i> Alterar</span>
                                            <input type="file" name="comprovante_cpf" class="default" />
                                            
                                        </span>
                                        
                                        <span class="fileupload-preview" style="margin-left:5px;"></span>
                                        
                                        <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                                        
                                    </section><!-- /fileupload -->
                                    
                                </section><!-- /controls -->
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="col-lg-2 control-label">Cópia RG ou CNH</label>
                                
                                <section class="controls col-lg-10">
                                            
                                    <section class="fileupload fileupload-new" data-provides="fileupload">
                                        
                                        <span class="btn btn-white btn-file">
                                            
                                            <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Selecione o Arquivo</span>
                                            <span class="fileupload-exists"><i class="fa fa-undo"></i> Alterar</span>
                                            <input type="file" name="comprovante_rg" class="default" />
                                            
                                        </span>
                                        
                                        <span class="fileupload-preview" style="margin-left:5px;"></span>
                                        
                                        <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                                        
                                    </section><!-- /fileupload -->
                                    
                                    <p class="help-text">Não é necessário envio da cópia do CPF.</p>
                                    
                                </section><!-- /controls -->
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="col-lg-2 control-label">Comprovante de Residência</label>
                                
                                <section class="controls col-lg-10">
                                            
                                    <section class="fileupload fileupload-new" data-provides="fileupload">
                                        
                                        <span class="btn btn-white btn-file">
                                            
                                            <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Selecione o Arquivo</span>
                                            <span class="fileupload-exists"><i class="fa fa-undo"></i> Alterar</span>
                                            <input type="file" name="comprovante_residencia" class="default" />
                                            
                                        </span>
                                        
                                        <span class="fileupload-preview" style="margin-left:5px;"></span>
                                        
                                        <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                                        
                                    </section><!-- /fileupload -->
                                    
                                </section><!-- /controls -->
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="col-lg-2 control-label">Comprovante Bancário</label>
                                
                                <section class="controls col-lg-10">
                                            
                                    <section class="fileupload fileupload-new" data-provides="fileupload">
                                        
                                        <span class="btn btn-white btn-file">
                                            
                                            <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Selecione o Arquivo</span>
                                            <span class="fileupload-exists"><i class="fa fa-undo"></i> Alterar</span>
                                            <input type="file" name="comprovante_bancario" class="default" />
                                            
                                        </span>
                                        
                                        <span class="fileupload-preview" style="margin-left:5px;"></span>
                                        
                                        <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                                        
                                    </section><!-- /fileupload -->
                                    
                                </section><!-- /controls -->
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="col-lg-2 control-label">Observações</label>
                                
                                <section class="col-lg-10">
                                     <textarea class="form-control"  rows="10" name="observacao" id="observacao"></textarea>
                                    
                                </section><!-- /col-lg-10 -->
                                
                            </section><!-- /form-group -->
                            
                            <hr/>
                            
                            <section class="form-group">
                                
                                <section class="col-lg-offset-2 col-lg-10">
                                    
                                    <button class="btn btn-success" id="BotaoForm" onclick="javascript:enviaFormulario(this);"><i class="fa fa-check-circle"></i> Enviar</button>
                                    </br></br>
                                    <div id="mensagem_de_erro_sucesso">

                                    </div>
                                    
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

function buscarValores(conta_id) {
    var tipo_conta = "";
    $.post('{/literal}{$admin_url}{literal}/contas/buscarCampos', {id:conta_id}, function html(json) {
        $('#retorno-form').html('');
        dados = jQuery.parseJSON(json);
        $('#id').val(conta_id);       
        $('#banco').html('<strong>'+dados.nome+'</strong>');
        $('#agencia').html('<strong>'+dados.agencia+'</strong>');
        $('#conta').html('<strong>'+dados.conta+'</strong>');
        if(dados.tipo == 1){
            tipo_conta = "Conta corrente";
        }else{
            tipo_conta = "Poupança";
        }
        $('#tipo').html('<strong>'+tipo_conta+'</strong>');
        
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
        url:        '{/literal}{$admin_url}{literal}/contas/enviarDocumentos'
    };
    jQuery('#form_envio_comprovante').ajaxSubmit(options); 
    return false;
}

function atualizaListagem(retorno) {
    
    var data = jQuery.parseJSON(retorno);
    if (data.erro_geral){
        jQuery("#mensagem_de_erro_sucesso").html(data.erro_geral);
        jQuery('#BotaoForm').html('<i class="fa fa-check-circle">Pronto!</i>');
        
    }
    if (data.sucesso_geral) {
        jQuery('#mensagem_de_erro_sucesso').html(data.sucesso_geral);
        jQuery('#BotaoForm').html('<i class="fa fa-check-circle">Pronto!</i>');        
    }
}

function salvarCampos() {
    $.post('{/literal}{$admin_url}{literal}/contas/novo', $('#form-cadastro').serialize(), function(json) {
        $('#retorno-form').html('<div class="alert alert-info">Cadastrado com sucesso!</div>');
    });
}

$("#recarregar").click(function(){
    location.reload();
});

//Delete
function setaExcluir(id) {
    $('#id_excluir').val(id);
}

//recusar
function confirmaExcluir() {
    window.location.href='{/literal}{$admin_url}{literal}/contas/apagar/' + $('#id_excluir').val();
    
}

</script>



{/literal}   
