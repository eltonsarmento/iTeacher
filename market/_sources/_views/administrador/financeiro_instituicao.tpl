        
        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="dashboard.html"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="financeiro-instituicoes.html">Financeiro Instituições</a></li>
                            <li class="active">Cursos IAG - Histórico Financeiro</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <section class="panel-heading"><strong>Cursos IAG - Histórico Financeiro</strong></section><!-- /panel-heading -->
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-calendar"></i> Data Pagamento</th>
                                            <th><i class="fa fa-signal"></i> Status</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        
                                        <tr>
                                            
                                            <td><strong>01/01/2015</strong></td>
                                            <td><span class="label label-warning">Em atraso</span></td>
                                            <td>
                                                
                                                <a data-toggle="modal" href="#alterarStatus" class="btn btn-success btn-xs tooltips" data-original-title="Status" data-placement="bottom"><i class="fa fa-refresh"></i></a>
                                                
                                            </td>
                                            
                                        </tr>
                                        
                                        <tr>
                                            
                                            <td><strong>01/04/2014</strong></td>
                                            <td><span class="label label-success">Ativa</span></td>
                                            <td></td>
                                            
                                        </tr>
                                        
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen -->
                        
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
       
        <!-- Modal Alterar Status -->
        
        <section class="modal fade modal-primary" id="alterarStatus" tabindex="-1" role="dialog" aria-labelledby="alterarStatus" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Alterar Status</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                    
                        <form class="form-horizontal tasi-form">
                            
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">Status</label>
                                
                                <section class="col-lg-10">
                                
                                    <select class="form-control">
                                        
                                        <option value="" selected>Selecione</option>
                                        <option value="">Ativa</option>
                                        <option value="">Em Atraso</option>
                                        <option value="">Inativa</option>
                                        <option value="">Bloqueado por falta de pagamento</option>
                                        <option value="">Pré-cadastro: aguardando primeiro pagamento</option>
                                    
                                    </select>                            
                                
                                </section><!-- input-group -->
                            
                            </section><!-- form-group -->
                            
                            <section class="form-group">
                                
                                <section class="col-lg-offset-2 col-lg-10">
                                
                                    <button class="btn btn-success"><i class="fa fa-check-circle"></i> Salvar</button>                       
                                
                                </section><!-- input-group -->
                            
                            </section><!-- form-group -->
                            
                        </form>
                    
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
    </section><!-- /container -->

 
