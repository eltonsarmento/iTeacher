        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="dashboard.html"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Relatórios de Cupons</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                    
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-8">
                        
                        <a data-toggle="modal" href="#filtrarRelatorio" class="btn btn-info"><i class="fa fa-filter"></i> Filtrar Relatório</a>

                        <section class="btn-group">
                            
                            <button data-toggle="dropdown" class="btn btn-white dropdown-toggle" type="button"><i class="fa fa-download"></i> Exportar Dados <span class="caret"></span></button>
                            
                            <ul role="menu" class="dropdown-menu">
                                
                                <li><a href="{$admin_url}/relatorios/relatorio/?tipo=pdf&dados=cupons&tipo_cupom={$tipo}&ativo={$ativo}&palavra_busca={$palavra_busca}" target="_blank">Exportar em PDF</a></li>
                                <li><a href="{$admin_url}/relatorios/relatorio/?tipo=xls&dados=cupons&tipo_cupom={$tipo}&ativo={$ativo}" target="_blank">Exportar em XLS</a></li>
                                
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
                            
                            <header class="panel-heading"><strong>Relatórios de Cupons</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-tag"></i> Cupom</th>
                                             <th><i class="fa fa-bookmark-o"></i> Tipo</th>
                                            <th><i class="fa fa-refresh"></i> Status</th>
                                            <th><i class="fa fa-flag"></i> Utilizações</th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach from=$cupons item=cupom}
                                        <tr>
                                            
                                            <td><span class="label label-default">{$cupom.nome}</span></td>
                                            <!-- 1- Unico, 2 - Intervalo de tempo, 3 - quantidade e 4 - Indeterminado -->
                                            <td>
                                                {if $cupom.tipo eq 1}
                                                    Unico
                                                {else if $cupom.tipo eq 2}
                                                    Intervalo de tempo
                                                {else if $cupom.tipo eq 3}
                                                    Quantidade
                                                {else if $cupom.tipo eq 4}
                                                    Indeterminado
                                                {/if}
                                            </td>
                                            <td>
                                                {if $cupom.ativo eq 1}
                                                    Ativo
                                                {else}
                                                    Inativo
                                                {/if}
                                            </td>
                                            <td>{$cupom.utilizacao}</td>
                                            
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
                        
                        <form method="post" class="form-horizontal tasi-form">
                            <input type="hidden" name="filtrar" id="filtrar" value="1"/>
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">Tipo</label>
                                
                                <section class="col-lg-10">
        
                                    <select class="form-control" name="tipo">
                                        <!-- 1- Unico, 2 - Intervalo de tempo, 3 - quantidade e 4 - Indeterminado -->
                                        <option value="" selected>Tipo</option>
                                        <option value="1">Único</option>
                                        <option value="2">Intervalo de Tempo</option>
                                        <option value="3">Quantidade</option>
                                        <option value="4">Indeterminado</option>
                                    
                                    </select>
                                        
                                </section><!-- /col-lg-9 -->
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">Status</label>
                                
                                <section class="col-lg-10">
        
                                    <select class="form-control" name="ativo">
                                        
                                        <option value="" selected>Status</option>
                                        <option value="1">Ativo</option>
                                        <option value="0">Inativo</option>
                                    
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
