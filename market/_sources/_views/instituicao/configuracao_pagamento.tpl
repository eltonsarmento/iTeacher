        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="dashboard.html"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Configurações de Pagamento</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                {if $msg_alert}
                    <div class="alert alert-info">{$msg_alert}</div>
                {/if}
                <section class="row">
                    
                    <section class="col-lg-6">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Configurações de Pagamento - Pagseguro</strong></header>
                            
                            <section class="panel-body">

                                <form class="form-horizontal tasi-form" role="form" method="post">
                                    <input type="hidden" name="editarPagseguro" value="1" id="editarPagseguro">
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">E-mail</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="pagseguro_email" value="{$pagseguro.pagseguro_email}" type="text" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Token</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="pagseguro_token" value="{$pagseguro.pagseguro_token}" type="text" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Status</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <select class="form-control" required name="pagseguro_status">
                                                <option {if $pagseguro.pagseguro_status eq 1}selected{else}{/if} value="1">Ativo</option>
                                                <option {if $pagseguro.pagseguro_status eq 0}selected{else}{/if} value="0">Inativo</option>
                                            </select>
                                              
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
                        
                    </section><!-- /col-lg-6 -->
                    
                    <section class="col-lg-6">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Configurações de Pagamento - Pagar.me</strong></header>
                            
                            <section class="panel-body">

                                <form class="form-horizontal tasi-form" role="form" method="post">
                                    <input type="hidden" name="editarPagarme" value="1" id="editarPagarme">
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Chave da API</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="pagarme_key_api" value="{$pagarme.pagarme_key_api}" type="text" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Chave de criptografia</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="pagarme_key_criptografia" value="{$pagarme.pagarme_key_criptografia}" type="text" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Status</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <select class="form-control" required name="pagarme_status">
                                                <option  {if $pagarme.pagarme_status eq 1}selected{else}{/if} value="1">Ativo</option>
                                                <option {if $pagarme.pagarme_status eq 0}selected{else}{/if} value="0">Inativo</option>
                                            </select>
                                              
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
                        
                    </section><!-- /col-lg-6 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
