
        
        <section id="main-content">
          
            <section class="wrapper site-min-height">

                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Gerenciar Categorias</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <a data-toggle="modal" href="#novaCategoria" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar nova</a>

                    </section><!-- /col-lg-12 -->
                    
                </section><!-- /row -->
                
                <br>
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Todos as Categorias</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-archive"></i> Categoria</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach item=categoria from=$categorias}       
                                        <tr>                                                                                 
                                            <td>{$categoria.categoria}</td>
                                            <td>                                                
                                                <a data-toggle="modal" href="#editarCategoria" class="btn btn-primary btn-xs tooltips" data-original-title="Editar" data-placement="bottom" onclick="buscarValores({$categoria.id});"><i class="fa fa-pencil"></i></a>
                                                <a data-toggle="modal" href="#deletarCategoria" class="btn btn-danger btn-xs tooltips" data-original-title="Excluir" data-placement="bottom" onclick="deletar({$categoria.id});"><i class="fa fa-trash-o"></i></a>
                                            </td>                                            
                                        </tr>
                                        {/foreach}
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen --> 
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <a data-toggle="modal" href="#novaCategoria" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar nova</a>

                    </section><!-- /col-lg-12 -->
                    
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
        
    
        <!-- Modal - Deletar Categoria -->
    
        <section class="modal fade modal-alert" id="deletarCategoria" tabindex="-1" role="dialog" aria-labelledby="deletarCategoria" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Deletar Categoria</h4>
                        
                    </section><!-- /modal-header -->
                     
                    <section  class="modal-body">
                        <div id="retorno-deletar"></div> 
                        <br>
                        Você deseja fazer isso?</section><!-- /modal-body -->
                    
                    <section class="modal-footer" id="footerModalDetelar">
                        <input type="hidden" class="form-control" id="codigoCategoria" >
                        <!-- <button data-dismiss="modal" class="btn btn-default" type="button">Não</button> -->
                        <a href="#" onclick="reload();" data-dismiss="modal" id="botaoNãoDetetar" class="btn btn-default" type="button">Não</a>
                        <a href="#" id="botaoDeletar" class="btn btn-danger" type="submit">Sim</a>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
        <!-- Modal - Nova Categoria -->
    
        <section class="modal fade modal-primary" id="novaCategoria" tabindex="-1" role="dialog" aria-labelledby="novaCategoria" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Nova Categoria</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <div id="retorno-form-cadastro"></div>

                        <form class="form-horizontal tasi-form" id="form-modal" onsubmit="salvarCampos();return false;">                                                                            
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">Categoria</label>
                                
                                <section class="col-lg-10">
                                    
                                    <input type="text" class="form-control" id="inputCategoria" name="categoria" required>
                                
                                </section><!-- /col-lg-10 -->
                            
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <section class="col-lg-offset-2 col-lg-10">
                                    
                                    <button class="btn btn-success" ><i class="fa fa-check-circle"></i> Salvar</button>
                                
                                </section><!-- /col-lg-10 -->
                            
                            </section><!-- /form-group -->
                        
                        </form>
                    
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" onclick="reload();" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
        <!-- Modal - Editar Categoria -->
    
        <section class="modal fade modal-primary" id="editarCategoria" tabindex="-1" role="dialog" aria-labelledby="editarCategoria" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Editar Categoria</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <div id="retorno-form"></div>

                        <form class="form-horizontal tasi-form" id="form-modal-atualizar" onsubmit="atualizarCampos();return false;">
                        
                            <input type="hidden" id="categoria_id_modal" name="categoria_id"/>  

                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">Categoria</label>
                                
                                <section class="col-lg-10">
                                    
                                    <input type="text" class="form-control" name="categoria" id="categoria_modal" required>
                                
                                </section><!-- /col-lg-10 -->
                            
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <section class="col-lg-offset-2 col-lg-10">
                                    
                                    <button class="btn btn-success" ><i class="fa fa-check-circle"></i> Salvar</button>
                                
                                </section><!-- /col-lg-10 -->
                            
                            </section><!-- /form-group -->
                        
                        </form>
                    
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" onclick="reload();" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
    </section><!-- /container -->
{literal}
<script type="text/javascript">
function buscarValores(categoria_id) {
    $.post('{/literal}{$admin_url}{literal}/materialmarketing/buscarCampos', {categoria:categoria_id}, function html(json){
        $('#retorno-form').html('');        
        dados = jQuery.parseJSON(json);        
        $('#categoria_id_modal').val(categoria_id);
        $('#categoria_modal').val(dados.categoria);        
    });
}
function deletar(categoria_id) {
    $('#codigoCategoria').val(categoria_id);
}

$('#botaoDeletar').click(function(e){
    e.preventDefault();
    var categoria_id = $('#codigoCategoria').val();
    $.post('{/literal}{$admin_url}{literal}/materialmarketing/deletarCategoria', {id:categoria_id}, function (json){        
        $('#retorno-deletar').html('<div class="alert alert-info">Item Excluído com sucesso!</div>');        
    });

    $("#footerModalDetelar").html('<a href="#" onclick="reload();" data-dismiss="modal" id="botaoNãoDetetar" class="btn btn-default" type="button">Fechar</a>');

});
function salvarCampos() {
    $.post('{/literal}{$admin_url}{literal}/materialmarketing/salvarDados', $('#form-modal').serialize(), function(json) {
        $('#retorno-form-cadastro').html('<div class="alert alert-info">Cadastrado com sucesso!</div>');
    });

    $('#inputCategoria').val('');

}
function atualizarCampos() {
    $.post('{/literal}{$admin_url}{literal}/materialmarketing/salvarDados', $('#form-modal-atualizar').serialize(), function(json) {
        $('#retorno-form').html('<div class="alert alert-info">Atualizado!</div>');        
    });
}

function reload(){
   window.location.href = '{/literal}{$admin_url}{literal}/materialmarketing/listarCategorias'; 
}

</script>



{/literal}    
   