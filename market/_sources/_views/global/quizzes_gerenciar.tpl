
        
        <section id="main-content">
          
            <section class="wrapper site-min-height">
            
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/cursos/listar">Cursos</a></li>
                            <li class="active">{$curso.curso} - Quizzes</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                            
                        <a href="{$admin_url}/quiz/novo/{$curso.id}" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar novo </a>

                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <br/>
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Todos os Quizzes</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-question-circle"></i> Pergunta</th>
                                            <th><i class="fa fa-comment"></i> Respostas Cadastradas</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach item=quizz from=$quizzes}
                                        <tr>
                                            
                                            <td><a data-toggle="modal" href="#visualizarQuiz" onclick="detalharQuizz({$quizz.id})" data-original-title="Visualizar" data-placement="bottom">{$quizz.pergunta}</a></td>
                                            <td>{$quizz.quantidade_alternativas}</td>
                                            <td>
                                                
                                                <a data-toggle="modal"  href="#visualizarQuiz" class="btn btn-success btn-xs tooltips" data-original-title="Visualizar" onclick="detalharQuizz({$quizz.id})" data-placement="bottom"><i class="fa fa-search"></i></a>
                                                <a href="{$admin_url}/quiz/editar/{$quizz.id}" class="btn btn-primary btn-xs tooltips" data-original-title="Editar" data-placement="bottom"><i class="fa fa-pencil"></i></a>
                                                <a data-toggle="modal" onclick="deletarQuizz({$quizz.id});" class="btn btn-danger btn-xs tooltips" data-original-title="Excluir" data-placement="bottom"><i class="fa fa-trash-o"></i></a>
                                                
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
                            
                        <a href="{$admin_url}/quiz/listar/{$curso.id}" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar novo</a>

                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
              
            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->


        <!-- Modal - Deletar Quiz -->
        <section class="modal fade modal-alert" id="deletarQuiz" tabindex="-1" role="dialog" aria-labelledby="deletarQuiz" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Deletar Quiz</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">Você deseja fazer isso?</section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Não</button>
                        <button class="btn btn-danger" id="btnDeletar">Sim</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
        
        <!-- Modal - Visualizar Quiz -->
        <section class="modal fade modal-primary" id="visualizarQuiz" tabindex="-1" role="dialog" aria-labelledby="visualizarQuiz" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Visualizar Quiz</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <h4 id="pergunta">Onde nós aplicamos o CSS?</h4>
                        
                        <ul id="respostas">
                            

                        </ul>
                    
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->

{literal}
    <script type="text/javascript">
    function detalharQuizz(id){
        $.post('{/literal}{$admin_url}{literal}/quiz/detalhar/'+id, function(json){
            dados = jQuery.parseJSON(json);
            lista = "";
            alternativa_certa = "";
            console.log(dados);
            $.each(dados, function(){
                $("#pergunta").html(this.pergunta);     
                alternativa_certa = this.alternativa_correta;           
                $.each(this.alternativa, function(index, value){
                    if(index == alternativa_certa){
                        lista = lista + "<li><strong class='text-success'>"+value+"</strong></li>";    
                    } else {
                        lista = lista + "<li>"+value+"</li>";
                    }
                    
                    $("#respostas").html(lista);
                });                
            });
            
        });
    }

    function deletarQuizz(id){
        $('#deletarQuiz').modal('show');

        $('#btnDeletar').click(function(){
            window.location.href='{/literal}{$admin_url}{literal}/quiz/apagar/'+id;
        });


    }        
    </script>

{/literal}
        
            
        