        
        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/alunos/listar">Alunos</a></li>
                            <li class="active">Editar Aluno</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <aside class="profile-nav col-lg-3">
                        
                        <section class="panel">
                            
                            <div class="user-heading round">
                                
                                <a href="{$admin_url}/alunos/visualizar/{$aluno.id}"><img src="{$url_site}market/uploads/avatar/{$aluno.avatar}" alt=""></a>
                                
                                <h1>{$aluno.nome}</h1>
                                <p>{$aluno.email}</p>
                                
                            </div>

                            <ul class="nav nav-pills nav-stacked">
                                
                                <li><a href="{$admin_url}/alunos/visualizar/{$aluno.id}"> <i class="fa fa-user"></i> Visualizar Aluno</a></li>
                                <li class="active"><a href="{$admin_url}/alunos/editarnavisualizacao/{$aluno.id}"> <i class="fa fa-edit"></i> Editar Aluno</a></li>
                                
                            </ul>

                        </section><!-- /panel -->
                        
                    </aside><!-- /profile-nav -->
                    
                    <aside class="profile-info col-lg-9">
                        {if $msg_alert}
                                <div class="alert alert-danger">{$msg_alert}</div>
                            {/if}
                        <section class="panel">
                            
                            <section class="panel-body bio-graph-info">
                                
                                <h1>Dados Cadastrais</h1>
                                
                                <form class="form-horizontal" role="form" method="post">
                                    <input type="hidden" value="1" name="editar"/>
                                    <input type="hidden" value="{$aluno.id}" name="id"/>

                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Nome</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="nome" type="text" value="{$aluno.nome}" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">E-mail</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="email" id="email" type="email" value="{$aluno.email}" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">CPF</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="cpf" id="cpf" data-mask="999.999.999-99" value="{$aluno.cpf}" type="text">
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">CEP</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="cep" id="cep" data-mask="99999-999" value="{$aluno.cep}" type="text" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Endereço</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="endereco" type="text" value="{$aluno.endereco}" required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Complemento</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="complemento" value="{$aluno.complemento}" type="text">
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Bairro</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="bairro" id="bairro" type="text" value="{$aluno.bairro}" required>
                                              
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
                                              
                                            <input class="form-control" name="telefone" id="telefone" data-mask="(99) 9999 - 9999" value="{$aluno.telefone}" type="text">
                                              
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
                                    <input type="hidden" value="{$aluno.id}" name="id"/>
                                    <input type="hidden" value="{$aluno.nome}" name="nome"/>
                                    <input type="hidden" value="{$aluno.email}" name="email"/>
                                    <input type="hidden" value="{$aluno.cpf}" name="cpf"/>
                                    <input type="hidden" value="{$aluno.cep}" name="cep"/>
                                    <input type="hidden" value="{$aluno.endereco}" name="endereco"/>
                                    <input type="hidden" value="{$aluno.complemento}" name="complemento"/>
                                    <input type="hidden" value="{$aluno.bairro}" name="bairro"/>
                                    <input type="hidden" value="{$aluno.estado}" name="estado"/>
                                    <input type="hidden" value="{$aluno.cidade}" name="cidade"/>
                                    <input type="hidden" value="{$aluno.telefone}" name="telefone"/>
                                    
                                          
                                    <section class="form-group">
                                            
                                        <label class="control-label col-lg-2">Nova Senha</label>
                                            
                                        <section class="col-lg-10">
                                                  
                                            <input class="form-control" name="" type="password" required>
                                                  
                                        </section><!-- /col-lg-10 --> 
                                            
                                    </section><!-- /form-group -->
                                        
                                    <section class="form-group">
                                            
                                        <label class="control-label col-lg-2">Confirme a nova senha</label>
                                            
                                        <section class="col-lg-10">
                                                  
                                             <input class="form-control" name="" type="password" required>
                                                  
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
