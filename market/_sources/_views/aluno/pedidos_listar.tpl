
        
        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/homr"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active"> Pedidos</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->                            
                
                <br/>
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Pedidos</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th>#</th>
                                            <th><i class="fa fa-book"></i> Cursos</th>
                                            <th><i class="fa fa-folder"></i> Forma de Pagamento</th>
                                            <th><i class="fa fa-signal"></i> Status</th>
                                            <th><i class="fa fa-calendar"></i> Data</th>
                                            <th><i class="fa fa-shopping-cart"></i> Total do Pedido</th>
                                            <th><i class="fa fa-money"></i> Total Líquido</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        
                                        {foreach item=venda key=k from=$vendas}
                                        <tr> 
                                            <input type="hidden" value="{$venda.id}" id="venda_id_{$venda.id}"/>
                                            <input type="hidden" value="{$venda.status}" class="status_{$venda.id}" id="status_{$venda.id}"/>
                                            <td><a href="{$admin_url}/vendas/detalhes/{$venda.id}">{$venda.numero}</a></td>
                                            <td><a data-toggle="modal" onclick="getCursosByVenda({$venda.id});" href="#visualizarCursos">Visualizar Cursos</a></td>
                                            <td>
                                                {if $venda.forma_pagamento_id eq 1}
                                                    PagSeguro
                                                {elseif $venda.forma_pagamento_id eq 2}
                                                    Pagar.me
                                                {elseif $venda.forma_pagamento_id eq 3}
                                                    Paypal
                                                {/if}
                                            </td>
                                            <td class="td_status_{$venda.id}"><span class="label 
                                                label-{if $venda.status == 1}success
                                                      {elseif $venda.status == 0}info
                                                      {elseif $venda.status == 2}danger{/if}">
                                            <i class="fa fa-check-circle"></i>
                                                       {if $venda.status == 1}Aprovado
                                                      {elseif $venda.status == 0}Aguardando
                                                      {elseif $venda.status == 2}Cancelado{/if}</span></td>
                                            <td class="td_data_{$venda.id}">{$venda.data_convertida}</td>
                                            <td>R$ {$venda.valor_total}</td>
                                            <td>R$ {$venda.valor_liquido}</td>
                                            <td>
                                                
                                                <a data-toggle="modal" href="#uploadComprovante" class="btn btn-warning btn-xs tooltips" data-original-title="Comprovante" onclick="setaIdVenda({$venda.id});" data-placement="bottom"><i class="fa fa-upload"></i></a>
                                                <!-- <a data-toggle="modal" href="#cancelarPedido" onclick="cancelaPedido({$venda.id});"class="btn btn-danger btn-xs tooltips" data-original-title="Cancelar" data-placement="bottom"><i class="fa fa-times"></i></a> -->
                                                
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
                
        <!-- Modal Upload -->
        
        <section class="modal fade modal-primary" id="uploadComprovante" tabindex="-1" role="dialog" aria-labelledby="uploadComprovante" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Upload Comprovante</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">                        
                        <form class="form-horizontal" action="{$admin_url}/pedidos/atualizaComprovante" onsubmit="return false;" role="form" method="post"  enctype="multipart/form-data" id="form_comprovante_edicao">
                            <input type="hidden" value="1" name="editar"/>
                            <input type="hidden" id="idVenda" name="id"/>
                        
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
                                          
                                        <span class="fileupload-preview" id="campoArquivo" style="margin-left:5px;"></span>
                                        
                                        <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                                        
                                    </section><!-- /fileupload -->
                                    
                                </section><!-- /controls -->
                            
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <section class="col-lg-offset-2 col-lg-10">
                                        
                                    <button class="btn btn-success" id="BotaoForm" onclick="javascript:enviaFormulario(this);"><i class="fa fa-upload"></i> Enviar</button>                                    
                                </section><!-- /col-offset-lg-2 -->
                            
                            </section><!-- /form-group -->
                        
                        </form>
                        
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">
                        
                        <button data-dismiss="modal"  id="fecharModalComprovante" onclick="javascript:limpaCamposModal();"class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
    </section><!-- /container -->

        
        <!-- Modal Visualizar Cursos -->
        
        <section class="modal fade modal-primary" id="visualizarCursos" tabindex="-1" role="dialog" aria-labelledby="visualizarCursos" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Visualizar Cursos</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <span id="span_dadosaluno"></span>
                        <p>Venda: <strong><span id="span_numerovenda"></span></strong></p>
                        
                        <hr/>
                        
                        <section class="row">
                        
                            <table class="table table-striped table-hover">
                                        
                                <thead>
                                    
                                    <tr>
                                        
                                        <th><i class="fa fa-book"></i> Cursos</th>
                                        
                                    </tr>
                                    
                                </thead>
                                
                                <tbody id="tbody_cursos">
                                    
                                    
                                    
                                </tbody>
                                
                            </table>
                            
                        </section><!-- /row -->
                        
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
    function getCursosByVenda(id){
        $.post('{/literal}{$admin_url}{literal}/pedidos/cursosByVenda/'+id, function(json){
            dados = jQuery.parseJSON(json);
            tabela = "";
            $.each(dados, function(){    
                tabela = tabela + "<tr><td>"+this.curso+"</td></tr>";
            });
            $('#tbody_cursos').html(tabela);
            $('#span_dadosaluno').html('<h4>'+dados[0].aluno['nome'] +'- <small>'+dados[0].aluno['email']+'</small></h4>');
            $('#span_numerovenda').html(dados[0].numero_venda['numero']);

        });
    }

    function enviaFormulario(form) {
        limpaCamposModal();
        jQuery('#BotaoForm').html('Aguarde...');
        jQuery('#BotaoForm').attr('disabled', 'disabled');        
        var options = { 
            //target:       '#vazio',
            success:    atualizaListagem,
            //clearForm:    true,
            //resetForm:  true,
            type:       'post',
            url:        '{/literal}{$admin_url}{literal}/pedidos/atualizaComprovante/'
        };
        jQuery('#form_comprovante_edicao').ajaxSubmit(options); 
        return false;
    }

    function atualizaListagem(retorno) {
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
    //Pagamento
    function cancelaPedido(k) {}

    function setaIdVenda(id){
        $('#idVenda').val(id);
    }
    function enviarComprovate() {
        $('#resposta_trocar_pagamento').html('Processando...');
        
        jQuery.post('{/literal}{$admin_url}{literal}/vendas/status',  $('#formStatus').serialize(), function html(html) { 
            //alert(html);
            $('#resposta_trocar_pagamento').html(html); 
        });
          
    } 

           
    </script>

{/literal}

    