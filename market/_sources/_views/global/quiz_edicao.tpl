<section id="main-content">
          
            <section class="wrapper site-min-height">
              
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/cursos/listar">Cursos</a></li>
                            <li><a href="{$admin_url}/quiz/listar/7">{$curso} - Quizzes</a></li>
                            <li class="active">Editar Quiz</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

                {if $msg_alert}
                <div class="alert alert-danger">{$msg_alert}</div>
                {/if}

                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Editar Quiz</strong></header>
                            
                            <section class="panel-body">
                                
                                <form class="form-horizontal tasi-form" method="post">
                                    <input type="hidden" value="1" name="editar"/>
                                    <input type="hidden" value="{$quiz.curso_id}" name="curso_id"/>
                                    <input type="hidden" value="{$quiz.curso_id}" name="curso_id"/>
                                    <input type="hidden" value="0" name="nova" id="nova"/>
                                    <!-- PERGUNTA -->
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Pergunta</label>
                                        
                                        <section class="col-lg-10">
                                            <input class="form-control" name="pergunta" type="text" value="{$quiz.pergunta}" placeholder="Onde nós aplicamos o CSS?">
                                        </section>
                                        
                                    </section>
                                    
                                    <!-- RESPOSTA -->
                                    <section class="form-group ">
                                        
                                        <label class="control-label col-lg-2">Resposta</label>
                                        
                                        <!-- ALTERNATIVAS -->
                                        <section class="col-lg-10 res">

                                            {foreach item=alternativa key=k from=$quiz.alternativa}
                                            <section class="input-group m-bot15 resposta" id="resposta_0">
                                                <span class="input-group-addon">
                                                    <input type="radio" name="alternativa_correta" value="{$k}" {if $k == $quiz.alternativa_correta} checked="checked" {/if}>
                                                </span>
                                                <input type="text" name="alternativa[{$k}]" class="form-control" value="{$alternativa}">
                                            </section><!-- /input-group -->
                                            {/foreach}
                                              
                                        </section><!-- /col-lg-10 --> 
                                        <!-- FIM ALTERNATIVAS -->

                                        <!-- BOTAO ADICIONAR -->
                                        <section class="col-lg-offset-2 col-lg-10">
                                            <a href="#" class="btn btn-white btn-block text-mutted" id="addResposta"><i class="fa fa-plus-circle"></i> Adicionar nova</a>
                                        </section>
                                        <!-- FIM BOTAO ADICIONAR -->
                                        
                                    </section>
                                    

                                    <!-- CAPITULOS -->
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Capítulo</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <select class="form-control" id="select-capitulos" name="capitulo_id" onchange="buscarAula()">
                                                <option value="" selectd>Selecione o capítulo</option>
                                                {foreach item=capitulo key=k from=$capitulos}  
                                                <option value="{$capitulo}" {if $capitulo == $quiz.capitulo_id} selected {/if}>Capítulo {$k+1}</option>
                                                {/foreach}
                                            </select>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section>
                                    <!-- FIM CAPITULOS -->
                                    
                                    <!-- AULAS -->
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Aula</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <select class="form-control" name="aula_id" id="select-aulas">
                                                <option value="0">Selecione a aula</option>
                                                {foreach from=$aulas item=aula}
                                                    <option value="{$aula.aula_id}" {if $aula.aula_id == $quiz.aula_id} selected {/if}>{$aula.nome}</option>
                                                {/foreach}
                                            </select>
                                              
                                        </section>
                                        
                                    </section>
                                    <!-- FIM AULAS -->
                                    
                                    <!-- OBRIGATORIO -->
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Obrigatório</label>
                                        <section class="col-lg-10">
                                              
                                             <section class="btn-row">
                                                
                                                <section data-toggle="buttons">
                                                     
                                                    <label class="btn btn-success active" onclick="mudarObrigatorio('Sim')">
                                                        <input type="radio" name="obrigatorio" value="1" {if $quiz.obrigatorio == 1} checked="checked" {/if} > Sim
                                                    </label>
                                                    
                                                    <label class="btn btn-danger" onclick="mudarObrigatorio('Não')">
                                                        <input type="radio" name="obrigatorio" value="0" {if $quiz.obrigatorio != 1} checked="checked" {/if}> Não
                                                    </label>
                                                    
                                                    <span class="help-block">Status Atual: <strong id="status_atual">{if $quiz.obrigatorio == 1}Sim{else}Não{/if}</strong></span>
                                                     
                                                </section><!-- /btn-group --> 
                                            
                                            </section><!-- /btn-row --> 
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->

                                    <section class="form-group">
                                          
                                        <section class="col-lg-offset-2 col-lg-10">
                                              
                                            <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Salvar</button>
                                            <button class="btn btn-default" onclick="javascript:jQuery('#nova').val(1)"><i class="fa fa-plus-circle"></i> Salvar e adicionar outra</button>
                                            <span>ou <a href="{$admin_url}/quiz/listar/{$quiz.id}">voltar a listagem</a></span>
                                              
                                        </section><!-- /col-lg-offset-2 col-lg-10 --> 
                                          
                                    </section><!-- /form-group --> 
                                      
                                </form>

                            </section><!-- /panel-body --> 
                        
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
              
            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->

{literal}
<script>
$(document).ready(function(){
    {/literal}
    var count = {$quiz.alternativa|count};
    {literal}

    if (count == 0) {
        count++;
        $( ".res" ).append( "<section class='input-group m-bot15 resposta' id='resposta_"+count+"'><span class='input-group-addon'><input type='radio' name='alternativa_correta' value='" + count +"'></span><input type='text' name='alternativa[" + count + "]' class='form-control'></section><!-- /input-group -->" );
    }

    $('#addResposta').click(function(e){
        count++;
        e.preventDefault();
        $( ".res" ).append( "<section class='input-group m-bot15 resposta' id='resposta_"+count+"'><span class='input-group-addon'><input type='radio' name='alternativa_correta' value='" + count +"'></span><input type='text' name='alternativa[" + count + "]' class='form-control'></section><!-- /input-group -->" );
    });
});

function mudarObrigatorio(val) {  
    $('#status_atual').html(val);
}

function buscarAula() {
    var capitulo = jQuery('#select-capitulos').val();
    
    jQuery.post('{/literal}{$admin_url}{literal}/quiz/aulas/', {capitulo_id:capitulo}, function html(html) {jQuery('#select-aulas').html(html); });

}

            
    </script>
{/literal}