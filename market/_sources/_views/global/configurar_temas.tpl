<section id="main-content">
          
            <section class="wrapper">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/temas/gerenciar-temas">Gerenciar Temas</a></li>
                            <li class="active">Personalizar Tema</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-3">
                        
                        <section class="panel">
                         
                          <header class="panel-heading">Menu</header>
                          
                          <section class="list-group">
                             
                              <a class="list-group-item" href="{$admin_url}/temas/personalizar-temas">
                                 
                                  <h4 class="list-group-item-heading">Aparência</h4>
                                  <p class="list-group-item-text"><i>Aqui é possível alterar logo e cores do seu tema.</i></p>
                                  
                              </a>
                              
                              <a class="list-group-item active" href="{$admin_url}/temas/configuracoes-temas">
                                 
                                  <h4 class="list-group-item-heading">Configurações Gerais</h4>
                                  <p class="list-group-item-text">Aqui é possível adicionar os links de suas redes sociais e configurar seu Google Analytics.</p>
                                  
                              </a>
                              
                          </section><!-- /list-group -->
                          
                      </section><!-- /panel -->
                        
                    </section><!-- /col-lg-3 -->
                    
                    
                    <section class="col-lg-9">

                        <form class="form-horizontal tasi-form" role="form" method="post"  >
                            <input type="hidden" value="0" name="rascunho" id="rascunho" />
                            <input type="hidden" value="1" name="editar"/>
                            <input type="hidden" value="{$configuracoestemas.id}" name="id"/>
                        
                            <section class="panel">
                                
                                <header class="panel-heading"><strong>Configurações Gerais - Tema Light</strong></header>
                                
                                <section class="panel-body">
                                        
                                        {if $msg_sucesso}
                                            <div class="alert alert-success">{$msg_sucesso}</div>
                                        {/if}

                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Facebook</label>
                                            
                                            <section class="col-lg-10">
                                                
                                                <section class="input-group m-bot15">
                                                   
                                                    <span class="input-group-addon"><i class="fa fa-facebook-square"></i></span>
                                                    <input type="text" name="facebook" value="{$configuracoestemas.facebook}" class="form-control">
                                                    
                                                </section><!-- /input-group -->
                                                
                                            </section><!-- /col-lg-10 -->
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Twitter</label>
                                            
                                            <section class="col-lg-10">
                                                
                                                <section class="input-group m-bot15">
                                                   
                                                    <span class="input-group-addon"><i class="fa fa-twitter-square"></i></span>
                                                    <input type="text" name="twitter" value="{$configuracoestemas.twitter}"class="form-control">
                                                    
                                                </section><!-- /input-group -->
                                                
                                            </section><!-- /col-lg-10 -->
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Youtube</label>
                                            
                                            <section class="col-lg-10">
                                                
                                                <section class="input-group m-bot15">
                                                   
                                                    <span class="input-group-addon"><i class="fa fa-youtube-square"></i></span>
                                                    <input type="text" name="youtube" value="{$configuracoestemas.youtube}" class="form-control">
                                                    
                                                </section><!-- /input-group -->
                                                
                                            </section><!-- /col-lg-10 -->
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Instagram</label>
                                            
                                            <section class="col-lg-10">
                                                
                                                <section class="input-group m-bot15">
                                                   
                                                    <span class="input-group-addon"><i class="fa fa-instagram"></i></span>
                                                    <input type="text" name="instagram" value="{$configuracoestemas.instagram}" class="form-control">
                                                    
                                                </section><!-- /input-group -->
                                                
                                            </section><!-- /col-lg-10 -->
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Google Analytics</label>
                                            
                                            <section class="col-lg-10">
                                                
                                                <textarea  id="" name="google_analytics" class="form-control" cols="30" rows="10">{$configuracoestemas.google_analytics}</textarea>
                                                
                                            </section><!-- /col-lg-10 -->
                                            
                                        </section><!-- /form-group -->
                                        
                                    
                                </section><!-- /panel-body -->
                                
                            </section><!-- /panel -->
                            
                            <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Salvar </button>
                            <button class="btn btn-default" onclick="$('#rascunho').val(1)" type="submit"><i class="fa fa-plus-circle"></i> Salvar como rascunho</button>

                        </form>
                    </section><!-- /col-lg-9 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->

            <br><br><br>

        </section><!-- /main-content -->