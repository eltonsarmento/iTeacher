        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="perfil.html">Perfil</a></li>
                            <li class="active">Editar Perfil</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <aside class="profile-nav col-lg-3">
                        
                        <section class="panel">
                            
                            <div class="user-heading round">
                                
                                <a href="{$admin_url}/perfil/visualizar/{$parceiro.id}"><img src="{$url_site}market/uploads/avatar/{$parceiro.avatar}" alt=""></a>
                                
                                <h1>{$parceiro.nome}</h1>
                                <p>{$parceiro.email}</p>
                                
                            </div>

                            <ul class="nav nav-pills nav-stacked">
                                
                                <li><a href="{$admin_url}/perfil/visualizar/{$parceiro.id}"> <i class="fa fa-user"></i> Visualizar Perfil</a></li>
                                <li class="active"><a href="{$admin_url}/perfil/editar/{$parceiro.id}"> <i class="fa fa-edit"></i> Editar Perfil</a></li>
                                
                            </ul>

                        </section><!-- /panel -->

                    </aside><!-- /profile-nav -->
                    
                    <aside class="profile-info col-lg-9">
                        
                        <section class="panel">
                            
                            <section class="panel-body bio-graph-info">
                                
                                <h1>Dados Cadastrais</h1>
                                {if $msg_error}
                                    <div class="alert alert-info">{$msg_error}</div>
                                {/if}                                    
                                
                                <form class="form-horizontal" role="form" method="post">
                                    <input type="hidden" name="editar" value="1">
                                    <input type="hidden" name="dados_comuns" value="1">
                                    <input type="hidden" name="id" value="{$parceiro.id}">

                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Nome</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="nome" type="text" value="{$parceiro.nome}" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">E-mail</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="email" type="email" value="{$parceiro.email}" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">CPF</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="cpf" data-mask="999.999.999-99" value="{$parceiro.cpf}" type="text">
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">CEP</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="cep" data-mask="99999-999" value="{$parceiro.cep}" type="text" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Endereço</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="endereco" type="text" value="{$parceiro.endereco}" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Complemento</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="complemento" value="{$parceiro.complemento}" type="text">
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Bairro</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="bairro" type="text" value="{$parceiro.bairro}" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Estado</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <select class="form-control m-bot15" name="estado" id="estados">
                                                
                                                
                                                
                                            </select>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Cidade</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <select class="form-control m-bot15" name="cidade" id="cidades">
                                                
                    
                                                
                                            </select>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Telefone</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="telefone" data-mask="(99) 9999 - 9999" value="{$parceiro.telefone}" type="text">
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Site</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="site" value="{$parceiro.site}" type="text">
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Razão Social</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="razao_social" value="{$parceiro.razao_social}" type="text">
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->

                                    <section class="form-group">
                                      
                                        <section class="col-lg-offset-2 col-lg-10">
                                          
                                            <button type="submit" class="btn btn-success"><i class="fa fa-check-circle"></i> Salvar</button>
                                          
                                        </section><!-- /col-lg-offset-2 col-lg-10 -->
                                      
                                    </section><!-- /form-group -->
                                    
                                </form>
                                
                            </section><!-- /panel-body -->
                            
                        </section><!-- /panel -->

                        <section class="panel panel-primary">
                            
                            <section class="panel-heading">Alterar Senha e Avatar</section><!-- /panel-heading -->
                            
                            <section class="panel-body">
                                {if $msg_error_senhafoto}
                                    <div class="alert alert-info">{$msg_error_senhafoto}</div>
                                {/if}
                                <form class="form-horizontal" role="form" method="post" enctype="multipart/form-data">
                                    <input type="hidden" name="editar" value="1">
                                    <input type="hidden" name="senha_foto" value="1">
                                    <input type="hidden" name="id" value="{$parceiro.id}">
                                          
                                    <section class="form-group">
                                            
                                        <label class="control-label col-lg-2">Nova Senha</label>
                                            
                                        <section class="col-lg-10">
                                                  
                                            <input class="form-control" name="senha" type="password" required>
                                                  
                                        </section><!-- /col-lg-10 --> 
                                            
                                    </section><!-- /form-group -->
                                        
                                    <section class="form-group">
                                            
                                        <label class="control-label col-lg-2">Confirme a nova senha</label>
                                            
                                        <section class="col-lg-10">
                                                  
                                             <input class="form-control" name="senha2" type="password" required>
                                                  
                                        </section><!-- /col-lg-10 --> 
                                            
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Avatar</label>
                                        
                                        <section class="controls col-lg-10">
                                            
                                            <section class="fileupload fileupload-new" data-provides="fileupload">
                                                
                                                <span class="btn btn-white btn-file">
                                                    
                                                    <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Selecione a imagem</span>
                                                    <span class="fileupload-exists"><i class="fa fa-undo"></i> Alterar</span>
                                                    <input type="file" name="avatar" class="default" />
                                                    
                                                </span>
                                                
                                                <span class="fileupload-preview" style="margin-left:5px;"></span>
                                                
                                                <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                                                
                                            </section><!-- /fileupload -->
                                            
                                        </section><!-- /controls -->
                                        
                                    </section><!-- /form-group -->
                                            
                                    <section class="form-group">
                                          
                                        <section class="col-lg-offset-2 col-lg-10">
                                                  
                                            <button type="submit" class="btn btn-info"><i class="fa fa-check-circle"></i> Salvar</button>
                                                  
                                        </section><!-- /col-lg-offset-2 col-lg-10 -->
                                          
                                    </section><!-- /form-group -->
                                            
                                </form>
                                    
                            </section><!-- /panel-body -->
                            
                        </section><!-- /panel -->

                    </aside><!-- /profile-info -->
                    
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
        $("#estados").val('{$parceiro.estado}'); //SETA O VALOR DO ESTADO AQUI !!
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
            $("#cidades").val('{$parceiro.cidade}');  //SETA O VALOR DA CIDADE AQUI !!
            {literal}
        }).change();        
    });
});
</script>
{/literal}
