		<section id="main-content">
          
            <section class="wrapper site-min-height">
              
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Gerenciar Categoria</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-6">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Adicionar Nova</strong></header>

                            <section class="panel-body">
                                        
                                <form class="tasi-form" method="post" action="{$admin_url}/areas/editar">
                                    <input type="hidden" value="1" name="editar"/>
									<input type="hidden" value="{$area.id}" name="id"/>
                                    <section class="form-group">
                                        
                                        <label>Categoria</label>
                                                      
                                        <input class="form-control" name="area" value="{$area.area}" type="text" autofocus required>
                                                
                                    </section><!-- /form-group -->
                                            
                                    <section class="form-group">
                                        
                                        <label>Pai</label>
                                                      
                                        <select class="form-control" name="area_pai_id" required>
                                                    
                                            <option value="0" selected>Nenhuma</option>
                                            {foreach from=$areas item=area_pai}
											<option value="{$area_pai.id}" {if $area_pai.id eq $area.pai} selected {/if}>{$area_pai.area}</option> 
											{/foreach}
                                                    
                                        </select>
                                                
                                    </section><!-- /form-group -->
                                            
                                    <section class="form-group">
                                              
                                        <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Salvar</button>
                                          
                                    </section><!-- /form-group --> 
                                            
                                </form>
                            
                            </section><!-- /panel-body -->
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-6 -->
                    
                    <section class="col-lg-6">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Todas as Categoria</strong></header>

                            <section class="panel-body">
                                        
                                <p>Arraste os itens para colocá-los na ordem desejada.</p>
                                        
                                    <section class="dd" id="nestable_list_1">
                                    
                                        <ol class="dd-list">
                                            {foreach from=$areas_listagem item=area}
                                            <li class="dd-item dd3-item" data-id="{$area.id}">
                                                    
                                                <div class="dd-handle dd3-handle"></div>
                                                <div class="dd3-content"><a href="{$admin_url}/areas/editar/{$area.id}">{$area.area}</a> <a data-toggle="modal" href="#deletarArea" onclick="javascript:setaDeletar({$area.id});" class="pull-right"><i class="fa fa-trash-o"></i></a></div>
                                                {$area.filhas}
                                            </li>
                                            {/foreach}
                                                
                                        </ol>
                                        
                                </section><!-- /dd -->
                                <input type="hidden" id="nestable-output" value="" />
    
                                <hr/>
                                
                                <section class="form-group">
                                              
                                    <button class="btn btn-success" onclick="javascript:salvarPosicoes();" type="submit"><i class="fa fa-check-circle"></i> Salvar</button>
                                          
                                </section><!-- /form-group --> 
                            
                            </section><!-- /panel-body -->
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-6 -->
                
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
                        <h4 class="modal-title">Deletar Categoria</h4>
                        
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
<script src="{$url_site}{$admin_dir}common/assets/nestable/jquery.nestable.js"></script>
<script src="{$url_site}{$admin_dir}common/js/nestable.js"></script>


<script type="text/javascript">
jQuery('.preco').priceFormat();
$(document).ready(function() {
    
    var updateOutput = function (e) {
        var list = e.length ? e : $(e.target),
            output = list.data('output');
        if (window.JSON) {
            $('#nestable-output').val(window.JSON.stringify(list.nestable('serialize')));
            //alert(window.JSON.stringify(list.nestable('serialize')));
        } else {
            output.val('JSON browser support required for this demo.');
        }
    };
  // activate Nestable for list 1
   $('#nestable_list_1').nestable(
       {group: 1, maxDepth: 3}).on('change', updateOutput);
    // output initial serialised data
    //updateOutput($('#group{$capitulo.capitulo_id}').data('output', $('#group{$capitulo.capitulo_id}_output')));
});

function setaDeletar(id) {
    $('#id_apagar').val(id);
}
function confirmaDeletar() {
    window.location.href='{/literal}{$admin_url}{literal}/areas/apagar/' + $('#id_apagar').val();
}
function salvarPosicoes() {
    jQuery.post('{/literal}{$admin_url}{literal}/areas/salvar/', {posicoes: $('#nestable-output').val()}, function html(html) {
		alert('Salvo com sucesso!');
	});
}
</script>


{/literal}