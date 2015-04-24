        <section id="main-content">
          
            <section class="wrapper site-min-height">

                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Todas as Instituições</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <a href="{$admin_url}/instituicoes/novo" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar nova</a>

                    </section><!-- /col-lg-12 -->
                    
                </section><!-- /row -->
                
                <br>
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Todas as Instituições</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-briefcase"></i> Instituição</th>
                                            <th><i class="fa fa-file-o"></i> CNPJ</th>
                                            <th><i class="fa fa-user"></i> Responsável</th>
                                            <th><i class="fa fa-envelope"></i> E-mail Responsável</th>
                                            <th><i class="fa fa-signal"></i> Status</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach from=$instituicoes item=instituicao}
                                        <tr>
                                            
                                            <td><a href="{$admin_url}/instituicoes/editar/{$instituicao.id}">{$instituicao.nome}</a></td>
                                            <td>{$instituicao.cnpj}</td>
                                            <td>{$instituicao.nome_responsavel}</td>
                                            <td>{$instituicao.email_secundario}</td>
                                            <td><span class="label label-{if $instituicao.ativo eq 1}success{else}danger{/if}">{if $instituicao.ativo eq 1}Ativa{else}Desativada{/if}</span></td>
                                            <td>
                                                
                                                <a href="{$admin_url}/instituicoes/validarAcesso/{$instituicao.id}" class="btn btn-success btn-xs tooltips" data-original-title="Acessar" data-placement="bottom"><i class="fa fa-desktop"></i></a> 
                                                <a href="{$admin_url}/instituicoes/editar/{$instituicao.id}" class="btn btn-primary btn-xs tooltips" data-original-title="Editar" data-placement="bottom"><i class="fa fa-pencil"></i></a>
                                                {if $instituicao.ativo eq 1}
                                                    <a data-toggle="modal" href="#desativarInstituicao" onclick="setaDesativar({$instituicao.id});" class="btn btn-danger btn-xs tooltips" data-original-title="Desativar" data-placement="bottom"><i class="fa fa-times"></i></a>
                                                {else}
                                                    <a data-toggle="modal" href="#ativarInstituicao" onclick="setaAtivar({$instituicao.id});" class="btn btn-success btn-xs tooltips" data-original-title="Ativar" data-placement="bottom"><i class="fa fa-check"></i></a>
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
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <a href="{$admin_url}/instituicoes/novo"href="{$admin_url}/instituicoes/novo" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar nova</a>

                    </section><!-- /col-lg-12 -->
                    
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        

    
        <!-- Modal - Desativar Instituição -->
    
        <section class="modal fade modal-alert" id="desativarInstituicao" tabindex="-1" role="dialog" aria-labelledby="desativarInstituicao" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Desativar Instituição</h4>
                        <input type="hidden" value="" id="id_desativar" name="id_desativar"/>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">Você deseja fazer isso?</section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Não</button>
                        <button class="btn btn-danger" type="submit" onclick="confirmaDesativar();">Sim</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->

        <!-- Modal - Desativar Instituição -->
    
        <section class="modal fade modal-succes" id="ativarInstituicao" tabindex="-1" role="dialog" aria-labelledby="desativarInstituicao" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Ativar Instituição</h4>
                        <input type="hidden" value="" id="id_ativar" name="id_ativar"/>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">Você deseja fazer isso?</section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Não</button>
                        <button class="btn btn-danger" type="submit" onclick="confirmaAtivar();">Sim</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
    </section><!-- /container -->

    <!-- JS -->
    
{literal}
<script type="text/javascript">
//Desativar
function setaDesativar(id) {
    $('#id_desativar').val(id);
}
function confirmaDesativar() {
    window.location.href='{/literal}{$admin_url}{literal}/instituicoes/desativar/' + $('#id_desativar').val();
}
//Ativar
function setaAtivar(id) {
    $('#id_ativar').val(id);
}

function confirmaAtivar() {
    window.location.href='{/literal}{$admin_url}{literal}/instituicoes/ativar/' + $('#id_ativar').val();
}
</script>
{/literal}