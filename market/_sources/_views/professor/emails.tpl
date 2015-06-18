
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
                                
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(1, 2);">Quando o usuário se cadastrar</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(3, 4);">Quando um pedido for feito</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(5, 6);">Quando a compra for aprovada / curso liberado</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(7, 8);">Quando um pedido alterar seu status</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(9, 10);">Quando um professor responder sua dúvida</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(11, 12);">Quando o status do certificado for alterado</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(13, 14);">Quando o acesso estiver vencendo (30 dias antes)</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(15, 16);">Quando o acesso estiver vencendo (15 dias antes)</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(17, 18);">Quando o acesso estiver vencendo (1 dia antes)</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(19, 20);">Quando uma assinatura for contratada</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(21, 22);">Quando a assinatura estiver vencendo (10 dias)</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(23, 24);">Quando a assinatura estiver vencendo (5 dias)</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(25, 26);">Quando a assinatura estiver vencendo (1 dia)</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(27, 28);">Quando a assinatura for renovada (Pagamento recorrente)</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(29, 30);">Quando a assinatura não for renovada por problemas financeiros</a>
                                
                            </section><!-- /list-group -->
                        
                        </section><!-- /panel --> 

                         <section class="panel alert-info">
                            
                            <header class="panel-heading alert-info"><strong>Ajuda</strong></header>
                                                        
                            <section class="list-group">
                                <a class="list-group-item" data-toggle="modal" href="#modeloShortcode" >Lista de shortcodes disponíveis </a>
                            </section><!-- /list-group -->
                        
                    </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-4 -->

                    
                    
                    <section class="col-lg-4">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Professor</strong></header>
                            
                            <section class="list-group">
                                
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(31, 32);">Quando um aluno deixar uma dúvida</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(33, 34);">Após 12 horas da dúvida deixada</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(35, 36);">Após 48 horas da dúvida deixada</a>
                                
                            </section><!-- /list-group -->
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-4 -->
                    
                    <section class="col-lg-4">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Administrativo</strong></header>
                            
                            <section class="list-group">
                                
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(37, 38);">Quando uma notificação for deixada</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(39, 40);">Quando uma venda for feita</a>
                                <a class="list-group-item" data-toggle="modal" href="#modeloEmail" onclick="buscarValores(41, 42);">Quando uma venda mudar de status</a>
                                
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



        <!-- Modal - Modelo de shortcodes  -->
        
        <section class="modal fade modal-primary" id="modeloShortcode" tabindex="-1" role="dialog" aria-labelledby="modeloShortcode" aria-hidden="true">
            
            <section class="modal-dialog modal-lg">
                
                <section class="modal-content">

                    <section class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Exemplos de Shortcode</h4>
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <div id="retorno-form"></div>

                                                    

                            <section class="form-group">
                                <label class="control-label">
                                    <strong>Shortcode</strong> é uma expressão/argumento geral para ser substituido por algum parâmetro.<br><br>
                                    Ao mandar um e-mail por exemplo, configura-se para que ele, no modelo de e-mail específico,
                                    que o <strong>"shortcode"</strong> será substituido pelo parametro desejado e que aquele modelo criado seja genérico.<br><br>
                                    Na caixa de texto abaixo um exemplo de modelo de e-mail para quando um aluno for cadasrato.
                                    Não se sabe qual o nome do aluno, então o shortcode <strong>"[[nome_aluno]]"</strong> irá ser substituido pelo nome do aluno.<br><br>
                                </label>                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                <label class="control-label"><strong>Exemplo do uso de um Shortcode</strong></label>
                                <textarea class="form-control"  disabled="true" rows="10" name="texto" id="texto_modal">
Olá [[nome_aluno]], eu sou Adriano Gianini, Diretor do Iteacher e quero lhe agradecer por se inscrever em nosso site.

Primeiramente quero lhe avisar que você dispõe de diversos cursos gratuitos, basta se matricular  e em segundos já estará estudando. Simples assim mesmo, sem complicações.

Gostaria de ressaltar que, como toda empresa, temos algumas regras e colocamos ela em um Manual do Aluno para facilitar.
                                </textarea>
                            </section><!-- /form-group -->
                            <br>
                            <section class="form-group">

                                <h4><strong>Lista de Shortcode:</strong> </h4>
                                    
                                    <table class="table table-striped" width="400px">                                    
                                        <thead></thead>                                    
                                        <tbody>
                                            <tr>
                                                <td>[[data_expiracao]]</td><td>[[data_compra]]</td><td>[[mes]], [[ano]] </td><td>[[email_usuario]]</td>
                                            </tr>                                            
                                            <tr>
                                                <td>[[nome_aluno]]</td><td>[[email_aluno]]</td><td>[[senha_aluno]]</td><td>[[numero_certificado]]</td>
                                            </tr>                                            
                                            <tr>
                                                <td>[[nome_professor]]</td><td>[[email_professor]]</td><td>[[senha_professor]]</td><td>[[titulo_duvida]]</td>
                                            </tr>                                            
                                            <tr>
                                                <td>[[nome_administrativo]]</td><td>[[email_administrativo]]</td><td>[[senha_administrativo]]</td><td>[[mensagem_notificacao]]</td>
                                            </tr>
                                            <tr>
                                                <td>[[nome_curso]]</td><td>[[numero_pedido]]</td><td>[[nome_plano]]</td><td>[[mensagem_duvida]]</td>
                                            </tr>                                            
                                        </tbody>
                                    </table>
                            </section>
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