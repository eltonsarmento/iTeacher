        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/parceiros/listar">Parceiros</a></li>
                            <li class="active">Adicionar Novo</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Adicionar Novo - Parceiro</strong></header>
                            
                            <section class="panel-body">
                                
                                
                                    {if $msg_alert}
                                        <div class="alert alert-info">{$msg_alert}</div>
                                    {/if}
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Tipo de Cadastro</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <section class="radios">
                                            
                                                <label class="label_radio" for="radio-01"><input name="sample-radio" id="radio-01" value="1" type="radio"> Pessoa Física</label>
                                                    
                                                <label class="label_radio" for="radio-02"><input name="sample-radio" id="radio-02" value="1" type="radio"> Pessoa Jurídica</label>

                                            </section><!-- /radios -->
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section id="pessoa-fisica">
                                        <form method="post" class="form-horizontal tasi-form">
                                        <input type="hidden" name="editar" value="1">    
                                        <input type="hidden" name="pessoa_fisica" value="1">
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Nome</label>
                                            
                                            <section class="col-lg-10">
                                                  
                                                <input class="form-control" name="nome" value="{if $parceiro.pessoa_fisica}{$parceiro.nome}{else}{/if}" type="text" autofocus required>
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">E-mail</label>
                                            
                                            <section class="col-lg-10">
                                                  
                                                <input class="form-control" value="{if $parceiro.pessoa_fisica}{$parceiro.email}{else}{/if}" name="email" type="text" required>
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">CPF</label>
                                            
                                            <section class="col-lg-10">
                                                
                                                <input class="form-control" value="{if $parceiro.pessoa_fisica}{$parceiro.cpf}{else}{/if}" name="cpf" data-mask="999.999.999-99" type="text" required>
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">CEP</label>
                                            
                                            <section class="col-lg-10">
                                                  
                                                <input class="form-control" value="{if $parceiro.pessoa_fisica}{$parceiro.cep}{else}{/if}" name="cep" data-mask="99999-999" type="text" required>
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Endereço</label>
                                            
                                            <section class="col-lg-10">
                                                  
                                                <input class="form-control" value="{if $parceiro.pessoa_fisica}{$parceiro.endereco}{else}{/if}" name="endereco" type="text" required>
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Complemento</label>
                                            
                                            <section class="col-lg-10">
                                                  
                                                <input class="form-control" value="{if $parceiro.pessoa_fisica}{$parceiro.complemento}{else}{/if}" name="complemento" type="text">
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Bairro</label>
                                            
                                            <section class="col-lg-10">
                                                  
                                                <input class="form-control" value="{if $parceiro.pessoa_fisica}{$parceiro.bairro}{else}{/if}" name="bairro" type="text" required>
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Estado</label>
                                            
                                            <section class="col-lg-2">
                                                  
                                                <select class="form-control m-bot15 estados" name="estado" id="estados1">
                                                    
                                                    
                                                    
                                                </select>
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Cidade</label>
                                            
                                            <section class="col-lg-2">
                                                  
                                                <select class="form-control m-bot15 cidades" name="cidade" id="cidades1">
                                                    
                                                  
                                                    
                                                </select>
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Telefone</label>
                                            
                                            <section class="col-lg-10">
                                                  
                                                <input class="form-control" value="{if $parceiro.pessoa_fisica}{$parceiro.telefone}{else}{/if}" name="telefone" data-mask="(99) 9999 - 9999" type="text">
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Site</label>
                                            
                                            <section class="col-lg-10">
                                                  
                                                <input class="form-control" value="{if $parceiro.pessoa_fisica}{$parceiro.site}{else}{/if}" name="site" type="text" required>
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Senha</label>
                                            
                                            <section class="col-lg-10">
                                                  
                                                <input class="form-control" name="senha" type="password" required>
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Confirme a Senha</label>
                                            
                                            <section class="col-lg-10">
                                                  
                                                <input class="form-control" name="senha2" type="password" required>
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->

                                        <section class="form-group">
                                              
                                            <section class="col-lg-offset-2 col-lg-10">
                                                  
                                                <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Salvar</button>
                                                <button class="btn btn-default" type="submit"><i class="fa fa-plus-circle"></i> Salvar e adicionar outro</button>
                                                <span>ou <a href="todos-os-parceiros.html">voltar a listagem</a></span>
                                                  
                                            </section><!-- /col-lg-offset-2 col-lg-10 --> 
                                              
                                        </section><!-- /form-group --> 
                                        </form>
                                    </section><!-- /pessoa-juridica --> 
                                    
                                    <section id="pessoa-juridica">
                                    <form method="post" class='form-horizontal tasi-form'>
                                        <input type="hidden" name="editar" value="1">    
                                        <input type="hidden" name="pessoa_juridica" value="1">
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Nome</label>
                                            
                                            <section class="col-lg-10">
                                                  
                                                <input class="form-control" value="{if $parceiro.pessoa_juridica}{$parceiro.nome}{else}{/if}" name="nome" type="text" autofocus required>
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Nome do Responsável</label>
                                            
                                            <section class="col-lg-10">
                                                  
                                                <input class="form-control" value="{if $parceiro.pessoa_juridica}{$parceiro.nome_responsavel}{else}{/if}" name="nome_responsavel" type="text" required>
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">E-mail do Responsável</label>
                                            
                                            <section class="col-lg-10">
                                                  
                                                <input class="form-control" value="{if $parceiro.pessoa_juridica}{$parceiro.email_responsavel}{else}{/if}" name="email_responsavel" type="text" required>
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">CNPJ</label>
                                            
                                            <section class="col-lg-10">
                                                
                                                <input class="form-control" name="cnpj" value="{if $parceiro.cnpj}{$parceiro.nome_responsavel}{else}{/if}" data-mask="99.999.999/9999-99" type="text" required>
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">CEP</label>
                                            
                                            <section class="col-lg-10">
                                                  
                                                <input class="form-control" value="{if $parceiro.pessoa_juridica}{$parceiro.cep}{else}{/if}" name="cep" data-mask="99999-999" type="text" required>
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Endereço</label>
                                            
                                            <section class="col-lg-10">
                                                  
                                                <input class="form-control" value="{if $parceiro.pessoa_juridica}{$parceiro.endereco}{else}{/if}" name="endereco" type="text" required>
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Complemento</label>
                                            
                                            <section class="col-lg-10">
                                                  
                                                <input class="form-control" value="{if $parceiro.pessoa_juridica}{$parceiro.complemento}{else}{/if}" name="complemento" type="text">
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Bairro</label>
                                            
                                            <section class="col-lg-10">
                                                  
                                                <input class="form-control" value="{if $parceiro.pessoa_juridica}{$parceiro.bairro}{else}{/if}" name="bairro" type="text" required>
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Estado</label>
                                            
                                            <section class="col-lg-2">
                                                  
                                                <select class="form-control m-bot15 estados" name="estado" id="estados2">

                                                    
                                                </select>
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Cidade</label>
                                            
                                            <section class="col-lg-2">
                                                  
                                                <select class="form-control m-bot15 cidades" name="cidade" id="cidades2">

                                                    
                                                </select>
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Telefone</label>
                                            
                                            <section class="col-lg-10">
                                                  
                                                <input class="form-control" name="telefone" data-mask="(99) 9999 - 9999" value="{if $parceiro.pessoa_juridica}{$parceiro.telefone}{else}{/if}" type="text">
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Site</label>
                                            
                                            <section class="col-lg-10">
                                                  
                                                <input class="form-control" value="{if $parceiro.pessoa_juridica}{$parceiro.site}{else}{/if}" name="site" type="text" required>
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Razão Social</label>
                                            
                                            <section class="col-lg-10">
                                                  
                                                <input class="form-control" value="{if $parceiro.pessoa_juridica}{$parceiro.razao_social}{else}{/if}" name="razao_social" type="text" required>
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Senha</label>
                                            
                                            <section class="col-lg-10">
                                                  
                                                <input class="form-control" name="senha" type="password" required>
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Confirme a Senha</label>
                                            
                                            <section class="col-lg-10">
                                                  
                                                <input class="form-control" name="senha2" type="password" required>
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->

                                        <section class="form-group">
                                              
                                            <section class="col-lg-offset-2 col-lg-10">
                                                  
                                                <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Salvar</button>
                                                <button class="btn btn-default" type="submit"><i class="fa fa-plus-circle"></i> Salvar e adicionar outro</button>
                                                <span>ou <a href="todos-os-parceiros.html">voltar a listagem</a></span>
                                                  
                                            </section><!-- /col-lg-offset-2 col-lg-10 --> 
                                              
                                        </section><!-- /form-group --> 
                                    </form>
                                        
                                    </section><!-- /pessoa-juridica --> 
                                      
                                

                            </section><!-- /panel-body --> 
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row --> 

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
{literal}
 <script>
        
    $(document).ready(function(){
        
        $('#pessoa-fisica').hide();
        $('#pessoa-juridica').hide();
        
        $("#radio-01").click(function(){          
            
            if($(this).is(":checked")){
                
                $('#pessoa-fisica').show();
                $('#pessoa-juridica').hide();
            
            }           
            
        });
        
        $("#radio-02").click(function(){          
            
            if($(this).is(":checked")){
                
                $('#pessoa-fisica').hide();
                $('#pessoa-juridica').show();
            
            }           
            
        });
        
    });
    
    </script>
{/literal}

