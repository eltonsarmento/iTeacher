
        
        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Modelos de E-mails</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-4">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Administrador</strong></header>
                            
                            <section class="list-group">
                                
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(85, 86);">Professor se cadastrar</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(87, 88);">Professor publicar um curso</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(89, 90);">Professor enviar documentos</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(91, 92);">Professor solicitar um saque</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(92, 94);">Instituição se cadastrar</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(95, 96);">Instituição publicar um curso</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(97, 98);">Instituição enviar documentos</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(99, 100);">Material de Marketing for publicado (Professor e Instituição)</a>
                                                                
                            </section><!-- /list-group -->
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-4 -->
                    
                    <section class="col-lg-4">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Professor</strong></header>
                            
                            <section class="list-group">
                                
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(101, 102);">Professor solicitar um saque</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(103, 104);">Solicitação de saque alterar status</a>
                                
                            </section><!-- /list-group -->
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-4 -->
                    
                    <section class="col-lg-4">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Instituição</strong></header>
                            
                            <section class="list-group">
                                
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(105, 106);">Instituição vencer a mensalidade (10 dias)</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(106, 107);">Instituição vencer a mensalidade (5 dias)</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(108, 109);">Instituição vencer a mensalidade (1 dia)</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(110, 111);">Instituição vencer a mensalidade (2 dias depois)</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(112, 113);">Instituição vencer a mensalidade (10 dias depois)</a>
                                
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
                                <input type="text" class="form-control" name="titulo" id="titulo_modal"required>
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
