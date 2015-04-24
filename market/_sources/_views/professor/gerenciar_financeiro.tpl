        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="dashboard.html"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Gerenciar Financeiro</li>
                            
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
                                
                                <p><strong>Saques</strong></p>
                                
                                <br/>
                                {if $msg_alert}
                                 <section class="alert alert-info">
                                    
                                    {$msg_alert}
                                
                                </section>
                                {/if}
                                
                                <form class="form-horizontal tasi-form" method="post">
                                    <input type='hidden' name='verificar_dados' value='1'/>                                
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
                                        
                                        <label class="control-label col-lg-2">Conta</label>
                                        
                                        <section class="col-lg-10">
                                            
                                            <table class="table table-bordered">
                                                
                                                <thead>
                                                    
                                                    <tr>
                                                        
                                                        <th width="30">#</th>
                                                        <th>Nome do Banco</th>
                                                        <th>Agência</th>
                                                        <th>Conta</th>
                                                        <th>Tipo</th>
                                                        <th class="text-center">Verificada</th>
                                                    
                                                    </tr>
                                                
                                                </thead>
                                                
                                                <tbody>
                                                    {foreach from=$contas item=conta}
                                                    <tr>
                                                        
                                                        <td><input type="radio" name="id_conta" value="{$conta.id}"/></td>
                                                        <td>{$conta.nome}</td>
                                                        <td>{$conta.agencia}</td>
                                                        <td>{$conta.conta}</td>
                                                        <td>
                                                            {if $conta.tipo eq 1}
                                                                Conta corrente
                                                            {else if $conta.tipo eq 2}
                                                                Poupança
                                                            {/if}
                                                        </td>
                                                        <td class="text-center">
                                                            {if $conta.status eq 1}
                                                                <span class="label label-success"><i class="fa fa-check"></i> Sim</span>
                                                            {else if $conta.status eq 0}
                                                                <span class="label label-danger"><i class="fa fa-times"></i> Não</span>
                                                            {/if}
                                                        </td>
                                                    
                                                    </tr>
                                                    {/foreach}  
                                                </tbody>
                                            
                                            </table>
                                                    
                                            <a data-toggle="modal" href="#novaConta">Adicionar uma nova</a>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Valor do saque</label>
                                        
                                        <section class="col-lg-2">
                                            
                                            <section class="input-group m-bot15">
                                                
                                                <span class="input-group-addon">R$</span>
                                                <input class="form-control" name="valor_saque" data-decimal="." data-thousands="." id="valor_saque" type="text" required>
                                                
                                            </section><!-- /input-group -->
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                          
                                        <section class="col-lg-offset-2 col-lg-10">
                                              
                                             <button class="btn btn-success" type="submit"><i class="fa fa-arrow-circle-right"></i> Continuar</a></button>
                                              
                                        </section><!-- /col-lg-offset-2 col-lg-10 --> 
                                          
                                    </section><!-- /form-group --> 
                                
                                </form>
                                
                            </section><!-- /panel-body -->
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Relatórios de Saques</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-calendar"></i> Data</th>
                                            <th><i class="fa fa-barcode"></i> Código</th>
                                            <th><i class="fa fa-file"></i> NFe</th>
                                            <th><i class="fa fa-signal"></i> Status</th>
                                            <th><i class="fa fa-money"></i> Valor</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach from=$saques_efetuados item=saque}
                                        <tr>
                                            
                                            <td>{$saque.data|date_format:"%d/%m/%Y"}</td>
                                            <td>{$saque.codigo} - <a href="{$admin_url}/financeiro/detalhes/?codigo={$saque.codigo}">Ver detalhes</a></td>
                                            <td><a href="javascript:;" target="_blank">Visualizar</a></td>
                                            <td><span class="label 
                                                {if $saque.status eq 0 }label-primary 
                                                {else if $saque.status eq 1} label-success{else}label-danger{/if}"><i class="fa fa-exclamation-circle"></i> 
                                                {if $saque.status eq 0}
                                                    Aguardando pagamento
                                                {else if $saque.status eq 1}
                                                    Pago
                                                {else if $saque.status eq 2}
                                                    Cancelado
                                                {/if}
                                            </span></td>
                                            <td>R$ {$saque.valor}</td>
                                            {if $saque.comprovante}
                                            <td>
                                                <a href="{$url_site}market/uploads/comprovantes_saque/{$saque.comprovante}" class="btn btn-warning btn-xs tooltips" data-original-title="Comprovante" data-placement="bottom"><i class="fa fa-download"></i></a>
                                            </td>
                                            {else}
                                            
                                            {/if}
                                        </tr>
                                        {/foreach}
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen --> 
                        
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
                         <div id="retorno-form"></div>
                        <form class="form-horizontal" role="form" id="form-cadastro" onsubmit="salvarCampos();return false;">
                            
                            <section class="form-group">
                                
                                <label class="col-lg-2 control-label">Banco</label>
                                
                                <section class="col-lg-10">
                                    
                                    <input type="text" name="nome" class="form-control" required>
                                    
                                </section><!-- /col-lg-10 -->
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="col-lg-2 control-label">Agência</label>
                                
                                <section class="col-lg-10">
                                    
                                    <input type="text" name="agencia" class="form-control" data-mask="9999-9" required>
                                    
                                </section><!-- /col-lg-10 -->
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="col-lg-2 control-label">Conta</label>
                                
                                <section class="col-lg-10">
                                    
                                    <input type="text" name="conta" class="form-control" data-mask="99.999-9" required>
                                    
                                </section><!-- /col-lg-10 -->
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="col-lg-2 control-label">Tipo</label>
                                
                                <section class="col-lg-10">
                                    
                                    <select class="form-control" name="tipo" required>
                                        
                                        <option value="" selected>Selecione</option>
                                        <option value="1">Conta Corrente</option>
                                        <option value="2">Conta Poupança</option>
                                        
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
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button"  id="recarregar">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
    </section><!-- /container -->

{literal}
<script type="text/javascript">
function salvarCampos() {
    $.post('{/literal}{$admin_url}{literal}/contas/novo', $('#form-cadastro').serialize(), function(json) {
        $('#retorno-form').html('<div class="alert alert-info">Cadastrado com sucesso!</div>');
    });
}

$("#recarregar").click(function(){
    location.reload();
});
</script>
{/literal}  
