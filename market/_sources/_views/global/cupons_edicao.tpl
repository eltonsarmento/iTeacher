
        
        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/cupons/listar">Cupons</a></li>
                            <li class="active">Adicionar Novo</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                {if $msg_alert}
                    <div class="alert alert-danger">{$msg_alert}</div>
                {/if}
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Adicionar Novo - Cupom</strong></header>
                            
                            <section class="panel-body">
                                
                                <form class="form-horizontal tasi-form" action="" method="post">
                                    <input type="hidden" value="1" name="editar"/>
                                    <input type="hidden" value="0" name="nova" id="nova"/>
                                    <input type="hidden" value="{$cupom.id}" name="id"/>                                    
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Cupom</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="nome" id="nome" value="{$cupom.nome}"type="text" autofocus required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Tipo</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <section class="radios">
                                            
                                                <label class="label_radio" for="radio-01"><input name="tipo" id="radio-01" value="1" type="radio" {if $cupom.tipo == 1} checked="checked"{/if}> Único</label>
                                                    
                                                <label class="label_radio" for="radio-02"><input name="tipo" id="radio-02" value="2" type="radio" {if $cupom.tipo == 2} checked="checked"{/if}> Intervalo de Tempo</label>
                                                    
                                                <label class="label_radio" for="radio-03"><input name="tipo" id="radio-03" value="3" type="radio" {if $cupom.tipo == 3} checked="checked"{/if}> Quantidade</label>
                                                
                                                <label class="label_radio" for="radio-04"><input name="tipo" id="radio-04" value="4" type="radio" {if $cupom.tipo == 4} checked="checked"{/if}> Indeterminado</label>

                                            </section><!-- /radios -->
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group" id="quantidade">
                                        
                                        <label class="control-label col-lg-2">Quantidade</label>
                                        
                                        <section class="col-lg-1">
                                            
                                            <div id="spinner1">
                                                
                                                <div class="input-group input-small">
                                                    
                                                    <input type="text" {if $cupom.tipo == 3} value="{$cupom.quantidade}" {else} value="0" {/if} class="spinner-input form-control" maxlength="3" readonly name="quantidade">
                                                    
                                                    <div class="spinner-buttons input-group-btn btn-group-vertical">
                                                        
                                                          <button type="button" class="btn spinner-up btn-xs btn-default"><i class="fa fa-angle-up"></i></button>
                                                        
                                                          <button type="button" class="btn spinner-down btn-xs btn-default"><i class="fa fa-angle-down"></i></button>
                                                        
                                                    </div>
                                                    
                                                </div>
                                                
                                            </div>
                                            
                                        </section><!-- /col-lg-1 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group" id="tempo">
                                        
                                        <label class="control-label col-lg-2">Tempo</label>
                                        
                                        <section class="col-lg-4">
                                            
                                            <section class="input-group input-large">
                                                
                                                <span class="input-group-addon">De</span>
                                                
                                                <input type="text" {if $cupom.tipo == 2} value="{$cupom.tempo_de}"{/if} class="form-control dpd1" name="tempo_de" data-date-format="dd/mm/yyyy">
                                                
                                                <span class="input-group-addon">Até</span>
                                                
                                                <input type="text" {if $cupom.tipo == 2} value="{$cupom.tempo_ate}"{/if}class="form-control dpd2" name="tempo_ate" data-date-format="dd/mm/yyyy">
                                                
                                            </section><!-- /input-group -->
                                    
                                        </section><!-- /col-lg-4 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Curso Específico</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <select id="selectize" name="cursos[]" multiple placeholder="Selecione o Curso">
                                                <option value="">Selecione o Curso</option>
                                                <option value="0" {if !$cupom.cursos|count && $cupom.id} selected="selected" {/if}>Todos os Cursos</option>

                                                {foreach from=$cursos key=k item=curso}
                                                        
                                                    <option value="{$curso.id}" {if $curso.id|in_array:(array)$cupom.cursos} selected="selected" {/if}>{$curso.curso}</option>
                                                    
                                                {/foreach}
                                                
                                            </select>                                                                                      
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Status</label>
                                        
                                        <section class="col-lg-10">
                                              
                                             <section class="btn-row">
                                                
                                                <section data-toggle="buttons">
                                                     
                                                    <label class="btn btn-success" onclick="mudarObrigatorio('Sim')">
                                                          
                                                        <input type="radio" name="ativo" id="" value="1" 
                                                        {if $cupom.ativo == 1} checked="checked" {/if} > <i class="fa fa-check"></i> Ativo
                                                          
                                                    </label>
                                                    
                                                    <label class="btn btn-danger" onclick="mudarObrigatorio('Não')">
                                                          
                                                        <input type="radio" name="ativo" id="" value="0"
                                                            {if $cupom == 0} checked="checked" {/if} > <i class="fa fa-minus"></i> Inativo
                                                          
                                                    </label>
                                                     <span class="help-block">Status Atual: <strong id="status_atual">
                                                        {if $cupom.ativo == 1}Sim{else}Não{/if}</strong></span>
                                                </section><!-- /btn-group --> 
                                            
                                            </section><!-- /btn-row --> 
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Tipo Desconto</label>
                                        
                                        <section class="col-lg-2">
                                            <select  id="comboTipoDesconto" name="tipo_desconto" class="form-control m-bot15">
                                                <option {if $cupom.tipo_desconto == 1 }selected="selected" {/if} value="1">Valor R$</option>
                                                <option {if $cupom.tipo_desconto == 2 }selected="selected" {/if} value="2">Percentual %</option>
                                            </select> 
                                        </section><!-- /col-lg-10 -->                                         
                                        
                                    </section><!-- /form-group -->

                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Valor</label>
                                        
                                        <section class="col-lg-2">
                                            
                                            <section class="input-group m-bot15">
                                                
                                                <span class="input-group-addon" id="simboloTipoDesconto">{if $cupom.tipo_desconto == 1 }R${else}%{/if}</span>
                                                <input class="form-control preco" name="valor" value="{$cupom.valor}" type="text" required>
                                                
                                            </section><!-- /input-group -->
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->

                                    <section class="form-group">
                                          
                                        <section class="col-lg-offset-2 col-lg-10">
                                              
                                            <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> {if $cupom.id}Editar {else} Salvar {/if}</button>
                                            <button class="btn btn-default" onclick="javascript:jQuery('#nova').val(1)"><i class="fa fa-plus-circle"></i> {if $cupom.id}Editar {else} Salvar {/if} e adicionar outro</button>
                                            <span>ou <a href="{$admin_url}/cupons/listar">voltar a listagem</a></span>
                                              
                                        </section><!-- /col-lg-offset-2 col-lg-10 --> 
                                          
                                    </section><!-- /form-group --> 
                                      
                                </form>

                            </section><!-- /panel-body --> 
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row --> 

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
    
    </section><!-- /container -->

  
    
    <script src="{$url_site}{$admin_dir}common/market/assets/bootstrap-select/selectize.js" ></script>
    {literal}

    <script>
        $('#selectize').selectize();
            
        $(document).ready(function(){

            
            $('#quantidade').val("0");
            $('#quantidade').hide();
            $('#tempo').hide();
            
            $("#radio-01").click(function(){          
                $('#quantidade').val("0");
                $('#quantidade').hide();
                $('#tempo').hide();         
                
            });
            
            $("#radio-02").click(function(){          
                
                if($(this).is(":checked")){

                    $('#tempo').show();
                    $('#quantidade').hide();
                    $('#quantidade').val("0");

                
                }           
                
            });
            
            $("#radio-03").click(function(){          
                
                if($(this).is(":checked")){

                    $('#quantidade').show();
                    $('#tempo').hide();
                
                }           
                
            });
            
            $("#radio-04").click(function(){          
                
                if($(this).is(":checked")){
                    $('#quantidade').val("0");
                    $('#quantidade').hide();
                    $('#tempo').hide();
                
                }           
                
            });
            
        });
        
        function mudarObrigatorio(val) {  
            $('#status_atual').html(val);
        }

        $("#comboTipoDesconto").change(function () {        
            var options_tipo  = '';
            var str = "";         
            $("#comboTipoDesconto option:selected").each(function () {
                options_tipo = $(this).val();
            });
            if(options_tipo == '1') str = "R$";
            else str = "%";

            $('#simboloTipoDesconto').html(str);
            //alert(options_tipo);
        });
        </script>
        <script src="{$url_site}{$admin_dir}/common/market/js/jquery.price_format.1.8.min.js"></script>
        <script src="{$url_site}{$admin_dir}/common/market/js/jquery.price_format.1.8.js"></script>
        <script>
            $('.preco').priceFormat();
        </script>

{/literal}
