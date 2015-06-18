        <section id="main-content">
          
            <section class="wrapper site-min-height">
              
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Material Marketing</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

                {if $reportar_sucesso}
                    <div class="alert alert-success">Sua mensagem foi enviada com sucesso. Aguarde retorno!</div>
                {/if}
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        {foreach item=categoria from=$categorias}
                        <section class="panel">
                            <header class="panel-heading"><strong>Material Marketing - {$categoria.categoria}</strong></header>
                            <section class="panel-body">
                                
                                <section id="unseen">
                                    <table class="table table-hover file-search">
                                        
                                        <thead>
                                            <tr> 
                                                <th>Arquivo</th>
                                                <th class="hidden-xs">Publicado</th>
                                                <th class="hidden-xs">Última Modificação</th>
                                                <th>Tamanho</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                            {foreach item=material from=$categoria.materiais} 
                                            <tr>
                                                <td>
                                                    <img alt="" src="{$url_site}market/common/market/img/file-search/zip.png">
                                                    <strong>
                                                        <a href="{$material.link}" target="_blank"  data-original-title="Download" data-placement="bottom">
                                                            {$material.material}
                                                        </a>
                                                        
                                                    </strong>
                                                </td>
                                                <td class="hidden-xs">{$material.data_cadastro|date_format:"%d/%m/%Y"}</td>
                                                <td class="hidden-xs">{$material.data_modificacao|date_format:"%d/%m/%Y"}</td>
                                                <td>{$material.tamanho} KB</td>
                                                <td>
                                                    <a href="{$material.link}" target="_blank" class="btn btn-info btn-xs tooltips" data-original-title="Download" data-placement="bottom"><i class="fa fa-download"></i></a>
                                                    {if $visao_adm eq false}
                                                        <a data-toggle="modal" href="#reportarErro" class="btn btn-danger btn-xs tooltips" data-original-title="Reportar Erro" data-placement="bottom" onclick="setarCamposReportarError({$material.id}, '{$material.material}')"><i class="fa fa-question-circle"></i></a>
                                                    {/if}
                                                </td>
                                            
                                            </tr>
                                            {/foreach}
                                        </tbody>
                                
                                    </table>
                                    
                                </section><!-- /unseen --> 
                            
                            </section><!-- /panel-body --> 
                        
                        </section><!-- /panel --> 
                        {/foreach}
                    </section><!-- /col-lg-12 -->
                
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