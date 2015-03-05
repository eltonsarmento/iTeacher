        <section id="main-content">
          
            <section class="wrapper site-min-height">
              
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/planos/listar-planos-instituicoes">Planos</a></li>
                            <li class="active">Adicionar Novo</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    {if $msg_alert}
                    <div class="alert alert-info">{$msg_alert}</div>
                    {/if}
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>{if $plano.id}Editar{else}Adicionar Novo{/if} - Plano</strong></header>
                            
                            <section class="panel-body">
                                
                                <form class="form-horizontal tasi-form" action="" method="post">
                                    <input type="hidden" name="editar" value="1">
                                    <input type="hidden" name="id" value="{$plano.id}">
                                    <input type="hidden" name="tipo" value="2">

                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Plano</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="plano" value="{$plano.plano}" type="text" autofocus required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Quantidade de Alunos</label>
                                        
                                        <section class="col-lg-2">
                                            
                                            <section class="input-group m-bot15">
                                                
                                                <span class="input-group-addon"><i class="fa fa-users"></i></span>
                                                <input class="form-control" name="qtd_alunos" value="{$plano.qtd_alunos}" type="text" required>
                                                
                                            </section><!-- /input-group -->
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Valor</label>
                                        
                                        <section class="col-lg-2">
                                            
                                            <section class="input-group m-bot15">
                                                
                                                <span class="input-group-addon">R$</span>
                                                <input class="form-control" name="valor" value="{$plano.valor}" type="text" required>
                                                
                                            </section><!-- /input-group -->
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Descrição</label>
                                        
                                        <section class="col-lg-10">
                                            
                                            <textarea class="form-control" name="descricao" cols="30" rows="5" required>{$plano.descricao}</textarea>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                                
                                        <label class="col-lg-2 control-label">Status</label>
                                            
                                        <section class="col-lg-10">
                                                
                                            <section class="radios">
                                        
                                                <label class="label_radio" for="radio-01"><input name="status" id="radio-01" value="1" type="radio" {if $plano.status == 1} checked="checked" {/if}/> Ativo</label>
                                                
                                                <label class="label_radio" for="radio-02"><input name="status" id="radio-02" value="0" type="radio"
                                                {if $plano.status == 0} checked="checked" {/if} /> Inativo</label>

                                            </section><!-- /radios -->
                                                
                                        </section><!-- /col-lg-10 -->
                                            
                                    </section><!-- /form-group -->

                                    <section class="form-group">
                                          
                                        <section class="col-lg-offset-2 col-lg-10">
                                              
                                            <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> {if $plano.id}Editar{else}Salvar{/if}</button>
                                            <button class="btn btn-default" onclick="$('#editar').val(2);" type="submit"><i class="fa fa-plus-circle"></i> {if $plano.id}Editar{else}Salvar{/if} e adicionar outro</button>
                                            <span>ou <a href="{$admin_url}/planos/listar-planos-instituicoes">voltar a listagem</a></span>
                                              
                                        </section><!-- /col-lg-offset-2 col-lg-10 --> 
                                          
                                    </section><!-- /form-group --> 
                                      
                                </form>

                            </section><!-- /panel-body --> 
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
              
            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->

        <!-- Modal - Deletar Plano -->
        <section class="modal fade modal-alert" id="deletarPlano" tabindex="-1" role="dialog" aria-labelledby="deletarPlano" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Deletar Plano</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">Você deseja fazer isso?</section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Não</button>
                        <button class="btn btn-danger" type="submit">Sim</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
    </section><!-- /container -->
