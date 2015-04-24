        <section id="main-content">
          
            <section class="wrapper site-min-height">

                {if $msg_erro} <div class="alert alert-danger">{$msg_erro}</div>{/if}
                {if $msg_suc} <div class="alert alert-success">{$msg_suc}</div>{/if}

                <section class="row">
                    <section class="col-lg-12">
                        <ul class="breadcrumb">
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/vendas/listar">Gerenciar Vendas</a></li>
                            <li class="active">Adicionar Nova</li>
                        </ul>
                    </section><!-- /col-lg-12 -->
                </section><!-- /row -->
                
                <section class="row">
                    <section class="col-lg-12">
                        <section class="panel">

                            <header class="panel-heading"><strong>Adicionar Nova - Venda</strong></header>
                            
                            <section class="panel-body">        

                                <form class="form-horizontal tasi-form" action="" method="post" id="form_vendas">
                                    <input type="hidden" value="0" name="nova" id="nova" />
                                    <input type="hidden" value="1" name="editar"/>
                                    <input type="hidden" value="0" name="valor_total" id="valor_total" />
                                    <input type="hidden" value="0" name="valor_sem_desconto" id="valor_sem_desconto" />

                                    <!-- ALUNO -->
                                    <section class="form-group">            
                                        <label class="control-label col-lg-2">Aluno</label>
                                        <section class="col-lg-10">
                                              
                                            <select id="selectize" name="aluno_id" placeholder="Selecione o Aluno">
                                                <option value="">Selecione o Aluno</option>
                                                {foreach item=aluno from=$alunos}
                                                <option value="{$aluno.id}" {if $vendas.aluno_id == $aluno.id} selected="" {/if}>{$aluno.nome} - {$aluno.email}</option>
                                              {/foreach}
                                            </select>
                                              
                                        </section>
                                    </section>
                                    
                                    <!-- CURSOS -->
                                    <section class="form-group">
                                        <label class="control-label col-lg-2">Curso</label>
                                        <section class="col-lg-10">
                                              
                                            <select id="selectize-curso" name="cursos[]" multiple placeholder="Selecione o Curso" onchange="javascript:mudarPreco()">
                                                <option value=""></option> 
                                                {foreach item=curso from=$cursos}
                                                    <option value="{$curso.id}" {if $curso.id|in_array:$vendas.cursos} selected {/if}>{$curso.curso}</option>
                                                {/foreach}
                                            </select>

                                        </section>
                                    </section>
                                    
                                    <!-- TIPO DESCONTO -->
                                    <section class="form-group">
                                        <label class="control-label col-lg-2">Tipo de Desconto</label>
                                        <section class="col-lg-10">
                                             <section class="btn-row">
                                                <section class="radios">
                                                     
                                                    <label class="label_radio" for="radio-01"><input name="forma_desconto" onclick="javascript:mudarPreco();" id="radio-01" value="1" {if $vendas.forma_desconto == 1} checked="checked" {/if} type="radio"> Valor</label>
                                                    <label class="label_radio" for="radio-02"><input name="forma_desconto" onclick="javascript:mudarPreco();" id="radio-02" value="2" {if $vendas.forma_desconto == 2} checked="checked" {/if} type="radio"> Percentual</label>
                                                    <label class="label_radio" for="radio-03"><input name="forma_desconto" onclick="javascript:mudarPreco();" id="radio-03" value="0" {if $vendas.forma_desconto == 0} checked="checked" {/if} type="radio"> Sem Desconto</label>

                                                </section>
                                            </section>
                                        </section>
                                    </section>
                                    
                                    <!-- VALOR DESCONTO (REAL) -->
                                    <section class="form-group" id="valor-desconto">
                                        <label class="control-label col-lg-2">Valor do Desconto</label>
                                        <section class="col-lg-2">
                                            <section class="input-group m-bot15">
                                                <span class="input-group-addon">R$</span>
                                                <input class="form-control preco" name="valor_real_desconto" maxlength="8" onblur="javascript:mudarPreco();" value="{$vendas.valor_real_desconto}" type="text">
                                            </section>
                                        </section>
                                    </section>
                                    
                                    <!-- VALOR DESCONTO (PORCENTAGEM) -->
                                    <section class="form-group" id="valor-desconto-percentual">
                                        <label class="control-label col-lg-2">Percentual do Desconto</label>
                                        <section class="col-lg-2">
                                            <section class="input-group m-bot15">
                                                <span class="input-group-addon">%</span>
                                                <input class="form-control" name="valor_porcentagem_desconto" onblur="javascript:mudarPreco();" value="{$vendas.valor_porcentagem_desconto}"  type="text">
                                            </section>
                                        </section>
                                    </section>
                                    
                                    <!-- FORMA DE PAGAMENTO -->
                                    <section class="form-group">
                                        <label class="control-label col-lg-2">Forma de Pagamento</label>
                                        <section class="col-lg-10">
                                             <section class="btn-row">
                                                <section data-toggle="buttons">
                                                     
                                                    <label class="btn btn-default {if $vendas.forma_pagamento == 1} active {/if}">
                                                        <input type="radio" name="forma_pagamento" value="1" {if $vendas.forma_pagamento == 1} checked="checked" {/if} id=""> Pagseguro
                                                    </label>
                                                    
                                                    <label class="btn btn-default {if $vendas.forma_pagamento == 2} active {/if}">
                                                        <input type="radio" name="forma_pagamento" value="2" {if $vendas.forma_pagamento == 2} checked="checked" {/if} id=""> Paypal
                                                    </label>
                                                    
                                                </section>
                                            </section>
                                        </section>
                                    </section>
                                    
                                    <!-- VALOR TOTAL -->
                                    <section class="form-group">
                                        <label class="control-label col-lg-2">Valor Total</label>
                                        <section class="col-lg-2">
                                            <p class="form-control-static"><strong>R$ <span id="preco">0,00</span></strong></p>
                                        </section>
                                    </section>
                                    
                                    <!-- OBSERVAÇÕES -->
                                    <section class="form-group">
                                        <label class="control-label col-lg-2">Observações</label>
                                        <section class="col-lg-10">
                                            <textarea class="form-control" rows="5" name="observacoes">{$vendas.observacoes}</textarea>
                                        </section>
                                    </section>

                                    <!-- BOTÕES -->
                                    <section class="form-group">
                                        <section class="col-lg-offset-2 col-lg-10">
                                            <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Salvar</button>
                                            <button class="btn btn-default" onclick="$('#nova').val(1)" type="submit"><i class="fa fa-plus-circle"></i> Salvar e adicionar outro</button>
                                            <span>ou <a href="{$admin_url}/vendas/listar">voltar a listagem</a></span>
                                        </section>
                                    </section> 
                                      
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

