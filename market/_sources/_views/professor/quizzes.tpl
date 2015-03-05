        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="dashboard.html"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Quizzes</li>
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Quizzes</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-book"></i> Curso</th>
                                            <th class="hidden-xs"><i class="fa fa-archive"></i> Capítulos</th>
                                            <th class="hidden-xs"><i class="fa fa-comment"></i> Quizzes</th>
                                            <th class="hidden-xs"><i class="fa fa-laptop"></i> Área</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach from=$cursos item=curso}
                                        <tr>
                                            
                                            <td>{$curso.curso}</td>
                                            <td class="hidden-xs">{$curso.qt_capitulos}</td>
                                            <td class="hidden-xs">{$curso.qt_quiz}</td>
                                            <td class="hidden-xs">
                                            {foreach from=$curso.categorias item=categoria}
                                                <span><strong>{$categoria.area}</strong></br></span>
                                            {/foreach}
                                            </td>
                                            <td>

                                                <a href="{$admin_url}/quiz/listar/{$curso.id}" class="btn btn-default btn-xs tooltips" data-original-title="Quizzes" data-placement="bottom"><i class="fa fa-comment"></i></a>
                                                
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