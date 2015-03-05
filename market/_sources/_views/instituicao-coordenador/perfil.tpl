        <section id="main-content">
          
            <section class="wrapper site-min-height">
              
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Perfil</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <aside class="profile-nav col-lg-3">
                        
                        <section class="panel">
                            
                            <div class="user-heading round">
                                
                                <a href="{$admin_url}/perfil/visualizar/{$usuario_id}"><img src="{$url_site}market/uploads/avatar/{$coordenador.avatar}" alt=""></a>
                                
                                <h1>{$coordenador.nome}</h1>
                                <p>{$coordenador.email}</p>
                                
                            </div>

                            <ul class="nav nav-pills nav-stacked">
                                
                                <li class="active"><a href="{$admin_url}/perfil/visualizar/{$usuario_id}"> <i class="fa fa-user"></i> Visualizar Perfil</a></li>
                                <li><a href="{$admin_url}/perfil/editar/{$usuario_id}"> <i class="fa fa-edit"></i> Editar Perfil</a></li>                                
                                
                            </ul>

                        </section><!-- /panel -->
                        
                    </aside><!-- /profile-nav -->
                    
                    <aside class="profile-info col-lg-9">
                        
                        <section class="panel">
                            
                            <section class="panel-body bio-graph-info">
                                
                                <h1>Dados Cadastrais</h1>
                                
                                <section class="row">
                                                                                                                                                                            
                                    <div class="bio-row">
                                        
                                        <p><span>Nome </span> <strong>{$coordenador.nome}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                                                       
                                    <div class="bio-row">
                                        
                                        <p><span>Email </span> <strong>{$coordenador.email}</strong></p>
                                        
                                    </div><!-- /bio-row -->

                                    <div class="bio-row">
                                        
                                        <p><span>CPF </span> <strong>{$coordenador.cpf}</strong></p>
                                        
                                    </div><!-- /bio-row -->

                                    <div class="bio-row">
                                        
                                        <p><span>CEP </span> <strong>{$coordenador.cep}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Endereço </span> <strong>{$coordenador.endereco}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Complemento </span> <strong>{$coordenador.complemento}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Bairro </span> <strong>{$coordenador.bairro}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Estado </span> <strong>{$coordenador.estado}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Cidade </span> <strong>{$coordenador.cidade}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Telefone </span> <strong>{$coordenador.telefone}</strong></p>
                                        
                                    </div><!-- /bio-row -->                                    
                                    
                                </section><!-- /row -->
                                
                            </section><!-- /panel-body -->
                            
                        </section><!-- /panel -->
                                                                                            
                      
                    </aside><!-- /profile-info -->
                    
                </section><!-- /row -->
              
            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
