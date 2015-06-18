<section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Alunos</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-4">
                        <form method="post">
                            <section class="input-group m-bot15">
                                    
                                <input type="text" class="form-control" name="palavra_busca">
                                    
                                <span class="input-group-btn"><button type="submit" class="btn btn-white"><i class="fa fa-search"></i></button></span>
                                    
                            </section><!-- /input-group -->
                        </form>
                    </section><!-- /col-lg-4 -->

                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Todos os Alunos</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-user"></i> Aluno</th>
                                            <th><i class="fa fa-envelope"></i> E-mail</th>
                                            <th class="hidden-xs"><i class="fa fa-truck"></i> CEP</th>
                                            <th class="hidden-xs"><i class="fa fa-credit-card"></i> CPF</th>
                                            <th class="hidden-xs"><i class="fa fa-phone"></i> Telefone</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach item=aluno key=k from=$alunos}
                                                <!-- DADOS MODAL -->
                                                 <input type="hidden" id="nome_{$k}" value="{$aluno.nome}"/>
                                                <input type="hidden" id="email_{$k}" value="{$aluno.email}"/>
                                                <input type="hidden" id="cep_{$k}" value="{$aluno.cep}"/>
                                                <input type="hidden" id="cpf_{$k}" value="{$aluno.cpf}"/>
                                                <input type="hidden" id="telefone_{$k}" value="{$aluno.telefone}"/>
                                                <input type="hidden" id="endereco_{$k}" value="{$aluno.endereco}"/>
                                                <input type="hidden" id="bairro_{$k}" value="{$aluno.bairro}"/>
                                                <input type="hidden" id="cidade_{$k}" value="{$aluno.cidade}"/>
                                                <input type="hidden" id="estado_{$k}" value="{$aluno.estado}"/>
                                                <!-- FIM DADOS MODAL -->
                                        <tr>
                                            <td><a href="{$admin_url}/alunos/visualizar/{$aluno.id}">{$aluno.nome}</a></td>
                                            <td>{$aluno.email}</td>
                                            <td class="hidden-xs">{$aluno.cep}</td>
                                            <td class="hidden-xs">{$aluno.cpf}</td>
                                            <td class="hidden-xs">{$aluno.telefone}</td>
                                            {if $visao_adm eq false}
                                                <td>
                                                    <a href="{$admin_url}/alunos/visualizar/{$aluno.id}" class="btn btn-success btn-xs tooltips" data-original-title="Visualizar" data-placement="bottom"><i class="fa fa-search"></i></a> 
                                                    <a href="{$admin_url}/alunos/editar/{$aluno.id}" class="btn btn-primary btn-xs tooltips" data-original-title="Editar" data-placement="bottom"><i class="fa fa-pencil"></i></a>
                                                    {if empty($aluno.cursos)}
                                                        <a data-toggle="modal" href="#deletarAluno" onclick="javascript:setaDeletar({$aluno.id},'{$aluno.nome}');" class="btn btn-danger btn-xs tooltips" data-original-title="Excluir" data-placement="bottom"><i class="fa fa-trash-o"></i></a> |
                                                    {/if}
                                                    <a data-toggle="modal" href="#visualizarHistorico" onclick="getVendasByAluno({$aluno.id});" class="btn btn-success btn-xs tooltips" data-original-title="Histórico" data-placement="bottom"><i class="fa fa-folder"></i></a>
                                                </td>
                                            {else}
                                                <td>
                                                    <a href="{$admin_url}/alunos/visualizar/{$aluno.id}" class="btn btn-success btn-xs tooltips" data-original-title="Visualizar" data-placement="bottom"><i class="fa fa-search"></i></a>                                                
                                                    <a data-toggle="modal" href="#visualizarHistorico" onclick="getVendasByAluno({$aluno.id});" class="btn btn-primary btn-xs tooltips" data-original-title="Histórico" data-placement="bottom"><i class="fa fa-folder"></i></a>
                                                </td>
                                            {/if}
                                        </tr>
                                        {/foreach}
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen --> 
                        
                        </section><!-- /panel --> 
                        
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
        <section class="modal fade modal-alert" id="deletarAluno" tabindex="-1" role="dialog" aria-labelledby="deletarAluno" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Deletar Aluno</h4>
                        <input type="hidden" value="" id="id_apagar" name="id_apagar" />
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">Você deseja apagar o aluno : <strong id="nome_aluno"></strong> ?</section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Não</button>
                        <button class="btn btn-danger" onclick="javascript:confirmaDeletar();" type="submit">Sim</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->

         <!-- Modal Visualizar Histórico -->
        
        <section class="modal fade modal-primary" id="visualizarHistorico" tabindex="-1" role="dialog" aria-labelledby="visualizarHistorico" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Visualizar Histórico</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <span id="span_nomeEmailAluno"></span>
                        
                        <hr/>
                        
                        <section class="row">
                        
                            <table class="table table-striped table-hover">
                                        
                                <thead>
                                    
                                    <tr>
                                        
                                        <th>#</th>
                                        <th><i class="fa fa-book"></i> Cursos</th>
                                        <th><i class="fa fa-signal"></i> Status</th>
                                        <th><i class="fa fa-calendar"></i> Data</th>
                                        <th><i class="fa fa-money"></i> Valor</th>
                                        
                                    </tr>
                                    
                                </thead>
                                
                                <tbody id="tbody_vendasaluno">
                                    
                                    
                                    
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
{literal}
<script type="text/javascript">

