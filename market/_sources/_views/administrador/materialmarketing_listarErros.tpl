
        
        <section id="main-content">
          
            <section class="wrapper site-min-height">

                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/materialmarketing/listar">Materiais</a></li>
                            <li class="active">Erro Materiais</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Erro Materiais</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-file"></i> Material</th>
                                            <th><i class="fa fa-question-circle"></i> Reportações</th>
                                            <th><i class="fa fa-comment"></i> Comentários</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach item=material from=$materiais}
                                        <tr>
                                            
                                            <td>{$material.material}</td>
                                            <td>{$material.quantidade}</td>
                                            <td><a data-toggle="modal" Onclick="buscarValores({$material.id});" href="#visualizarComentarios" >Visualizar Comentários</a></td>
                                            <td>                                                
                                                <a href="#corrigirErro" Onclick="setarValorCorrigir({$material.id});" class="btn btn-success btn-xs tooltips" data-toggle="modal" data-original-title="Corrigidir" ><i class="fa fa-check"></i></a>                                                
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
        
        
        <!-- Modal - Visualizar Comentários -->
    
        <section class="modal fade modal-primary" id="visualizarComentarios" tabindex="-1" role="dialog" aria-labelledby="visualizarComentarios" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Visualizar Comentários</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        <span id="cabecalho"></span>                                                
                        <hr/>   
                        <div id="corpoDescricao"></did>                         
                                                                    
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->

        <!-- Modal - Deletar Categoria -->
    
        <section class="modal fade modal-alert" id="corrigirErro" tabindex="-1" role="dialog" aria-labelledby="corrigirErro" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Corrigir Erro do Material Marketing</h4>
                        
                    </section><!-- /modal-header -->
                     <div id="retorno-corrigir"></div> 
                    <section  class="modal-body">Você deseja corrigir esse erro ?</section><!-- /modal-body -->
                    
                    <section class="modal-footer">
                        <input type="hidden" class="form-control" id="codigoMaterial" >
                        <!-- <button data-dismiss="modal" class="btn btn-default" type="button">Não</button> -->
                        <a href="#"  data-dismiss="modal" class="btn btn-default" type="button">Não</a>
                        <a href="#" Onclick="corrigirMaterial();"class="btn btn-danger" type="submit">Sim</a>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
    </section><!-- /container -->

    
    
{literal}
<script type="text/javascript">

function buscarValores(material_id) {

    $.post('{/literal}{$admin_url}{literal}/materialmarketing/buscarValores', {material:material_id}, function html(json){
        $('#retorno-form').html('');        
        dados = jQuery.parseJSON(json);
        campos = "";  
        $('#cabecalho').html('<h4>'+dados.nomeMaterial+' - <small>'+dados.nomeCategoria+'</small></h4>\
                        <p>Tamanho: <strong>'+dados.tamanho+'</strong></p>');

        $.each(dados.descricoes, function(){                           
            campos = campos + "<section><strong>"+this.usuario+"</strong><p>"+this.descricao+"</p></section>";
        });
        $('#corpoDescricao').html(campos);        
    });
}
function setarValorCorrigir(material_id){
   $("#codigoMaterial").val(material_id);
}
function corrigirMaterial() {

    var material_id = $("#codigoMaterial").val();
    $.post('{/literal}{$admin_url}{literal}/materialmarketing/corrigirMaterial', {material:material_id}, function html(json){        
    });
    $('#retorno-corrigir').html('<div class="alert alert-info">Atualizado!</div>');   
    window.location.href = '{/literal}{$admin_url}{literal}/materialmarketing/listarErros'; 
}


</script>
{/literal}    
