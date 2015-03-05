
        
        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/administrativos/listar">Administrativos</a></li>
                            <li class="active">Visualizar Administrativo</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <aside class="profile-nav col-lg-3">
                        
                        <section class="panel">
                            
                            <div class="user-heading round">
                                <a href="{$admin_url}/administrativos/visualizar/{$administrativo.id}">
                                    <img src="{$url_site}/market/uploads/avatar/{$administrativo.avatar}" alt="">
                                </a>
                                <h1>{$administrativo.nome}</h1>
                                <p>{$administrativo.email}</p>
                                
                            </div>

                            <ul class="nav nav-pills nav-stacked">
                                
                                <li class="active"><a href="{$admin_url}/administrativos/visualizar/{$administrativo.id}"> <i class="fa fa-user"></i> Visualizar Administrativo</a></li>
                                <li><a href="{$admin_url}/administrativos/editarnavisualizacao/{$administrativo.id}"> <i class="fa fa-edit"></i> Editar Administrativo</a></li>
                                
                            </ul>

                        </section><!-- /panel -->
                        
                    </aside><!-- /profile-nav -->
                    
                    <aside class="profile-info col-lg-9">
                        
                        <section class="panel">
                            
                            <section class="panel-body bio-graph-info">
                                
                                <h1>Dados Cadastrais</h1>
                                
                                <section class="row">
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Nome </span> <strong>{$administrativo.nome}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>E-mail </span> <strong>{$administrativo.email}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                </section><!-- /row -->
                                
                            </section><!-- /panel-body -->
                            
                        </section><!-- /panel -->
                      
                    </aside><!-- /profile-info -->
                    
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        