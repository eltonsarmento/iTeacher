
        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="dashboard.html"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Modelos de E-mails</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-4">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Aluno</strong></header>
                            
                            <section class="list-group">
                                
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(43, 44);">Quando o usuário se cadastrar</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(45, 46);">Quando um pedido for feito</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(47, 48);">Quando a compra for aprovada / curso liberado</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(49, 50);">Quando um pedido alterar seu status</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(51, 52);">Quando um professor responder sua dúvida</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(53, 54);">Quando o status do certificado for alterado</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(55, 56);">Quando o acesso estiver vencendo (30 dias antes)</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(57, 58);">Quando o acesso estiver vencendo (15 dias antes)</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(59, 60);">Quando o acesso estiver vencendo (1 dia antes)</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(61, 62);">Quando uma assinatura for contratada</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(63, 64);">Quando a assinatura estiver vencendo (10 dias)</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(65, 66);">Quando a assinatura estiver vencendo (5 dias)</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(67, 68);">Quando a assinatura estiver vencendo (1 dia)</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(69, 70);">Quando a assinatura for renovada (Pagamento recorrente)</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(71, 72);">Quando a assinatura não for renovada por problemas financeiros</a>
                                
                            </section><!-- /list-group -->
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-4 -->
                    
                    <section class="col-lg-4">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Professor</strong></header>
                            
                            <section class="list-group">
                                
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(73, 74);">Quando um aluno deixar uma dúvida</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(75, 76);">Após 12 horas da dúvida deixada</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(77, 78);">Após 48 horas da dúvida deixada</a>
                                
                            </section><!-- /list-group -->
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-4 -->
                    
                    <section class="col-lg-4">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Administrativo</strong></header>
                            
                            <section class="list-group">
                                
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(79, 80);">Quando uma notificação for deixada</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(81, 82);">Quando uma venda for feita</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(83, 84);">Quando uma venda mudar de status</a>
                                
                            </section><!-- /list-group -->
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-4 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
       
        
        <!-- Modal - Modelo de E-mail -->
        
        <section class="modal fade modal-primary" id="modeloEmail" tabindex="-1" role="dialog" aria-labelledby="modeloEmail" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">

                    <section class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Modelo de E-mail</h4>
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <div id="retorno-form"></div>

                        <form role="form" id="form-modal" onsubmit="salvarCampos();return false;">
                            
                            <input type="hidden" id="titulo_id_modal" name="titulo_id"/>
                            <input type="hidden" id="texto_id_modal" name="texto_id"/>

                            <section class="form-group">
                                <label class="control-label">Título do E-mail</label>
                                <input type="text" class="form-control" name="titulo" id="titulo_modal" required>
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                <label class="control-label">Corpo do E-mail</label>
                                <textarea class="form-control"  rows="10" name="texto" id="texto_modal"></textarea>
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Salvar</button>
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
function buscarValores(titulo_id, texto_id) {
    
    $.post('{/literal}{$admin_url}{literal}/emails/buscarCampos', {titulo:titulo_id, texto:texto_id}, function html(json) {
        $('#retorno-form').html('');
        dados = jQuery.parseJSON(json)
        
        $('#titulo_id_modal').val(titulo_id);
        $('#titulo_modal').val(dados.titulo);
        $('#texto_id_modal').val(texto_id);
        $('#texto_modal').val(dados.texto);
        $('#texto_modal').data('wysihtml5').editor.setValue(dados.texto);
    });
}

function salvarCampos() {
    $.post('{/literal}{$admin_url}{literal}/emails/salvarDados', $('#form-modal').serialize(), function(json) {
        $('#retorno-form').html('<div class="alert alert-info">Atualizado!</div>');
    });
}

</script>



{/literal}