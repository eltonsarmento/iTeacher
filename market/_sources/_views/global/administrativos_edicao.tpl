
        
        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/administrativos/listar">Administrativos</a></li>
                            <li class="active">Adicionar Novo</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                {if $msg_alert}
                    <div class="alert alert-danger">{$msg_alert}</div>
                {/if}
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>{if $administrativo.id}Editar{else}Adicionar Novo{/if} - Administrativo</strong></header>
                            
                            <section class="panel-body">
                                
                                <form class="form-horizontal tasi-form" method="post" action="" enctype="multipart/form-data">
                                    <input type="hidden" value="0" name="nova" id="nova" />
                                    <input type="hidden" value="1" name="editar"/>
                                    <input type="hidden" value="{$administrativo.id}" name="id"/>

                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Nome</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="nome" type="text" value="{$administrativo.nome}" autofocus required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">E-mail</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="email" type="email" value="{$administrativo.email}" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Senha</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="senha" type="password" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Confirme a Senha</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="senha2" type="password" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Avatar</label>
                                        
                                        <section class="controls col-lg-10">
                                            
                                            <section class="fileupload fileupload-new" data-provides="fileupload">
                                                
                                                <span class="btn btn-white btn-file">
                                                    
                                                    <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Selecione a imagem</span>
                                                    <span class="fileupload-exists"><i class="fa fa-undo"></i> Alterar</span>
                                                    <input type="file" name="avatar" class="default" />
                                                    
                                                </span>
                                                
                                                <span class="fileupload-preview" style="margin-left:5px;"></span>
                                                
                                                <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                                                
                                            </section><!-- /fileupload -->
                                            
                                        </section><!-- /controls -->
                                        
                                    </section><!-- /form-group -->

                                    <section class="form-group">
                                          
                                        <section class="col-lg-offset-2 col-lg-10">
                                              
                                            <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> {if $administrativo.id}Editar{else}Salvar{/if}</button>
                                            <button class="btn btn-default" onclick="javascript:jQuery('#nova').val(1)"><i class="fa fa-plus-circle"></i> {if $administrativo.id}Editar{else}Salvar{/if} e adicionar outro</button>
                                            <span>ou <a href="{$admin_url}/administrativos/listar">voltar a listagem</a></span>
                                              
                                        </section><!-- /col-lg-offset-2 col-lg-10 --> 
                                          
                                    </section><!-- /form-group --> 
                                      
                                </form>

                            </section><!-- /panel-body --> 
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row --> 

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
