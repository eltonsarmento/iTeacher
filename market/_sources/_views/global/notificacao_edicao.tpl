        
        <section id="main-content">
          
            <section class="wrapper site-min-height">
              
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/notificacoesadmin/listar">Notificações</a></li>
                            <li class="active">Adicionar Nova</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

                {if $msg_alert}
                    <div class="alert alert-info">{$msg_alert}</div>
                {/if}
                
                <section class="row">
                    
                    <section class="col-lg-12">

                        <section class="panel">
                            
                            <header class="panel-heading"><strong>{if $notificacao.id} Editar {else}Adicionar Nova {/if}- Notificação</strong></header>
                            
                            <section class="panel-body">
                                
                                <form class="form-horizontal tasi-form" action="" method="post">
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
                                        
                                        <label class="control-label col-lg-2">Destinatário</label>
                                        <section class="col-lg-10">
                                            <select id="selectize" name="destinatario_nivel" id="destinatario" class="destinatario" onchange="mudarNivel();">
                                                <option value="0">Selecione o Destinatário</option>
                                                <option value="2" {if $notificacao.destinatario_nivel == 2} selected {/if}>Alunos</option>
                                                <option value="8" {if $notificacao.destinatario_nivel == 8} selected {/if}>Professores</option>
                                                <option value="7" {if $notificacao.destinatario_nivel == 7} selected {/if}>Parceiros</option>
                                                <option value="6" {if $notificacao.destinatario_nivel == 6} selected {/if}>Coordenadores</option>
                                                <option value="4" {if $notificacao.destinatario_nivel == 4} selected {/if}>Administrativo</option>
                                            </select>
                                        </section>
                                        
                                        <section id="campo_cursos" {if $notificacao.destinatario_nivel != 2} style="display:none;" {/if} >
                                            <label class="control-label col-lg-2">Curso: </label>
                                            <select id="selectize2" name="cursos[]" multiple placeholder="Selecione o Curso" class="col-lg-10 ">
                     
                                                <option value="">Selecione o Curso</option>

                                                <option value="0" {if !$notificacao.cursos|count && $notificacao.id} selected="selected" {/if}>Todos os Cursos</option>
                                                
                                                {foreach from=$cursos  key=k item=curso}
                                                    <option value="{$curso.id}" {if $curso.id|in_array:(array)$notificacao.cursos} selected="selected" {/if}>{$curso.curso}</option>
                                                {/foreach}
                                                
                                                        
                                            </select>
                                              
                                        </section>
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Mensagem</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <textarea  id="wysihtml5_notificacao" name="conteudo"  class="form-control" rows="10">{$notificacao.conteudo}</textarea>
                                              
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

        <script src="{$url_site}{$admin_dir}common/market/assets/bootstrap-select/selectize.js"></script>

        {literal}
            <script type="text/javascript">
                $('#selectize').selectize();
                $('#selectize2').selectize();
                function mudarNivel() {
                    if (jQuery(".destinatario").val() == 2) {
                        jQuery("#campo_cursos").show('slow');
                    } else {
                        jQuery("#campo_cursos").hide('slow');
                    }
                }
            </script>
        {/literal}