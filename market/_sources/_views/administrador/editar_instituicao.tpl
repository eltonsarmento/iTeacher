
        <section id="main-content">
          
            <section class="wrapper site-min-height">

                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/instituicoes/listar">Instituições</a></li>
                            <li class="active">Editar Instituição - Cursos IAG</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    
                    <section class="col-lg-12">
                        {if $msg_sucesso}
                            <div class="alert alert-info">{$msg_sucesso}</div>
                        {/if}
                        {if $msg_error}
                            <div class="alert alert-danger">{$msg_error}</div>
                        {/if}
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>{if $instituicao.id}Editar{else}Cadastrar{/if} - Instituição</strong></header>
                            
                            <section class="panel-body">
                                
                                <form class="form-horizontal tasi-form" action="" method="post" enctype="multipart/form-data">
                                    <input type="hidden" name="editar" value="1">
                                    <input type="hidden" name="id" value="{$instituicao.id}">
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Nome</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="nome" type="text" value="{$instituicao.nome}" >
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->

                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">E-mail </label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="email" type="text" value="{$instituicao.email}" >
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Razão Social</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="razao_social" type="text" value="{$instituicao.razao_social}" >
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">CNPJ</label>
                                        
                                        <section class="col-lg-10">
                                            
                                            <input class="form-control" name="cnpj" type="text" data-mask="99.999.999/9999-99" value="{$instituicao.cnpj}" >
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Responsável</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="nome_responsavel" type="text" value="{$instituicao.nome_responsavel}" >
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">E-mail Responsável</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="email_secundario" type="text" value="{$instituicao.email_secundario}" >
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Telefone Responsável</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="telefone_responsavel" data-mask="(99) 9999 - 9999" value="{$instituicao.telefone_responsavel}" type="text">
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Inscrição Municipal</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="inscricao_municipal" value="{$instituicao.inscricao_municipal}" type="text">
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Inscrição Estadual</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="inscricao_estadual" value="{$instituicao.inscricao_estadual}" type="text">
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">CEP</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="cep" data-mask="99999-999" value="{$instituicao.cep}" type="text" >
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Endereço</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="endereco" type="text" value="{$instituicao.endereco}" >
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Complemento</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="complemento" value="{$instituicao.complemento}" type="text">
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Bairro</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="bairro" type="text" value="{$instituicao.bairro}" >
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Estado</label>
                                        
                                        <section class="col-lg-2">
                                              
                                            <select class="form-control m-bot15" name="estado" id="estados">
                                                
                                                
                                                
                                            </select>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Cidade</label>
                                        
                                        <section class="col-lg-2">
                                              
                                            <select class="form-control m-bot15" name="cidade" id="cidades">
                                                
                                                
                                                
                                            </select>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Site</label>
                                        
                                        <section class="col-lg-10">
                                            
                                            <section class="input-group m-bot15">
                                                
                                                <span class="input-group-addon">http://</span>
                                                
                                                <input class="form-control" name="site" type="text" value="{$instituicao.site}" >
                                                
                                            </section><!-- /input-group -->

                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Área de Atuação</label>
                                        
                                        <section class="col-lg-10">
  
                                            <input class="form-control" name="area_atuacao" type="text" value="{$instituicao.area_atuacao}" >

                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Senha</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="senha" type="password" >
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Confirme a Senha</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="senha2" type="password" >
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Logo</label>
                                        
                                        <section class="controls col-lg-10">
                                            
                                            <section class="fileupload fileupload-new" data-provides="fileupload">
                                                
                                                <span class="btn btn-white btn-file">
                                                    
                                                    <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Selecione a imagem</span>
                                                    <span class="fileupload-exists"><i class="fa fa-undo"></i> Alterar</span>
                                                    <input type="file" name="logo_instituicao" class="default" />
                                                    
                                                </span>
                                                
                                                <span class="fileupload-preview" style="margin-left:5px;"></span>
                                                
                                                <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                                                
                                            </section><!-- /fileupload -->
                                            
                                        </section><!-- /controls -->
                                        
                                    </section><!-- /form-group -->

                                    <section class="form-group">
                                          
                                        <section class="col-lg-offset-2 col-lg-10">
                                              
                                            <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> {if $instituicao.id}Editar{else}Salvar{/if}</button>
                                            <button class="btn btn-default" type="submit"><i class="fa fa-plus-circle"></i> {if $instituicao.id}Editar{else}Salvar{/if} e adicionar outro</button>
                                            <span>ou <a href="todas-as-instituicoes.html">voltar a listagem</a></span>
                                              
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
$(document).ready(function ($) {
    $.getJSON('{/literal}{$url_site}{literal}market/common/market/js/estados_cidades.json', function (data) {
        var items = [];
        var options = '<option value="">Selecione um Estado</option>';  
        $.each(data, function (key, val) {
            options += '<option value="' + val.nome + '">' + val.nome + '</option>';
        });   
        $("#estados").html(options);    
        {/literal}    
        $("#estados").val('{$instituicao.estado}'); //SETA O VALOR DO ESTADO AQUI !!
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
            $("#cidades").val('{$instituicao.cidade}');  //SETA O VALOR DA CIDADE AQUI !!
            {literal}
        }).change();        
    });
});
</script>
{/literal}