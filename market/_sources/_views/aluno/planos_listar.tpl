
        <section id="main-content">
          
            <section class="wrapper site-min-height">

                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Assinaturas</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Assinaturas</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-credit-card"></i> Plano</th>
                                            <th class="hidden-xs"><i class="fa fa-calendar"></i> Quantidade de Meses</th>
                                            <th class="hidden-xs"><i class="fa fa-calendar"></i> Assinado</th>
                                            <th class="hidden-xs"><i class="fa fa-calendar"></i> Expiração</th>
                                            <th><i class="fa fa-bar-chart-o"></i> Status</th>
                                            <th class="text-center">Renovar</th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        
                                        {foreach item=plano from=$planos}
                                        <tr>
                                            
                                            <td>{$plano.nome}</td>
                                            <td class="hidden-xs">{$plano.meses}</td>
                                            <td class="hidden-xs">{$plano.data_periodo}</td>
                                            <td class="hidden-xs">{$plano.data_expiracao}</td>
                                            <td><span class="label 
                                                {if $plano.status == '1'}label-success
                                                {else}label-danger{/if}">
                                                {if $plano.status == 1}Ativo{else}Expirou{/if}</span></td>
                                            <td class="text-center">                                                 
                                                <a href="#" class="btn btn-sm 
                                                {if $plano.status == '1'} btn-success
                                                {else}disabled btn-danger{/if}
                                                 ">
                                                 {if $plano.status == 1}Renovar{else}Cancelada{/if}</a>
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
        