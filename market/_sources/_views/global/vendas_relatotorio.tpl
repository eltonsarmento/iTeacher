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
                                                        
                                                        <h3 class="text-margin-no text-center">R$ 200,00</h3>
                                                    
                                                    </section><!-- /panel-body -->
                                                    
                                                </section><!-- /panel -->
                                                
                                                <section class="panel panel-dark">
                                                    
                                                    <header class="panel-heading">Total de Pedidos</header>
                                                    
                                                    <section class="panel-body">
                                                        
                                                        <h3 class="text-margin-no text-center">2<strong>(5 itens)</strong></h3>
                                                    
                                                    </section><!-- /panel-body -->
                                                    
                                                </section><!-- /panel -->
                                                
                                                <section class="panel panel-dark">
                                                    
                                                    <header class="panel-heading">Média Total de Vendas</header>
                                                    
                                                    <section class="panel-body">
                                                        
                                                        <h3 class="text-margin-no text-center">R$ 100,00</h3>
                                                    
                                                    </section><!-- /panel-body -->
                                                    
                                                </section><!-- /panel -->
                                                
                                                <section class="panel panel-dark">
                                                    
                                                    <header class="panel-heading">Descontos Usados</header>
                                                    
                                                    <section class="panel-body">
                                                        
                                                        <h3 class="text-margin-no text-center">n/a</h3>
                                                    
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
                                                                
                                                                <tr>
                                                                    
                                                                    <td><a href="vendas-detalhes.html">1</a></td>
                                                                    <td>Adriano Gianini</td>
                                                                    <td><a data-toggle="modal" href="#visualizarCursos">Visualizar Cursos</a></td>
                                                                    <td class="hidden-xs"><span class="label label-success"><i class="fa fa-check-circle"></i> Aprovado</span></td>
                                                                    <td>R$ 300,00</td>
                                                                    <td class="hidden-xs">
                                                                        
                                                                        <a data-toggle="modal" href="#visualizarHistorico" class="btn btn-success btn-xs tooltips" data-original-title="Histórico" data-placement="bottom"><i class="fa fa-folder"></i></a>
                                                                        
                                                                    </td>
                                                                    
                                                                </tr>
                                                                
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
                                                    
                                                        <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Filtrar</button>

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
                                                        
                                                        <h3 class="text-margin-no text-center">R$ 200,00</h3>
                                                    
                                                    </section><!-- /panel-body -->
                                                    
                                                </section><!-- /panel -->
                                                
                                                <section class="panel panel-dark">
                                                    
                                                    <header class="panel-heading">Total de Pedidos</header>
                                                    
                                                    <section class="panel-body">
                                                        
                                                        <h3 class="text-margin-no text-center">2<strong>(5 itens)</strong></h3>
                                                    
                                                    </section><!-- /panel-body -->
                                                    
                                                </section><!-- /panel -->
                        
                                            </section><!-- /col-lg-3 -->
                                            
                                            <section class="col-lg-9">
                                                
                                                <section class="panel panel-dark">
                                                    
                                                    <header class="panel-heading">Todas as Vendas | <strong>19/01/2014 - 19/03/2014</strong></header>
                                                    
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
                                                                
                                                                <tr>
                                                                    
                                                                    <td><a href="vendas-detalhes.html">1</a></td>
                                                                    <td>Adriano Gianini</td>
                                                                    <td><a data-toggle="modal" href="#visualizarCursos">Visualizar Cursos</a></td>
                                                                    <td class="hidden-xs"><span class="label label-success"><i class="fa fa-check-circle"></i> Aprovado</span></td>
                                                                    <td>R$ 300,00</td>
                                                                    <td class="hidden-xs">
                                                                        
                                                                        <a data-toggle="modal" href="#visualizarHistorico" class="btn btn-success btn-xs tooltips" data-original-title="Histórico" data-placement="bottom"><i class="fa fa-folder"></i></a>
                                                                        
                                                                    </td>
                                                                    
                                                                </tr>
                                                                
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
                                                
                                                <section class="col-lg-3">
                                                    
                                                    <section class="form-group">
    
                                                        <section class="input-group input-large">
                                                            
                                                            <span class="input-group-addon">Ano</span>
                                                            
                                                            <select class="form-control">
                                                                
                                                                <option>2014</option>
                                                            
                                                            </select>
                                                            
                                                            <span class="input-group-addon">Mês</span>
                                                            
                                                            <select class="form-control">
                                                                
                                                                <option>01</option>
                                                                <option>02</option>
                                                                <option selected>03</option>
                                                                <option>04</option>
                                                                <option>05</option>
                                                                <option>06</option>
                                                                <option>07</option>
                                                                <option>08</option>
                                                                <option>09</option>
                                                                <option>10</option>
                                                                <option>11</option>
                                                                <option>12</option>
                                                            
                                                            </select>
                                                            
                                                        </section><!-- /input-group -->
    
                                                    </section><!-- /form-group -->
                                                    
                                                </section><!-- /col-lg-3 --> 
                                                
                                                <section class="col-lg-9">
                                                    
                                                    <section class="form-group">
                                                    
                                                        <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Filtrar</button>

                                                    </section><!-- /form-group -->
                                                    
                                                </section><!-- /col-lg-9 --> 
                                                    
                                            </form>

                                        </section><!-- /row -->
                                        
                                        <br/>
                                        
                                        <section class="row">
                                            
                                            <section class="col-lg-12">
                                                
                                                <section class="panel panel-dark">
                                                    
                                                    <header class="panel-heading">Todas as Vendas | <strong>03/2014</strong></header>
                                                    
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
                                                                
                                                                <tr>
                                                                    
                                                                    <td><a href="vendas-detalhes.html">1</a></td>
                                                                    <td>Adriano Gianini</td>
                                                                    <td><a data-toggle="modal" href="#visualizarCursos">Visualizar Cursos</a></td>
                                                                    <td class="hidden-xs"><span class="label label-success"><i class="fa fa-check-circle"></i> Aprovado</span></td>
                                                                    <td>R$ 300,00</td>
                                                                    <td class="hidden-xs">
                                                                        
                                                                        <a data-toggle="modal" href="#visualizarHistorico" class="btn btn-success btn-xs tooltips" data-original-title="Histórico" data-placement="bottom"><i class="fa fa-folder"></i></a>
                                                                        
                                                                    </td>
                                                                    
                                                                </tr>
                                                                
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
                                                            
                                                            <select class="selectize" placeholder="Selecione o Curso">
                    
                                                                <option value="">Selecione o Curso</option>
                                                                <option value="Curso de Web Design">Curso de Web Design</option>
                                                                <option value="Curso de Programação">Curso de Programação</option>
                                                                        
                                                            </select>
                                                            
                                                        </section><!-- /input-group -->
    
                                                    </section><!-- /form-group -->
                                                    
                                                </section><!-- /col-lg-5 --> 
                                                
                                                <section class="col-lg-7">
                                                    
                                                    <section class="form-group">
                                                    
                                                        <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Filtrar</button>

                                                    </section><!-- /form-group -->
                                                    
                                                </section><!-- /col-lg-7 --> 
                                                    
                                            </form>

                                        </section><!-- /row -->
                                        
                                        <br/>
                                        
                                        <section class="row">
                                            
                                            <section class="col-lg-6">
                                                
                                                <section class="panel panel-dark">
                                                    
                                                    <header class="panel-heading">Total de Vendas | <strong>Curso de Web Design</strong></header>
                                                    
                                                    <section class="panel-body">
                                                        
                                                        <h3 class="text-margin-no">300</h3>
                                                    
                                                    </section><!-- /panel-body -->
                                                    
                                                </section><!-- /panel -->
                        
                                            </section><!-- /col-lg-6 -->
                                            
                                            <section class="col-lg-6">
                                                
                                                <section class="panel panel-dark">
                                                    
                                                    <header class="panel-heading">Valor Total de Vendas | <strong>Curso de Web Design</strong></header>
                                                    
                                                    <section class="panel-body">
                                                        
                                                        <h3 class="text-margin-no">R$ 300,00</h3>
                                                    
                                                    </section><!-- /panel-body -->
                                                    
                                                </section><!-- /panel -->
                        
                                            </section><!-- /col-lg-6 -->
                                            
                                            <section class="col-lg-12">
                                                
                                                <section class="panel panel-dark">
                                                    
                                                    <header class="panel-heading">Todas as Vendas | <strong>Curso de Web Design</strong></header>
                                                    
                                                    <section id="unseen">
                            
                                                        <table class="table table-striped table-advance table-hover">
                                                            
                                                            <thead>
                                        
                                                                <tr>
                                                                    
                                                                    <th><i class="fa fa-calendar"></i> Mês</th>
                                                                    <th><i class="fa fa-archive"></i> Quantidade</th>
                                                                    <th><i class="fa fa-money"></i> Valor</th>
                                                                    
                                                                </tr>
                                                                
                                                            </thead>
                                                            
                                                            <tbody>
                                                                
                                                                <tr>
                                                                    
                                                                    <td>01</td>
                                                                    <td>30</td>
                                                                    <td>R$ 300,00</td>
                                                                    
                                                                </tr>
                                                                
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
                                                            
                                                            <input type="text" class="form-control dpd1" name="from" data-date-format="dd/mm/yyyy">
                                                            
                                                            <span class="input-group-addon">Até</span>
                                                            
                                                            <input type="text" class="form-control dpd2" name="to" data-date-format="dd/mm/yyyy">
                                                            
                                                        </section><!-- /input-group -->
    
                                                    </section><!-- /form-group -->
                                                    
                                                </section><!-- /col-lg-3 --> 
                                                
                                                <section class="col-lg-9">
                                                    
                                                    <section class="form-group">
                                                    
                                                        <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Filtrar</button>

                                                    </section><!-- /form-group -->
                                                    
                                                </section><!-- /col-lg-9 --> 
                                                    
                                            </form>

                                        </section><!-- /row -->
                                        
                                        <br/>
                                        
                                        <section class="row">
                                            
                                            <section class="col-lg-12">
                                                
                                                <section class="panel panel-dark">
                                                    
                                                    <header class="panel-heading">Todas as Vendas | <strong>19/01/2014 - 19/03/2014</strong></header>
                                                    
                                                    <section id="unseen">
                            
                                                        <table class="table table-striped table-advance table-hover">
                                                            
                                                            <thead>
                                        
                                                                <tr>
                                                                    
                                                                    <th><i class="fa fa-book"></i> Curso</th>
                                                                    <th><i class="fa fa-archive"></i> Quantidade</th>
                                                                    <th><i class="fa fa-money"></i> Valor</th>
                                                                    
                                                                </tr>
                                                                
                                                            </thead>
                                                            
                                                            <tbody>
                                                                
                                                                <tr>
                                                                    
                                                                    <td>Curso de Web Design</td>
                                                                    <td>30</td>
                                                                    <td>R$ 9.000,00</td>
                                                                    
                                                                </tr>
                                                                
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
                                                            
                                                            <select class="form-control">
                                                                
                                                                <option>2014</option>
                                                            
                                                            </select>
                                                            
                                                            <span class="input-group-addon">Mês</span>
                                                            
                                                            <select class="form-control">
                                                                
                                                                <option>01</option>
                                                                <option>02</option>
                                                                <option selected>03</option>
                                                                <option>04</option>
                                                                <option>05</option>
                                                                <option>06</option>
                                                                <option>07</option>
                                                                <option>08</option>
                                                                <option>09</option>
                                                                <option>10</option>
                                                                <option>11</option>
                                                                <option>12</option>
                                                            
                                                            </select>
                                                            
                                                        </section><!-- /input-group -->
    
                                                    </section><!-- /form-group -->
                                                    
                                                </section><!-- /col-lg-3 --> 
                                                
                                                <section class="col-lg-9">
                                                    
                                                    <section class="form-group">
                                                    
                                                        <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Filtrar</button>

                                                    </section><!-- /form-group -->
                                                    
                                                </section><!-- /col-lg-9 --> 
                                                    
                                            </form>

                                        </section><!-- /row -->
                                        
                                        <br/>
                                        
                                        <section class="row">
                                            
                                            <section class="col-lg-12">
                                                
                                                <section class="panel panel-dark">
                                                    
                                                    <header class="panel-heading">Todas as Vendas | <strong>03/2014</strong></header>
                                                    
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
                                                            
                                                            <tbody>
                                                                
                                                                <tr>
                                                                    
                                                                    <td>Adriano Gianini</td>
                                                                    <td><span class="label label-danger">30</span></td>
                                                                    <td><span class="label label-warning">5</span></td>
                                                                    <td>R$ 300,00</td>
                                                                    
                                                                </tr>
                                                                
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
                                                
                                                <section class="col-lg-7">
                                                    
                                                    <section class="form-group">
    
                                                        <section class="input-group input-large">
                                                            
                                                            <span class="input-group-addon">Ano</span>
                                                            
                                                            <select class="form-control">
                                                                
                                                                <option>2014</option>
                                                            
                                                            </select>
                                                            
                                                            <span class="input-group-addon">Mês</span>
                                                            
                                                            <select class="form-control">
                                                                
                                                                <option>01</option>
                                                                <option>02</option>
                                                                <option selected>03</option>
                                                                <option>04</option>
                                                                <option>05</option>
                                                                <option>06</option>
                                                                <option>07</option>
                                                                <option>08</option>
                                                                <option>09</option>
                                                                <option>10</option>
                                                                <option>11</option>
                                                                <option>12</option>
                                                            
                                                            </select>
                                                            
                                                            <span class="input-group-addon">Área</span>
                                                            
                                                            <select class="selectize" placeholder="Selecione o Curso">
                    
                                                                <option value="">Selecione a Área</option>
                                                                <option value="Web Design">Web Design</option>
                                                                <option value="Programação">Programação</option>
                                                                        
                                                            </select>
                                                            
                                                        </section><!-- /input-group -->
    
                                                    </section><!-- /form-group -->
                                                    
                                                </section><!-- /col-lg-3 --> 
                                                
                                                <section class="col-lg-5">
                                                    
                                                    <section class="form-group">
                                                    
                                                        <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Filtrar</button>

                                                    </section><!-- /form-group -->
                                                    
                                                </section><!-- /col-lg-9 --> 
                                                    
                                            </form>

                                        </section><!-- /row -->
                                        
                                        <br/>
                                        
                                        <section class="row">
                                            
                                            <section class="col-lg-12">
                                                
                                                <section class="panel panel-dark">
                                                    
                                                    <header class="panel-heading">Todas as Vendas | <strong>Web Design</strong></header>
                                                    
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
                                                            
                                                            <tbody>
                                                                
                                                                <tr>
                                                                    
                                                                    <td><a href="vendas-detalhes.html">1</a></td>
                                                                    <td>Adriano Gianini</td>
                                                                    <td><a data-toggle="modal" href="#visualizarCursos">Visualizar Cursos</a></td>
                                                                    <td>R$ 300,00</td>
                                                                    
                                                                </tr>
                                                                
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
                        
                        <h4>Adriano Gianini - <small>adriano@cursosiag.com.br</small></h4>
                        <p>Venda: <strong>1</strong></p>
                        
                        <hr/>
                        
                        <section class="row">
                        
                            <table class="table table-striped table-hover">
                                        
                                <thead>
                                    
                                    <tr>
                                        
                                        <th><i class="fa fa-book"></i> Cursos</th>
                                        
                                    </tr>
                                    
                                </thead>
                                
                                <tbody>
                                    
                                    <tr>
                                        
                                        <td>Curso de Web Design</td>
                                        
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