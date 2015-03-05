        <section id="main-content">
          
            <section class="wrapper site-min-height">

                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Todos os Coordenadores</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

                {if $msg_alert}
                    <div class="alert alert-info">{$msg_alert}</div>
                {/if}
                
                <section class="row">
                    {if $visao_adm eq false}
                        <section class="col-lg-12">
                        
                            <a href="{$admin_url}/coordenadores/novo" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar novo</a>

                        </section><!-- /col-lg-12 -->
                    {/if}
                </section><!-- /row -->
                
                <br>
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Todos os Coordenadores</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-user"></i> Coordenador</th>
                                            <th><i class="fa fa-envelope"></i> E-mail</th>
                                            <th class="hidden-xs"><i class="fa fa-truck"></i> CEP</th>
                                            <th class="hidden-xs"><i class="fa fa-credit-card"></i> CPF</th>
                                            <th class="hidden-xs"><i class="fa fa-phone"></i> Telefone</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach from=$coordenadores item=coordenador}
                                        <tr>
                                            
                                            <td><a href="{$admin_url}/coordenadores/editar/{$coordenador.id}">{$coordenador.nome}</a></td>
                                            <td>{$coordenador.email}</td>
                                            <td class="hidden-xs">{$coordenador.cep}</td>
                                            <td class="hidden-xs">{$coordenador.cpf}</td>
                                            <td class="hidden-xs">{$coordenador.telefone}</td>
                                            <td>
                                                
                                                <a href="{$admin_url}/coordenadores/visualizar/{$coordenador.id}" class="btn btn-success btn-xs tooltips" data-original-title="Visualizar" data-placement="bottom"><i class="fa fa-search"></i></a>
                                                {if $visao_adm eq false}
                                                    <a href="{$admin_url}/coordenadores/editar/{$coordenador.id}" class="btn btn-primary btn-xs tooltips" data-original-title="Editar" data-placement="bottom"><i class="fa fa-pencil"></i></a>
                                                    <a data-toggle="modal" href="#deletarCoordenador" onclick="javascript:setaDeletar({$coordenador.id});" class="btn btn-danger btn-xs tooltips" data-original-title="Excluir" data-placement="bottom"><i class="fa fa-trash-o"></i></a>
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
                        
                            <a href="{$admin_url}/coordenadores/novo" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar novo</a>

                        </section><!-- /col-lg-12 -->
                    
                    </section><!-- /row -->
                {/if}
            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
       
    
        <!-- Modal - Deletar Coordenador -->
    
        <section class="modal fade modal-alert" id="deletarCoordenador" tabindex="-1" role="dialog" aria-labelledby="deletarCoordenador" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Deletar Coordenador</h4>
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
    
    </section><!-- /container -->

{literal}
<script type="text/javascript">

//Delete
function setaDeletar(id) {
    $('#id_apagar').val(id);
}
function confirmaDeletar() {
    window.location.href='{/literal}{$admin_url}{literal}/coordenadores/apagar/' + $('#id_apagar').val();
}     

</script>
{/literal} 
