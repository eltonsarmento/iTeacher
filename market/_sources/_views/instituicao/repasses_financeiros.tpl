
        
        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Repasses Financeiros</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-8">
                            
                        <section class="btn-group">
                            
                            <button data-toggle="dropdown" class="btn btn-white dropdown-toggle" type="button"><i class="fa fa-download"></i> Exportar Dados <span class="caret"></span></button>
                            
                            <ul role="menu" class="dropdown-menu">
                                    
                                    <li><a  href="{$admin_url}/relatorios/relatorio/?tipo=pdf&dados=repassesFinanceiros&palavra_busca={$palavra_busca}" target="_blank">Exportar em PDF</a></li>
                                    <li><a  href="{$admin_url}/relatorios/relatorio/?tipo=xls&dados=repassesFinanceiros&palavra_busca={$palavra_busca}" target="_blank">Exportar em XLS</a></li>
                                    
                                </ul>
                            
                        </section><!-- /btn-group -->

                    </section><!-- /col-lg-8 -->
                    
                    <section class="col-lg-4">
                        
                        <form>
                            <section class="input-group m-bot15">
                                    
                                <input type="text" name="palavra_busca" class="form-control">
                                    
                                <span class="input-group-btn"><button type="submit" class="btn btn-white"><i class="fa fa-search"></i></button></span>
                                    
                            </section><!-- /input-group -->
                        </form>
                    </section><!-- /col-lg-4 -->

                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Repasses Financeiros</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-user"></i> Parceiro</th>
                                            <th><i class="fa fa-calendar"></i> Mês</th>
                                            <th><i class="fa fa-money"></i> Total</th>
                                            <th><i class="fa fa-calendar"></i> Data Pagamento</th>
                                            <th><i class="fa fa-comment"></i> Observações</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach item=repasse from=$repasses}
                                        <tr>
                                            
                                            <td>{$repasse.nomeParceiro}</td>
                                            <td>{$repasse.mes}/{$repasse.ano}</td>
                                            <td>R${$repasse.total}</td>
                                            <td>{$repasse.data_cadastro}</td>
                                            <td><a data-toggle="modal" href="#visualizarObservações">Visualizar Observações</a></td>
                                            <td>
                                                
                                                <a href="#" class="btn btn-primary btn-xs tooltips" data-original-title="Comprovante" data-placement="bottom"><i class="fa fa-file"></i></a>
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
                
        <!-- Modal - Visualizar Observações -->
        
        <section class="modal fade" id="visualizarObservações" tabindex="-1" role="dialog" aria-labelledby="visualizarObservações" aria-hidden="true" style="display: none;">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">Visualizar Observações</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <p>Essa observação não sei por onde é cadastrada ou inserida! se vai estar no banco ou não! </p>
                    
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
    </section><!-- /container -->

    