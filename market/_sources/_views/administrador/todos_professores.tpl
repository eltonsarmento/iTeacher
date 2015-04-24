<section id="main-content">
          
            <section class="wrapper site-min-height">

                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Todos os Professores</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <a href="{$admin_url}/professor/novo" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar novo</a>

                    </section><!-- /col-lg-12 -->
                    
                </section><!-- /row -->
                
                <br>
                
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
                                        {foreach from=$professores item=professor}
                                        <tr>
                                            
                                            <td><a href="{$admin_url}/professor/editar/{$professor.id}">{$professor.nome}</a></td>
                                            <td>{$professor.email}</td>
                                            <td class="hidden-xs">{$professor.cep}</td>
                                            <td class="hidden-xs">{$professor.cpf}</td>
                                            <td class="hidden-xs">{$professor.telefone}</td>
                                            <td>
                                                <a href="#" onclick="validaAcessoProfessor({$professor.id})" class="btn btn-success btn-xs tooltips" data-original-title="Acessar" data-placement="bottom"><i class="fa fa-desktop"></i></a> 
                                                <a href="{$admin_url}/professor/editar/{$professor.id}" class="btn btn-primary btn-xs tooltips" data-original-title="Editar" data-placement="bottom"><i class="fa fa-pencil"></i></a>
                                                {if $professor.ativo eq 1}
                                                    <a data-toggle="modal" href="#desativarProfessor" onclick="setaDesativar({$professor.id})" class="btn btn-danger btn-xs tooltips" data-original-title="Desativar" data-placement="bottom"><i class="fa fa-times"></i></a>
                                                {else}
                                                    <a data-toggle="modal" href="#ativarProfessor" onclick="setaAtivar({$professor.id})" class="btn btn-success btn-xs tooltips" data-original-title="Ativar" data-placement="bottom"><i class="fa fa-check"></i></a>
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
                        
                        <a href="{$admin_url}/professor/novo" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar novo</a>

                    </section><!-- /col-lg-12 -->
                    
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        

    
        <!-- Modal - Desativar Professor -->
    
        <section class="modal fade modal-alert" id="desativarProfessor" tabindex="-1" role="dialog" aria-labelledby="desativarProfessor" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Desativar Professor</h4>
                        <input type="hidden" name="id_desativar" id="id_desativar">
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">Você deseja fazer isso?</section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Não</button>
                        <button class="btn btn-danger" type="submit" onclick="confirmaDesativar();">Sim</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->

        <!-- Modal - Ativar Professor -->
    
        <section class="modal fade modal-success" id="ativarProfessor" tabindex="-1" role="dialog" aria-labelledby="desativarProfessor" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Ativar Professor</h4>
                        <input type="hidden" name="id_ativar" id="id_ativar">
                        
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
    window.location.href='{/literal}{$admin_url}{literal}/professor/desativar/' + $('#id_desativar').val();
}
//Ativar
function setaAtivar(id) {
    $('#id_ativar').val(id);
}

function confirmaAtivar() {
    window.location.href='{/literal}{$admin_url}{literal}/professor/ativar/' + $('#id_ativar').val();
}

function validaAcessoProfessor(id) {
    window.location.href='{/literal}{$admin_url}{literal}/professor/validarAcessoProfessor/' + id;
}

</script>
{/literal}
 