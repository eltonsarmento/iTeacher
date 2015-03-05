<script type="text/javascript" src="{$url_site}market/common/market/js/admin/vendas.js"></script>
<script type="text/javascript">
{literal}
jQuery(document).ready(function(){
{/literal}
    carregaDadosVendaPorDia('{$categoria}', '{$data1}', '{$data2}');
    carregaDadosVendaPorMes('{$categoria}', '{$mes}', '{$ano}', 0);
    carregaDadosVendaMaisVendidos('{$categoria}', '{$data1}', '{$data2}');
    carregaDadosVendaTopConsumidores('{$categoria}', '{$mes}', '{$ano}');
    carregaDadosVendaPorAreas('{$categoria}', '{$mes}', '{$ano}', jQuery('.vendas_por_areas_area').val());
    carregaDadosVendaCupons('{$categoria}', '{$data1}', '{$data2}');    
{literal}
});
function getCursosByVenda(id){    
        $.post('{/literal}{$admin_url}{literal}/relatorios/cursosByVenda/'+id, function(json){
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
{/literal}
</script>
        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Relatórios de Vendas</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                    
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading tab-bg-dark-navy-blue">
                                
                                <ul class="nav nav-tabs">
                                    
                                    <li class="active"><a data-toggle="tab" href="#visao-geral">Visão Geral</a></li> 
                                    <li class=""><a data-toggle="tab" href="#vendas-dia">Vendas por Dia</a></li>
                                    <li class=""><a data-toggle="tab" href="#vendas-mes">Vendas por Mês</a></li>
                                    <li class=""><a data-toggle="tab" href="#vendas-curso">Vendas por Curso</a></li>
                                    <li class=""><a data-toggle="tab" href="#cursos-mais-vendidos">Cursos mais Vendidos</a></li>
                                    <li class=""><a data-toggle="tab" href="#top-consumidores">Top Consumidores</a></li>
                                    <li class=""><a data-toggle="tab" href="#vendas-areas">Vendas por Área</a></li>
                                    
                                </ul>
                                
                            </header>
                            
                            <section class="panel-body">
                                
                                <section class="tab-content">
                                    
                                    <section id="visao-geral" class="tab-pane active">
                                    
                                        <section class="row">
                    
                                            <section class="col-lg-3">
                                                
                                                <section class="panel panel-dark">
                                                    
                                                    <header class="panel-heading">Total de Vendas</header>
                                                    
                                                    <section class="panel-body">
                                                        
                                                        <h3 class="text-margin-no text-center">R$ {$total_vendas}</h3>
                                                    
                                                    </section><!-- /panel-body -->
                                                    
                                                </section><!-- /panel -->
                                                
                                                <section class="panel panel-dark">
                                                    
                                                    <header class="panel-heading">Total de Pedidos</header>
                                                    
                                                    <section class="panel-body">
                                                        
                                                        <h3 class="text-margin-no text-center">{$total_pedidos}<strong>({$total_itens_pedidos} Itens)</strong></h3>
                                                    
                                                    </section><!-- /panel-body -->
                                                    
                                                </section><!-- /panel -->
                                                
                                                <section class="panel panel-dark">
                                                    
                                                    <header class="panel-heading">Média Total de Vendas</header>
                                                    
                                                    <section class="panel-body">
                                                        
                                                        <h3 class="text-margin-no text-center">R$ {$media_vendas}</h3>
                                                    
                                                    </section><!-- /panel-body -->
                                                    
                                                </section><!-- /panel -->
                                                
                                                <section class="panel panel-dark">
                                                    
                                                    <header class="panel-heading">Descontos Usados</header>
                                                    
                                                    <section class="panel-body">
                                                        
                                                        <h3 class="text-margin-no text-center">{if $descontos_usados != ''}n/a{else}$descontos_usados{/if}</h3>
                                                    
                                                    </section><!-- /panel-body -->
                                                    
                                                </section><!-- /panel -->
                        
                                            </section><!-- /col-lg-3 -->
                                            
                                            <section class="col-lg-9">
                                                
                                                <section class="panel panel-dark">
                                                    
                                                    <header class="panel-heading">Últimas 10 Vendas</header>
                                                    
                                                    <section id="unseen">
                            
                                                        <table class="table table-striped table-advance table-hover">
                                                            
                                                            <thead>
                                        
                                                                <tr>
                                                                    
                                                                    <th>#</th>
                                                                    <th><i class="fa fa-user"></i> Aluno</th>
                                                                    <th class="hidden-xs"><i class="fa fa-book"></i> Cursos</th>
                                                                    <th class="hidden-xs"><i class="fa fa-signal"></i> Status</th>
                                                                    <th><i class="fa fa-money"></i> Valor</th>
                                                                    <th class="hidden-xs"></th>
                                                                    
                                                                </tr>
                                                                
                                                            </thead>
                                                            
                                                            <tbody>
                                                                
                                                                {foreach item=venda from=$ultimas_10_vendas}
                                                                <tr>
                                                                    
                                                                    <td><a href="{$admin_url}/vendas/detalhes/{$venda.id}">{$venda.numero}</a></td>
                                                                    <td>{$venda.cliente.nome}</td>
                                                                    <td><a data-toggle="modal" onclick="getCursosByVenda({$venda.id});" href="#visualizarCursos">Visualizar Cursos</a></td>
                                                                    <td class="hidden-xs"><span class="label label-{if $venda.status == 1}success{elseif $venda.status == 2}danger{else}info{/if}"><i class="fa fa-check-circle"></i> {if $venda.status == 1}Aprovado{elseif $venda.status == 2}Cancelado{else}Aguardando pagamento{/if}</span></td>
                                                                    <td>R$ {$venda.valor_total|number_format:2}</td>
                                                                    <td class="hidden-xs">
                                                                        
                                                                        <a data-toggle="modal" href="#visualizarHistorico" class="btn btn-success btn-xs tooltips" data-original-title="Histórico" data-placement="bottom"><i class="fa fa-folder"></i></a>
                                                                        
                                                                    </td>
                                                                    
                                                                </tr>
                                                                {/foreach}
                                                            </tbody>
                                                            
                                                        </table>
                                                        
                                                    </section><!-- /unseen -->
                                                    
                                                </section><!-- /panel -->
                        
                                            </section><!-- /col-lg-9 -->
                                            
                                        </section><!-- /row -->
                                        
                                    </section>
                                    
                                    <section id="vendas-dia" class="tab-pane">
                                        
                                        <section class="row">
                                            
                                            <form action="#" class="form-inline">
                                                
                                                <section class="col-lg-3">
                                                    
                                                    <section class="form-group">
    
                                                        <section class="input-group input-large">
                                                            
                                                            <span class="input-group-addon">De</span>
                                                            
                                                            <input type="text" class="form-control dpd1" name="from" data-date-format="dd/mm/yyyy">
                                                            
                                                            <span class="input-group-addon">Até</span>
                                                            
                                                            <input type="text" class="form-control dpd2" name="to" data-date-format="dd/mm/yyyy">
                                                            
                                                        </section><!-- /input-group -->
    
                                                    </section><!-- /form-group -->
                                                    
                                                </section><!-- /col-lg-3 --> 
                                                
                                                <section class="col-lg-9">
                                                    
                                                    <section class="form-group">
                                                    
                                                        <button class="btn btn-success" onclick="javascript:carregaDadosVendaPorDia('{$categoria}', jQuery('.dpd1').val(), jQuery('.dpd2').val()); return false;"type="submit"><i class="fa fa-check-circle"></i> Filtrar</button>

                                                    </section><!-- /form-group -->
                                                    
                                                </section><!-- /col-lg-9 --> 
                                                    
                                            </form>

                                        </section><!-- /row -->
                                        
                                        <br/>
                                        
                                        <section class="row">
                    
                                            <section class="col-lg-3">
                                                
                                                <section class="panel panel-dark">
                                                    
                                                    <header class="panel-heading">Total de Vendas</header>
                                                    
                                                    <section class="panel-body">
                                                        
                                                        <h3 class="text-margin-no text-center" id="total_vendas_dia">R$ 00,00</h3>
                                                    
                                                    </section><!-- /panel-body -->
                                                    
                                                </section><!-- /panel -->
                                                
                                                <section class="panel panel-dark">
                                                    
                                                    <header class="panel-heading">Total de Pedidos</header>
                                                    
                                                    <section class="panel-body">
                                                        
                                                        <h3 class="text-margin-no text-center" id="total_pedidos_dia">0<strong>(0 itens)</strong></h3>
                                                    
                                                    </section><!-- /panel-body -->
                                                    
                                                </section><!-- /panel -->
                        
                                            </section><!-- /col-lg-3 -->
                                            
                                            <section class="col-lg-9">
                                                
                                                <section class="panel panel-dark">
                                                    
                                                    <header class="panel-heading">Todas as Vendas | <strong id="dia_vendas_ate"></strong></header>
                                                    
                                                    <section id="unseen">
                            
                                                        <table class="table table-striped table-advance table-hover">
                                                            
                                                            <thead>
                                        
                                                                <tr>
                                                                    
                                                                    <th>#</th>
                                                                    <th><i class="fa fa-user"></i> Aluno</th>
                                                                    <th class="hidden-xs"><i class="fa fa-book"></i> Cursos</th>
                                                                    <th class="hidden-xs"><i class="fa fa-signal"></i> Status</th>
                                                                    <th><i class="fa fa-money"></i> Valor</th>
                                                                    <th class="hidden-xs"></th>
                                                                    
                                                                </tr>
                                                                
                                                            </thead>
                                                            
                                                            <tbody id="tabela_vendas_dia">
                                                            </tbody>
                                                            
                                                        </table>
                                                        
                                                    </section><!-- /unseen -->
                                                    
                                                </section><!-- /panel -->
                        
                                            </section><!-- /col-lg-9 -->
                                            
                                        </section><!-- /row -->
                                        
                                    </section>
                                    
                                    <section id="vendas-mes" class="tab-pane">
                                        
                                        <section class="row">
                                            
                                            <form action="#" class="form-inline">
                                                
                                                <section class="col-lg-4">
                                                    
                                                    <section class="form-group">
    
                                                        <section class="input-group input-large">
                                                            
                                                            <span class="input-group-addon">Ano</span>
                                                            
                                                            <select name="vendas_por_mes_ano" id="vendas_por_mes_ano" class="form-control vendas_por_mes_ano">
                                                                
                                                               <option selected>Selecione o Ano</option>
                                                                {php}
                                                                    for($i = 2013; $i <= date('Y'); $i++) {
                                                                    echo '<option>'.$i.'</option>';
                                                                    }
                                                                {/php}
                                                            
                                                            </select>
                                                            
                                                            <span class="input-group-addon">Mês</span>
                                                            
                                                            <select name="vendas_por_mes_mes" id="vendas_por_mes_mes" class="form-control vendas_por_mes_mes">
                                                                <option selected>Selecione o Mês</option>
                                                                {php}
                                                                    for($i = 1; $i <= 12; $i++) {
                                                                        echo '<option>'.(($i < 10) ? '0' : '').$i.'</option>';
                                                                    }
                                                                {/php}
                                                            </select>
                                                        </section><!-- /input-group -->
    
                                                    </section><!-- /form-group -->
                                                    
                                                </section><!-- /col-lg-3 --> 
                                                
                                                <section class="col-lg-">
                                                    
                                                    <section class="form-group">
                                                    
                                                        <button class="btn btn-success" type="submit" onclick="javascript:carregaDadosVendaPorMes('{$categoria}', jQuery('.vendas_por_mes_mes').val(), jQuery('.vendas_por_mes_ano').val()); return false;"><i class="fa fa-check-circle"></i> Filtrar</button>

                                                    </section><!-- /form-group -->
                                                    
                                                </section><!-- /col-lg-9 --> 
                                                    
                                            </form>

                                        </section><!-- /row -->
                                        
                                        <br/>
                                        
                                        <section class="row">
                                            
                                            <section class="col-lg-12">
                                                
                                                <section class="panel panel-dark">
                                                    
                                                    <header class="panel-heading" id="">Todas as Vendas | <strong id="ano_vendas_ate"></strong></header>
                                                    
                                                    <section id="unseen">
                            
                                                        <table class="table table-striped table-advance table-hover">
                                                            
                                                            <thead>
                                        
                                                                <tr>
                                                                    
                                                                    <th>#</th>
                                                                    <th><i class="fa fa-user"></i> Aluno</th>
                                                                    <th class="hidden-xs"><i class="fa fa-book"></i> Cursos</th>
                                                                    <th class="hidden-xs"><i class="fa fa-signal"></i> Status</th>
                                                                    <th><i class="fa fa-money"></i> Valor</th>
                                                                    <th class="hidden-xs"></th>
                                                                    
                                                                </tr>
                                                                
                                                            </thead>
                                                            
                                                            <tbody id="tabela_vendas_mes">                                                                                                                            
                                                            </tbody>
                                                            
                                                        </table>
                                                        
                                                    </section><!-- /unseen -->
                                                    
                                                </section><!-- /panel -->
                        
                                            </section><!-- /col-lg-12 -->
                                        
                                        </section><!-- /row -->
                                        
                                    </section>
                                    
                                    <section id="vendas-curso" class="tab-pane">
                                        
                                        <section class="row">
                                            
                                            <form action="#" class="form-inline">
                                                
                                                <section class="col-lg-5">
                                                    
                                                    <section class="form-group">
                                                        
                                                        <section class="input-group input-large">
                                                            
                                                            <span class="input-group-addon">Curso</span>
                                                            
                                                            <select name="vendas_por_produto_curso_id" id="vendas_por_produto_curso_id" class="selectize vendas_por_produto_curso_id" placeholder="Selecione o Curso">            
                                                                <option value="" selectd>Selecione o Curso</option> 
                                                                  {foreach item=curso from=$cursos}
                                                                    <option value="{$curso.id}">{$curso.curso}</option>
                                                                  {/foreach}                                                                        
                                                            </select>
                                                            
                                                        </section><!-- /input-group -->
    
                                                    </section><!-- /form-group -->
                                                    
                                                </section><!-- /col-lg-5 --> 
                                                
                                                <section class="col-lg-7">
                                                    
                                                    <section class="form-group">
                                                    
                                                        <button class="btn btn-success" type="submit" onclick="javascript:carregaDadosVendaPorProdutos('{$categoria}', jQuery('.vendas_por_produto_curso_id').val()); return false;"><i class="fa fa-check-circle"></i> Filtrar</button>

                                                    </section><!-- /form-group -->
                                                    
                                                </section><!-- /col-lg-7 --> 
                                                    
                                            </form>

                                        </section><!-- /row -->
                                        
                                        <br/>
                                        
                                        <section class="row">
                                            
                                            <section class="col-lg-6">
                                                
                                                <section class="panel panel-dark">
                                                    
                                                    <header class="panel-heading">Total de Vendas | <strong class="vendas_por_curso" ></strong></header>
                                                    
                                                    <section class="panel-body">
                                                        
                                                        <h3 class="text-margin-no" id="total_vendas_por_curso"></h3>
                                                    
                                                    </section><!-- /panel-body -->
                                                    
                                                </section><!-- /panel -->
                        
                                            </section><!-- /col-lg-6 -->
                                            
                                            <section class="col-lg-6">
                                                
                                                <section class="panel panel-dark">
                                                    
                                                    <header class="panel-heading">Valor Total de Vendas | <strong class="vendas_por_curso"></strong></header>
                                                    
                                                    <section class="panel-body" >
                                                        
                                                        <h3 class="text-margin-no" id="valor_total_venda_curso"></h3>
                                                    
                                                    </section><!-- /panel-body -->
                                                    
                                                </section><!-- /panel -->
                        
                                            </section><!-- /col-lg-6 -->
                                            
                                            <section class="col-lg-12">
                                                
                                                <section class="panel panel-dark">
                                                    
                                                    <header class="panel-heading">Todas as Vendas | <strong class="vendas_por_curso"></strong></header>
                                                    
                                                    <section id="unseen">
                            
                                                        <table class="table table-striped table-advance table-hover">
                                                            
                                                            <thead>
                                        
                                                                <tr>
                                                                    
                                                                    <th><i class="fa fa-calendar"></i> Mês</th>
                                                                    <th><i class="fa fa-archive"></i> Quantidade</th>
                                                                    <th><i class="fa fa-money"></i> Valor</th>
                                                                    
                                                                </tr>
                                                                
                                                            </thead>
                                                            
                                                            <tbody id="tabela_vendas_por_produtos">                                                                
                                                                
                                                            </tbody>
                                                            
                                                        </table>
                                                        
                                                    </section><!-- /unseen -->
                                                    
                                                </section><!-- /panel -->
                        
                                            </section><!-- /col-lg-12 -->
                                        
                                        </section><!-- /row -->
                                        
                                    </section>
                                    
                                    <section id="cursos-mais-vendidos" class="tab-pane">
                                        
                                        <section class="row">
                                            
                                            <form action="#" class="form-inline">
                                                
                                                <section class="col-lg-3">
                                                    
                                                    <section class="form-group">
    
                                                        <section class="input-group input-large">
                                                            
                                                            <span class="input-group-addon">De</span>
                                                            
                                                            <input type="text" class="form-control dpd1 venda_mais_vendido_data1" name="from" data-date-format="dd/mm/yyyy">
                                                            
                                                            <span class="input-group-addon">Até</span>
                                                            
                                                            <input type="text" class="form-control dpd2 venda_mais_vendido_data2" name="to" data-date-format="dd/mm/yyyy">
                                                            
                                                        </section><!-- /input-group -->
    
                                                    </section><!-- /form-group -->
                                                    
                                                </section><!-- /col-lg-3 --> 
                                                
                                                <section class="col-lg-9">
                                                    
                                                    <section class="form-group">
                                                    
                                                        <button class="btn btn-success" type="submit" onclick="javascript:carregaDadosVendaMaisVendidos('{$categoria}', jQuery('.venda_mais_vendido_data1').val(), jQuery('.venda_mais_vendido_data2').val()); return false;" ><i class="fa fa-check-circle"></i> Filtrar</button>

                                                    </section><!-- /form-group -->
                                                    
                                                </section><!-- /col-lg-9 --> 
                                                    
                                            </form>

                                        </section><!-- /row -->
                                        
                                        <br/>
                                        
                                        <section class="row">
                                            
                                            <section class="col-lg-12">
                                                
                                                <section class="panel panel-dark">
                                                    
                                                    <header class="panel-heading">Todas as Vendas | <strong class="dataMaisVendidos"></strong></header>
                                                    
                                                    <section id="unseen">
                            
                                                        <table class="table table-striped table-advance table-hover">
                                                            
                                                            <thead>
                                        
                                                                <tr>
                                                                    
                                                                    <th><i class="fa fa-book"></i> Curso</th>
                                                                    <th><i class="fa fa-archive"></i> Quantidade</th>
                                                                    <th><i class="fa fa-money"></i> Valor</th>
                                                                    
                                                                </tr>
                                                                
                                                            </thead>
                                                            
                                                            <tbody id="tabela_vendas_por_mais_vendidos">                                                                
                                                            </tbody>
                                                            
                                                        </table>
                                                        
                                                    </section><!-- /unseen -->
                                                    
                                                </section><!-- /panel -->
                        
                                            </section><!-- /col-lg-12 -->
                                        
                                        </section><!-- /row -->
                                    
                                    </section>
                                    
                                    <section id="top-consumidores" class="tab-pane">
                                        
                                        <section class="row">
                                            
                                            <form action="#" class="form-inline">
                                                
                                                <section class="col-lg-3">
                                                    
                                                    <section class="form-group">
    
                                                        <section class="input-group input-large">
                                                            
                                                            <span class="input-group-addon">Ano</span>
                                                            
                                                            <select  name="vendas_top_consumidores_ano" id="vendas_top_consumidores_ano" class="form-control vendas_top_consumidores_ano">
                                                                
                                                            <option selected>Selecione o Ano</option>
                                                                {php}
                                                                for($i = 2013; $i <= date('Y'); $i++) {
                                                                    echo '<option>'.$i.'</option>';
                                                                }
                                                                {/php}
                                                            </select>
                                                            
                                                            <span class="input-group-addon">Mês</span>                                                            
                                                            <select name="vendas_top_consumidores_mes" id="vendas_top_consumidores_mes" class="form-control vendas_top_consumidores_mes">
                                                                <option selected>Selecione o Mês</option>
                                                                {php}
                                                                for($i = 1; $i <= 12; $i++) {
                                                                    echo '<option>'.(($i < 10) ? '0' : '').$i.'</option>';
                                                                }
                                                                {/php}
                                                            </select>
                                                        </section><!-- /input-group -->
    
                                                    </section><!-- /form-group -->
                                                    
                                                </section><!-- /col-lg-3 --> 
                                                
                                                <section class="col-lg-9">
                                                    
                                                    <section class="form-group">
                                                    
                                                        <button class="btn btn-success" type="submit" onclick="javascript:carregaDadosVendaTopConsumidores('{$categoria}', jQuery('.vendas_top_consumidores_mes').val(), jQuery('.vendas_top_consumidores_ano').val()); return false;"><i class="fa fa-check-circle"></i> Filtrar</button>

                                                    </section><!-- /form-group -->
                                                    
                                                </section><!-- /col-lg-9 --> 
                                                    
                                            </form>

                                        </section><!-- /row -->
                                        
                                        <br/>
                                        
                                        <section class="row">
                                            
                                            <section class="col-lg-12">
                                                
                                                <section class="panel panel-dark">
                                                    
                                                    <header class="panel-heading">Todas as Vendas | <strong class="dataTopVendas"></strong></header>
                                                    
                                                    <section id="unseen">
                            
                                                        <table class="table table-striped table-advance table-hover">
                                                            
                                                            <thead>
                                        
                                                                <tr>
                                                                    
                                                                    <th><i class="fa fa-user"></i> Aluno</th>
                                                                    <th><i class="fa fa-shopping-cart"></i> Compras</th>
                                                                    <th><i class="fa fa-book"></i> Cursos</th>
                                                                    <th><i class="fa fa-money"></i> Valor</th>
                                                                    
                                                                </tr>
                                                                
                                                            </thead>
                                                            
                                                            <tbody id="tabela_vendas_top_consumidores">
                                                                                                                                                                                            
                                                            </tbody>
                                                            
                                                        </table>
                                                        
                                                    </section><!-- /unseen -->
                                                    
                                                </section><!-- /panel -->
                        
                                            </section><!-- /col-lg-12 -->
                                        
                                        </section><!-- /row -->
                                    
                                    </section>
                                    
                                    <section id="vendas-areas" class="tab-pane">
                                        
                                        <section class="row">
                                            
                                            <form action="#" class="form-inline">
                                                
                                                <section class="col-lg-5">
                                                    
                                                    <section class="form-group">
    
                                                        <section class="input-group input-large">
                                                            
                                                            <span class="input-group-addon">Ano</span>
                                                            
                                                            <select class="form-control venda_por_area_ano">
                                                                <option selected>Selecione o Ano</option>
                                                                {php}
                                                                for($i = 2013; $i <= date('Y'); $i++) {
                                                                    echo '<option>'.$i.'</option>';
                                                                }
                                                                {/php}
                                                            
                                                            </select>
                                                            
                                                            <span class="input-group-addon">Mês</span>
                                                            
                                                            <select class="form-control venda_por_area_mes">
                                                                <option selected>Selecione o Mês</option>
                                                                {php}
                                                                for($i = 1; $i <= 12; $i++) {
                                                                    echo '<option>'.(($i < 10) ? '0' : '').$i.'</option>';
                                                                }
                                                                {/php}                                                        
                                                            
                                                            </select>
                                                            
                                                            <span class="input-group-addon">Área</span>
                                                            
                                                            <select class="form-control selectize venda_por_area_area">
                                                                <option value="">Selecione uma Área</option>    
                                                                {foreach item=area from=$areas}
                                                                    <option value="{$area.id}">{$area.area}</option>
                                                                {/foreach }
                                                                
                                                                
                                                                        
                                                            </select>
                                                            
                                                        </section><!-- /input-group -->
    
                                                    </section><!-- /form-group -->
                                                    
                                                </section><!-- /col-lg-3 --> 
                                                
                                                <section class="col-lg-7">
                                                    
                                                    <section class="form-group">
                                                    
                                                        <button class="btn btn-success" type="submit" onclick="javascript:carregaDadosVendaPorAreas('{$categoria}', jQuery('.venda_por_area_mes').val(), jQuery('.venda_por_area_ano').val(), jQuery('.venda_por_area_area').val()); return false;"><i class="fa fa-check-circle"></i> Filtrar</button>

                                                    </section><!-- /form-group -->
                                                    
                                                </section><!-- /col-lg-9 --> 
                                                    
                                            </form>

                                        </section><!-- /row -->
                                        
                                        <br/>
                                        
                                        <section class="row">
                                            
                                            <section class="col-lg-12">
                                                
                                                <section class="panel panel-dark">
                                                    
                                                    <header class="panel-heading">Todas as Vendas | <strong id="area_venda"></strong></header>
                                                    
                                                    <section id="unseen">
                            
                                                        <table class="table table-striped table-advance table-hover">
                                                            
                                                            <thead>
                                        
                                                                <tr>
                                                                    
                                                                    <th>#</th>
                                                                    <th><i class="fa fa-user"></i> Aluno</th>
                                                                    <th><i class="fa fa-book"></i> Cursos</th>
                                                                    <th><i class="fa fa-money"></i> Valor</th>
                                                                    
                                                                </tr>
                                                                
                                                            </thead>
                                                            
                                                            <tbody id="tabela_vendas_por_categorias">
                                                                                                                                
                                                            </tbody>
                                                            
                                                        </table>
                                                        
                                                    </section><!-- /unseen -->
                                                    
                                                </section><!-- /panel -->
                        
                                            </section><!-- /col-lg-12 -->
                                        
                                        </section><!-- /row -->
                                    
                                    </section>
                                    
                                </section><!-- /tab-content -->
                            
                            </section><!-- /panel-body -->
                        
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-12 -->
                    
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
        
        <!-- Modal Visualizar Histórico -->
        
        <section class="modal fade modal-primary" id="visualizarHistorico" tabindex="-1" role="dialog" aria-labelledby="visualizarHistorico" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Visualizar Histórico</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <h4>Adriano Gianini - <small>adriano@cursosiag.com.br</small></h4>
                        
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
                                
                                <tbody>
                                    
                                    <tr>
                                        
                                        <td><a href="vendas-detalhes.html">1</a></td>
                                        <td>Curso de Web Design</td>
                                        <td><span class="label label-success"><i class="fa fa-check-circle"></i> Aprovado</span></td>
                                        <td>14/03/2014</td>
                                        <td>R$ 300,00</td>
                                        
                                    </tr>
                                    
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

    