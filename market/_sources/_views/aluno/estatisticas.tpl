        <section id="main-content">
          
            <section class="wrapper site-min-height">

                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="dashboard.html"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Estatísticas</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Estatísticas</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-book"></i> Curso</th>
                                            <th><i class="fa fa-refresh"></i> Percentual</th>
                                            <th class="hidden-xs"><i class="fa fa-laptop"></i> Aulas Assistidas</th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach from=$cursos item=curso}
                                        <tr>
                                            
                                            <td>{$curso.curso}</td>
                                            <td>
                                                
                                                <section class="progress progress-striped active">
                                                    
                                                    <section class="progress-bar progress-bar-info"  role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: {$curso.porcentagem}%">
                                                        
                                                        <span>{$curso.porcentagem}%</span>
                                                        
                                                    </section>
                                                    
                                                </section>
                                                
                                            </td>
                                            
                                            <td class="hidden-xs">{$curso.aulas_assistidas}</td>
                                                
                                            </td>
                                            
                                        </tr>
                                        {foreachelse}
                                        <tr><td colspan="100%">Não exitem estatisticas ainda.</td></tr>
                                        {/foreach}
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen --> 
                        
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
