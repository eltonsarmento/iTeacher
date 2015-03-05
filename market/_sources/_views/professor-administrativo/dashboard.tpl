        <section id="main-content">
          
            <section class="wrapper site-min-height">

                <section class="row state-overview">
                    
                    <section class="col-lg-12">
                    
                        <section class="border-head"><h3>Resumo Financeiro</h3></section>
                        
                    </section><!-- /col-lg-12 -->
                    
                    <section class="col-lg-6">
                            
                        <section class="panel">
                            
                            <section class="symbol green"><i class="fa fa-dollar"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">R$ {$saldo_disponivel}</h1>
                                <p>Saldo Disponível</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-6 -->
                    
                    <section class="col-lg-6">
                            
                        <section class="panel">
                            
                            <section class="symbol red"><i class="fa fa-dollar"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">R$ {$saldo_receber}</h1>
                                <p>Saldo a Receber</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-6 -->
                    
                    <section class="col-lg-12">
                    
                        <section class="border-head"><h3>Resumo de Estatísticas</h3></section>
                        
                    </section><!-- /col-lg-12 -->
                    
                    <section class="col-lg-4">
                            
                        <section class="panel">
                            
                            <section class="symbol gray"><i class="fa fa-user"></i></section><!-- /symbol -->
                            
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
                                
                                <h1 class="count">{$qtd_vendas}</h1>
                                <p>Vendas</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-4 -->
                    
                    <section class="col-lg-4">
                            
                        <section class="panel">
                            
                            <section class="symbol gray"><i class="fa fa-book"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">{$cursos}</h1>
                                <p>Cursos</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-4 -->
                    
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
     
        
        <!-- Modal - Reportar Erro -->
        <section class="modal fade modal-alert" id="reportarErro" tabindex="-1" role="dialog" aria-labelledby="reportarErro" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Reportar Erro</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <form role="form">
                            
                            <p>Nome do arquivo: <strong>Arquivo.zip</strong></p>
                            
                            <section class="form-group">
                                
                                <textarea class="form-control" cols="30" rows="5"></textarea>
                                
                            </section><!-- /form-group -->

                            <button type="submit" class="btn btn-success"><i class="fa fa-check-circle"></i> Reportar</button>
                            
                        </form>
                    
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
    </section><!-- /container -->

