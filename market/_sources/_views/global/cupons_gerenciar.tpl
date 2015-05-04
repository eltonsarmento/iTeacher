
        
        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Gerenciar Cupons</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    
                    {if $visao_adm eq false}
                        <section class="col-lg-12">
                            <section class="col-lg-8">                                
                                <a href="{$admin_url}/cupons/novo" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar novo</a>
                            </section>    
                            <section class="col-lg-4">
                                <form>
                                    <section class="input-group m-bot15">                                    
                                        <input type="text" name="palavra_busca" class="form-control">                                    
                                    <span class="input-group-btn"><button type="submit" class="btn btn-white"><i class="fa fa-search"></i></button></span>                                    
                                    </section><!-- /input-group -->
                                </form>
                            </section>
                        </section><!-- /col-lg-12 -->
                    {else}
                        <section class="col-lg-4">
                            <form>
                                <section class="input-group m-bot15">                                    
                                    <input type="text" name="palavra_busca" class="form-control">                                    
                                <span class="input-group-btn"><button type="submit" class="btn btn-white"><i class="fa fa-search"></i></button></span>                                    
                                </section><!-- /input-group -->
                            </form>
                        </section>
                    {/if}
                </section><!-- /row -->
                
                <br/>
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Todos os Cupons</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-tag"></i> Cupom</th>
                                            <th><i class="fa fa-bookmark-o"></i> Tipo</th>
                                            <th><i class="fa fa-refresh"></i> Status</th>
                                            <th><i class="fa fa-flag"></i> Utilizações</th>
                                            <th><i class="fa fa-user"></i> Criado por</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        
                                        {foreach item=cupom from=$cupons}
                                        <tr>
                                            
                                            <td><a href="{$admin_url}/cupons/editar/{$cupom.id}"><span class="label label-default">{$cupom.nome}</span></a></td>
                                            <td>
                                                {if $cupom.tipo == 1}Único{/if}
                                                {if $cupom.tipo == 2}Intervalo de Tempo{/if}
                                                {if $cupom.tipo == 3}Quantidade{/if}
                                                {if $cupom.tipo == 4}Indeterminado{/if}
                                            </td>
                                            <td>
                                            {if $cupom.ativo == 1}
                                            <span class="label label-success">Ativo</span>
                                            {else}
                                            <span class="label label-danger">Inativo</span>
                                            {/if}
                                            </td>
                                            <td>{$cupom.utilizacao}</td>
                                            <td>{$cupom.usuario}</td>
                                            <td>
                                                {if $visao_adm eq false}
                                                    <a href="{$admin_url}/cupons/editar/{$cupom.id}" class="btn btn-primary btn-xs tooltips" data-original-title="Editar" data-placement="bottom"><i class="fa fa-pencil"></i></a>
                                                    <a data-toggle="modal" href="#deletarCupom" onclick="javascript:setaExcluir({$cupom.id});" class="btn btn-danger btn-xs tooltips" data-original-title="Excluir" data-placement="bottom"><i class="fa fa-trash-o"></i></a> |
                                                    <a data-toggle="modal" href="#visualizarPedidos" onclick="javascript:consultaCumpom({$cupom.id},'{$cupom.nome}');" class="btn btn-success btn-xs tooltips" data-original-title="Pedidos" data-placement="bottom"><i class="fa fa-shopping-cart"></i></a>
                                                {else}
                                                    <a data-toggle="modal" href="#visualizarPedidos" onclick="javascript:consultaCumpom({$cupom.id},'{$cupom.nome}');" class="btn btn-primary btn-xs tooltips" data-original-title="Pedidos" data-placement="bottom"><i class="fa fa-shopping-cart"></i></a>
                                                {/if}
                                            </td>
                                            
                                        </tr>
                                        {/foreach}
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen --> 
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row --> 
                {if $visao_adm eq false}
                    <section class="row">                        
                        <section class="col-lg-12">                                
                            <a href="{$admin_url}/cupons/novo" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar novo</a>
                        </section><!-- /col-lg-12 -->                    
                    </section><!-- /row -->
                {/if }
            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
        <!-- Modal - Deletar ALuno -->
        <section class="modal fade modal-alert" id="deletarCupom" tabindex="-1" role="dialog" aria-labelledby="deletarCupom" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Deletar Cupom</h4>
                        <input type="hidden" value="" id="id_excluir" name="id" />
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">Você deseja fazer isso?</section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Não</button>
                        <button class="btn btn-danger" onclick="javascript:confirmaExcluir();">Sim</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
        
        <!-- Modal Visualizar Pedidos -->
        
        <section class="modal fade modal-primary" id="visualizarPedidos" tabindex="-1" role="dialog" aria-labelledby="visualizarPedidos" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Visualizar Pedidos</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <h4 id="nome_cupom"></h4>
                        
                        <hr/>
                        
                        <section class="row">
                            
                            <section style="height: 328px;overflow: auto;">
                        
                            <table class="table table-striped table-hover">
                                        
                                <thead>
                                    
                                    <tr>
                                        
                                        <th>#</th>
                                        <th><i class="fa fa-envelope"></i> E-mail</th>
                                        
                                    </tr>
                                    
                                </thead>
                                
                                <tbody id="tbody_cupom">
                                    
                                    <tr>
                                        
                                        <td><a href="vendas-detalhes.html">1</a></td>
                                        <td>adriano@cursosiag.com.br</td>
                                        
                                    </tr>
                                    
                                                                        
                                </tbody>
                                
                            </table>
                                
                            </section>
                            
                        </section><!-- /row -->
                        
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
    </section><!-- /container -->


    <!-- JS -->
    
    <script type="text/javascript" language="javascript" src="assets/advanced-datatable/media/js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="js/respond.min.js" ></script>

    <!-- COMMON JS -->
    
    <script src="js/common-scripts.js"></script>


    {literal}
<script type="text/javascript">

//Delete
function setaExcluir(id) {
    $('#id_excluir').val(id);
}

//recusar
function confirmaExcluir() {
    window.location.href='{/literal}{$admin_url}{literal}/cupons/apagar/' + $('#id_excluir').val();
}



//historico do aluno
function consultaCumpom(id,nome){
    $('#nome_cupom').html(nome);
    $('#tbody_cupom').html('');
    $.post('{/literal}{$admin_url}{literal}/cupons/consultaCupom/'+id, function(json){
        dados = jQuery.parseJSON(json);
        
        var itens = "";

       $.each(dados, function(){
            itens = itens + "<tr><td><a href='#'>"+this.codigo+"</a></td><td>"+this.email+"</td></tr>";              
        });

        //$('#span_nomeEmailAluno').html("<h4>"+dados[0].aluno['nome']+" - <small>"+dados[0].aluno['email']+"</small></h4>");
        $('#tbody_cupom').html(itens);
    });
}

</script>
{/literal}

