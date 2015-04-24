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
                                
                                <a href="{$admin_url}/perfil/visualizar/{$usuario_id}"><img src="{$url_site}market/uploads/avatar/{$professor.avatar}" alt=""></a>
                                
                                <h1>{$professor.nome}</h1>
                                <p>{$professor.email}</p>
                                
                            </div>

                            <ul class="nav nav-pills nav-stacked">
                                
                                <li class="active"><a href="{$admin_url}/perfil/visualizar/{$usuario_id}"> <i class="fa fa-user"></i> Visualizar Perfil</a></li>
                                <li><a href="{$admin_url}/perfil/editar/{$usuario_id}"> <i class="fa fa-edit"></i> Editar Perfil</a></li>
                                <li><a href="{$admin_url}/contas/visualizar"> <i class="fa fa-money"></i> Contas Bancárias</a></li>
                                
                            </ul>

                        </section><!-- /panel -->
                        
                    </aside><!-- /profile-nav -->
                    
                    <aside class="profile-info col-lg-9">
                        
                        <section class="panel">
                            
                            <section class="panel-body bio-graph-info">
                                
                                <h1>Dados Cadastrais</h1>
                                
                                <section class="row">
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Nome Fantasia </span> <strong>{$professor.nome}</strong></p>
                                        
                                    </div><!-- /bio-row -->

                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Tema </span> <strong class="label label-default">Light</strong> <a href="gerenciar-temas.html">alterar tema</a></p>
                                        
                                    </div><!-- /bio-row -->

                                    <div class="bio-row">
                                        
                                        <p><span>Domínio Site </span> <strong>{$professor.dominio}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Nome </span> <strong>{$professor.nome}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>E-mail </span> <strong>{$professor.email}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>CPF </span> <strong>{$professor.cpf}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>CEP </span> <strong>{$professor.cep}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Endereço </span> <strong>{$professor.endereco}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Complemento </span> <strong>{$professor.complemento}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Bairro </span> <strong>{$professor.bairro}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Estado </span> <strong>{$professor.estado}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Cidade </span> <strong>{$professor.cidade}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Telefone </span> <strong>{$professor.telefone}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                </section><!-- /row -->
                                
                            </section><!-- /panel-body -->
                            
                        </section><!-- /panel -->
                        
                        <section class="panel">
                            
                            <section class="panel-body bio-graph-info">
                                
                                <h1>Conexões</h1>
                                
                                <section class="row">
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Facebook </span> <strong><a href="{$professor.facebook}" target="_blank">{$professor.facebook}</a></strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Twitter </span> <strong><a href="{$professor.twitter}" target="_blank">{$professor.twitter}</a></strong></p>
                                        
                                    </div><!-- /bio-row -->

                                    <div class="bio-row">
                                        
                                        <p><span>Instagram </span> <strong><a href="{$professor.instagram}" target="_blank">{$professor.instagram}</a></strong></p>
                                        
                                    </div><!-- /bio-row -->

                                    <div class="bio-row">
                                        
                                        <p><span>Youtube </span> <strong><a href="{$professor.youtube}" target="_blank">{$professor.youtube}</a></strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                </section><!-- /row -->
                                
                            </section><!-- /panel-body -->
                            
                        </section><!-- /panel -->
                        
                        <section class="panel">
                            
                            <section class="panel-body bio-graph-info">
                                
                                <h1>Sobre</h1>
                                
                                {$professor.minicurriculo}
                                
                            </section><!-- /panel-body -->
                            
                        </section><!-- /panel -->
                      
                    </aside><!-- /profile-info -->
                    
                </section><!-- /row -->
              
            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
