
        <section id="main-content">
          
            <section class="wrapper site-min-height">

                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Todos os Parceiros</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    {if $visao_adm eq false}
                        <section class="col-lg-12">
                        
                            <a href="{$admin_url}/parceiros/novo" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar novo</a>

                        </section><!-- /col-lg-12 -->
                    {/if}
                </section><!-- /row -->
                
                <br>
                {if $msg_alert}
                    <div class="alert alert-info">{$msg_alert}</div>
                {/if}
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Todos os Parceiros</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-briefcase"></i> Nome</th>
                                            <th class="hidden-xs"><i class="fa fa-user"></i> Tipo de Cadastro</th>
                                            <th><i class="fa fa-envelope"></i> E-mail</th>
                                            <th class="hidden-xs"><i class="fa fa-credit-card"></i> CPF/CNPJ</th>
                                            <th class="hidden-xs"><i class="fa fa-truck"></i> CEP</th>
                                            <th class="hidden-xs"><i class="fa fa-phone"></i> Telefone</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach from=$parceiros item=parceiro}
                                        <tr>
                                            
                                            <td><a href="{$admin_url}/parceiros/editar/{$parceiro.id}?tipo={if $parceiro.tipo_pessoa eq 1}PF{else if $parceiro.tipo_pessoa eq 2}PJ{/if}">{$parceiro.nome}</a></td>
                                            <td class="hidden-xs">{if $parceiro.tipo_pessoa eq 1} Pessoa Física {else if $parceiro.tipo_pessoa eq 2} Pessoa Jurídica {/if}</td>
                                            <td>{if $parceiro.tipo_pessoa eq 1} {$parceiro.email} {else if $parceiro.tipo_pessoa eq 2} {$parceiro.email_secundario} {/if}</td>
                                            <td class="hidden-xs">{if $parceiro.tipo_pessoa eq 1} {$parceiro.cpf} {else if $parceiro.tipo_pessoa eq 2} {$parceiro.cnpj} {/if}</td>
                                            <td class="hidden-xs">{$parceiro.cep}</td>
                                            <td class="hidden-xs">{$parceiro.telefone}</td>
                                            <td>
                                                
                                                <a data-toggle="modal" {if $parceiro.tipo_pessoa eq 1}href="#visualizarParceiroPF"{else if $parceiro.tipo_pessoa eq 2}href="#visualizarParceiroPJ"{/if} onclick="getDetalheParceiro({if $parceiro.tipo_pessoa eq 1}'PF'{else if $parceiro.tipo_pessoa eq 2}'PJ'{/if},{$parceiro.id});" class="btn btn-success btn-xs tooltips" data-original-title="Visualizar" data-placement="bottom"><i class="fa fa-search"></i></a>
                                                {if $visao_adm eq false}
                                                    <a href="{$admin_url}/parceiros/editar/{$parceiro.id}?tipo={if $parceiro.tipo_pessoa eq 1}PF{else if $parceiro.tipo_pessoa eq 2}PJ{/if}" class="btn btn-primary btn-xs tooltips" data-original-title="Editar" data-placement="bottom"><i class="fa fa-pencil"></i></a>

                                                    <a data-toggle="modal" href="#deletarParceiro" onclick="javascript:setaDeletar({$parceiro.id});" class="btn btn-danger btn-xs tooltips" data-original-title="Excluir" data-placement="bottom"><i class="fa fa-trash-o"></i></a>
                                                {/if}
                                            </td>
                                            
                                        </tr>
                                        {/foreach}
                                        
                                        
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen --> 
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                {if $visao_adm eq false}
                    <section class="row">
                        
                        <section class="col-lg-12">
                            
                            <a href="{$admin_url}/parceiros/novo" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar novo</a>

                        </section><!-- /col-lg-12 -->
                        
                    </section><!-- /row -->
                {/if}
            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
       
        <!-- Modal - Deletar Parceiro -->
    
        <section class="modal fade modal-alert" id="deletarParceiro" tabindex="-1" role="dialog" aria-labelledby="deletarParceiro" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Deletar Parceiro</h4>
                        <input type="hidden" value="" id="id_apagar" name="id_apagar" />
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">Você deseja fazer isso?</section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Não</button>
                        <button class="btn btn-danger" onclick="javascript:confirmaDeletar();" type="submit">Sim</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
        
        <!-- Modal - Visualizar Parceiro -->
    
        <section class="modal fade modal-primary" id="visualizarParceiroPF" tabindex="-1" role="dialog" aria-labelledby="visualizarParceiroPF" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Visualizar Parceiro</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                                
                        <h4><span id="nome_pf">Adriano Gianini</span> - <small><span id="email_pf">adriano@cursosiag.com.br</span></small></h4>
                        
                        <hr/>
                        
                        <p>CPF: <strong><span id="cpf_pf">000.000.000-00</span></strong></p>
                        <p>Razão Social: <strong><span id="razao_social_pf">EAD</span></strong></p>
                        
                        <hr/>
                        
                        <p>CEP: <strong><span id="cep_pf">00000-000</span></strong></p>
                        <p>Endereço: <strong><span id="endereco_pf">Rua Treze de Maio</span></strong></p>
                        <p>Complemento: <strong><span id="complemento_pf">Próximo ao SESC poço</span></strong></p>
                        <p>Bairro: <strong><span id="bairro_pf">Poço</span></strong></p>
                        <p>Estado: <strong><span id="estado_pf">Alagoas</span></strong></p>
                        <p>Cidade: <strong><span id="cidade_pf">Maceió</span></strong></p>
                        <p>Telefone: <strong><span id="telefone_pf">(00) 0000 - 0000</span></strong></p>
                        
                        <hr/>
                        
                        <p>Site: <strong><a id="link_pf" target="_blank"><span id="site_pf"></span></a></strong></p>
                        
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
        
        <!-- Modal - Visualizar Parceiro -->
    
        <section class="modal fade modal-primary" id="visualizarParceiroPJ" tabindex="-1" role="dialog" aria-labelledby="visualizarParceiroPF" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Visualizar Parceiro</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                                
                        <h4><span id="nome_pj">Cursos IAG</span> - <small><span id="email_pj">suporte@cursosiag.com.br</span></small></h4>
                        
                        <hr/>
                        
                        <p>Tipo de Cadastro: <strong>Pessoa Jurídica</strong></p>
                        <p>Nome do Responsável: <strong><span id="nome_responsavel_pj">Adriano Gianini</span></strong></p>
                        <p>CNPJ: <strong><span id="cnpj_pj">00.000.000/0000-00</span></strong></p>
                        <p>Razão Social: <strong><span id="razao_social_pj">EAD</span></strong></p>
                        
                        <hr/>
                        
                        <p>CEP: <strong><span id="cep_pj">00000-000</span></strong></p>
                        <p>Endereço: <strong><span id="endereco_pj">Rua Treze de Maio</span></strong></p>
                        <p>Complemento: <strong><span id="complemento_pj">Próximo ao SESC poço</span></strong></p>
                        <p>Bairro: <strong><span id="bairro_pj">Poço</span></strong></p>
                        <p>Estado: <strong><span id="estado_pj">Alagoas</span></strong></p>
                        <p>Cidade: <strong><span id="cidade_pj">Maceió</span></strong></p>
                        <p>Telefone: <strong><span id="telefone_pj">(00) 0000 - 0000</span></strong></p>
                        
                        <hr/>
                        
                        <p>Site: <strong><a target="_blank"><span id="site_pj"></span></a></strong></p>
                        
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
    </section><!-- /container -->

 {literal}
