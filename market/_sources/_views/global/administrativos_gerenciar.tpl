
<section id="main-content">
  
    <section class="wrapper site-min-height">
        
        <section class="row">                    
            <section class="col-lg-12">                        
                <ul class="breadcrumb">
                    
                    <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                    <li class="active">Administrativos</li>
                    
                </ul>                        
            </section><!-- /col-lg-12 -->                
        </section><!-- /row -->
        
        <section class="row">      
            <section class="col-lg-4">
                <form>
                    <section class="input-group m-bot15">
                        
                        <input type="text" name="palavra_busca" class="form-control">
                        
                        <span class="input-group-btn"><button type="submit" class="btn btn-white"><i class="fa fa-search"></i></button></span>
                            
                    </section><!-- /input-group -->
                </form>
            </section>

            {if $visao_adm eq false}    
                <section class="col-lg-12">                                        
                    <a href="{$admin_url}/administrativos/novo" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar novo</a>
                </section><!-- /col-lg-12 -->

            {/if}            
        </section><!-- /row -->

        
        
        <br/>
        
        <section class="row">                    
            <section class="col-lg-12">                    
                <section class="panel">                            
                    <header class="panel-heading"><strong>Todos os Administrativos</strong></header>                            
                    <section id="unseen">                            
                        <table class="table table-striped table-advance table-hover">                                    
                            <thead>                                        
                                <tr>                                        
                                    <th><i class="fa fa-user"></i> Administrativo</th>
                                    <th><i class="fa fa-envelope"></i> E-mail</th>
                                    <th></th>                                            
                                </tr>                                        
                            </thead>                                    
                            <tbody>        
                                {foreach item=administrativo from=$administrativos}


                                <tr>                                        
                                    <td><a href="{$admin_url}/administrativos/editar/{$administrativo.id}">{$administrativo.nome}</a></td>
                                    <td>{$administrativo.email}</td>
                                    <td>
                                        
                                        <a href="{$admin_url}/administrativos/visualizar/{$administrativo.id}" class="btn btn-success btn-xs tooltips" data-original-title="Visualizar" data-placement="bottom"><i class="fa fa-search"></i></a> 
                                        {if $visao_adm eq false}
                                            <a href="{$admin_url}/administrativos/editar/{$administrativo.id}" class="btn btn-primary btn-xs tooltips" data-original-title="Editar" data-placement="bottom"><i class="fa fa-pencil"></i></a>

                                            <a data-toggle="modal" href="#deletarAdministrativo" onclick="javascript:setaDeletar({$administrativo.id});" class="btn {if $pagina.status == 1}btn-success {else}btn-danger{/if} btn-xs tooltips" data-original-title="Excluir" data-placement="bottom"><i class="fa fa-trash-o"></i></a>                                    
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
                <section class="col-lg-12">                                        
                    <a href="{$admin_url}/administrativos/novo" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar novo</a>
                </section><!-- /col-lg-12 -->
        {/if}

    </section><!-- /wrapper -->
    
</section><!-- /main-content -->

<!-- Modal - Deletar Administrativo -->
<section class="modal fade modal-alert" id="deletarAdministrativo" tabindex="-1" role="dialog" aria-labelledby="deletarAdministrativo" aria-hidden="true">
    
    <section class="modal-dialog">
        
        <section class="modal-content">
            
            <section class="modal-header">
                
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Deletar Administrativo</h4>
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

{literal}
<script type="text/javascript">

//Delete
function setaDeletar(id) {
    $('#id_apagar').val(id);
}
function confirmaDeletar() {
    window.location.href='{/literal}{$admin_url}{literal}/administrativos/apagar/' + $('#id_apagar').val();
}     

</script>
{/literal}   