function mudarPreco() {
    {/literal}
    jQuery.post('/market/{$categoria}/vendas/calcularPreco', jQuery('#form_vendas').serialize(), function html(json) {ldelim}
        dados = jQuery.parseJSON(json);
        jQuery('#preco').html(dados.preco);
        jQuery('#valor_total').val(dados.preco);
        jQuery('#valor_sem_desconto').val(dados.preco_sem_desconto);
    {rdelim});
    {literal}
}

//selectize
$('#selectize').selectize();
$('#selectize-curso').selectize({  
    plugins: ['remove_button']
});


$(document).ready(function(){
    mudarPreco();
{/literal}
    {if $vendas.forma_desconto != 1}
    $("#valor-desconto").hide();
    {/if}
    {if $vendas.forma_desconto != 2}
    $("#valor-desconto-percentual").hide();
    {/if}
    
{literal}
    $("#radio-01").click(function(){              
        if($(this).is(":checked")){
            $("#valor-desconto").show();
            $("#valor-desconto-percentual").hide();
        }               
    });
    
    $("#radio-02").click(function(){          
        if($(this).is(":checked")){  
            $("#valor-desconto").hide();
            $("#valor-desconto-percentual").show();
        }            
    });
    
    $("#radio-03").click(function(){          
        if($(this).is(":checked")){ 
            $("#valor-desconto").hide();
            $("#valor-desconto-percentual").hide();
        }           
    });
    
});
</script>
{/literal}
</body>
</html>