<script type="text/javascript">
function getDetalheParceiro(tipo,id){
    if(tipo == "PF"){
        getParceiroPF(id);
    }else if(tipo == "PJ"){
        getParceiroPJ(id);
    }
}
function getParceiroPF(id){
    $.post('{/literal}{$admin_url}{literal}/parceiros/visualizar/'+id, function(json){
        dados = jQuery.parseJSON(json);
        console.log(dados);
        $("#nome_pf").html(dados.nome);
        $("#email_pf").html(dados.email);
        $("#cpf_pf").html(dados.cpf);
        $("#razao_social_pf").html(dados.razao_social);
        $("#cep_pf").html(dados.cep);
        $("#endereco_pf").html(dados.endereco);
        $("#bairro_pf").html(dados.bairro);
        $("#estado_pf").html(dados.estado);
        $("#cidade_pf").html(dados.cidade);
        $("#telefone_pf").html(dados.telefone);
        $("#site_pf").html(dados.site);
        //$("#link_pf").attr("href",dados.site);
    });
}
function getParceiroPJ(id){
    $.post('{/literal}{$admin_url}{literal}/parceiros/visualizar/'+id, function(json){
        dados = jQuery.parseJSON(json);
        console.log(dados);
        $("#nome_pj").html(dados.nome);
        $("#email_pj").html(dados.email);
        $("#cnpj_pj").html(dados.cnpj);
        $("#razao_social_pj").html(dados.razao_social);
        $("#cep_pj").html(dados.cep);
        $("#endereco_pj").html(dados.endereco);
        $("#bairro_pj").html(dados.bairro);
        $("#estado_pj").html(dados.estado);
        $("#cidade_pj").html(dados.cidade);
        $("#telefone_pj").html(dados.telefone);
        $("#site_pj").html(dados.site);
    });
}

function setaDeletar(id) {
    $('#id_apagar').val(id);
}
function confirmaDeletar() {
    window.location.href='{/literal}{$admin_url}{literal}/parceiros/apagar/' + $('#id_apagar').val();
}
</script>
{/literal}  