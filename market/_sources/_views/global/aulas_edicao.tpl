<section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/cursos/listar">Cursos</a></li>
                            <li><a href="{$admin_url}/aulas/listar/{$curso_id}">{$cursoNome}</a></li>
                            <li class="active">{if $aula_id}Editar Aula{else}Adicionar Nova{/if}</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                {if $msg_alert}
                    <div class="alert alert-danger">{$msg_alert}</div>
                {else if $msg}
                    <div class="alert alert-success">{$msg}</div>
                {/if}
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>{if $aula_id}Editar Aula{else}Adicionar Nova{/if} - Capítulo {$capituloNome}</strong></header>
                            
                            <section class="panel-body" >
                                
                                <form id="form-aula" class="form-horizontal tasi-form" action="{$admin_url}/aulas/editar/" method="post">
                                    <input type="hidden" value="1" name="editar"/>
									<input type="hidden" value="{$capitulo_id}" name="id" />
									<input type="hidden" value="{$aula_id}" name="aula_id" />
									<input type="hidden" value="{$curso_id}" name="curso_id" />
									<input type="hidden" value="{$aulas.posicao}" name="posicao"/>
									<input type="hidden" value="0" name="nova" id="nova"/>
									
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Nome da Aula</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="nome" value="{$aulas.nome}" type="text" autofocus >
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Tipo da Aula</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <section class="radios">
                                            
                                                <label class="label_radio" for="radio-01"><input name="tipo" id="radio-01" value="1" type="radio" {if $aulas.tipo eq 1 || !$aulas.tipo}checked="checked"{/if} /> Vídeo Aula</label>
                                                    
                                                <label class="label_radio" for="radio-02"><input name="tipo" id="radio-02" value="2" type="radio" {if $aulas.tipo eq 2}checked="checked"{/if} /> PPT</label>
                                                    
                                                <label class="label_radio" for="radio-03"><input name="tipo" id="radio-03" value="3" type="radio" {if $aulas.tipo eq 3}checked="checked"{/if} /> PDF</label>
                                                
                                                <label class="label_radio" for="radio-04"><input name="tipo" id="radio-04" value="4" type="radio" {if $aulas.tipo eq 4}checked="checked"{/if} /> Texto</label>
                                                
                                                <label class="label_radio" for="radio-05"><input name="tipo" id="radio-05" value="5" type="radio" {if $aulas.tipo eq 5}checked="checked"{/if} /> Materias Extras</label>

                                            </section><!-- /radios -->
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group" id="tempo">
                                        
                                        <label class="control-label col-lg-2">Duração</label>
                                        
                                        <section class="col-lg-2">
                                            
                                            <section class="input-group m-bot15">
                                                
                                                <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                                <input class="form-control" name="duracao" value="{$aulas.duracao}" type="text" data-mask="99:99:99" >
                                                
                                            </section><!-- /input-group -->
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group" id="amazon">
                                        
                                        <label class="control-label col-lg-2">Link Amazon</label>
                                        
                                        <section class="col-lg-10">
                                            
                                            <section class="input-group m-bot15">
                                                
                                                <span class="input-group-addon"><i class="fa fa-cloud"></i></span>
                                                <input class="form-control" name="amazon" value="{$aulas.amazon}" type="text">
                                                
                                            </section><!-- /input-group -->
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group" id="vimeo">
                                        
                                        <label class="control-label col-lg-2">Link Vimeo</label>
                                        
                                        <section class="col-lg-10">
                                            
                                            <section class="input-group m-bot15">
                                                
                                                <span class="input-group-addon"><i class="fa fa-vimeo-square"></i></span>
                                                <input class="form-control" name="vimeo" value="{$aulas.vimeo}" type="text">
                                                
                                            </section><!-- /input-group -->
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group" id="youtube">
                                        
                                        <label class="control-label col-lg-2">Link Youtube</label>
                                        
                                        <section class="col-lg-10">
                                            
                                            <section class="input-group m-bot15">
                                                
                                                <span class="input-group-addon"><i class="fa fa-youtube-play"></i></span>
                                                <input class="form-control" name="youtube" value="{$aulas.youtube}" type="text">
                                                
                                            </section><!-- /input-group -->
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group" id="texto">
                                                
                                        <label class="col-lg-2 control-label">Texto</label>
                                            
                                        <section class="col-lg-10">
                                            
                                            <textarea class="wysihtml5 form-control" name="resumo" rows="10">{$aulas.resumo}</textarea>
                                                
                                        </section><!-- /col-lg-10 -->
                                            
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Aula Gratuita</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <select class="form-control m-bot15" name="gratuito">
                                                
                                                <option value="0" {if $aulas.gratuito eq 2}selected="selected"{/if}>Não</option>
												<option value="1" {if $aulas.gratuito eq 1}selected="selected"{/if}>Sim</option>
                                                
                                            </select>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->

                                    <section class="form-group">
                                          
                                        <section class="col-lg-offset-2 col-lg-10">
                                              
                                            <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Salvar</button>
											{if !$aula_id}
                                                <button class="btn btn-default" onclick="salvarAdicionar(); return false;" type="submit"><i class="fa fa-plus-circle"></i> Salvar e adicionar outra</button>
											{/if}
                                            <span>ou <a href="{$admin_url}/aulas/listar/{$curso_id}">voltar a listagem</a></span>
                                              
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
    function salvarAdicionar(){
        $('#editar').val(2);
        $('#nova').val(1);
        $('#form-aula').submit();
    }
        
    $(document).ready(function(){



        $('#texto').hide();
        
        
        var value = $('input[name=tipo]:checked').val();        
        for (i = 1; i <= 5; i++) { 
                if(value == 1){
                    $('#texto').hide();
                    $('#tempo').show();
                    $("#amazon").show();
                    $("#vimeo").show();
                    $("#youtube").show();
                } else if(value == 2){
                    $("#amazon").show();
                    $('#tempo').hide();
                    $("#vimeo").hide();
                    $("#youtube").hide();
                    $('#texto').hide();
                } else if(value == 3){
                    $("#amazon").show();
                    $('#tempo').hide();
                    $("#vimeo").hide();
                    $("#youtube").hide();
                    $('#texto').hide();
                } else if(value == 4){
                    $('#tempo').hide();
                    $("#amazon").hide();
                    $("#vimeo").hide();
                    $("#youtube").hide();
                    $("#texto").show();
            
                }else{
                    $("#amazon").show();
                    $('#tempo').hide();
                    $("#vimeo").hide();
                    $("#youtube").hide();
                    $('#texto').hide();
                }

        }        

        $("#radio-01").click(function(){          
            
            if($(this).is(":checked")){
                
                $('#texto').hide();
                $('#tempo').show();
                $("#amazon").show();
                $("#vimeo").show();
                $("#youtube").show();
            
            }           
            
        });
        
        $("#radio-02").click(function(){          
            alert('clicou');      
            if($(this).is(":checked")){

                $("#amazon").show();
                $('#tempo').hide();
                $("#vimeo").hide();
                $("#youtube").hide();
                $('#texto').hide();
            
            }           
            
        });
        
        $("#radio-03").click(function(){          
            
            if($(this).is(":checked")){

                $("#amazon").show();
                $('#tempo').hide();
                $("#vimeo").hide();
                $("#youtube").hide();
                $('#texto').hide();
            
            }           
            
        });
        
        $("#radio-04").click(function(){          
            
            if($(this).is(":checked")){
                
                $('#tempo').hide();
                $("#amazon").hide();
                $("#vimeo").hide();
                $("#youtube").hide();
                $("#texto").show();
            
            }           
            
        });
        
        $("#radio-05").click(function(){          
            
            if($(this).is(":checked")){

                $("#amazon").show();
                $('#tempo').hide();
                $("#vimeo").hide();
                $("#youtube").hide();
                $('#texto').hide();
            
            }           
            
        });


        
    });
    
    </script>
{/literal}