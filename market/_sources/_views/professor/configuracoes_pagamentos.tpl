        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Configurações de Pagamento</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel tasks-widget">
                            
                            <header class="panel-heading"><strong>Configurações de Pagamento</strong></header>
                            
                            <section class="panel-body">

                                <form role="form" method="post">
                                    <input type="hidden" id="pagamento_paypal" name="pagamento_paypal" value="{$pagamento.paypal_status}"/>
                                    <input type="hidden" id="pagamento_pagseguro" name="pagamento_pagseguro" value="{$pagamento.pagseguro_status}"/>
                                    <input type="hidden" id="pagamento_pagarme" name="pagamento_pagarme" value="{$pagamento.pagarme_status}"/>
                                    <input type="hidden" value="1" name="editar"/>
                                        
                                    <section class="task-content">
                                        
                                        <ul class="task-list">
                                            {if $pagamento.pagseguro_excluido eq 0} 
                                                <li>
                                                    <section class="task-title">
                                                        
                                                        <span class="task-title-sp">Pagseguro </span>
                                                        {if $pagamento.pagseguro_status eq 1} 
                                                            <span class="badge badge-sm label-success">Ativo</span>
                                                        {else}
                                                            <span class="badge badge-sm label-danger">Inativo</span>
                                                        {/if}                                                       
                                                        {if $visao_adm eq false}
                                                            <section class="pull-right">
                                                                
                                                                <button class="btn btn-success btn-xs tooltips" id="ativar_pagseguro" data-original-title="Ativar" data-placement="bottom" onclick="escolherPagamento(1, 'habilitar');" {if $pagamento.pagseguro_status eq 1} disabled="disabled" {/if}><i class="fa fa-check"></i></button>
                                                                <button class="btn btn-danger btn-xs tooltips" id="desativar_pagseguro" data-original-title="Desativar" data-placement="bottom" onclick="escolherPagamento(1, 'desabilitar');" {if $pagamento.pagseguro_status eq 0} disabled="disabled" {/if}><i class="fa fa-minus"></i></button>
                                                                
                                                            </section><!-- /pull-right -->
                                                        {/if}
                                                    </section><!-- /task-title -->
                                                    
                                                </li>
                                            {/if}

                                            {if $pagamento.paypal_excluido eq 0} 
                                                <li>
                                                    
                                                    <section class="task-title">
                                                        
                                                        <span class="task-title-sp">Paypal</span>
                                                        {if $pagamento.paypal_status eq 1} 
                                                            <span class="badge badge-sm label-success">Ativo</span>
                                                        {else}
                                                            <span class="badge badge-sm label-danger">Inativo</span>
                                                        {/if}
                                                        {if $visao_adm eq false}
                                                            <section class="pull-right">             
                                                                <button class="btn btn-success btn-xs tooltips" id="ativar_paypal"  data-original-title="Ativar" data-placement="bottom" onclick="escolherPagamento(2, 'habilitar');" {if $pagamento.paypal_status eq 1} disabled="disabled" {/if} ><i class="fa fa-check"></i></button>
                                                                <button class="btn btn-danger btn-xs tooltips" id="desativar_paypal" data-original-title="Desativar" data-placement="bottom" onclick="escolherPagamento(2, 'desabilitar');" {if $pagamento.paypal_status eq 0} disabled="disabled" {/if}><i class="fa fa-minus"></i></button>
                                                                
                                                            </section><!-- /pull-right -->
                                                        {/if}
                                                    </section><!-- /task-title -->
                                                    
                                                </li>
                                            {/if}
                                            {if $pagamento.pagarme_excluido eq 0} 
                                                <li>
                                                    
                                                    <section class="task-title">
                                                        
                                                        <span class="task-title-sp">Pagarme</span>
                                                        {if $pagamento.pagarme_status eq 1} 
                                                            <span class="badge badge-sm label-success">Ativo</span>
                                                        {else}
                                                            <span class="badge badge-sm label-danger">Inativo</span>
                                                        {/if}
                                                        {if $visao_adm eq false}
                                                            <section class="pull-right">             
                                                                <button class="btn btn-success btn-xs tooltips" id="ativar_pagarme"  data-original-title="Ativar" data-placement="bottom" onclick="escolherPagamento(3, 'habilitar');" {if $pagamento.pagarme_status eq 1} disabled="disabled" {/if} ><i class="fa fa-check"></i></button>
                                                                <button class="btn btn-danger btn-xs tooltips" id="desativar_pagarme" data-original-title="Desativar" data-placement="bottom" onclick="escolherPagamento(3, 'desabilitar');" {if $pagamento.pagarme_status eq 0} disabled="disabled" {/if}><i class="fa fa-minus"></i></button>
                                                                
                                                            </section><!-- /pull-right -->
                                                        {/if}
                                                    </section><!-- /task-title -->
                                                    
                                                </li>
                                            {/if}
                                        </ul>
                                        
                                    </section><!-- /task-content -->
                                    {if $visao_adm eq false}
                                        <section class="form-group">
                                                                  
                                            <!-- <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Salvar</button> -->
                               
                                        </section><!-- /form-group -->
                                    {/if}
                                 </form>
                                
                            </section><!-- /panel-body -->
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->

{literal}
    <script type="text/javascript">
        function escolherPagamento(valor, acao){
            if(acao == "habilitar"){
                if(valor == 1){
                    $('#pagamento_pagseguro').val(1);    
                    $("#ativar_pagseguro").attr("disabled", "disabled");
                    $("#desativar_pagseguro").removeAttr("disabled", "disabled");
                    
                    return false;
                }

                if(valor == 2){
                    $('#pagamento_paypal').val(1);    
                    $("#ativar_paypal").attr("disabled", "disabled");
                    $("#desativar_paypal").removeAttr("disabled", "disabled");                

                    return false;
                }
                if(valor == 3){
                    $('#pagamento_pagarme').val(1);    
                    $("#ativar_pagarme").attr("disabled", "disabled");
                    $("#desativar_pagarme").removeAttr("disabled", "disabled");                

                    return false;
                }
                return false;
            }else if(acao == "desabilitar"){
                if(valor == 1){
                    $('#pagamento_pagseguro').val(0);    
                    $("#ativar_pagseguro").removeAttr("disabled", "disabled");
                    $("#desativar_pagseguro").attr("disabled", "disabled");
                    
                    return false;
                }

                if(valor == 2){
                    $('#pagamento_paypal').val(0);    
                    $("#ativar_paypal").removeAttr("disabled", "disabled");
                    $("#desativar_paypal").attr("disabled", "disabled");                

                    return false;
                }

                if(valor == 3){
                    $('#pagamento_pagarme').val(0);    
                    $("#ativar_pagarme").removeAttr("disabled", "disabled");
                    $("#desativar_pagarme").attr("disabled", "disabled");                        

                    return false;
                }
                return false;
            }
            return false;
            

        }
    </script>
{/literal}       
     