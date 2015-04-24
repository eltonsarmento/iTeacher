<section id="main-content">
          
            <section class="wrapper site-min-height">
              
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/cursos/listar">Cursos</a></li>
                            <li class="active">{if $curso.id} Editar Curso{else} Adicionar Novo{/if}</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>{if $curso.id} Editar{else} Adicionar Novo{/if} - Curso</strong></header>
                            
                            <section class="panel-body">
                                
                                <section class="stepy-tab">
                                    
                                    <ul id="default-titles" class="stepy-titles clearfix">
                                        
                                        <li id="default-title-0" class="current-step">
                                            
                                            <div>Passo 1</div>
                                            
                                        </li>
                                        
                                        <li id="default-title-1" class="">
                                            
                                            <div>Passo 2</div>
                                            
                                        </li>
                                        
                                    </ul>

                                </section><!-- /stepy-tab -->
                                    
                                <form class="form-horizontal tasi-form" method="post" id="default" enctype="multipart/form-data">
                                    <input type="hidden" value="1" name="editar" />
									<input type="hidden" value="{$curso.id}" name="id" />
									{if $msg_alert}
                                        <div class="alert alert-danger">{$msg_alert}</div>
                                    {/if}
                                    <fieldset title="Passo 1" class="step" id="default-step-0">
                                            
                                        <legend></legend>
                                            
                                        <section class="form-group">
                                                
                                            <label class="col-lg-2 control-label">Nome do Curso</label>
                                                
                                            <section class="col-lg-10">
                                                    
                                                <input type="text" class="form-control" value="{$curso.curso}" name="curso" required>
                                                    
                                            </section><!-- /col-lg-10 -->
                                                
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                                
                                            <label class="col-lg-2 control-label">Tags</label>
                                                
                                            <section class="col-lg-10">
                                                    
                                                <input id="tagsinput" value="{$curso.tags}" name="tags" class="tagsinput" required/>
                                                    
                                            </section><!-- /col-lg-10 -->
                                                
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                                
                                            <label class="col-lg-2 control-label">Categoria</label>
                                                
                                            <section class="col-lg-10">
                                                    
                                                <section class="checkboxes">
                                                    {$areas_opcoes}                                                    
                                                </section><!-- /checkboxes -->
                                                    
                                            </section><!-- /col-lg-10 -->
                                                
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                                
                                            <label class="col-lg-2 control-label">Curso Gratuito</label>
                                                
                                            <section class="col-lg-10">
                                                    
                                                <section class="switch switch-square" data-on-label="Sim" data-off-label="Não">
                                                    
                                                    <input type="checkbox" name="gratuito" value="1" {if $curso.gratuito == 1} checked {/if} />
                                                
                                                </section><!-- /switch -->
                                                    
                                            </section><!-- /col-lg-10 -->
                                                
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                        
                                            <label class="control-label col-lg-2">Valor do Curso</label>
                                            
                                            <section class="col-lg-2">
                                                
                                                <section class="input-group m-bot15">
                                                    
                                                    <span class="input-group-addon">R$</span>
                                                    <input class="form-control preco" name="valor" maxlength="8" value="{$curso.valor}" type="text" required>
                                                    
                                                </section><!-- /input-group -->
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                                
                                            <label class="col-lg-2 control-label">Variações</label>
                                                
                                            <section class="col-lg-10">
                                                    
                                                <section class="checkboxes">
                                            <!-- 
                                                    <label class="label_check" for="checkbox-05"><input name="dvd" id="checkbox-05" value="1" type="checkbox" {if $curso.dvd}checked="checked"{/if} /> DVD</label> -->
                                                    <label class="label_check" id="label-dvd" for="checkbox-05"><input name="dvd" class="checkbox-dvd" id="checkbox-05" value="1" type="checkbox" {if $curso.dvd}checked="checked"{/if} /> DVD</label>
													
                                                    {if $certificado.produtos_certificado_tipo != 0}
                                                    <label class="label_check" for="checkbox-06"><input name="certificado" id="checkbox-06" value="1" type="checkbox" {if $curso.certificado}checked="checked"{/if} /> Certificado Impresso</label>
													{/if}
													
													{if $suporte.produtos_suporte_tipo != 0}
													<label class="label_check" for="checkbox-07"><input name="suporte" id="checkbox-07" value="1" type="checkbox" {if $curso.suporte}checked="checked"{/if} /> Suporte</label>
													{/if}
                                                    
                                                </section><!-- /checkboxes -->
                                                    
                                            </section><!-- /col-lg-10 -->
                                                
                                        </section><!-- /form-group -->
                                        
                                        {if $usuario_nivel eq 7}
                                            <input type="hidden" name="exibir_site" value="0"/>
                                        {else} 
                                            <section class="form-group">
                                                    
                                                <label class="col-lg-2 control-label">Exibir na home</label>
                                                    
                                                <section class="col-lg-10">
                                                        
                                                    <section class="switch switch-square" data-on-label="Sim" data-off-label="Não">
                                                        
                                                        <input type="checkbox" name="exibir_site" value="1" {if $curso.exibir_site eq 1}checked="checked"{/if} />
                                                    
                                                    </section><!-- /switch -->
                                                        
                                                </section><!-- /col-lg-10 -->
                                                    
                                            </section><!-- /form-group -->
                                        {/if}
                                        
                                        <section class="form-group">
                                                
                                            <label class="col-lg-2 control-label">Exibir no Banner</label>
                                                
                                            <section class="col-lg-10">
                                                    
                                                <section class="switch switch-square" data-on-label="Sim" data-off-label="Não">
                                                    
                                                    <input type="checkbox" name="banner" value="1" {if $curso.banner == 1}checked="checked"{/if} />
                                                
                                                </section><!-- /switch -->
                                                    
                                            </section><!-- /col-lg-10 -->
                                                
                                        </section><!-- /form-group -->
                                        <span id="frete"></span>
                                        
                                        <section class="form-group">
                                                
                                            <label class="col-lg-2 control-label">Servidor do Curso</label>
                                                
                                            <section class="col-lg-10">
                                                    
                                                <section class="radios">
                                            
                                                    <label class="label_radio" for="radio-03"><input name="servidor" id="radio-03" value="0" type="radio" {if $curso.servidor == 0}  checked="checked" {/if}/> Default</label>
                                                    
                                                    <label class="label_radio" for="radio-04"><input name="servidor" id="radio-04" value="1" type="radio" {if $curso.servidor == 1}  checked="checked" {/if} /> Amazon</label>
                                                    
                                                    <label class="label_radio" for="radio-05"><input name="servidor" id="radio-05" value="2" type="radio" {if $curso.servidor == 2}  checked="checked" {/if} /> Vimeo</label>
                                                    
                                                    <label class="label_radio" for="radio-06"><input name="servidor" id="radio-06" value="3" type="radio" {if $curso.servidor == 3}  checked="checked" {/if} /> Youtube</label>

                                                </section><!-- /radios -->
                                                    
                                            </section><!-- /col-lg-10 -->
                                                
                                        </section><!-- /form-group -->

                                    </fieldset>
                                        
                                    <fieldset title="Passo 2" class="step" id="default-step-2">
                                            
                                        <legend></legend>
                                            
                                        <section class="form-group">
                                                
                                            <label class="col-lg-2 control-label">Descrição do Curso</label>
                                                
                                            <section class="col-lg-10">
                                                
                                                <textarea class="wysihtml5 form-control" name="descricao" rows="10">{$curso.descricao}</textarea>
                                                    
                                            </section><!-- /col-lg-10 -->
                                                
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                        
                                            <label class="control-label col-lg-2">Imagem Destacada</label>
                                            
                                            <section class="controls col-lg-10">
                                                
                                                <section class="fileupload {if $curso.destaque_arquivo}fileupload-exists{else}fileupload-new{/if}" data-provides="fileupload">
                                                    
                                                    <span class="btn btn-white btn-file">
                                                        
                                                        <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Selecione a imagem</span>
                                                        <span class="fileupload-exists"><i class="fa fa-undo"></i> Alterar</span>
                                                        <input type="file" name="destaque_arquivo"  class="default" />
                                                        
                                                    </span>
                                                    
                                                    <span class="fileupload-preview" style="margin-left:5px;">{$curso.destaque_arquivo}</span>
                                                    
                                                    <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                                                    <span class="help-block">Tamanho: <strong>200 x 200</strong></span>
                                                    
                                                </section><!-- /fileupload -->
                                                
                                            </section><!-- /controls -->
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                        
                                            <label class="control-label col-lg-2">Banner do Curso</label>
                                            
                                            <section class="controls col-lg-10">
                                                
                                                <section class="fileupload {if $curso.banner_arquivo}fileupload-exists{else}fileupload-new{/if}" data-provides="fileupload">
                                                    
                                                    <span class="btn btn-white btn-file">
                                                        
                                                        <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Selecione a imagem</span>
                                                        <span class="fileupload-exists"><i class="fa fa-undo"></i> Alterar</span>
                                                        <input type="file" class="default" name="banner_arquivo" />
                                                        
                                                    </span>
                                                    
                                                    <span class="fileupload-preview" style="margin-left:5px;">{$curso.banner_arquivo}</span>
                                                    
                                                    <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                                                    <span class="help-block">Tamanho: <strong>200 x 200</strong></span>
                                                    
                                                </section><!-- /fileupload -->
                                                
                                            </section><!-- /controls -->
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                        
                                            <label class="control-label col-lg-2">Quantidade de Capítulos</label>
                                            
                                            <section class="col-lg-1">
                                                
                                                <input class="form-control" name="qt_capitulos" value="{$curso.qt_capitulos}" type="text" required>
                                                
                                            </section><!-- /col-lg-1 --> 
                                            
                                        </section><!-- /form-group -->
                                    
                                        <section class="form-group">
                                        
                                            <label class="control-label col-lg-2">Carga Horária</label>
                                            
                                            <section class="col-lg-1">
                                                
                                                <input class="form-control" name="carga_horaria" type="text" value="{$curso.carga_horaria}" required>
                                                
                                            </section><!-- /col-lg-1 --> 
                                            
                                        </section><!-- /form-group -->
                                        {if $categoria eq 'professor'}
                                        {else}
                                         <!-- PROFESSOR -->
                                        <section class="form-group">            
                                            <label class="control-label col-lg-2">Professor</label>
                                            <section class="col-lg-10">
                                                  
                                                <select id="selectize" name="professor_id" placeholder="Selecione o Professor">
                                                    <option value="">Selecione o Professor</option>
                                                    {foreach item=professor from=$professores}
                                                        <option value="{$professor.id}" {if $curso.professor_id eq $professor.id} selected="" {/if}>{$professor.nome} - {$professor.email}</option>
                                                    {/foreach}
                                                </select>
                                                  
                                            </section>
                                        </section>
                                        <!-- PROFESSOR -->
                                        {/if}
                                    </fieldset>
                                        
                                    <button type="submit" class="finish btn btn-success"><i class="fa fa-check-circle"></i> Finalizar</button>
                                        
                                </form>
                                
                            </section><!-- /panel-body -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
              
            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->


