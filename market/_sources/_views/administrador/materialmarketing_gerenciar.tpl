
        
        <section id="main-content">
          
            <section class="wrapper site-min-height">

                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Gerenciar Material</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <a href="{$admin_url}/materialmarketing/novo" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar novo</a>
                        <a href="{$admin_url}/materialmarketing/listarErros" class="btn btn-danger"><i class="fa fa-question-circle"></i> Erro materiais</a>

                    </section><!-- /col-lg-12 -->
                    
                </section><!-- /row -->
                
                <br>
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Todos os Materiais</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-file"></i> Material</th>
                                            <th><i class="fa fa-archive"></i> Categoria</th>
                                            <th><i class="fa fa-calendar"></i> Publicado</th>
                                            <th><i class="fa fa-clock-o"></i> Última Modificação</th>
                                            <th><i class="fa fa-cog"></i> Tamanho</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach item=material from=$materiais}     
                                        <tr>
                                            
                                            <td><a href="{$admin_url}/materialmarketing/editar/{$material.id}">{$material.material}</a></td>
                                            <td>{if $material.nome_categoria == null}N/a{else} {$material.nome_categoria} {/if}</td>
                                            <td>{$material.data_cadastro|date_format:"%d/%m/%Y"}</td>
                                            <td>{$material.data_modificacao|date_format:"%d/%m/%Y"}</td>
                                            <td>{$material.tamanho}</td>
                                            <td>
                                                
                                                <a href="{$admin_url}/materialmarketing/editar/{$material.id}" class="btn btn-primary btn-xs tooltips" data-original-title="Editar" data-placement="bottom"><i class="fa fa-pencil"></i></a>
                                                <a data-toggle="modal" href="#deletarMaterial" onclick="deletar({$material.id});" class="btn btn-danger btn-xs tooltips" data-original-title="Excluir" data-placement="bottom"><i class="fa fa-trash-o"></i></a>
                                                
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
                        
                        <a href="{$admin_url}/materialmarketing/novo" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar novo</a>
                        <a href="{$admin_url}/materialmarketing/listarErros" class="btn btn-danger"><i class="fa fa-question-circle"></i> Erro materiais</a>

                    </section><!-- /col-lg-12 -->
                    
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
        <footer class="site-footer">
            
            <section class="text-center">2014 &copy; CursosIAG.<a href="#" class="go-top"><i class="fa fa-angle-up"></i></a></section>
            
        </footer>
    
        <!-- Modal - Deletar Material -->
    
        <section class="modal fade modal-alert" id="deletarMaterial" tabindex="-1" role="dialog" aria-labelledby="deletarMaterial" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Deletar Material</h4>
                        
                    </section><!-- /modal-header -->
                    <div id="retorno-deletar"></div>
                    <section class="modal-body">Você deseja fazer isso?</section><!-- /modal-body -->
                    
                    <section class="modal-footer">
                        <input type="hidden" class="form-control" id="codigoMarketing" >
                        <button data-dismiss="modal" class="btn btn-default" type="button">Não</button>
                        <button class="btn btn-danger" id="botaoDeletar" type="submit">Sim</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
    </section><!-- /container -->

{literal}
<script type="text/javascript">
function deletar(mkt_id) {   
    $('#codigoMarketing').val(mkt_id);
}

$('#botaoDeletar').click(function(e){
    e.preventDefault();
    var mkt_id = $('#codigoMarketing').val();

    $.post('{/literal}{$admin_url}{literal}/materialmarketing/deletarMarketing', {id:mkt_id}, function (json) {
        reload();
        $('#retorno-deletar').html('<div class="alert alert-info">Item Excluído com sucesso!</div>');        
    });

    $("#footerModalDetelar").html('<a href="#" onclick="reload();" data-dismiss="modal" id="botaoNãoDetetar" class="btn btn-default" type="button">Fechar</a>');

});
function reload(){
   window.location.href = '{/literal}{$admin_url}{literal}/materialmarketing/listar'; 
}
</script>
{/literal}



    