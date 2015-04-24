<section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/alunos/listar">Alunos</a></li>
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
                            
                            <header class="panel-heading"><strong>Adicionar Novo - Aluno</strong></header>
                            
                            <section class="panel-body">
                                
                                <form class="form-horizontal tasi-form" method="post" action="">
                                    <input type="hidden" value="0" name="nova" id="nova" />
                                    <input type="hidden" value="1" name="editar"/>
                                    <input type="hidden" value="{$aluno.id}" name="id"/>
                                    
                                    <!-- NOME -->
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Nome</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="nome" type="text" id="nome" value="{$aluno.nome}" autofocus required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <!-- EMAIL -->
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">E-mail</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="email" id="email" value="{$aluno.email}" type="email" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <!-- CPF -->
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">CPF</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="cpf" id="cpf" value="{$aluno.cpf}" data-mask="999.999.999-99" type="text">
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <!-- CEP -->
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">CEP</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="cep" id="cep" value="{$aluno.cep}" data-mask="99999-999" type="text" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <!-- ENDEREÇO -->
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Endereço</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="endereco" id="endereco" value="{$aluno.endereco}" type="text" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <!-- COMPLEMENTO -->
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Complemento</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="complemento" id="complemento" value="{$aluno.complemento}" type="text">
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <!-- BAIRRO -->
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Bairro</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="bairro" id="bairro" value="{$aluno.bairro}" type="text" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <!-- ESTADO -->
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Estado</label>
                                        
                                        <section class="col-lg-2">
                                            <select id="estados" name="estado" class="form-control m-bot15"></select>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <!-- CIDADE -->
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Cidade</label>
                                        
                                        <section class="col-lg-2">
                                            <select id="cidades" class="form-control m-bot15" name="cidade"></select>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <!-- TELEFONE -->
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Telefone</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="telefone" id="telefone" value="{$aluno.telefone}" data-mask="(99) 9999 - 9999" type="text">
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <!-- SENHA -->
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Senha</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="senha" type="password" {if !$aluno.id} required {/if}>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <!-- CONFIRME A SENHA -->
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Confirme a Senha</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="senha2" type="password" {if !$aluno.id} required {/if}>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->

                                    <!-- AÇÕES -->
                                    <section class="form-group">
                                          
                                        <section class="col-lg-offset-2 col-lg-10">
                                              
                                            <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> {if $aluno.id}Editar{else}Salvar{/if}</button>
                                            <button class="btn btn-default" onclick="$('#nova').val(1)" type="submit"><i class="fa fa-plus-circle"></i> {if $aluno.id}Editar{else}Salvar{/if} e adicionar outro</button>
                                            <span>ou <a href="{$admin_url}/alunos/listar">voltar a listagem</a></span>
                                              
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
        $("#estados").html(options);    
        {/literal}    
        $("#estados").val('{$aluno.estado}'); //SETA O VALOR DO ESTADO AQUI !!
        {literal}
        $("#estados").change(function () {        
            var options_cidades = '';
            var str = "";         
            $("#estados option:selected").each(function () {
                str += $(this).text();
            });
            $.each(data, function (key, val) {
                if(val.nome == str) { 
                    $.each(val.cidades, function (key_city, val_city) {
                        options_cidades += '<option value="' + val_city + '">' + val_city + '</option>';
                    });  
                }
            });
            $("#cidades").html(options_cidades);
            {/literal}
            $("#cidades").val('{$aluno.cidade}');  //SETA O VALOR DA CIDADE AQUI !!
            {literal}
        }).change();        
    });
});
</script>
{/literal}