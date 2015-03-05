		<section id="main-content">
          
            <section class="wrapper site-min-height">
              
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
							<li><a href="{$admin_url}/areas/listar">Áreas</a></li>
                            <li class="active">Editar Área</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

                {if $msg_alert}
                    <div class="alert alert-info">{$msg_alert}</div>
                {/if}

                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Editar - Área</strong></header>
                            
                            <section class="panel-body">
                                
                                <form class="form-horizontal tasi-form" method="post" action="">
                                     <input type="hidden" value="1" name="editar" id="editar"/>
                                    <input type="hidden" value="{$area.id}" name="id"/>
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Área</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="area" type="text" value="{$area.area}" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Pai</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <select class="form-control" name="area_pai_id" required>
                                                    
												<option value="0" selected>Nenhuma</option>
												{foreach from=$areas item=area_pai}
												<option value="{$area_pai.id}" {if $area_pai.id == $area.pai} selected {/if}>{$area_pai.area}</option> 
												{/foreach}
														
											</select>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->

                                    <section class="form-group">
                                          
                                        <section class="col-lg-offset-2 col-lg-10">
                                              
                                            <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Salvar</button>
                                            <span>ou <a href="{$admin_url}/areas/listar">voltar a listagem</a></span>
                                              
                                        </section><!-- /col-lg-offset-2 col-lg-10 --> 
                                          
                                    </section><!-- /form-group --> 
                                      
                                </form>

                            </section><!-- /panel-body --> 
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row --> 
              
            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
		
		<!-- Modal - Deletar Área -->
        <section class="modal fade modal-alert" id="deletarArea" tabindex="-1" role="dialog" aria-labelledby="deletarArea" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    <input type="hidden" value="" id="id_apagar" name="id_apagar" />
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Deletar Área</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">Você deseja fazer isso?</section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Não</button>
                        <button class="btn btn-danger" onclick="javascript:confirmaDeletar();" type="submit">Sim</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
{literal}
<script type="text/javascript">
function setaDeletar(id) {
    $('#id_apagar').val(id);
}
function confirmaDeletar() {
    window.location.href='{/literal}{$admin_url}{literal}/areas/apagar/' + $('#id_apagar').val();
}
</script>
{/literal}
<script src="{$url_site}{$admin_dir}common/assets/nestable/jquery.nestable.js"></script>
<script src="{$url_site}{$admin_dir}common/js/nestable.js"></script>