
        
        <section id="main-content">
          
            <section class="wrapper site-min-height">
              
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/notificacoes/listar">Notificações</a></li>
                            <li class="active">Adicionar Nova</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Adicionar Nova - Notificação</strong></header>
                            
                            <section class="panel-body">
                                
                                <form class="form-horizontal tasi-form" action=""  method="post">
                                    <input type="hidden" value="1" name="editar"/>
                                    <input type="hidden" value="0" name="nova" id="nova"/>
                                    <input type="hidden" value="{$notificacao.id}" name="id"/>
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Título</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="titulo" value="{$notificacao.titulo}" type="text" autofocus required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Destinatário </label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <select class="form-control" name="destinatario_nivel">
                    
                                                <option value="" >Selecione</option>
                                                <option value="3" {if $notificacao.destinatario_nivel eq 3} selected{/if}>Professores</option>
                                                <option value="5" {if $notificacao.destinatario_nivel eq 5} selected{/if} >Instituições</option>
                                                
                                            </select>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Mensagem</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <textarea class="wysihtml5 form-control" name="conteudo" rows="10">{$notificacao.conteudo}</textarea>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->

                                    <section class="form-group">
                                          
                                        <section class="col-lg-offset-2 col-lg-10">
                                              
                                            <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i>{if $notificacao.id} Editar {else}Salvar {/if}</button>
                                            <button class="btn btn-default" onclick="javascript:jQuery('#nova').val(1)"><i class="fa fa-plus-circle"></i>{if $notificacao.id} Editar {else} Salvar {/if} e adicionar outra</button>
                                            <span>ou <a href="{$admin_url}/notificacoesadmin/listar">voltar a listagem</a></span>
                                              
                                        </section><!-- /col-lg-offset-2 col-lg-10 --> 
                                          
                                    </section><!-- /form-group --> 
                                      
                                </form>

                            </section><!-- /panel-body --> 
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
        
    
    </section><!-- /container -->

    
