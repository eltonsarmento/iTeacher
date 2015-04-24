        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="dashboard.html"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Gerenciar Financeiro</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <section class="panel-heading"><strong>Gerenciar Financeiro</strong></section><!-- /panel-heading -->
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-calendar"></i> Data Vencimento</th>
                                            <th class="hidden-xs"><i class="fa fa-signal"></i> Status</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        
                                        <tr>
                                            
                                            <td><strong>01/04/2014</strong></td>
                                            <td><span class="label label-success">Paga</span></td>
                                            <td>
                                                
                                                <a data-toggle="modal" href="#enviarComprovante" class="btn btn-success btn-xs tooltips" data-original-title="Comprovante" data-placement="bottom"><i class="fa fa-download"></i></a>
                                                
                                            </td>
                                            
                                        </tr>
                                        
                                        <tr>
                                            
                                            <td><strong>01/04/2014</strong></td>
                                            <td><span class="label label-warning">Em Aberto</span></td>
                                            <td>
                                                
                                                <a data-toggle="modal" href="#enviarComprovante" class="btn btn-success btn-xs tooltips" data-original-title="Comprovante" data-placement="bottom"><i class="fa fa-download"></i></a>
                                                
                                            </td>
                                            
                                        </tr>
                                        
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen -->
                        
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->


         <section class="modal fade modal-primary" id="enviarComprovante" tabindex="-1" role="dialog" aria-labelledby="enviarComprovante" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Enviar Comprovante</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                    
                        <form class="form-horizontal tasi-form">
                            
                            <section class="form-group">
                                        
                                <label class="control-label col-lg-2">Comprovante</label>

                                <section class="controls col-lg-10">

                                    <section class="fileupload fileupload-new" data-provides="fileupload">

                                        <span class="btn btn-white btn-file">

                                            <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Selecione o arquivo</span>
                                            <span class="fileupload-exists"><i class="fa fa-undo"></i> Alterar</span>
                                            <input type="file" class="default" />

                                        </span>

                                        <span class="fileupload-preview" style="margin-left:5px;"></span>

                                        <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>

                                    </section><!-- /fileupload -->

                                </section><!-- /controls -->

                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <section class="col-lg-offset-2 col-lg-10">
                                
                                    <button class="btn btn-success"><i class="fa fa-check-circle"></i> Enviar</button>                       
                                
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