<section id="main-content">
          
            <section class="wrapper site-min-height">

                <section class="row state-overview">
                    
                    <section class="col-lg-12">
                    
                        <section class="border-head"><h3>Resumo de Estatísticas</h3></section>
                        
                    </section><!-- /col-lg-12 -->
                    
                    <section class="col-lg-6">
                            
                        <section class="panel">
                            
                            <section class="symbol gray"><i class="fa fa-book"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">{$cursos}</h1>
                                <p>Cursos</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-6 -->
                    
                    <section class="col-lg-6">
                            
                        <section class="panel">
                            
                            <section class="symbol gray"><i class="fa fa-question-circle"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">{$duvidas_topo.total}</h1>
                                <p>Dúvidas</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-6 -->
                    
                    <section class="col-lg-3">
                    
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Curso Atual</strong></header>
                            
                            <section class="panel-body">
                            
                                <section class="thumbnail">
                                    {if $ultimo_curso.curso}
                                    <img src="{$url_site}market/uploads/cursos/{$ultimo_curso.destaque_arquivo}" class="img-responsive img-thumbnail" alt="{$ultimo_curso.curso}">
                                    {else}
                                    {/if}
                                    <section class="caption">
                                        
                                        <section class="caption-title">
                                        
                                            <h4>{if $ultimo_curso.curso} {$ultimo_curso.curso} {else} Você ainda não contém cursos. {/if}</h4>
                                            
                                        </section><!-- /caption-title -->
                                        
                                        <section class="info-course">
                                            
                                            <p><i class="fa fa-laptop"></i> Aulas: <strong>{$ultimo_curso.qtd_aulas}</strong></p>
                                            
                                            <p><i class="fa fa-calendar"></i> Disponível até: <strong class="text-danger">{$ultimo_curso.expira|date_format:"%d/%m/%Y"}</strong></p>
                                        
                                        </section><!-- /info-course -->
                                            
                                        <p class="times-course"><i class="fa fa-clock-o"></i> Último Acesso: <strong> {if $ultimo_curso.ultimo_acesso}{$ultimo_curso.ultimo_acesso|date_format:"%d/%m/%Y"}{else}N/a{/if}</strong></p>
                                        
                                        <section class="percentual-course">
                                            
                                            <section class="progress">
                                            
                                                <section class="progress-bar progress-bar-info"  role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: {$ultimo_curso.porcentagem}%">
                                                    
                                                    <span>{$ultimo_curso.porcentagem}% Concluído</span>
                                                    
                                                </section>
                                                
                                            </section>
                                        
                                        </section><!-- /percentual-course -->
                                        
                                        <p class="last-class"><i class="fa fa-laptop"></i> Última Aula: <strong class="text-danger">{$ultimo_curso.ultima_aula}</strong></p>
                                        
                                        <section class="caption-buttons">
                                            
                                        <p>
                                            {if $ultimo_curso.ultimo_acesso}
                                                <a href="{$admin_url}/cursos/verCurso/{$ultimo_curso.id_relacionamento}" class="btn btn-warning btn-block" role="button"><i class="fa fa-refresh"></i> Retomar Curso</a>
                                            {else}
                                                <a href="{$admin_url}/cursos/verCurso/{$ultimo_curso.id_relacionamento}" class="btn btn-success btn-block" role="button"><i class="fa fa-share"></i> Iniciar Curso</a>
                                            {/if}
                                                    
                                        </p>
                                            
                                        </section><!-- /caption-buttons -->
                                        
                                    </section><!-- /caption -->
                                    
                                </section><!-- /thumbnail --> 
                                
                            </section><!-- /panel-body --> 
                        
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-3 -->
                    
                    <section class="col-lg-9">
                    
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Últimos Pedidos</strong></header>
                            
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
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach item=venda key=k from=$vendas}
                                        <tr>
                                            
                                            <td><a href="{$admin_url}/vendas/detalhes/{$venda.id}">{$venda.numero}</a></td>
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
                                            <td>{$venda.data_convertida}</td>
                                            <td>R$ {$venda.valor_total}</td>
                                            <td>R$ {$venda.valor_liquido}</td>
                                            
                                        </tr>
                                        {foreachelse}
                                        <tr><td colspan="100">Não contém vendas</td></tr>
                                        {/foreach}
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen --> 
                        
                        </section><!-- /panel -->
                    
                    </section><!-- /col-lg-9 -->
                    
                    <section class="col-lg-9">
                    
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Últimas Dúvidas</strong></header>
                            
                            <section class="panel-body">
                                {foreach from=$ultimas_duvidas item=duvida}
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
                    
                    </section><!-- /col-lg-9 -->
                    
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

    

           
    </script>

{/literal}   