//Edição
function setarValores(aluno) {
    jQuery("#modal_nome").html(jQuery("#nome_"+aluno).val());
    jQuery("#modal_email").html(jQuery("#email_"+aluno).val());
    jQuery("#modal_cep").html(jQuery("#cep_"+aluno).val());
    jQuery("#modal_endereco").html(jQuery("#endereco_"+aluno).val());
    jQuery("#modal_bairro").html(jQuery("#bairro_"+aluno).val());
    jQuery("#modal_cidade").html(jQuery("#cidade_"+aluno).val());
    jQuery("#modal_estado").html(jQuery("#estado_"+aluno).val());  
}

//historico do aluno
function getVendasByAluno(id){
    $.post('{/literal}{$admin_url}{literal}/vendas/vendasByAluno/'+id, function(json){
        dados = jQuery.parseJSON(json);
        
        tabela = "";
        curso = ""
        label = "";
        status = "";
       $.each(dados, function(){
            if(this.cursos){
                $.each(this.cursos, function(index, value){
                    curso = curso +value.curso+"<br>";
                });   
                if(this.status == 1){
                    label = "success";
                    status = "Aprovado";
                } else if(this.status == 0){
                    label = "info";
                    status = "Aguardando";
                } else if(this.status == 2){
                    label = "danger";
                    status = "Cancelado";
                }
                alert(tabela);
                tabela = tabela + "<tr><td><a href='vendas-detalhes.html'>"+this.numero+"</a></td><td>"+curso+"</td><td><span class='label label-"+label+"'><i class='fa fa-check-circle'></i> "+status+"</span></td><td>"+this.data_convertida+"</td><td>R$ "+this.valor_total+"</td></tr>";  
            }
            
        });

        $('#span_nomeEmailAluno').html("<h4>"+dados[0].aluno['nome']+" - <small>"+dados[0].aluno['email']+"</small></h4>");
        $('#tbody_vendasaluno').html(tabela);
    });
}

// DELEÇÃO//
function setaDeletar(aluno_id,aluno_descricao) {    
    $('#id_apagar').val(aluno_id);
    $("#nome_aluno").html(aluno_descricao);   
}
function confirmaDeletar() {
    window.location.href='{/literal}{$admin_url}{literal}/alunos/apagar/' + $('#id_apagar').val();
}
</script>
{/literal}