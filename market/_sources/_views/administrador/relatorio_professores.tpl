
        <section id="main-content">
          
            <section class="wrapper site-min-height">

                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Relatórios Professores</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-8">
                        
                        <section class="btn-group">
                            
                            <button data-toggle="dropdown" class="btn btn-white dropdown-toggle" type="button"><i class="fa fa-download"></i> Exportar Dados <span class="caret"></span></button>
                            
                            <ul role="menu" class="dropdown-menu">
                                
                                <li><a  href="{$admin_url}/relatorios/relatorio/?tipo=pdf&dados=professoresGerenciar&palavra_busca={$palavra_busca}" target="_blank">Exportar em PDF</a></li>
                                <li><a  href="{$admin_url}/relatorios/relatorio/?tipo=xls&dados=professoresGerenciar&palavra_busca={$palavra_busca}" target="_blank">Exportar em XLS</a></li>
                                
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
                            
                            <header class="panel-heading"><strong>Relatórios Professores</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-briefcase"></i> Professor</th>
                                            <th class="hidden-xs"><i class="fa fa-file-o"></i> Email</th>
                                            <th class="hidden-xs"><i class="fa fa-user"></i> CEP</th>
                                            <th><i class="fa fa-envelope"></i> CPF</th>
                                            <th><i class="fa fa-credit-card"></i> Telefone</th>
                                            <th><i class="fa fa-credit-card"></i> Mês Atual</th>
                                            <th class="hidden-xs"><i class="fa fa-signal"></i> Total</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach from=$professores item=professor}
                                        <tr>
                                            <td>{$professor.nome}</td>
                                            <td class="hidden-xs">{$professor.email}</td>
                                            <td class="hidden-xs">{$professor.cep}</td>
                                            <td>{$professor.cpf}</td>
                                            <td>{$professor.telefone}</td>
                                            <td>R$ {$professor.total_venda_mes}</td>
                                            <td>R$ {$professor.total}</td>                                            
                                            <td>
                                                
                                                <a href="#visualizarProfessor" Onclick="buscarValores({$professor.id});" class="btn btn-success btn-xs tooltips" data-toggle="modal" data-original-title="Visualizar" ><i class="fa fa-search"></i></a>                                                 
                                                
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
        
        <!-- /MODAL visualizarProfessor  -->

        <section aria-hidden="false" aria-labelledby="visualizarProfessor" role="dialog" tabindex="-1" id="visualizarProfessor" class="modal fade modal-primary in" style="display: none;">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                        <h4 class="modal-title">Visualizar Professor</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                               
                        <div id="cabecalho"></div> 
                        
                        
                        <hr>
                        <div id="corpo"></div>
                        
                        
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section>
    
    </section><!-- /container -->

{literal}
<script type="text/javascript">
function buscarValores(professor_id) {


    $.post('{/literal}{$admin_url}{literal}/relatorios/buscarValoresProfessor', {professor:professor_id}, function html(json){
        $('#retorno-form').html('');        
        dados = jQuery.parseJSON(json);      
        $('#cabecalho').html('<h4>'+dados.nome+' - <small>'+dados.email+'</small></h4>');


        $('#corpo').html('  <p>CPF: <strong>'+dados.cpf+'</strong></p>\
                            <p>CEP: <strong>'+dados.cep+'</strong></p>\
                            <p>Endereço: <strong>'+dados.endereco+'</strong></p>\
                            <p>Complemento: <strong>'+dados.complemento+'</strong></p>\
                            <p>Bairro: <strong>'+dados.bairro+'</strong></p>\
                            <p>Estado: <strong>'+dados.estado+'</strong></p>\
                            <p>Cidade: <strong>'+dados.cidade+'</strong></p>\
                            <p>Telefone: <strong>'+dados.telefone+'</strong></p>'); 
        
    });
}

function teste(){
    alert('teste');
}
</script>
{/literal}  
