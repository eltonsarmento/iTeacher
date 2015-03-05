
        
        <section id="main-content">
          
            <section class="wrapper site-min-height">

                <section class="row state-overview">
                    
                    <section class="col-lg-12">
                    
                        <section class="border-head"><h3>Resumo de Estatísticas</h3></section>
                        
                    </section><!-- /col-lg-12 -->
                    
                    <section class="col-lg-4">
                            
                        <section class="panel">
                            
                            <section class="symbol gray"><i class="fa fa-book"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">{$cursos}</h1>
                                <p>Cursos</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-4 -->
                    
                    <section class="col-lg-4">
                            
                        <section class="panel">
                            
                            <section class="symbol gray"><i class="fa fa-users"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">{$alunos}</h1>
                                <p>Alunos</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-4 -->
                    
                    <section class="col-lg-4">
                            
                        <section class="panel">
                            
                            <section class="symbol gray"><i class="fa fa-shopping-cart"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">{$vendas}</h1>
                                <p>Vendas</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-4 -->
                    
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-6">
                        
                        <section class="panel">
                            
                            <header class="panel-heading">
                                
                                <strong>Últimos Cursos</strong>
                                
                                <span class="tools pull-right">

                                    <a href="{$admin_url}/cursos/listar"><i class="fa fa-plus"></i> Ver todos</a>

                                </span>                            
                            
                            </header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-book"></i> Curso</th>
                                            <th class="hidden-xs"><i class="fa fa-user"></i> Professor</th>
                                            <th class="hidden-xs"><i class="fa fa-calendar"></i> Data Cadastro</th>
                                            <th><i class="fa fa-refesh"></i> Status</th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        
                                        {foreach from=$ultimos_cursos item=curso}
                                        <tr>
                                            
                                            <td>{$curso.curso}</td>
                                            <td class="hidden-xs">{$curso.professor}</td>
                                            <td class="hidden-xs">{$curso.data_convertida}</td>
                                            <td><span class="label label-{if $curso.exibir_site == 1}success{elseif $curso.exibir_site == 0}info{/if}">
                                                    <i class="fa fa-check-circle"></i> {if $curso.exibir_site == 1}Aprovado{elseif $curso.exibir_site == 0}Não Aprovado{/if}
                                                </span></td>
                                            
                                        </tr>
                                        
                                        {foreachelse}
                                            <tr><td colspan="100%">Não contém cursos</td></tr>
                                        {/foreach}
                                        
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen --> 
                        
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-6 -->
                    
                    <section class="col-lg-6">
                        
                        <section class="panel">
                            
                            <header class="panel-heading">
                                
                                <strong>Últimas Vendas</strong>
                                
                                <span class="tools pull-right">

                                    <a href="{$admin_url}/vendas/listarTodas"><i class="fa fa-plus"></i> Ver todas</a>

                                </span>
                            
                            </header>
                            
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
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach from=$ultimas_vendas item=vendas}
                                        <tr>
                                            
                                            <td><a href="{$admin_url}/vendas/detalhes/{$venda.id}">{$vendas.numero}</a></td>
                                            <td>{$vendas.aluno}</td>
                                            <td><a data-toggle="modal" onclick="getCursosByVenda({$vendas.id});" href="#visualizarCursos">Visualizar Cursos</a></td>
                                            <td>{if $vendas.forma_pagamento eq 1}PagSeguro{else if $vendas.forma_pagamento eq 2 }PayPal{/if}</td>
                                            <td>
                                                <span class="label label-{if $vendas.status == 1}success{elseif $vendas.status == 0}info{elseif $vendas.status == 2}danger{/if}">
                                                    <i class="fa fa-check-circle"></i> {if $vendas.status == 1}Aprovado{elseif $vendas.status == 0}Aguardando{elseif $vendas.status == 2}Cancelado{/if}
                                                </span>
                                            </td>
                                            <td>{$vendas.data_convertida}</td>
                                            <td>R$ {$vendas.valor_liquido}</td>
                                            
                                        </tr>
                                        {foreachelse}
                                            <tr><td colspan="100%">Não contém vendas</td></tr>
                                        {/foreach}
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen -->
                        
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-6 -->
                    
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
    
        
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
            $('#resposta_trocar_pagamento').html(html); 
        });
          
    } 

           
    </script>

{/literal}

