        

        <section id="main-content">
            
            <section class="wrapper site-min-height">

                <section class="row state-overview">

                    
                    
                    <section class="col-lg-12">
                    
                        <section class="border-head"><h3>Resumo de Estatísticas</h3></section>
                        
                    </section><!-- /col-lg-12 -->
                    
                    <section class="col-lg-6">
                        
                        <section class="panel">
                            
                            <section class="symbol gray"><i class="fa fa-shopping-cart"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">{$qtd_vendas}</h1>
                                <p>Vendas</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-6 -->
                    
                    <section class="col-lg-6">
                            
                        <section class="panel">
                            
                            <section class="symbol gray"><i class="fa fa-question-circle"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">{$duvidas_nao_respondidas}</h1>
                                <p>Dúvidas</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-6 -->
                    
                    <section class="col-lg-6">
                    
                        <section class="panel">
                            
                            <header class="panel-heading">


                                <strong>Últimas Vendas</strong>

                                <span class="tools pull-right">

                                    <a href="vendas.html"><i class="fa fa-plus"></i> Todas as Vendas</a>

                                </span>

                            </header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th>#</th>
                                            <th><i class="fa fa-user"></i> Aluno</th>
                                            <th><i class="fa fa-book"></i> Cursos</th>
                                            <th><i class="fa fa-signal"></i> Status</th>
                                            <th><i class="fa fa-calendar"></i> Data</th>
                                            <th><i class="fa fa-shopping-cart"></i> Total do Pedido</th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach item=venda key=k from=$ultimas_vendas}
                                        <tr>
                                            
                                            <td>{$venda.numero}</td>
                                            <td>{$venda.aluno}</td>
                                            <td><a data-toggle="modal" onclick="getCursosByVenda({$venda.id});" href="#visualizarCursos">Visualizar Cursos</a></td>
                                            <td class="td_status_{$venda.id}"><span class="label 
                                                label-{if $venda.status == 1}success
                                                      {elseif $venda.status == 0}info
                                                      {elseif $venda.status == 2}danger{/if}">
                                            <i class="fa fa-check-circle"></i>
                                                       {if $venda.status == 1}Aprovado
                                                      {elseif $venda.status == 0}Aguardando
                                                      {elseif $venda.status == 2}Cancelado{/if}</span></td>
                                            <td>{$venda.data_convertida}</td>
                                            <td>R$ {$venda.valor_total}</td>
                                            
                                        </tr>
                                        {/foreach}
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen --> 
                        
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-6 -->
                    
                    <section class="col-lg-6">
                    
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Últimas Dúvidas</strong></header>
                            
                            <section class="panel-body">

                                {foreach item=duvida from=$duvidas}
                                <article class="media">
                                    
                                    <a class="pull-left thumb p-thumb"><img src="{$url_site}market/uploads/avatar/{$duvida.aluno.avatar}"></a>
                                    
                                    <section class="media-body">
                                        
                                        <strong>{$duvida.aluno.nome} - <small>{$duvida.curso.curso}</small></strong>
                                        <p><i class="fa fa-clock-o"></i> {$duvida.tempo_cadastrado}</p>
                                        <p>{$duvida.mensagem.comentario}</p>
                                    
                                    </section><!-- /media-body -->
                                    
                                </article><!-- /media -->
                                
                                <hr/>
                                {/foreach}
                            
                            </section><!-- /panel-body --> 
                        
                        </section><!-- /panel -->
                    
                    </section><!-- /col-lg-6 -->
                    
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
        <footer class="site-footer">
            
            <section class="text-center">2014 &copy; CursosIAG.<a href="#" class="go-top"><i class="fa fa-angle-up"></i></a></section>
            
        </footer>
        
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
                        <p>Venda: <strong><span id="span_numerovenda">1</span></strong></p>
                        
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
    </script>

{/literal}