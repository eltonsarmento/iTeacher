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
                                
                            <input type="text" name="palavra_busca" class="form-control">
                                
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
                                        <tr>
                                            
                                            <td>{$aluno.nome}</td>
                                            <td>{$aluno.email}</td>
                                            <td class="hidden-xs">{$aluno.cep}</td>
                                            <td class="hidden-xs">{$aluno.cpf}</td>
                                            <td class="hidden-xs">{$aluno.telefone}</td>
                                            <td>
                                                <a data-toggle="modal" href="#visualizarHistorico" onclick="getVendasByAluno({$aluno.id});" class="btn btn-success btn-xs tooltips" data-original-title="Histórico" data-placement="bottom"><i class="fa fa-folder"></i></a>
                                            </td>
                                            
                                        </tr>
                                        {/foreach}
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen --> 
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-12 -->

                    <section class="text-center">
                            
                            <ul class="pagination">
                                
                                {$paginacao.anterior}
                                {$paginacao.page_string}
                                {$paginacao.proxima} 
                                
                            </ul>
                            
                        </section>
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
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

                tabela = tabela + "<tr><td><a href='{/literal}{$admin_url}{literal}/vendas/detalhes/"+this.id+"'>"+this.numero+"</a></td><td>"+curso+"</td><td><span class='label label-"+label+"'><i class='fa fa-check-circle'></i> "+status+"</span></td><td>"+this.data_convertida+"</td><td>R$ "+this.valor_total+"</td></tr>";  
            }
            
        });

        $('#span_nomeEmailAluno').html("<h4>"+dados[0].aluno['nome']+" - <small>"+dados[0].aluno['email']+"</small></h4>");
        $('#tbody_vendasaluno').html(tabela);
    });
}

</script>
{/literal}