<section id="main-content">
          
            <section class="wrapper site-min-height">
              
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/planos/listar">Planos</a></li>
                            <li class="active">{if $plano.id}Editar Plano{else}Adicionar Novo{/if}</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    {if $msg_alert}
                    <div class="alert alert-info">{$msg_alert}</div>
                    {else}
                    {/if}
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>{if $plano.id}Editar{else}Adicionar Novo{/if} - Plano</strong></header>
                            
                            <section class="panel-body">
                                
                                <form class="form-horizontal tasi-form" method="post" id="default">
                                    <input type="hidden" value="1" name="editar" id="editar"/>
                                    <input type="hidden" value="{$plano.id}" name="id"/>
                                    <input type="hidden" name="tipo" value="1">

									
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Plano</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="plano" type="text" value="{$plano.plano}" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Meses</label>
                                        
                                        <section class="col-lg-2">
                                            
                                            <section class="input-group m-bot15">
                                                
                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                <input class="form-control inteiro" name="meses" type="text" value="{$plano.meses}" {if $plano.id} disabled="" {else} required {/if}>
												{if $plano.id}
                                                    <input type="hidden" name="meses" value="{$plano.meses}" >
                                                {/if}
                                            </section><!-- /input-group -->
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Valor</label>
                                        
                                        <section class="col-lg-2">
                                            
                                            <section class="input-group m-bot15">
                                                
                                                <span class="input-group-addon">R$</span>
                                                <input class="form-control preco" name="valor"  maxlength="8" type="text" value="{$plano.valor}" {if $plano.id} disabled="" {else} required {/if}>
												{if $plano.id}
                                                    <input type="hidden" name="valor" value="{$plano.valor}" >
                                                {/if}
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
                                            
                                                    <label class="label_radio" for="radio-01"><input name="status" id="radio-01" value="1" type="radio" {if $plano.status == 1} checked="checked" {/if} /> Ativo</label>
                                                    
                                                    <label class="label_radio" for="radio-02"><input name="status" id="radio-02" value="0" type="radio" {if $plano.status == 0} checked="checked" {/if} /> Inativo</label>
                                                    

                                                </section><!-- /radios -->
                                                    
                                            </section><!-- /col-lg-10 -->
                                                
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                          
                                        <section class="col-lg-offset-2 col-lg-10">
                                              
                                            <button class="btn btn-success" name="salvar" value="1" type="submit"><i class="fa fa-check-circle"></i> {if $plano.id}Editar{else}Salvar{/if}</button>
											{if $plano.id eq 0}
                                            <button class="btn btn-default" onclick="$('#editar').val(2);" type="submit"><i class="fa fa-plus-circle"></i> Salvar e adicionar outro</button>
											{/if}
                                            <span>ou <a href="{$admin_url}/planos/listar">voltar a listagem</a></span>
                                              
                                        </section><!-- /col-lg-offset-2 col-lg-10 --> 
                                          
                                    </section><!-- /form-group --> 
                                      
                                </form>

                            </section><!-- /panel-body --> 
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
              
            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->

        {literal}
            <script src="/market/common/market/js/jquery.price_format.1.8.min.js"></script>
            <script src="/market/common/market/js/jquery.price_format.1.8.js"></script>
            <script>
                jQuery('.preco').priceFormat();
                jQuery('.inteiro').priceFormat({
                    centsLimit: 0,
                    limit:3
                });
            </script>
        {/literal}