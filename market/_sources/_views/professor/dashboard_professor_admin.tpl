<section id="main-content">
          
            <section class="wrapper site-min-height">

                <section class="row state-overview">
                    
                    {if $visao_adm eq true}
                        <section class="col-lg-12">
                        
                            <section class="panel">
                                
                                <section class="panel-body text-center"><h4 class="text-margin-no">Professor <strong>{$nome_usuario_visitado}</strong></h4></section><!-- /panel-body -->
                            
                            </section><!-- /panel -->
                            
                        </section>
                    {/if}

                    <section class="col-lg-12">
                    
                        <section class="border-head"><h3>Resumo Financeiro</h3></section>
                        
                    </section><!-- /col-lg-12 -->
                    
                    <section class="col-lg-4">
                            
                        <section class="panel">
                            
                            <section class="symbol green"><i class="fa fa-dollar"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">R$ {$saldo_disponivel}</h1>
                                <p>Saldo Disponível</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-4 -->
                    
                    <section class="col-lg-4">
                            
                        <section class="panel">
                            
                            <section class="symbol red"><i class="fa fa-dollar"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">R$ {$saldo_receber}</h1>
                                <p>Saldo a Receber</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-4 -->
                    
                    <section class="col-lg-4">
                            
                        <section class="panel">
                            
                            <section class="symbol yellow"><i class="fa fa-dollar"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">R$ {$saldo_bloqueado}</h1>
                                <p>Saldo Bloqueado</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-4 -->
                    
                    <section class="col-lg-12">
                    
                        <section class="border-head"><h3>Resumo de Estatísticas</h3></section>
                        
                    </section><!-- /col-lg-12 -->
                    
                    <section class="col-lg-4">
                            
                        <section class="panel">
                            
                            <section class="symbol gray"><i class="fa fa-user"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">{$alunos}</h1>
                                <p>Alunos</p>
                                
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
                    
                    <section class="col-lg-4">
                            
                        <section class="panel">
                            
                            <section class="symbol gray"><i class="fa fa-book"></i></section><!-- /symbol -->
                            
                            <section class="value">
                                
                                <h1 class="count">{$cursos}</h1>
                                <p>Cursos</p>
                                
                            </section><!-- /value -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-4 -->
                    
                </section><!-- /row -->

                <section class="row">
                    {if $reportar_sucesso}
                        <div class="alert alert-success">Sua mensagem foi enviada com sucesso. Aguarde retorno!</div>
                    {/if}

                </section>
                
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
                                            <td><a href="{$material.link}" target="_blank" class="btn btn-info btn-xs tooltips" data-original-title="Download" data-placement="bottom"><i class="fa fa-download"></i></a> <a data-toggle="modal" href="#reportarErro" class="btn btn-danger btn-xs tooltips" data-original-title="Reportar Erro" data-placement="bottom" onclick="setarCamposReportarError({$material.id}, '{$material.material}')"><i class="fa fa-question-circle"></i></a></td>
                                        {/foreach}
                                        </tr>
                                    </tbody>
                            
                                </table>
                                
                            </section><!-- /unseen --> 
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-3 -->
                    {/foreach}
                    
                    
                    
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->


        <!-- Modal - Reportar Erro -->
        <section class="modal fade modal-alert" id="reportarErro" tabindex="-1" role="dialog" aria-labelledby="reportarErro" aria-hidden="true">

            <section class="modal-dialog">
                <section class="modal-content">

                    <section class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Reportar Erro</h4>
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        <form role="form" method="post">
                            <input type="hidden" value="1" name="reportar_erro"/>
                            <input type="hidden" value="" name="material_id" id="material_erro_id"/>
                            <p>Nome do arquivo: <strong id="material_erro_arquivo"></strong></p>
                            
                            <section class="form-group">
                                <textarea class="form-control" cols="30" rows="5" name="descricao" required="required"></textarea>
                            </section><!-- /form-group -->

                            <button type="submit" class="btn btn-success"><i class="fa fa-check-circle"></i> Reportar</button>
                        </form>

                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section>
        <!-- FIM Modal - Reportar Erro -->
        
{literal}
<script type="text/javascript">
function setarCamposReportarError(id, material) {
    $('#material_erro_arquivo').html(material);
    $('#material_erro_id').val(id);
}
</script>
{/literal}