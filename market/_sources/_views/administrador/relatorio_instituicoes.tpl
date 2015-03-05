
        <section id="main-content">
          
            <section class="wrapper site-min-height">

                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Relatórios Instituições</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-8">
                        
                        <section class="btn-group">
                            
                            <button data-toggle="dropdown" class="btn btn-white dropdown-toggle" type="button"><i class="fa fa-download"></i> Exportar Dados <span class="caret"></span></button>
                            
                            <ul role="menu" class="dropdown-menu">
                                
                                <li><a  href="{$admin_url}/relatorios/relatorio/?tipo=pdf&dados=instituicoesGerenciar&palavra_busca={$palavra_busca}" target="_blank">Exportar em PDF</a></li>
                                <li><a  href="{$admin_url}/relatorios/relatorio/?tipo=xls&dados=instituicoesGerenciar&palavra_busca={$palavra_busca}" target="_blank">Exportar em XLS</a></li>
                                
                            </ul>
                            
                        </section><!-- /btn-group -->
                        
                    </section><!-- /col-lg-8 -->
                    
                    <section class="col-lg-4">
                        <form>
                            <section class="input-group m-bot15">
                                    
                                <input type="text" name="palavra_busca" class="form-control">
                                    
                                <span class="input-group-btn"><button type="submit" class="btn btn-white"><i class="fa fa-search"></i></button></span>
                                    
                            </section><!-- /input-group -->
                        </form>
                    </section><!-- /col-lg-4 -->

                    
                </section><!-- /row -->
                
                <br>
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Relatórios Instituições</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-briefcase"></i> Instituição</th>
                                            <th class="hidden-xs"><i class="fa fa-file-o"></i> CNPJ</th>
                                            <th class="hidden-xs"><i class="fa fa-user"></i> Responsável</th>
                                            <th><i class="fa fa-envelope"></i> E-mail Responsável</th>
                                            <th><i class="fa fa-credit-card"></i> Plano</th>
                                            <th class="hidden-xs"><i class="fa fa-signal"></i> Status</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach from=$instituicoes item=instituicao}
                                        <tr>
                                            <td>{$instituicao.nome}</td>
                                            <td class="hidden-xs">{$instituicao.cnpj}</td>
                                            <td class="hidden-xs">{$instituicao.responsavel}</td>
                                            <td>{$instituicao.email_responsavel}</td>
                                            <td><span class="label label-default">Básico</span></td>
                                            <td class="hidden-xs"><span 
                                                class="label {if $instituicao.ativo eq 1}label-success{else}label-danger{/if}">
                                                {if $instituicao.ativo eq 1}Ativa{else}Desativada{/if}</span></td>
                                            <td>
                                                
                                                <a href="#visualizarInstituicao" Onclick="buscarValores({$instituicao.id});" class="btn btn-success btn-xs tooltips" data-toggle="modal" data-original-title="Visualizar" ><i class="fa fa-search"></i></a>                                                 
                                                
                                            </td>
                                        </tr>
                                        {/foreach}
                                        
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen --> 
                        
                        </section><!-- /panel --> 
                        
                        <section class="text-center">                            
                                
                            <ul class="pagination">
                                {$paginacao.anterior}
                                {$paginacao.page_string}
                                {$paginacao.proxima}    
                            </ul>
                                                            
                        </section><!-- /text-center -->
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
    
        <!-- Modal Visualizar Instituição -->
        
        <section class="modal fade modal-primary" id="visualizarInstituicao" tabindex="-1" role="dialog" aria-labelledby="visualizarInstituicao" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Visualizar Instituição</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <section class="row">
                            
                            <section class="col-lg-6">                          
                                <section id="cabecalho"></section>     
                                <!-- <h4>Cursos IAG</h4>
                                <p>CNPJ: <strong>11.432.779/0001-30</strong></p>    -->                         
                            </section><!-- /row -->
                            
                            <section id="imagemInstituicao" class="col-lg-6">
                                
                                <!-- <figure class="hidden-xs">
                                    <img src="http://cursosiag.com.br/lms/common/site/images/logo-cursosiag.png" class="img-resposive pull-right" height="67">
                                </figure> -->
                            
                            </section><!-- /row -->

                        </section><!-- /row -->
                        
                        <hr/>
                        <div id="corpo"></div><!-- 
                        <p>Razão Social: <strong></strong></p>
                        <p>Responsável: <strong>Adriano Gianini</strong></p>
                        <p>E-mail Responsável: <strong>adriano@cursosiag.com.br</strong></p>
                        <p>Telefone Responsável: <strong>(82) 9117 - 1331</strong></p>
                        <p>Inscrição Municipal: <strong></strong></p>
                        <p>Inscrição Estadual: <strong></strong></p>
                        
                        <hr/>
                        
                        <p>CEP: <strong>57025-410</strong></p>
                        <p>Endereço: <strong>Rua Treze de Maio, 90</strong></p>
                        <p>Complemento: <strong>Próximo ao Sesc Poço</strong></p>
                        <p>Bairro: <strong>Poço</strong></p>
                        <p>Estado: <strong>Alagoas</strong></p>
                        <p>Cidade: <strong>Maceió</strong></p>
                        
                        <hr/>
                        
                        <p>Site: <strong><a href="http://www.cursosiag.com.br" target="_blank">http://www.cursosiag.com.br</a></strong></p>
                        <p>Área de Atuação: <strong>EAD</strong></p> -->
                        
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
function buscarValores(instituicao_id) {

    $.post('{/literal}{$admin_url}{literal}/relatorios/buscarValoresInstituicao', {instituicao:instituicao_id}, function html(json){
        $('#retorno-form').html('');        
        dados = jQuery.parseJSON(json);      
        $('#cabecalho').html('<h4>'+dados.nome+'</h4>\
                        <p>CNPJ: <strong>'+dados.cnpj+'</strong></p>');
        $('#imagemInstituicao').html('<figure class="hidden-xs">\
                                            <img src="{/literal}{$url_site}{literal}market/uploads/avatar/'+dados.avatar+'" class="img-resposive pull-right" height="67">\
                                        </figure>');

        $('#corpo').html('  <p>Razão Social: <strong>'+dados.razao_social+'</strong></p>\
                            <p>Responsável: <strong>'+dados.nome_responsavel+'</strong></p>\
                            <p>E-mail Responsável: <strong>'+dados.email_secundario+'</strong></p>\
                            <p>Telefone Responsável: <strong>'+dados.telefone_responsavel+'</strong></p>\
                            <p>Inscrição Municipal: <strong>'+dados.inscricao_municipal+'</strong></p>\
                            <p>Inscrição Estadual: <strong>'+dados.inscricao_estadual+'</strong></p>\
                            <hr/>\
                            <p>CEP: <strong>'+dados.cep+'</strong></p>\
                            <p>Endereço: <strong>'+dados.endereco+'</strong></p>\
                            <p>Complemento: <strong>'+dados.complemento+'</strong></p>\
                            <p>Bairro: <strong>'+dados.bairro+'</strong></p>\
                            <p>Estado: <strong>'+dados.estado+'</strong></p>\
                            <p>Cidade: <strong>'+dados.cidade+'</strong></p>\
                            <hr/>\
                            <p>Site: <strong><a href="http://'+dados.site+'" target="_blank">'+dados.site+'</a></strong></p>\
                            <p>Área de Atuação: <strong>'+dados.area_atuacao+'</strong></p>'); 
        
    });
}

function teste(){
    alert('teste');
}
</script>
{/literal}  
