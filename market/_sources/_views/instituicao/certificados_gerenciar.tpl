
        
        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="dashboard.html"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Gerenciar Certificados</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-8">
                        
                        <a data-toggle="modal" href="#filtrarRelatorio" class="btn btn-info"><i class="fa fa-filter"></i> Filtrar Relatório</a>

                        <section class="btn-group">
                            
                            <button data-toggle="dropdown" class="btn btn-white dropdown-toggle" type="button"><i class="fa fa-download"></i> Exportar Dados <span class="caret"></span></button>
                            
                            <ul role="menu" class="dropdown-menu">
                                
                                <li><a  href="{$admin_url}/relatorios/relatorio/?tipo=pdf&dados=certificadosGerenciar&palavra_busca={$palavra_busca}" target="_blank">Exportar em PDF</a></li>
                                    <li><a  href="{$admin_url}/relatorios/relatorio/?tipo=xls&dados=certificadosGerenciar&palavra_busca={$palavra_busca}" target="_blank">Exportar em XLS</a></li>
                                
                            </ul>
                            
                        </section><!-- /btn-group -->

                    </section><!-- /col-lg-8 -->
                    
                    <section class="col-lg-4">
                        <form>
                            <section class="input-group m-bot15">
                                    
                                <input type="text" name="palavra_busca"  class="form-control">
                                    
                                <span class="input-group-btn"><button type="submit" class="btn btn-white"><i class="fa fa-search"></i></button></span>
                                    
                            </section><!-- /input-group -->
                        </form>
                    </section><!-- /col-lg-4 -->
                    
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Gerenciar Certificados</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th>#</th>
                                            <th><i class="fa fa-user"></i> Aluno</th>
                                            <th><i class="fa fa-envelope"></i> E-mail</th>
                                            <th><i class="fa fa-book"></i> Curso</th>
                                            <th><i class="fa fa-calendar"></i> Emitido em</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach from=$certificados item=certificado}
                                        <tr>
                                            
                                            <td>{$certificado.id}</td>
                                            <td>{$certificado.aluno.nome}</td>
                                            <td>{$certificado.aluno.email}</td>
                                            <td>{$certificado.curso.curso}</td>
                                            <td>{$certificado.data_emissao|date_format:"%d/%m/%Y"}</td>
                                            <td>
                                                
                                                <!-- <a data-toggle="modal" href="#visualizarHistoricoCertificados" class="btn btn-success btn-xs tooltips" data-original-title="Histórico" data-placement="bottom"><i class="fa fa-folder"></i></a> -->
                                                <a href="{$admin_url}/certificados/certificado/{$certificado.matricula_curso_id}" target="_blank" class="btn btn-warning btn-xs tooltips" data-original-title="Download" data-placement="bottom"><i class="fa fa-upload"></i></a>
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
              
                
        <!-- Modal Visualizar Histórico de Certificados -->
        
        <section class="modal fade modal-primary" id="visualizarHistoricoCertificados" tabindex="-1" role="dialog" aria-labelledby="visualizarHistoricoCertificados" aria-hidden="true" style="display: none;">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">Visualizar Histórico</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <h4>Adriano Gianini - <small>adriano@cursosiag.com.br</small></h4>
                        
                        <hr>
                        
                        <section class="row">
                        
                            <table class="table table-striped table-hover">
                                        
                                <thead>
                                    
                                    <tr>
                                        
                                        <th>#</th>
                                        <th><i class="fa fa-book"></i> Curso</th>
                                        <th><i class="fa fa-calendar"></i> Emitido em</th>
                                        
                                    </tr>
                                    
                                </thead>
                                
                                <tbody>
                                    
                                    <tr>
                                        
                                        <td>1</td>
                                        <td>Curso de Web Design</td>
                                        <td>05/05/2014</td>
                                        
                                    </tr>
                                    
                                </tbody>
                                
                            </table>
                            
                        </section><!-- /row -->
                        
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
        
        <!-- Modal - Filtrar Relatorio -->
        
        <section class="modal fade modal-primary" id="filtrarRelatorio" tabindex="-1" role="dialog" aria-labelledby="filtrarRelatorio" aria-hidden="true" style="display: none;">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">Filtrar Relatório</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <form method="post" class="form-horizontal tasi-form">
                            <input type="hidden" name="filtrar" value="1">
                            <section class="form-group">
                    
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">De</label>
                                
                                <section class="col-lg-9">
        
                                    <section data-date-format="dd/mm/yyyy" data-date="{$dataMenos1Mes}" class="input-append date dpYears">
                                    
                                        <input type="text" readonly="" name='de' value="{$dataMenos1Mes}" size="16" class="form-control">
                                        
                                        <span class="input-group-btn add-on">
                                            
                                            <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                            
                                        </span>
                                        
                                    </section><!-- /date-->
                                        
                                </section><!-- /col-lg-9 -->
                                
                            </section><!-- /form-group -->
                                
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">Até</label>
                                
                                <section class="col-lg-9">
        
                                    <section data-date-format="dd/mm/yyyy" data-date="{$dataAtual}" class="input-append date dpYears">
                                    
                                        <input type="text" readonly="" name="ate" value="{$dataAtual}" size="16" class="form-control">
                                        
                                        <span class="input-group-btn add-on">
                                            
                                            <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                            
                                        </span>
                                        
                                    </section><!-- /date-->
                                        
                                </section><!-- /col-lg-9 -->
                                
                            </section><!-- /form-group -->
                                
                                <!-- CURSOS -->
                            <section class="form-group">
                                <label class="control-label col-lg-2">Curso</label>
                                <section class="col-lg-10">
                                      
                                    <select id="selectize-curso" name="cursos[]" multiple placeholder="Selecione o Curso">
                                        <option value=""></option> 
                                        {foreach item=curso from=$cursos}
                                            <option value="{$curso.id}" >{$curso.curso}</option>
                                        {/foreach}
                                    </select>

                                </section>
                            </section>
                                
                            
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

<script src="{$url_site}{$admin_dir}common/market/assets/bootstrap-select/selectize.js" ></script>
{literal}
<script>
//selectize
$('#selectize').selectize();
$('#selectize-curso').selectize({  
    plugins: ['remove_button']
});
</script>
{/literal}