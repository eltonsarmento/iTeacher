        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Administrador</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-8">
                        
                        <a href="{$admin_url}/administrador/novo" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar novo</a>

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
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Todos os administradores</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-user"></i> administrador</th>
                                            <th><i class="fa fa-envelope"></i> E-mail</th>
                                            <th class="hidden-xs"><i class="fa fa-truck"></i> CEP</th>
                                            <th class="hidden-xs"><i class="fa fa-credit-card"></i> CPF</th>
                                            <th class="hidden-xs"><i class="fa fa-phone"></i> Telefone</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                     <tbody>
                                        {foreach item=administrador key=k from=$administradores}
                                                <!-- DADOS MODAL -->
                                                 <input type="hidden" id="nome_{$k}" value="{$administrador.nome}"/>
                                                <input type="hidden" id="email_{$k}" value="{$administrador.email}"/>
                                                <input type="hidden" id="cep_{$k}" value="{$administrador.cep}"/>
                                                <input type="hidden" id="cpf_{$k}" value="{$administrador.cpf}"/>
                                                <input type="hidden" id="telefone_{$k}" value="{$administrador.telefone}"/>
                                                <input type="hidden" id="endereco_{$k}" value="{$administrador.endereco}"/>
                                                <input type="hidden" id="bairro_{$k}" value="{$administrador.bairro}"/>
                                                <input type="hidden" id="cidade_{$k}" value="{$administrador.cidade}"/>
                                                <input type="hidden" id="estado_{$k}" value="{$administrador.estado}"/>
                                                <!-- FIM DADOS MODAL -->
                                        <tr>
                                            <td>{$administrador.nome}</td>
                                            <td>{$administrador.email}</td>
                                            <td class="hidden-xs">{$administrador.cep}</td>
                                            <td class="hidden-xs">{$administrador.cpf}</td>
                                            <td class="hidden-xs">{$administrador.telefone}</td>
                                            <td>
                                                <a href="{$admin_url}/perfil/visualizar/{$administrador.id}" class="btn btn-success btn-xs tooltips" data-original-title="Visualizar" data-placement="bottom"><i class="fa fa-search"></i></a> 
                                                <a href="{$admin_url}/administrador/editar/{$administrador.id}" class="btn btn-primary btn-xs tooltips" data-original-title="Editar" data-placement="bottom"><i class="fa fa-pencil"></i></a>
                                                <a data-toggle="modal" href="#deletarAdministrador" onclick="deletar({$administrador.id});" class="btn btn-danger btn-xs tooltips" data-original-title="Excluir" data-placement="bottom"><i class="fa fa-trash-o"></i></a> 
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
                            
                        <a href="{$admin_url}/administrador/novo" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar novo</a>

                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

                <!-- PAGINACAO -->
                <section class="row">
                    <section class="col-lg-12">
                        <section class="text-center">
                            
                            <ul class="pagination">
                                {$paginacao.anterior}
                                {$paginacao.page_string}
                                {$paginacao.proxima}    
                            </ul>
                            
                        </section>
                    </section>
                </section>
                <!-- FIM PAGINACAO -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->

        
        <!-- Modal - Deletar ALuno -->
        <section class="modal fade modal-alert" id="deletarAdministrador" tabindex="-1" role="dialog" aria-labelledby="deletarAdministrador" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Deletar Administrador</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body" >
                        <div id="retorno-deletar"></div> 
                        <br>
                        Você deseja fazer isso?</section><!-- /modal-body -->
                    
                    <section class="modal-footer" id="footerModalDetelar">
                        <input type="hidden" class="form-control" id="codigoAdministrador" >
                        <a href="#" onclick="reload();" data-dismiss="modal" id="botaoNãoDetetar" class="btn btn-default" type="button">Não</a>
                        <a href="#" id="botaoDeletar" class="btn btn-danger" type="submit">Sim</a>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->            
{literal}
<script type="text/javascript">
function deletar(adm_id) {    
    $('#codigoAdministrador').val(adm_id);
}

$('#botaoDeletar').click(function(e){
    e.preventDefault();
    var adm_id = $('#codigoAdministrador').val();
    $.post('{/literal}{$admin_url}{literal}/administrador/deletarAdministrador', {id:adm_id}, function (json){        
        $('#retorno-deletar').html('<div class="alert alert-info">Item Excluído com sucesso!</div>');        
    });

    $("#footerModalDetelar").html('<a href="#" onclick="reload();" data-dismiss="modal" id="botaoNãoDetetar" class="btn btn-default" type="button">Fechar</a>');

});

function reload(){
   window.location.href = '{/literal}{$admin_url}{literal}/administrador/listar'; 
}
</script>
{/literal}    