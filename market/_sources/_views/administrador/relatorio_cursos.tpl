
        <section id="main-content">
          
            <section class="wrapper site-min-height">

                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Relatórios Cursos</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-8">
                        
                        <a data-toggle="modal" href="#filtrarRelatorio" class="btn btn-info"><i class="fa fa-filter"></i> Filtrar Relatório</a>
                        
                        <section class="btn-group">
                            
                            <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown"><i class="fa fa-download"></i> Exportar Dados <span class="caret"></span></button>
                            
                            <ul class="dropdown-menu" role="menu">
                                
                                <li><a href="{$admin_url}/relatorios/relatorio/?tipo=pdf&dados=cursos" target="_blank">Exportar em PDF</a></li>
                                <li><a href="{$admin_url}/relatorios/relatorio/?tipo=xls&dados=cursos" target="_blank">Exportar em XLS</a></li>
                                
                            </ul>
                            
                        </section><!-- /btn-group -->
                        
                    </section><!-- /col-lg-8 -->
                    
                    <section class="col-lg-4">
                        <form>
                            <section class="input-group m-bot15">
                                    
                                <input type="text" name="palavra_busca" class="form-control">
                                    
                                <span class="input-group-btn"><button type="submit" class="btn btn-white"><i class="fa fa-search"></i></button></span>
                                    
                            </section><!-- /input-group -->
                        </form>
                    </section><!-- /col-lg-4 -->
                    
                </section><!-- /row -->
                
                <br>
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Relatórios Cursos</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-book"></i> Curso</th>
                                            <th><i class="fa fa-briefcase"></i> Criado Por</th>
                                            <th><i class="fa fa-shopping-cart"></i> Quantidade de Vendas</th>
                                            <th><i class="fa fa-money"></i> Total</th>
                                            <th class="hidden-xs"><i class="fa fa-laptop"></i> Área</th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach from=$cursos item=curso}
                                        <tr>
                                            
                                            <td>{$curso.curso}</td>
                                            <td><strong>{$curso.nivel_usu_cadastrador}</strong> - {$curso.cadastrado_por}</td>
                                            <td><strong>{$curso.vendas_deste_curso}</strong></td>
                                            <td><strong>R$ {$curso.total_valor_venda}</strong></td>
                                            <td class="hidden-xs">
                                                {foreach from=$curso.areas_curso item=areas}
                                                <span>{$areas.area}<br/></span>
                                                {/foreach}
                                            </td>
                                            
                                        </tr>
                                        {/foreach}    
                                        
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen --> 
                        
                        </section><!-- /panel --> 
                        
                        <section class="text-center">
                            
                            <ul class="pagination">
                                {$paginacao.anterior}
                                {$paginacao.page_string}
                                {$paginacao.proxima}    
                            </ul>
                            
                        </section><!-- /text-center -->
                        
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
                                
                                <label class="control-label col-lg-2">Filtrar por</label>
                                
                                <section class="col-lg-9">
        
                                    <section class="checkboxes">
                                            
                                        <label class="label_check" for="checkbox-01"><input name="professores" id="checkbox-01" value="1" type="checkbox"/> Professores</label>
                                        
                                        <label class="label_check" for="checkbox-02"><input name="instituicoes" id="checkbox-02" value="1" type="checkbox"/> Instituições</label>
    
                                    </section><!-- /checkboxes -->
                                        
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

    <!-- JS -->
