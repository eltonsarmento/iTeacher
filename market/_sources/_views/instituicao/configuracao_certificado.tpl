        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="dashboard.html"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Configurações de Certificado</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">

                    <section class="col-lg-12">
                        {if $msg_erro}
                            <div class="alert alert-info">{$msg_erro}</div>
                        {/if}
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Configurações de Certificado</strong></header>
                            
                            <section class="panel-body">

                                <form class="form-horizontal tasi-form" role="form" method="post" enctype="multipart/form-data">
                                    <input type='hidden' name='editar' value='1'>
                                    <input type='hidden' name='id' value='{$certificado.id}'>
                                
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Título</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="titulo" type="text" value="{$certificado.titulo}" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Texto</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <textarea class="form-control" cols="30" rows="8" required name="texto">{if $certificado.texto}{$certificado.texto}{else}CERTIFICAMOS QUE O ALUNO [[aluno_nome]] CONCLUIO O [[curso_nome]] EM [[data_conclusao]] COM CARGA HORÁRIA DE [[carga_horaria]] HORAS AULAS.{/if}</textarea>
                                            
                                            <span class="help-block"><a data-toggle="modal" href="#visualizarShortcodes">Visualizar Shortcodes</a></span>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Assinatura de Autenticação</label>
                                              
                                        <section class="controls col-lg-10">
                                        
                                            <section class="fileupload fileupload-new" data-provides="fileupload">
                                                
                                                <span class="btn btn-white btn-file">
                                                    
                                                    <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Selecione o arquivo</span>
                                                    <span class="fileupload-exists"><i class="fa fa-undo"></i> Alterar</span>
                                                    <input type="file" name="assinatura" class="default" />
                                                    
                                                </span>
                                                
                                                <span class="fileupload-preview" style="margin-left:5px;"><img src="{$url_site}market/uploads/certificados/{$certificado.img_assinatura}" width="100"></span>
                                                
                                                <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                                                
                                            </section><!-- /fileupload -->
                                            
                                            <span class="help-block">Formatos: <strong>jpg, jpeg, JPG ou JPEG</strong> </span>
                                            
                                        </section><!-- /controls -->
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Modelo</label>
                                              
                                        <section class="controls col-lg-10">
                                        
                                            <section class="fileupload fileupload-new" data-provides="fileupload">
                                                
                                                <span class="btn btn-white btn-file">
                                                    
                                                    <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Selecione o arquivo</span>
                                                    <span class="fileupload-exists"><i class="fa fa-undo"></i> Alterar</span>
                                                    <input type="file" name="modelo" class="default" />
                                                    
                                                </span>
                                                
                                                <span class="fileupload-preview" style="margin-left:5px;"><img src="{$url_site}market/uploads/certificados/{$certificado.modelo}" width="100"></span>
                                                
                                                <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                                                
                                            </section><!-- /fileupload -->
                                            
                                            <span class="help-block">Formatos: <strong>jpg, jpeg, JPG ou JPEG</strong> </span>
                                            
                                        </section><!-- /controls -->
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Percentual de Conclusão</label>
                                        
                                        <section class="col-lg-1">
                                            
                                            <section class="input-group">
                                                
                                                <span class="input-group-addon">%</span>
                                                <input class="form-control" name="percentual_conclusao" value="{$certificado.percentual_conclusao}" style="width: 50px;" type="text" required>
                                                
                                            </section><!-- /input-group -->
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Autenticação do Certificado</label>
                                        
                                        <section class="col-lg-1">
                                            
                                            <input class="form-control" name="autenticacao" value="{$certificado.autenticacao}" type="text" required>
                                              
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
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        

        
        <!-- Modal - Visualizar Shortcodes -->
        
        <section class="modal fade modal-primary" id="visualizarShortcodes" tabindex="-1" role="dialog" aria-labelledby="visualizarShortcodes" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Visualizar Shortcodes</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <p>Lista de Shortcodes</p>
                        
                        <p><strong>[[aluno_nome]]</strong> - Nome do Aluno</p>
                        
                        <p><strong>[[curso_nome]]</strong> - Nome do Curso que concluio</p>
                        
                        <p><strong>[[data_conclusao]]</strong> - Data de conclusão de curso</p>
                        
                        <p><strong>[[carga_horaria]]</strong> - Carga horária do curso</p>
                    
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
    </section><!-- /container -->

 