{literal}
<script type="text/javascript">
$(document).ready(function(){
    {/literal}
    //{if $msg_alert} jAlert('{$msg_alert}'); {/if}
    {literal}
});
</script>
<script type="text/javascript"> 
$(document).ready(function ($) {
    $.getJSON('{/literal}{$url_site}{literal}market/common/market/js/estados_cidades.json', function (data) {
        var items = [];
        var options = '<option value="">Selecione um Estado</option>';  
        $.each(data, function (key, val) {
            options += '<option value="' + val.nome + '">' + val.nome + '</option>';
        });   
        $("#estados1").html(options);
        $("#estados2").html(options);    
        {/literal}    
        $("#estados").val('{$parceiro.estado}'); //SETA O VALOR DO ESTADO AQUI !!
        {literal}
        $("#estados1").change(function () {        
            var options_cidades = '';
            var str = "";         
            $("#estados1 option:selected").each(function () {
                str += $(this).text();
            });
            $.each(data, function (key, val) {
                if(val.nome == str) { 
                    $.each(val.cidades, function (key_city, val_city) {
                        options_cidades += '<option value="' + val_city + '">' + val_city + '</option>';
                    });  
                }
            });
            $("#cidades1").html(options_cidades);
            {/literal}
            $("#cidades1").val('{$parceiro.cidade}');  //SETA O VALOR DA CIDADE AQUI !!
            {literal}
        }).change();
        $("#estados2").change(function () {        
            var options_cidades = '';
            var str = "";         
            $("#estados2 option:selected").each(function () {
                str += $(this).text();
            });
            $.each(data, function (key, val) {
                if(val.nome == str) { 
                    $.each(val.cidades, function (key_city, val_city) {
                        options_cidades += '<option value="' + val_city + '">' + val_city + '</option>';
                    });  
                }
            });
            $("#cidades2").html(options_cidades);
            {/literal}
            $("#cidades2").val('{$parceiro.cidade}');  //SETA O VALOR DA CIDADE AQUI !!
            {literal}
        }).change();        
    });
});
</script>
{/literal}
