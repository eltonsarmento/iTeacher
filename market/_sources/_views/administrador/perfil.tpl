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
                                
                                <a href="{$admin_url}/perfil/visualizar/{$usuario_id}"><img src="{$url_site}market/uploads/avatar/{$administrador.avatar}" alt=""></a>
                                
                                <h1>{$administrador.nome}</h1>
                                <p>{$administrador.email}</p>
                                
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
                                        
                                        <p><span>Nome </span> <strong>{if $administrador.nome != ""}{$administrador.nome}{else}N/a{/if}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>E-mail </span> <strong>{if $administrador.email != ""}{$administrador.email}{else}N/a{/if}
                                            </strong></p>
                                        
                                    </div><!-- /bio-row -->

                                    <div class="bio-row-full">
                                        
                                        <p><span>E-mail Secundário</span> <strong>{if $administrador.email_secundario != ""}{$administrador.email_secundario}{else}N/a{/if}</strong></p>
                                        
                                    </div><!-- /bio-row -->

                                    
                                    <div class="bio-row">
                                        
                                        <p><span>CPF </span> <strong>{if $administrador.cpf != ""}{$administrador.cpf}{else}N/a{/if}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>CEP </span> <strong>{if $administrador.cep != ""}{$administrador.cep}{else}N/a{/if}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Endereço </span> <strong>{if $administrador.endereco != ""}{$administrador.endereco}{else}N/a{/if}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Complemento </span> <strong>{if $administrador.complemento != ""}{$administrador.complemento}{else}N/a{/if}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Bairro </span> <strong>{if $administrador.bairro != ""}{$administrador.bairro}{else}N/a{/if}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Estado </span> <strong>{if $administrador.estado != ""}{$administrador.estado}{else}N/a{/if}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Cidade </span> <strong>{if $administrador.cidade != ""}{$administrador.cidade}{else}N/a{/if}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Telefone </span> <strong>{if $administrador.telefone != ""}{$administrador.telefone}{else}N/a{/if}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                </section><!-- /row -->
                                
                            </section><!-- /panel-body -->
                            
                        </section><!-- /panel -->
                        
                    </aside><!-- /profile-info -->
                    
                </section><!-- /row -->
              
            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