<script src="{$url_site}{$admin_dir}common/market/js/jquery.price_format.1.8.min.js"></script>
<script src="{$url_site}{$admin_dir}common/market/js/jquery.price_format.1.8.js"></script>
<script src="{$url_site}{$admin_dir}common/market/assets/bootstrap-select/selectize.js" ></script> 
{literal}
<script type="text/javascript">
jQuery('.preco').priceFormat();
//selectize
$('#selectize').selectize();

//Areas
$( ".checkbox-area" ).click(function() {
  
    var id = $(this).val();
    
    if($(this).attr("checked")=="checked"){        
        $(this).removeAttr("checked");
        $('label[id_secundario="'+ id +'"]').removeClass("label_check c_on").addClass("label_check c_off");
    } else{
        $(this).attr("checked","checked");     
        $('label[id_secundario="'+ id +'"]').removeClass("label_check c_off").addClass("label_check c_on");
    }
});

//DVD
$( ".checkbox-dvd" ).click(function() {  
    var id = $(this).val();
    if($(this).attr("checked")=="checked"){        
        $(this).removeAttr("checked");
        $('#label-dvd').removeClass("label_check c_on").addClass("label_check c_off");
        $('#frete').html('');
    } else{
        $(this).attr("checked","checked");     
        $('#label-dvd').removeClass("label_check c_off").addClass("label_check c_on");
        $('#frete').html('<section class="form-group" id="frete"><label class="col-lg-2 control-label">Frete</label><section class="col-lg-10"><section class="radios"><label id="label_gratuito" class="label_radio" for="radio-01"><input name="frete" id="radio-01" value="1" type="radio" {/literal}{if $curso.frete == 1}  checked="checked" {/if}{literal} /> Gratuito</label><label id="label_fixo" class="label_radio" for="radio-02"><input name="frete" id="radio-02" value="2" type="radio" {/literal}{if $curso.frete == 2}  checked="checked" {/if}{literal} /> Fixo</label><label id="label_calculado" class="label_radio" for="radio-03"><input name="frete" id="radio-03" value="3" type="radio" {/literal}{if $curso.frete == 3}  checked="checked" {/if}{literal} /> Calculado</label></section></section><!-- /radios --></section><!-- /col-lg-10 --><section class="form-group"><label class="control-label col-lg-2">Valor do Frete</label><section class="col-lg-2"><section class="input-group m-bot15"><span class="input-group-addon">R$</span><input class="form-control" value="{/literal}{$curso.valor_frete}{literal}" name="valor_frete" type="text" required></section><!-- /input-group --></section><!-- /col-lg-10 --> </section><!-- /form-group -->');
        $("#radio-01").click(function() {  
            $(this).attr("checked","checked");     
            $('#radio-02').removeAttr("checked");
            $('#radio-03').removeAttr("checked");
            $('#label_gratuito').addClass("label_radio r_on");
            $('#label_fixo').removeClass("label_radio r_on").addClass("label_radio");
            $('#label_calculado').removeClass("label_radio r_on").addClass("label_radio");
        });
        $("#radio-02").click(function() {  
            $(this).attr("checked","checked");     
            $('#radio-01').removeAttr("checked");
            $('#radio-03').removeAttr("checked");
            $('#label_fixo').addClass("label_radio r_on");
            $('#label_gratuito').removeClass("label_radio r_on").addClass("label_radio");
            $('#label_calculado').removeClass("label_radio r_on").addClass("label_radio");
        });
        $("#radio-03").click(function() {  
            $(this).attr("checked","checked");     
            $('#radio-02').removeAttr("checked");
            $('#radio-01').removeAttr("checked");
            $('#label_calculado').addClass("label_radio r_on");
            $('#label_gratuito').removeClass("label_radio r_on").addClass("label_radio");
            $('#label_fixo').removeClass("label_radio r_on").addClass("label_radio");
        });
    }
});



</script>
{/literal}
<!-- </body>
</html> -->
