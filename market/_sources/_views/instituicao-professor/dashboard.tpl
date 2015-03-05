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
                                
                                <h1 class="count">{$vendas}</h1>
                                <p>Vendas</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-6 -->
                    
                    <section class="col-lg-6">
                            
                        <section class="panel">
                            
                            <section class="symbol gray"><i class="fa fa-question-circle"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">{$duvidas}</h1>
                                <p>Dúvidas</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-6 -->
                    
                    <section class="col-lg-6">
                    
                        <section class="panel">
                            
                            <header class="panel-heading">


                                <strong>Últimas Vendas</strong>

                                <span class="tools pull-right">

                                    <a href="{$admin_url}/vendas/listar"><i class="fa fa-plus"></i> Todas as Vendas</a>

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
                                        {foreach from=$ultimas_vendas item=vendas}
                                        <tr>
                                            
                                            <td>1</td>
                                            <td>{$vendas.aluno}</td>
                                            <td><a data-toggle="modal" onclick="getCursosByVenda({$vendas.id});" href="#visualizarCursos">Visualizar Cursos</a></td>
                                            <td><span class="label label-label label-{if $vendas.status == 1}success{elseif $vendas.status == 0}info{elseif $vendas.status == 2}danger{/if}"><i class="fa fa-check-circle"></i> {if $vendas.status == 1}Aprovado{elseif $vendas.status == 0}Aguardando{elseif $vendas.status == 2}Cancelada{/if}</span></td>
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
                    
                    <section class="col-lg-6">
                    
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Últimas Dúvidas</strong></header>
                            
                            <section class="panel-body">
                                {foreach from=$ultimas_duvidas key=key item=duvida}
                                <article class="media">
                                    
                                    <a class="pull-left thumb p-thumb"><img src="{$url_site}market/uploads/avatar/{$duvida.aluno.avatar}"></a>
                                    
                                    <section class="media-body">
                                        <strong>{$duvida.aluno.nome} - <small>{$duvida.curso.curso}</small></strong>
                                        <p><i class="fa fa-clock-o"></i> {$duvida.tempo_cadastrado}</p>
                                        <p>{$duvida.comentario}</p>
                                    </section><!-- /media-body -->
                                    
                                </article><!-- /media -->
                                
                                <hr/>
                                {foreachelse}

                                {/foreach}                                    
                               
                            </section><!-- /panel-body --> 
                        
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
                if(this.curso){
                    tabela = tabela + "<tr><td>"+this.curso+"</td></tr>";    
                }else{
                    tabela = tabela + "<tr><td>Esta venda não contém cursos ministrados por você.</td></tr>";    
                }
                
            });
            $('#tbody_cursos').html(tabela);
            $('#span_dadosaluno').html('<h4>'+dados[0].aluno['nome'] +'- <small>'+dados[0].aluno['email']+'</small></h4>');
            $('#span_numerovenda').html(dados[0].numero_venda['numero']);

        });
    }

    
           
    </script>

{/literal}
