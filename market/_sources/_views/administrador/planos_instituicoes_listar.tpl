        <section id="main-content">
          
            <section class="wrapper site-min-height">
              
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Planos</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                            
                        <a href="{$admin_url}/planos/novo-plano-instituicao" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar novo</a>

                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <br/>
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Todos os Planos</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-credit-card"></i> Plano</th>
                                            <th class="hidden-xs"><i class="fa fa-users"></i> Quantidade de Alunos</th>
                                            <th class="hidden-xs"><i class="fa fa-money"></i> Valor</th>
                                            <th><i class="fa fa-bar-chart-o"></i> Status</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach item=plano from=$planos}
                                        <tr>
                                            
                                            <td><a href="{$admin_url}/planos/editar-plano-instituicao/{$plano.id}">{$plano.plano}</a></td>
                                            <td class="hidden-xs">{$plano.qtd_alunos}</td>
                                            <td class="hidden-xs">R$ {$plano.valor}</td>
                                            <td>
                                                {if $plano.status == 1}
                                                <span class="label label-success">Ativo</span>
                                                {else}
                                                <span class="label label-danger">Inativo</span>
                                                {/if}
                                            </td>
                                            <td>
                                                 
                                                <a href="{$admin_url}/planos/editar-plano-instituicao/{$plano.id}" class="btn btn-primary btn-xs tooltips" data-original-title="Editar" data-placement="bottom"><i class="fa fa-pencil"></i></a>
                                                <a data-toggle="modal" href="#deletarPlano" class="btn btn-danger btn-xs tooltips" data-original-title="Excluir" onclick="javascript:setaDeletar({$plano.id});" data-placement="bottom"><i class="fa fa-trash-o"></i></a>
                                                
                                            </td>
                                            
                                        </tr>
                                        {/foreach}                                        
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen --> 
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row --> 
                
                <section class="row">
                    
                    <section class="col-lg-12">
                            
                        <a href="{$admin_url}/planos/novo-plano-instituicao" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar novo</a>

                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
              
            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        

        <section class="modal fade modal-alert" id="deletarPlano" tabindex="-1" role="dialog" aria-labelledby="deletarPlano" aria-hidden="true">
            
            <section class="modal-dialog">
                <input type="hidden" value="" id="id_apagar" name="id_apagar" />
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Deletar Plano</h4>
                        
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
function setaDeletar(id) {
    $('#id_apagar').val(id);
}
function confirmaDeletar() {
    window.location.href='{/literal}{$admin_url}{literal}/planos/apagar/' + $('#id_apagar').val();
}
</script>
{/literal}