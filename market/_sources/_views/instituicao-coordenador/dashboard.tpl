        <section id="main-content">
          
            <section class="wrapper site-min-height">

                <section class="row state-overview">
                    
                    <section class="col-lg-12">
                    
                        <section class="border-head"><h3>Resumo de Estatísticas</h3></section>
                        
                    </section><!-- /col-lg-12 -->
                    
                    <section class="col-lg-6">
                            
                        <section class="panel">
                            
                            <section class="symbol gray"><i class="fa fa-book"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">{$cursos}</h1>
                                <p>Cursos</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-6 -->
                    
                    <section class="col-lg-6">
                            
                        <section class="panel">
                            
                            <section class="symbol gray"><i class="fa fa-laptop"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">{$areas}</h1>
                                <p>Áreas</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-6 -->
                    
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                    
                        <section class="border-head"><h3>Últimos Cadastros</h3></section>
                        
                    </section><!-- /col-lg-12 -->
                    
                    <section class="col-lg-6">
                        
                        <section class="panel">
                            
                            <header class="panel-heading">
                                
                                <strong>Cursos</strong>
                                
                                <span class="tools pull-right">

                                    <a href="{$admin_url}/cursos/listar"><i class="fa fa-plus"></i> Ver todos</a>

                                </span>                            
                            
                            </header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-book"></i> Curso</th>
                                            <th class="hidden-xs"><i class="fa fa-user"></i> Professor</th>
                                            <th class="hidden-xs"><i class="fa fa-calendar"></i> Data Cadastro</th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach from=$ultimos_cursos item=curso}
                                        <tr>
                                            <td><a href="{$admin_url}/aulas/listar/{$curso.id}">{$curso.curso}</a></td>
                                            <td class="hidden-xs">{$curso.professor}</td>
                                            <td class="hidden-xs">{$curso.data_convertida}</td>
                                        </tr>
                                        {/foreach}
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen --> 
                        
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-6 -->
                    
                    <section class="col-lg-6">
                        
                        <section class="panel">
                            
                            <header class="panel-heading">
                                
                                <strong>Professores</strong>
                                
                                <span class="tools pull-right">

                                    <a href="{$admin_url}/professor/listar"><i class="fa fa-plus"></i> Ver todos</a>

                                </span>
                            
                            </header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-user"></i> Professor</th>
                                            <th><i class="fa fa-envelope"></i> E-mail</th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach from=$ultimos_professores item=professor}
                                        <tr>
                                            
                                            <td>{$professor.nome}</td>
                                            <td>{$professor.email}</td>
                                            
                                        </tr>
                                        {/foreach}
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen --> 
                        
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-6 -->
                    
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->