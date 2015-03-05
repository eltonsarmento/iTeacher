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
                                
                                <a href="{$admin_url}/perfil/visualizar/{$usuario_id}"><img src="{$url_site}market/uploads/avatar/{$instituicao.avatar}" alt=""></a>
                                
                                <h1>{$instituicao.nome}</h1>
                                <p>{$instituicao.email}</p>
                                
                            </div>

                            <ul class="nav nav-pills nav-stacked">
                                
                                <li class="active"><a href="{$admin_url}/perfil/visualizar/{$usuario_id}"> <i class="fa fa-user"></i> Visualizar Perfil</a></li>
                                {if $visao_adm eq false}
                                    <li><a href="{$admin_url}/perfil/editar/{$usuario_id}"> <i class="fa fa-edit"></i> Editar Perfil</a></li>
                                {/if}
                            </ul>

                        </section><!-- /panel -->
                        
                    </aside><!-- /profile-nav -->
                    
                    <aside class="profile-info col-lg-9">
                        
                        <section class="panel">
                            
                            <section class="panel-body bio-graph-info">
                                
                                <h1>Dados Cadastrais</h1>
                                
                                <section class="row">
                                                                                                        
                                    <div class="bio-row">
                                        
                                        <p><span>Tema </span> <strong class="label label-default">Light</strong>{if $visao_adm eq false}<a href="#">alterar tema</a>{/if}</p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Nome </span> <strong>{$instituicao.nome}</strong></p>
                                        
                                    </div><!-- /bio-row -->

                                    <div class="bio-row">
                                        
                                        <p><span>Domínio Site </span> <strong>{$instituicao.dominio}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Razão Social </span> <strong>{$instituicao.razao_social}</strong></p>
                                        
                                    </div><!-- /bio-row -->

                                    <div class="bio-row">
                                        
                                        <p><span>Responsável </span> <strong>{$instituicao.responsavel}</strong></p>
                                        
                                    </div><!-- /bio-row -->

                                    <div class="bio-row">
                                        
                                        <p><span>Email Responsável </span> <strong>{$instituicao.email_secundario}</strong></p>
                                        
                                    </div><!-- /bio-row -->

                                    <div class="bio-row">
                                        
                                        <p><span>Telefone Responsável </span> <strong>{$instituicao.telefone}</strong></p>
                                        
                                    </div><!-- /bio-row -->

                                    <div class="bio-row">
                                        
                                        <p><span>CNPJ </span> <strong>{$instituicao.cnpj}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Inscrição Municipal </span> <strong>{$instituicao.inscricao_municipal}</strong></p>
                                        
                                    </div><!-- /bio-row -->

                                    <div class="bio-row">
                                        
                                        <p><span>Inscrição Estadual </span> <strong>{$instituicao.inscricao_estadual}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>CEP </span> <strong>{$instituicao.cep}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Endereço </span> <strong>{$instituicao.endereco}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Complemento </span> <strong>{$instituicao.complemento}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Bairro </span> <strong>{$instituicao.bairro}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Estado </span> <strong>{$instituicao.estado}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Cidade </span> <strong>{$instituicao.cidade}</strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Área de Atuação </span> <strong>{$instituicao.area_atuacao}</strong></p>
                                        
                                    </div><!-- /bio-row -->

                                    <div class="bio-row">
                                        
                                        <p><span>Site </span> 
                                            <strong>
                                                <a href="{$instituicao.site}" target="_blank">{$instituicao.site}</a>
                                            </strong>
                                        </p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                </section><!-- /row -->
                                
                            </section><!-- /panel-body -->
                            
                        </section><!-- /panel -->
                             
                        <section class="panel">
                            
                            <section class="panel-body bio-graph-info">
                                
                                <h1>Conexões</h1>
                                
                                <section class="row">
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Facebook </span> <strong><a href="{$instituicao.facebook}" target="_blank">{$instituicao.facebook}</a></strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                    <div class="bio-row">
                                        
                                        <p><span>Twitter </span> <strong><a href="{$instituicao.twitter}" target="_blank">{$instituicao.twitter}</a></strong></p>
                                        
                                    </div><!-- /bio-row -->

                                    <div class="bio-row">
                                        
                                        <p><span>Instagram </span> <strong><a href="{$instituicao.instagram}" target="_blank">{$instituicao.instagram}</a></strong></p>
                                        
                                    </div><!-- /bio-row -->

                                    <div class="bio-row">
                                        
                                        <p><span>Youtube </span> <strong><a href="{$instituicao.youtube}" target="_blank">{$instituicao.youtube}</a></strong></p>
                                        
                                    </div><!-- /bio-row -->
                                    
                                </section><!-- /row -->
                                
                            </section><!-- /panel-body -->
                            
                        </section><!-- /panel -->                                                                    
                      
                    </aside><!-- /profile-info -->
                    
                </section><!-- /row -->
              
            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
