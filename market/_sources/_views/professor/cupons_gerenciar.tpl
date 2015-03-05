
        
        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Gerenciar Cupons</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                            
                        <a href="{$admin_url}/cupons/novo" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar novo</a>

                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <br/>
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Todos os Cupons</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-tag"></i> Cupom</th>
                                            <th><i class="fa fa-bookmark-o"></i> Tipo</th>
                                            <th><i class="fa fa-refresh"></i> Status</th>
                                            <th><i class="fa fa-flag"></i> Utilizações</th>
                                            <th><i class="fa fa-user"></i> Criado por</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        
                                        {foreach item=cupom from=$cupons}
                                        <tr>
                                            
                                            <td><a href="{admin_url}/cupom/editar/{$cupom.id}"><span class="label label-default">{$cupom.cupom}</span></a></td>
                                            <td>{$cupom.tipo}</td>
                                            <td>
                                            {if $cupom.ativo == 1}
                                            <span class="label label-success">Ativo</span>
                                            {else}
                                            <span class="label label-danger">Inativo</span>
                                            {/if}
                                            </td>
                                            <td>{$cupom.utilizacoes}</td>
                                            <td>{$cupom.usuario}</td>
                                            <td>
                                                
                                                <a href="{admin_url}/cupom/editar/{$cupom.id}" class="btn btn-primary btn-xs tooltips" data-original-title="Editar" data-placement="bottom"><i class="fa fa-pencil"></i></a>
                                                <a data-toggle="modal" href="#deletarCupom" class="btn btn-danger btn-xs tooltips" data-original-title="Excluir" data-placement="bottom"><i class="fa fa-trash-o"></i></a> |
                                                <a data-toggle="modal" href="#visualizarPedidos" class="btn btn-success btn-xs tooltips" data-original-title="Pedidos" data-placement="bottom"><i class="fa fa-shopping-cart"></i></a>
                                                
                                            </td>
                                            
                                        </tr>
                                        
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen --> 
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row --> 
                
                <section class="row">
                    
                    <section class="col-lg-12">
                            
                        <a href="novo-cupom.html" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar novo</a>

                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
        <!-- Modal - Deletar ALuno -->
        <section class="modal fade modal-alert" id="deletarCupom" tabindex="-1" role="dialog" aria-labelledby="deletarCupom" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Deletar Cupom</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">Você deseja fazer isso?</section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Não</button>
                        <button class="btn btn-danger" type="submit">Sim</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
        
        <!-- Modal Visualizar Pedidos -->
        
        <section class="modal fade modal-primary" id="visualizarPedidos" tabindex="-1" role="dialog" aria-labelledby="visualizarPedidos" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Visualizar Pedidos</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <h4>CUPOM001</h4>
                        
                        <hr/>
                        
                        <section class="row">
                            
                            <section style="height: 328px;overflow: auto;">
                        
                            <table class="table table-striped table-hover">
                                        
                                <thead>
                                    
                                    <tr>
                                        
                                        <th>#</th>
                                        <th><i class="fa fa-envelope"></i> E-mail</th>
                                        
                                    </tr>
                                    
                                </thead>
                                
                                <tbody>
                                    
                                    <tr>
                                        
                                        <td><a href="vendas-detalhes.html">1</a></td>
                                        <td>adriano@cursosiag.com.br</td>
                                        
                                    </tr>
                                    
                                    <tr>
                                        
                                        <td><a href="vendas-detalhes.html">2</a></td>
                                        <td>adriano@cursosiag.com.br</td>
                                        
                                    </tr>
                                    
                                    <tr>
                                        
                                        <td><a href="vendas-detalhes.html">3</a></td>
                                        <td>adriano@cursosiag.com.br</td>
                                        
                                    </tr>
                                    
                                    <tr>
                                        
                                        <td><a href="vendas-detalhes.html">4</a></td>
                                        <td>adriano@cursosiag.com.br</td>
                                        
                                    </tr>
                                    
                                    <tr>
                                        
                                        <td><a href="vendas-detalhes.html">5</a></td>
                                        <td>adriano@cursosiag.com.br</td>
                                        
                                    </tr>
                                    
                                    <tr>
                                        
                                        <td><a href="vendas-detalhes.html">6</a></td>
                                        <td>adriano@cursosiag.com.br</td>
                                        
                                    </tr>
                                    
                                    <tr>
                                        
                                        <td><a href="vendas-detalhes.html">7</a></td>
                                        <td>adriano@cursosiag.com.br</td>
                                        
                                    </tr>
                                    
                                    <tr>
                                        
                                        <td><a href="vendas-detalhes.html">8</a></td>
                                        <td>adriano@cursosiag.com.br</td>
                                        
                                    </tr>
                                                                        
                                </tbody>
                                
                            </table>
                                
                            </section>
                            
                        </section><!-- /row -->
                        
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
    </section><!-- /container -->

    <!-- JS -->
    
    <script type="text/javascript" language="javascript" src="assets/advanced-datatable/media/js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="js/respond.min.js" ></script>

    <!-- COMMON JS -->
    
    <script src="js/common-scripts.js"></script>

</body>
</html>
