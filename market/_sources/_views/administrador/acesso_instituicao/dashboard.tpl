        <section id="main-content">
          
            <section class="wrapper site-min-height">

                <section class="row state-overview">
                    
                    <section class="col-lg-12">
                    
                        <section class="panel">
                            
                            <section class="panel-body text-center"><h4 class="text-margin-no">Instituição <strong>{$nome_instituicao}</strong></h4></section><!-- /panel-body -->
                        
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-12 -->
                    
                    <section class="col-lg-12">
                    
                        <section class="border-head"><h3>Resumo de Estatísticas</h3></section>
                        
                    </section><!-- /col-lg-12 -->
                    
                    <section class="col-lg-4">
                            
                        <section class="panel">
                            
                            <section class="symbol gray"><i class="fa fa-user"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">{$qtd_alunos}</h1>
                                <p>Alunos</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-4 -->
                    
                    <section class="col-lg-4">
                            
                        <section class="panel">
                            
                            <section class="symbol gray"><i class="fa fa-users"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">{$qtd_professores}</h1>
                                <p>Professores</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-4 -->

                    <section class="col-lg-4">
                            
                        <section class="panel">
                            
                            <section class="symbol gray"><i class="fa fa-shopping-cart"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">{$qtd_vendas}</h1>
                                <p>Vendas</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-4 -->
                    
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                    
                        <section class="border-head"><h3>Material Marketing</h3></section>
                        
                    </section><!-- /col-lg-12 -->
                    {foreach item=categoria from=$categorias}
                    <section class="col-lg-3">
                        
                        <section class="panel">
                            
                            <section class="panel-heading">{$categoria.categoria}</section><!-- /panel-heading -->
                            
                            <section id="unseen">
                                
                                <table class="table table-hover file-search">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th>Arquivo</th>
                                            <th class="hidden-xs">Publicado</th>
                                            <th></th>
                                        
                                        </tr>
                                    
                                    </thead>
                                    
                                    <tbody>
                                        {foreach item=material from=$categoria.materiais} 
                                        <tr>
                                            
                                            <td>
                                                
                                                <img alt="" src="{$url_site}market/common/market/img/file-search/zip.png">
                                                <strong> {$material.material}</strong>
                                                
                                            </td>
                                            
                                            <td class="hidden-xs">{$material.data_cadastro|date_format:"%d/%m/%Y"}</td>
                                            <td><a href="{$material.link}" target="_blank" class="btn btn-info btn-xs tooltips" data-original-title="Download" data-placement="bottom"><i class="fa fa-download"></i></a></td>
                                        
                                        </tr>
                                        {/foreach}
                                    </tbody>
                            
                                </table>
                                
                            </section><!-- /unseen --> 
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-3 -->
                    {/foreach}
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->