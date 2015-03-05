        
        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/vendas/listar"><i class="fa fa-home"></i> Vendas Gerenciar</a></li>
                            <li class="active">Vendas Detalhes - {$venda.numero}</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Vendas Detalhes - <span class="text-primary">{$venda.numero}</span></strong></header>

                            <section class="panel-body">
                                
                                <section class="row">
                                    
                                    <section class="bio-row">
                                        
                                        <p><span>Aluno </span> <strong>{$aluno.nome}</strong></p>
                                        
                                    </section><!-- /bio-row -->
                                    
                                    <section class="bio-row">
                                        
                                        <p><span>E-mail </span> <strong>{$aluno.email}</strong></p>
                                        
                                    </section><!-- /bio-row -->
                                    
                                    <section class="bio-row">
                                        
                                        <p><span>Status </span> 
                                            <strong class="label label-{if $venda.status == 1}success{elseif $venda.status == 2}danger{else}info{/if}
                                            "><i class="fa fa-check-circle"></i> {if $venda.status == 1}Aprovado
                                          {elseif $venda.status == 2}Cancelada{else} Aguardando Pagamento {/if}  </strong></p>
                                        
                                    </section><!-- /bio-row -->
                                    
                                    <section class="bio-row">
                                        
                                        <p><span>Pagamento </span> <strong>{if $venda.forma_pagamento_id eq 1} PagSeguro {else} Paypal {/if}</strong></p>
                                        
                                    </section><!-- /bio-row -->
                                    
                                    <section class="bio-row">
                                        
                                        <p><span>Rastreamento </span> <strong><a href="#" target="_blank">SG113377460BR</a></strong></p>
                                        
                                    </section><!-- /bio-row -->
                                    
                                    <section class="bio-row-full">
                                        
                                        <p><span>Observações </span> <strong>{$venda.observacoes}</strong> - <a data-toggle="modal" onclick="buscarValores({$venda.id});" href="#alterarObservacoes">Editar Observações</a></p>
                                        
                                    </section><!-- /bio-row-full -->
                                    
                                    <section class="bio-row">
                                        
                                        <p><span>Data Compra </span> <strong>{$venda.data_venda}</strong></p>
                                        
                                    </section><!-- /bio-row -->
                                    
                                    <section class="bio-row">
                                        
                                        <p><span>Data Expiração </span> <strong class="text-danger">{$venda.data_expiracao}</strong></p>
                                        
                                    </section><!-- /bio-row -->
                                    
                                    <section class="bio-row">
                                        
                                        <p><span>Total do Pedido </span> <strong class="text-primary">R$ {$venda.valor_total}</strong></p>
                                        
                                    </section><!-- /bio-row -->
                                    
                                    <section class="bio-row">
                                        
                                        <p><span>Total Líquido </span> <strong class="text-warning">R$ {$venda.valor_liquido}</strong></p>
                                        
                                    </section><!-- /bio-row -->
                                    
                                </section><!-- /row -->

                            </section><!-- /panel-body -->
    
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            <th><i class="fa fa-book"></i> Curso</th>
                                            <th><i class="fa fa-money"></i> Valor</th>
                                            <th><i class="fa fa-calendar-o"></i> Data Compra</th>
                                            <th><i class="fa fa-calendar-o"></i> Data Expiração</th>
                                            <!-- <th></th> -->
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        
                                        {foreach item=curso from=$cursos}
                                            <tr>                                                
                                                <td>{$curso.curso}</td>
                                                <td>R$ {$curso.preco_total}</td>
                                                <td>{$venda.data_venda}</td>
                                                <td>{$venda.data_expiracao}</td>
                                               <!--  <td>
                                                    
                                                    <a data-toggle="modal" href="#deletarCurso" class="btn btn-danger btn-xs tooltips" data-original-title="Excluir" data-placement="bottom"><i class="fa fa-trash-o"></i></a>

                                                </td>   -->                                              
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
                
        
         <!-- Modal Alterar Observações -->
        
        <section class="modal fade modal-primary" id="alterarObservacoes" tabindex="-1" role="dialog" aria-labelledby="alterarObservacoes" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Alterar Observações</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        <div id="retorno-form"></div>
                        <form id="form-modal" onsubmit="salvarCampos();return false;">
                            <input type="hidden" id="venda_id" name="venda_id" value=""/>
                            <input type="hidden" id="editar" name="editar" value="1"/>
                            <section class="form-group">
                                
                                <label class="control-label">Observação</label>
                                
                                <textarea class="form-control" cols="30" rows="5" id="observacoes" name="observacoes"></textarea>
                            
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

        <!-- Modal - Deletar Curso -->
        
        <section class="modal fade modal-alert" id="deletarCurso" tabindex="-1" role="dialog" aria-labelledby="deletarCurso" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Deletar Curso</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">Você deseja fazer isso?</section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Não</button>
                        <button class="btn btn-danger" type="submit">Sim</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
    </section><!-- /container -->

{literal}
<script type="text/javascript">
function buscarValores(venda_id) {
    $.post('{/literal}{$admin_url}{literal}/vendas/observacao', {id_venda:venda_id}, function html(json) {
        $('#retorno-form').html('');
        dados = jQuery.parseJSON(json);
        //console.log(dados);
        $('#venda_id').val(venda_id);
        if(dados.observacoes != ""){
            $('#observacoes').html(dados.observacoes);
        }else{
            $('#observacoes').html("Não contém observação ainda!");
        }   
    });
}

function salvarCampos() {
    $.post('{/literal}{$admin_url}{literal}/vendas/alterarObservacao', $('#form-modal').serialize(), function(json) {
        $('#retorno-form').html("<div class='alert alert-info'>"+json+"</div>");
    });
}

</script>



{/literal}



   
