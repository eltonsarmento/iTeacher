
        
        <section id="main-content">
          
            <section class="wrapper site-min-height">

                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/materialmarketing/listar">Materiais</a></li>
                            <li class="active">Adicionar novo</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                {if $msg_alert_error}
                    <div class="alert alert-danger">{$msg_alert_error}</div>
                {/if}
                {if $msg_alert_sucesso}
                    <div class="alert alert-success">{$msg_alert_sucesso}</div>
                {/if}
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Adicionar Novo - Material</strong></header>
                            
                            <section class="panel-body">
                                
                                <form class="form-horizontal tasi-form">
                                
                                    <input type="hidden" value="0" name="nova" id="nova" />
                                    <input type="hidden" value="1" name="editar"/>
                                    <input type="hidden" value="{$material.id}" name="id"/>
                                    <input type="hidden" name="data_cadastro" value="{$material.data_cadastro}" />

                                    <section class="form-group">
                                    
                                        <label class="control-label col-lg-2">Material</label><!-- /control-label --> 
                                        
                                        <section class="col-lg-10">
                                            
                                            <input type="text" class="form-control" name="material" value="{$material.material}" required autofocus>
                                        
                                        </section><!-- /col-lg-10 --> 
                                    
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                    
                                        <label class="control-label col-lg-2">Descrição</label><!-- /control-label --> 
                                        
                                        <section class="col-lg-10">
                                            
                                            <textarea class="wysihtml5 form-control" name="descricao" rows="10">{$material.descricao}</textarea>
                                        
                                        </section><!-- /col-lg-10 --> 
                                    
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                    
                                        <label class="control-label col-lg-2">Categoria</label><!-- /control-label --> 
                                        
                                        <section class="col-lg-10">
                                            
                                            <select name="categoria_id" class="form-control" required>
                                                <option value="" >Selecione</option>
                                                {foreach item=categoria from=$categorias}
                                                    <option value='{$categoria.id}'
                                                    {if $categoria.id eq $material.categoria_id} selected {/if}> 
                                                    {$categoria.categoria}</option>
                                                {/foreach}                                                
                                                
                                            </select>
                                        
                                        </section><!-- /col-lg-10 --> 
                                    
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                    
                                        <label class="control-label col-lg-2">Link</label><!-- /control-label --> 
                                        
                                        <section class="col-lg-10">
                                            
                                            <input type="text" class="form-control" name="link" value="{$material.link}" required>
                                            
                                        </section><!-- /col-lg-10 -->
                                    
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                          
                                        <section class="col-lg-offset-2 col-lg-10">
                                              
                                            <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Salvar</button>
                                            <button class="btn btn-default" type="submit"><i class="fa fa-plus-circle"></i> Salvar e adicionar outro</button>
                                            <span>ou <a href="gerenciar-material.html">voltar a listagem</a></span>
                                              
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

   