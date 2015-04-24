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
                                
                                <a href="{$admin_url}/perfil/visualizar/{$usuario_id}"><img src="{$url_site}market/uploads/avatar/{$aluno.avatar}" alt=""></a>
                                
                                <h1>{$aluno.nome}</h1>
                                <p>{$aluno.email}</p>
                                
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
                                        
                                        <p><span>Nome </span> <strong>{$aluno.nome}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                                                       
                                    <div class="bio-row">
                                        
                                        <p><span>Email </span> <strong>{$aluno.email}</strong></p>
                                        
                                    </div><!-- /bio-row -->

                                    <div class="bio-row">
                                        
                                        <p><span>CPF </span> <strong>{$aluno.cpf}</strong></p>
                                        
                                    </div><!-- /bio-row -->

                                    <div class="bio-row">
                                        
                                        <p><span>CEP </span> <strong>{$aluno.cep}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Endereço </span> <strong>{$aluno.endereco}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Complemento </span> <strong>{$aluno.complemento}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Bairro </span> <strong>{$aluno.bairro}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Estado </span> <strong>{$aluno.estado}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Cidade </span> <strong>{$aluno.cidade}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Telefone </span> <strong>{$aluno.telefone}</strong></p>
                                        
                                    </div><!-- /bio-row -->                                    
                                    
                                </section><!-- /row -->
                                
                            </section><!-- /panel-body -->
                            
                        </section><!-- /panel -->
                         
                         <section class="panel">
                            
                            <section class="panel-body bio-graph-info">
                                
                                <h1>Sobre</h1>
                                
                                {$aluno.minicurriculo}
                                
                            </section><!-- /panel-body -->
                            
                        </section><!-- /panel -->                                                                   
                      
                    </aside><!-- /profile-info -->
                    
                </section><!-- /row -->
              
            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
