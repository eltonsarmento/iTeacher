        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="dashboard.html"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Relatórios de Saques</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                    
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-8">
                        
                        <a data-toggle="modal" href="#filtrarRelatorio" class="btn btn-info"><i class="fa fa-filter"></i> Filtrar Relatório</a>

                        <section class="btn-group">
                            
                            <button data-toggle="dropdown" class="btn btn-white dropdown-toggle" type="button"><i class="fa fa-download"></i> Exportar Dados <span class="caret"></span></button>
                            
                            <ul role="menu" class="dropdown-menu">
                                
                                <li><a href="{$admin_url}/relatorios/relatorio/?tipo=pdf&dados=saques&data_de={$data_de}&data_ate={$data_ate}" target="_blank">Exportar em PDF</a></li>
                                <li><a href="{$admin_url}/relatorios/relatorio/?tipo=xls&dados=saques&data_de={$data_de}&cc={$data_ate}" target="_blank">Exportar em XLS</a></li>
                            </ul>
                            
                        </section><!-- /btn-group -->

                    </section><!-- /col-lg-8 -->
                    
                    <section class="col-lg-4">
                        <form method="post">
                            <section class="input-group m-bot15">
                                <input type="text" name="palavra_busca" class="form-control">
                                <span class="input-group-btn"><button type="submit" class="btn btn-white"><i class="fa fa-search"></i></button></span>
                            </section><!-- /input-group -->
                        </form>
                    </section><!-- /col-lg-4 -->
                    
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
                                                {if $saque.status eq 0} label-primary 
                                                {else if $saque.status eq 1}label-success{else}label-danger{/if}"><i class="fa fa-exclamation-circle"></i> 
                                                {if $saque.status eq 0}
                                                    Aguardando pagamento
                                                {else if $saque.status eq 1}
                                                    Pago
                                                {else if $saque.status eq 2}
                                                    Cancelado
                                                {/if}</span></td>
                                            <td>R$ {$saque.valor}</td>
                                            <td>
                                                <a href="{$url_site}market/uploads/comprovantes_saque/{$saque.comprovante}" class="btn btn-warning btn-xs tooltips" data-original-title="Comprovante" data-placement="bottom"><i class="fa fa-download"></i></a>
                                            </td>
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
        
        
        <!-- Modal - Filtrar Relatorio -->
        <section class="modal fade modal-primary" id="filtrarRelatorio" tabindex="-1" role="dialog" aria-labelledby="filtrarRelatorio" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Filtrar Relatório</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <form  class="form-horizontal tasi-form" method="post">
                            <input type="hidden" name="filtrar" id="filtrar" value="1"/>
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">De</label>
                                
                                <section class="col-lg-9">
        
                                    <section data-date-format="dd/mm/yyyy" data-date="18/03/2014" class="input-append date dpYears">
                                    
                                        <input type="text" readonly="" value="18/03/2014" name="de" size="16" class="form-control">
                                        
                                        <span class="input-group-btn add-on">
                                            
                                            <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                            
                                        </span>
                                        
                                    </section><!-- /date-->
                                        
                                </section><!-- /col-lg-9 -->
                                
                            </section><!-- /form-group -->
                                
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">Até</label>
                                
                                <section class="col-lg-9">
        
                                    <section data-date-format="dd/mm/yyyy" data-date="18/03/2014" class="input-append date dpYears">
                                    
                                        <input type="text" readonly="" value="18/03/2014" name="ate" size="16" class="form-control">
                                        
                                        <span class="input-group-btn add-on">
                                            
                                            <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                            
                                        </span>
                                        
                                    </section><!-- /date-->
                                        
                                </section><!-- /col-lg-9 -->
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">Status</label>
                                
                                <section class="col-lg-10">
        
                                    <select class="form-control" name="status">
                                        
                                        <option value="" selected>Status</option>
                                        <option value="1">Pagamento Efetuado</option>
                                        <option value="2">Pagamento Cancelado</option>
                                        <option value="0">Aguardando pagamento</option>
                                    
                                    </select>
                                        
                                </section><!-- /col-lg-9 -->
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <section class="col-lg-offset-2 col-lg-10">
                                    
                                    <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Filtrar</button>
                                    
                                </section><!-- /col-lg-10 -->
                                
                            </section><!-- /form-group -->
                            
                        </form>
                    
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
    </section><!-- /container -->

