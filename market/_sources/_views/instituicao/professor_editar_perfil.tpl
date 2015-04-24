        
        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/professor/listar">Professores</a></li>
                            <li class="active">Editar Professor</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <aside class="profile-nav col-lg-3">
                        
                        <section class="panel">
                            
                            <div class="user-heading round">
                                
                                <a href="{$admin_url}/professor/visualizar/{$professor.id}"><img src="{$url_site}market/uploads/avatar/{$professor.avatar}" alt=""></a>
                                
                                <h1>{$professor.nome}</h1>
                                <p>{$professor.email}</p>
                                
                            </div>

                            <ul class="nav nav-pills nav-stacked">
                                
                                <li><a href="{$admin_url}/professor/visualizar/{$professor.id}"> <i class="fa fa-user"></i> Visualizar Professor</a></li>
                                <li class="active"><a href="{$admin_url}/professor/editarnavisualizacao/{$professor.id}"> <i class="fa fa-edit"></i> Editar Professor</a></li>
                                
                            </ul>

                        </section><!-- /panel -->
                        
                    </aside><!-- /profile-nav -->
                    
                    <aside class="profile-info col-lg-9">
                        {if $msg_alert_error}
                            <div class="alert alert-danger">{$msg_alert_error}</div>
                        {/if}
                        {if $msg_alert_sucesso}
                            <div class="alert alert-success">{$msg_alert_sucesso}</div>
                        {/if}
                        <section class="panel">
                            
                            <section class="panel-body bio-graph-info">
                                
                                <h1>Dados Cadastrais</h1>
                                
                                <form class="form-horizontal" role="form" method="post">
                                    <input type="hidden" value="1" name="editar"/>
                                    <input type="hidden" value="{$professor.id}" name="id"/>

                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Nome</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="nome" type="text" value="{$professor.nome}" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">E-mail</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="email" id="email" type="email" value="{$professor.email}" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">CPF</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="cpf" id="cpf" data-mask="999.999.999-99" value="{$professor.cpf}" type="text">
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">CEP</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="cep" id="cep" data-mask="99999-999" value="{$professor.cep}" type="text" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Endereço</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="endereco" type="text" value="{$professor.endereco}" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Complemento</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="complemento" value="{$professor.complemento}" type="text">
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Bairro</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="bairro" id="bairro" type="text" value="{$professor.bairro}" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Estado</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <select class="form-control m-bot15" id="estados" name="estado">
                                                
                                               
                                                
                                            </select>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Cidade</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <select class="form-control m-bot15" id="cidades" name="cidade">
                                            
                                                
                                            </select>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Telefone</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="telefone" id="telefone" data-mask="(99) 9999 - 9999" value="{$professor.telefone}" type="text">
                                              
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
                            
                            <section class="panel-heading">Alterar Senha</section><!-- /panel-heading -->
                            
                            <section class="panel-body">
                                    
                                <form class="form-horizontal" role="form" method="post">
                                    <input type="hidden" value="1" name="editar"/>
                                    <input type="hidden" value="{$professor.id}" name="id"/>
                                    <input type="hidden" value="{$professor.nome}" name="nome"/>
                                    <input type="hidden" value="{$professor.email}" name="email"/>
                                    <input type="hidden" value="{$professor.cpf}" name="cpf"/>
                                    <input type="hidden" value="{$professor.cep}" name="cep"/>
                                    <input type="hidden" value="{$professor.endereco}" name="endereco"/>
                                    <input type="hidden" value="{$professor.complemento}" name="complemento"/>
                                    <input type="hidden" value="{$professor.bairro}" name="bairro"/>
                                    <input type="hidden" value="{$professor.estado}" name="estado"/>
                                    <input type="hidden" value="{$professor.cidade}" name="cidade"/>
                                    <input type="hidden" value="{$professor.telefone}" name="telefone"/>
                                    
                                          
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
        $("#estados").val('{$professor.estado}'); //SETA O VALOR DO ESTADO AQUI !!
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
            $("#cidades").val('{$professor.cidade}');  //SETA O VALOR DA CIDADE AQUI !!
            {literal}
        }).change();        
    });
});
</script>
{/literal}
