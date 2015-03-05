        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Professor</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    {if $visao_adm eq false}
                        <section class="col-lg-8">
                            
                            <a href="{$admin_url}/professor/novo" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar novo</a>
                            
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
                    {/if}   
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Todos os Professores</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-user"></i> Professor</th>
                                            <th><i class="fa fa-envelope"></i> E-mail</th>
                                            <th class="hidden-xs"><i class="fa fa-truck"></i> CEP</th>
                                            <th class="hidden-xs"><i class="fa fa-credit-card"></i> CPF</th>
                                            <th class="hidden-xs"><i class="fa fa-phone"></i> Telefone</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                     <tbody>
                                        {foreach item=professor key=k from=$professores}
                                                <!-- DADOS MODAL -->
                                                 <input type="hidden" id="nome_{$k}" value="{$professor.nome}"/>
                                                <input type="hidden" id="email_{$k}" value="{$professor.email}"/>
                                                <input type="hidden" id="cep_{$k}" value="{$professor.cep}"/>
                                                <input type="hidden" id="cpf_{$k}" value="{$professor.cpf}"/>
                                                <input type="hidden" id="telefone_{$k}" value="{$professor.telefone}"/>
                                                <input type="hidden" id="endereco_{$k}" value="{$professor.endereco}"/>
                                                <input type="hidden" id="bairro_{$k}" value="{$professor.bairro}"/>
                                                <input type="hidden" id="cidade_{$k}" value="{$professor.cidade}"/>
                                                <input type="hidden" id="estado_{$k}" value="{$professor.estado}"/>
                                                <!-- FIM DADOS MODAL -->
                                        <tr>
                                            <td><a href="{$admin_url}/professor/editar/{$professor.id}">{$professor.nome}</a></td>
                                            <td>{$professor.email}</td>
                                            <td class="hidden-xs">{$professor.cep}</td>
                                            <td class="hidden-xs">{$professor.cpf}</td>
                                            <td class="hidden-xs">{$professor.telefone}</td>
                                            <td>
                                                <a href="{$admin_url}/professor/visualizar/{$professor.id}" class="btn btn-success btn-xs tooltips" data-original-title="Visualizar" data-placement="bottom"><i class="fa fa-search"></i></a>
                                                {if $visao_adm eq false} 
                                                    <a href="{$admin_url}/professor/editar/{$professor.id}" class="btn btn-primary btn-xs tooltips" data-original-title="Editar" data-placement="bottom"><i class="fa fa-pencil"></i></a>
                                                    <a data-toggle="modal" href="#deletarProfessor" onclick="javascript:setaDeletar({$professor.id});" class="btn btn-danger btn-xs tooltips" data-original-title="Excluir" data-placement="bottom"><i class="fa fa-trash-o"></i></a> 
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
                                
                            <a href="{$admin_url}/professor/novo" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar novo</a>

                        </section><!-- /col-lg-12 -->
                    
                    </section><!-- /row -->
                {/if}
                <!-- PAGINACAO -->
                <section class="row">
                    <section class="col-lg-12">
                        <section class="text-center">
                            
                            <ul class="pagination">
                                {$paginacao.anterior}
                                {$paginacao.page_string}
                                {$paginacao.proxima}    
                            </ul>
                            
                        </section>
                    </section>
                </section>
                <!-- FIM PAGINACAO -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->

        
        <!-- Modal - Deletar ALuno -->
        <section class="modal fade modal-alert" id="deletarProfessor" tabindex="-1" role="dialog" aria-labelledby="deletarProfessor" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Deletar Professor</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">Você deseja fazer isso?</section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Não</button>
                        <button class="btn btn-danger" type="submit">Sim</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->            