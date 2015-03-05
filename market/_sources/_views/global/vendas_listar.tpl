
        
        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/homr"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/vendas/listar"><i class="fa fa-home"></i> Gerenciar Vendas</a></li>
                            <li class="active"> Todas as Vendas</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-4">
                        <form method="post">
                            <section class="input-group m-bot15">
                                
                                    <input type="text" name="palavra_busca" class="form-control">
                                        
                                    <span class="input-group-btn"><button type="submit" class="btn btn-white"><i class="fa fa-search"></i></button></span>
                                
                            </section><!-- /input-group -->
                        </form>       
                    </section><!-- /col-lg-4 -->

                </section><!-- /row -->
                
                <br/>
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>vendas</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th>#</th>
                                            <th><i class="fa fa-user"></i> Aluno</th>
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
                                            <td>{$venda.aluno}</td>
                                            <td><a data-toggle="modal" onclick="getCursosByVenda({$venda.id});" href="#visualizarCursos">Visualizar Cursos</a></td>
                                            <td>{if $venda.forma_pagamento_id eq 1} PagSeguro {else} Paypal {/if}</td>
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
                                                
                                                <a data-toggle="modal" href="#visualizarHistorico" onclick="getVendasByAluno({$venda.aluno_id});" class="btn btn-success btn-xs tooltips" data-original-title="Histórico" data-placement="bottom"><i class="fa fa-folder"></i></a>
                                                <a data-toggle="modal" href="#alterarStatus" onclick="setarValoresPagamento({$venda.id});"  class="btn btn-info btn-xs tooltips" data-original-title="Status" data-placement="bottom"><i class="fa fa-refresh"></i></a>
                                                
                                            </td>
                                            
                                        </tr>
                                        {/foreach}
                                        
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen --> 
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row --> 
                <section class="row">
                    
                    <section class="col-lg-12">
                                                    
                        {if $categoria eq 'professor-administrativo'}
                        {else}
                        <a href="{$admin_url}/relatorios/venda" class="btn btn-info"><i class="fa fa-bar-chart-o"></i> Relatório completo </a>
                        {/if}
                        <section class="text-center">
                            
                            <ul class="pagination">
                                
                                {$paginacao.anterior}
                                {$paginacao.page_string}
                                {$paginacao.proxima} 
                                
                            </ul>
                            
                        </section>

                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
                
        
        <!-- Modal Visualizar Histórico -->
        
        <section class="modal fade modal-primary" id="visualizarHistorico" tabindex="-1" role="dialog" aria-labelledby="visualizarHistorico" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Visualizar Histórico</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <span id="span_nomeEmailAluno"></span>
                        
                        <hr/>
                        
                        <section class="row">
                        
                            <table class="table table-striped table-hover">
                                        
                                <thead>
                                    
                                    <tr>
                                        
                                        <th>#</th>
                                        <th><i class="fa fa-book"></i> Cursos</th>
                                        <th><i class="fa fa-signal"></i> Status</th>
                                        <th><i class="fa fa-calendar"></i> Data</th>
                                        <th><i class="fa fa-money"></i> Valor</th>
                                        
                                    </tr>
                                    
                                </thead>
                                
                                <tbody id="tbody_vendasaluno">
                                    
                                    
                                    
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
        
        <!-- Modal Alterar Status -->
        
        <section class="modal fade modal-primary" id="alterarStatus" tabindex="-1" role="dialog" aria-labelledby="alterarStatus" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Alterar Status</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <form class="form-horizontal tasi-form" id="formStatus" onsubmit="return false;">
                            <div id="resposta_trocar_pagamento"></div>
                            <input type="hidden" name="editar" value="1"/>
                            <input type="hidden" name="venda_id" value="" id="venda_id_modal_pagamento"/>
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">Status</label>
                                
                                <section class="col-lg-10">
                                
                                    <select class="form-control" name="status" id="status_modal">
                                    
                                        <option selected>Status</option>
                                        <option  value="1">Aprovado</option>
                                        <option value="2">Cancelado</option>
                                        <option value="0">Aguardando Pagamento</option>
                                        
                                    </select>
                                
                                </section><!-- /form-group -->
                            
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <section class="col-lg-offset-2 col-lg-10">
                                    
                                    <button class="btn btn-success" onclick="alterarPagamento();"><i class="fa fa-check-circle"></i> Salvar</button>
                                    
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
    function getCursosByVenda(id){
        $.post('{/literal}{$admin_url}{literal}/vendas/cursosByVenda/'+id, function(json){
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

    function getVendasByAluno(id){
        $.post('{/literal}{$admin_url}{literal}/vendas/vendasByAluno/'+id, function(json){
            dados = jQuery.parseJSON(json);
            tabela = "";
            curso = ""
            label = "";
            status = "";
           $.each(dados, function(){
                $.each(this.cursos, function(index, value){
                    curso = curso +value.curso+"<br>";
                });   
                if(this.status == 1){
                    label = "success";
                    status = "Aprovado";
                } else if(this.status == 0){
                    label = "info";
                    status = "Aguardando";
                } else if(this.status == 2){
                    label = "danger";
                    status = "Cancelado";
                }
                tabela = tabela + "<tr><td><a href='vendas-detalhes.html'>"+this.numero+"</a></td><td>"+curso+"</td><td><span class='label label-"+label+"'><i class='fa fa-check-circle'></i> "+status+"</span></td><td>"+this.data_convertida+"</td><td>R$ "+this.valor_total+"</td></tr>";  
            });

            $('#span_nomeEmailAluno').html("<h4>"+dados[0].aluno['nome']+" - <small>"+dados[0].aluno['email']+"</small></h4>");
            $('#tbody_vendasaluno').html(tabela);
        });
    }
    //Pagamento
    function setarValoresPagamento(k) {
        jQuery('#status_modal').val(jQuery("#status_"+k).val());
        jQuery('#venda_id_modal_pagamento').val(jQuery("#venda_id_"+k).val());
    }

    function alterarPagamento() {
        $('#resposta_trocar_pagamento').html('Processando...');
        
        jQuery.post('{/literal}{$admin_url}{literal}/vendas/status',  $('#formStatus').serialize(), function html(html) { 
            //alert(html);
            $('#resposta_trocar_pagamento').html(html); 
        });
          
    } 

           
    </script>

{/literal}

    