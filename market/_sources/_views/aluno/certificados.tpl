      
        <section id="main-content">
          
            <section class="wrapper site-min-height">

                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="dashboard.html"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Certificados</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Certificados</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th>#</th>
                                            <th><i class="fa fa-book"></i> Curso</th>
                                            <th><i class="fa fa-calendar"></i> Emitido em</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach from=$certificados item=certificado}
                                        <tr>
                                            
                                            <td>{$certificado.id}</td>
                                            <td>{$certificado.curso.curso}</td>
                                            <td>{$certificado.data_emissao|date_format:"%d/%m/%Y"}</td>
                                            <td>
                                                
                                                <a href="{$admin_url}/certificados/certificado/{$certificado.matricula_curso_id}" target="_blank" class="btn btn-warning btn-xs tooltips" data-original-title="Download" data-placement="bottom"><i class="fa fa-upload"></i></a>
                                                
                                            </td>
                                            
                                        </tr>
                                        {/foreach}
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen --> 
                        
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->

