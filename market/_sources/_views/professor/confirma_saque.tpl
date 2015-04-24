        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/financeiro/gerenciar">Gerenciar Financeiro</a></li>
                            <li class="active">Confirmação de Saque</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Gerenciar Financeiro</strong></header>
                            
                            <section class="panel-body">
                                
                                <ul class="summary-list">
                                    
                                    <li>
                                              
                                        Disponível: <strong class="text-success">R$ {$saldo_disponivel}</strong>
                                              
                                    </li>
                                    
                                    <li>
                                              
                                        A Receber: <strong class="text-primary">R$ {$saldo_receber}</strong>
                                              
                                    </li>
                                    
                                    <li>
                                              
                                        Bloqueado: <strong class="text-danger">R$ {$saldo_bloqueado}</strong>
                                              
                                    </li>
                                    
                                </ul>
                                
                                <section class="row">
                                
                                    <hr/>
                                    
                                </section>
                                {if $msg_alert}
                                    <section class="alert alert-info">
                                        
                                        <strong>Atenção. </strong>{$msg_alert}
                                    
                                    </section><!-- /alert -->
                                {else}
                                    <section class="alert alert-info">
                                        
                                        <strong>Atenção, </strong>confira atentamente os dados abaixo e clique em solicitar saque para continuar.
                                    
                                    </section><!-- /alert -->
                                {/if}
                                
                                
                                <form class="form-horizontal tasi-form" method="post">  
                                    <input type='hidden' name='saque' value='1'/>
                                    <input type='hidden' name='id_conta' value='{$dados_conta.id}'/>
                                    <input type='hidden' name='valor_saque' value='{$valor_sacar}'/>

                                    <p><strong>Titular da Conta</strong></p>
                                
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
                                    
                                    <p><strong>Dados Bancários</strong></p>
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Banco</label>
                                        
                                        <section class="col-lg-10">
                                              
                                             <p class="form-control-static"><strong>{$dados_conta.nome}</strong></p> 
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Agência</label>
                                        
                                        <section class="col-lg-10">
                                              
                                             <p class="form-control-static"><strong>{$dados_conta.agencia}</strong></p> 
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Conta</label>
                                        
                                        <section class="col-lg-10">
                                              
                                             <p class="form-control-static"><strong>{$dados_conta.conta}</strong></p> 
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Tipo</label>
                                        
                                        <section class="col-lg-10">
                                        {if $dados_conta.tipo eq 1}      
                                             <p class="form-control-static"><strong>Conta Corrente</strong></p> 
                                        {else if $dados_conta.tipo eq 2}
                                             <p class="form-control-static"><strong>Poupança</strong></p> 
                                        {/if}      
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Valor</label>
                                        
                                        <section class="col-lg-10">
                                              
                                             <p class="form-control-static"><strong class="text-primary">R$ {$valor_sacar}</strong></p> 
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                          
                                        <section class="col-lg-offset-2 col-lg-10">
                                              
                                            <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Solicitar Saque</button>
                                            <a href="{$admin_url}/financeiro/gerenciar" class="btn btn-default">Corrigir </a>
                                            
                                            <span class="text-danger">Apenas um saque por dia é permitido.</span>
                                              
                                        </section><!-- /col-lg-offset-2 col-lg-10 -->
                                          
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