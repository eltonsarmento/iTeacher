        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="dashboard.html"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="relatorios-saques.html">Relatórios</a></li>
                            <li class="active">Detalhes Saque</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Detalhes Saque</strong></header>
                            
                            <section class="panel-body">
                                
                                <form class="form-horizontal tasi-form">
                                    
                                    <section class="form-group">
                                        
                                        <label class="col-lg-2 control-label">Status</label>
                                        
                                        <section class="col-lg-10">
                                            
                                            <p class="form-control-static">
                                                <strong>
                                                    {if $detalheSaque.status eq 0}
                                                        Aguardando pagamento
                                                    {else if $detalheSaque.status eq 1}
                                                        Pago
                                                    {else if $detalheSaque.status eq 2}
                                                        Cancelado
                                                    {/if}
                                                </strong>
                                            </p>
                                            
                                        </section><!-- /col-lg-10 -->
                                        
                                    </section><!-- /form-group -->
                                                                    
                                    <section class="form-group">
                                        
                                        <label class="col-lg-2 control-label">Código</label>
                                        
                                        <section class="col-lg-10">
                                            
                                            <p class="form-control-static"><strong>{$detalheSaque.codigo}</strong></p>
                                            
                                        </section><!-- /col-lg-10 -->
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="col-lg-2 control-label">Data</label>
                                        
                                        <section class="col-lg-10">
                                            
                                            <p class="form-control-static"><strong>{$detalheSaque.data|date_format:"%d/%m/%Y"}</strong></p>
                                            
                                        </section><!-- /col-lg-10 -->
                                        
                                    </section><!-- /form-group -->
                                                                        
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Valor</label>
                                        
                                        <section class="col-lg-10">
                                              
                                             <p class="form-control-static"><strong class="text-primary">R$ {$detalheSaque.valor}</strong></p> 
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="col-lg-2 col-sm-2 control-label">Razão social</label>
                                        
                                        <section class="col-lg-10">
                                            
                                            <p class="form-control-static"><strong>{$usuario_dados.razao_social}</strong></p>
                                            
                                        </section><!-- /col-lg-10 -->
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="col-lg-2 control-label">CPF</label>
                                        
                                        <section class="col-lg-10">
                                            
                                            <p class="form-control-static"><strong>{$usuario_dados.cpf}</strong></p>
                                            
                                        </section><!-- /col-lg-10 -->
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Banco</label>
                                        
                                        <section class="col-lg-10">
                                              
                                             <p class="form-control-static"><strong>{$detalheSaque.nome}</strong></p> 
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Agência</label>
                                        
                                        <section class="col-lg-10">
                                              
                                             <p class="form-control-static"><strong>{$detalheSaque.agencia}</strong></p> 
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Conta</label>
                                        
                                        <section class="col-lg-10">
                                              
                                             <p class="form-control-static"><strong>{$detalheSaque.conta}</strong></p> 
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Tipo</label>
                                        
                                        <section class="col-lg-10">
                                              
                                             <p class="form-control-static">
                                                <strong>
                                                    {if $detalheSaque.tipo eq 1}
                                                        Conta Corrente
                                                    {else if $detalheSaque.tipo eq 2}
                                                        Poupança
                                                    {/if}
                                                </strong>
                                            </p> 
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">NFe</label>
                                        
                                        <section class="col-lg-10">
                                              
                                             <p class="form-control-static"><a href="#" target="_blank">Visualizar</a></p> 
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Comprovante</label>
                                        
                                        <section class="col-lg-10">
                                              
                                             <p class="form-control-static"><a href="#" target="_blank">Download</a></p> 
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                
                                </form>
                                
                            </section><!-- /panel-body -->
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->

        
        <!-- Modal - Nova conta -->
        <section class="modal fade modal-primary" id="novaConta" tabindex="-1" role="dialog" aria-labelledby="novaConta" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Adicionar nova conta bancária</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <form class="form-horizontal" role="form">
                            
                            <section class="form-group">
                                
                                <label class="col-lg-2 control-label">Banco</label>
                                
                                <section class="col-lg-10">
                                    
                                    <input type="text" class="form-control" required>
                                    
                                </section><!-- /col-lg-10 -->
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="col-lg-2 control-label">Agência</label>
                                
                                <section class="col-lg-10">
                                    
                                    <input type="text" class="form-control" data-mask="9999-9" required>
                                    
                                </section><!-- /col-lg-10 -->
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="col-lg-2 control-label">Conta</label>
                                
                                <section class="col-lg-10">
                                    
                                    <input type="text" class="form-control" data-mask="99.999-9" required>
                                    
                                </section><!-- /col-lg-10 -->
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="col-lg-2 control-label">Tipo</label>
                                
                                <section class="col-lg-10">
                                    
                                    <select class="form-control" required>
                                        
                                        <option value="" selected>Selecione</option>
                                        <option value="">Conta Corrente</option>
                                        <option value="">Conta Poupança</option>
                                        
                                    </select>
                                    
                                </section><!-- /col-lg-10 -->
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <section class="col-lg-offset-2 col-lg-10">
                                    
                                    <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Salvar</button>
                                    
                                </section><!-- /col-lg-10 -->
                                
                            </section><!-- /form-group -->
                            
                        </form>
                    
                    </section><!-- /modal-body -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
    </section><!-- /container -->
