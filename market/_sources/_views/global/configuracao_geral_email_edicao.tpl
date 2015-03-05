<section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Configurações de E-mail</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-6">
                        {if $msg_alert}
                         <div class="alert alert-info">{$msg_alert}</div>
                        {/if}
                         <section class="panel">
                            
                            <header class="panel-heading"><strong>Servidor de E-mail</strong></header>
                            
                            <section class="panel-body">
                                
                                <form class="form-horizontal tasi-form" role="form" method="post">
                                    <input type="hidden" value="1" name="editar_host" id="editar_host"/>
                                    <input type="hidden" value="{$configuracoes_email.sistema_id}" name="sistema_id"/>
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Host</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="host" {if $visao_adm eq true} disabled{/if} value="{$configuracoes_email.host}" type="text" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Porta</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="porta" {if $visao_adm eq true}disabled{/if} value="{$configuracoes_email.porta}" type="text" data-mask="9999" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Senha</label>
                                        
                                        <section class="col-lg-10">
                                            
                                                <input class="form-control" name="senha" {if $visao_adm eq true}disabled{/if}  value="{$configuracoes_email.senha}" type="password" required>                                            
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    {if $visao_adm eq false}
                                        <section class="form-group">
                                            <section class="col-lg-offset-2 col-lg-10">                                              
                                                <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Salvar</button>
                                                <button class="btn btn-info" type="submit"><i class="fa fa-check-circle"></i> Salvar e enviar um e-mail teste</button>
                                            </section><!-- /col-lg-10 -->
                                        </section><!-- /form-group -->
                                    {/if}
                                </form>
                                
                            </section><!-- /panel-body -->
                        
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-6 -->
                    
                    <section class="col-lg-6">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Opções de Remetente</strong></header>
                            
                            <section class="panel-body">
                                
                                <form class="form-horizontal tasi-form" role="form" method="post">
                                    <input type="hidden" value="1" name="editar_remetente" id="editar_remetente"/>
                                    <input type="hidden" value="{$configuracoes_email.sistema_id}" name="sistema_id"/>
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Nome</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="nome" {if $visao_adm eq true}disabled{/if} value="{$configuracoes_email.nome}" type="text" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">E-mail</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="email" {if $visao_adm eq true}disabled{/if} type="email" value="{$configuracoes_email.email}" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    {if $visao_adm eq false}
                                        <section class="form-group">
                                            
                                            <section class="col-lg-offset-2 col-lg-10">
                                                  
                                                <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Salvar</button>
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                    {/if}
                                </form>
                                
                            </section><!-- /panel-body -->
                        
                        </section><!-- /panel -->
                        {if $visao_adm eq false}
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Modelo de E-mail</strong></header>
                            
                            <section class="panel-body">
                                
                                <form class="form-horizontal tasi-form" role="form" method="post" enctype="multipart/form-data">
                                    <input type="hidden" value="1" name="editar_modelo" id="editar_modelo"/>
                                    <input type="hidden" value="{$configuracoes_email.sistema_id}" name="sistema_id"/>
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Cabeçalho</label>
                                        
                                        <section class="controls col-lg-10">
                                            
                                            <section class="fileupload fileupload-new" data-provides="fileupload">
                                                
                                                <span class="btn btn-white btn-file">
                                                    
                                                    <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Selecione a imagem</span>
                                                    <span class="fileupload-exists"><i class="fa fa-undo"></i> Alterar</span>
                                                    <input type="file" name="imagem_cabecalho" class="default" />
                                                    
                                                </span>
                                                
                                                <span class="fileupload-preview" style="margin-left:5px;"></span>
                                                
                                                <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                                                
                                            </section><!-- /fileupload -->
                                            
                                        </section><!-- /controls --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Texto do Rodapé</label>
                                        
                                        <section class="col-lg-10">
                                            
                                            <textarea class="form-control" name="texto_rodape" cols="30" rows="5">{$configuracoes_email.texto_rodape}</textarea>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <section class="col-lg-offset-2 col-lg-10">
                                              
                                            <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Salvar</button>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                
                                </form>
                                
                            </section><!-- /panel-body -->
                        
                        </section><!-- /panel --> 
                        {/if}
                    </section><!-- /col-lg-6 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content --