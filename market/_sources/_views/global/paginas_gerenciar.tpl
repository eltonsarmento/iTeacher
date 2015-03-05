
        
        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Gerenciar Páginas</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Todas Páginas</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-file"></i> Página</th>
                                            <th><i class="fa fa-clock-o"></i> Última Atualização</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        
                                        {foreach item=pagina from=$paginas}
                                                                                
                                        <tr>
                                            
                                            <td><a href="{$admin_url}/paginas/editar/{$pagina.id}">{$pagina.titulo}</a></td>
                                            <td>{$pagina.data_atualizacao|date_format:"%d/%m/%Y"}</td>
                                            <td>                                                
                                                <a href="#" target="_blank" class="btn btn-info btn-xs tooltips" data-original-title="Visualizar" data-placement="bottom"><i class="fa fa-search"></i></a> 
                                                <a href="{$admin_url}/paginas/editar/{$pagina.id}" class="btn btn-primary btn-xs tooltips" data-original-title="Editar" data-placement="bottom"><i class="fa fa-pencil"></i></a> |
                                                <a href="{$admin_url}/paginas/alterar/{$pagina.id}" 
                                                class="btn {if $pagina.status == 1} btn-success{else}btn-danger{/if} btn-xs tooltips" data-original-title="{if $pagina.status == 1}Ativado{else}Desativado{/if}" data-placement="bottom"><i class="fa {if $pagina.status == 1}fa-check{else}fa-times{/if}"></i></a>                                                                                                
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
        
        
    </section><!-- /container -->