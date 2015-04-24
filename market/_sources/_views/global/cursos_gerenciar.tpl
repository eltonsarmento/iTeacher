<section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Cursos</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                {if $visao_adm eq false}
                    <section class="col-lg-12">
                        <section class="col-lg-8">                                                 
                            <a href="{$admin_url}/cursos/novo" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar novo</a>
                        </section><!-- /col-lg-6 -->
                        
                        <section class="col-lg-4">
                            <form>
                                <section class="input-group m-bot15">
                                        
                                    <input type="text" name="palavra_busca" class="form-control">
                                        
                                    <span class="input-group-btn"><button type="submit" class="btn btn-white"><i class="fa fa-search"></i></button></span>
                                        
                                </section><!-- /input-group -->
                            </form>
                        </section>    
                    </section><!-- /col-lg-12 -->
                {else}
                    <section class="col-lg-4">
                            <form>
                                <section class="input-group m-bot15">
                                        
                                    <input type="text" name="palavra_busca" class="form-control">
                                        
                                    <span class="input-group-btn"><button type="submit" class="btn btn-white"><i class="fa fa-search"></i></button></span>
                                        
                                </section><!-- /input-group -->
                            </form>
                        </section>   
                {/if}
                </section><!-- /row -->
                
                <br/>
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Todos os Cursos</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-book"></i> Curso</th>
                                            <th class="hidden-xs"><i class="fa fa-archive"></i> Capítulos</th>
                                            <th class="hidden-xs"><i class="fa fa-comment"></i> Quizzes</th>
                                            <th class="hidden-xs"><i class="fa fa-user"></i> Professor</th>
                                            <th class="hidden-xs"><i class="fa fa-user"></i> Situação</th>
                                            <th class="hidden-xs"><i class="fa fa-laptop"></i> Área</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach from=$cursos key=k item=curso}
                                        <tr>
                                            
                                            <td><a href="{$admin_url}/aulas/listar/{$curso.id}">{$curso.curso}</a></td>
                                            <td class="hidden-xs">{$curso.qt_capitulos}</td>
                                            <td class="hidden-xs">{$curso.qt_quiz}</td>
                                            <td class="hidden-xs">{$curso.professor}</td>
                                            <td class="hidden-xs">                                                
                                                <span class="label label-{if $curso.exibir_site eq 1}success{else}danger{/if}">
                                                    <i class="fa fa-check-circle"></i>{if $curso.exibir_site eq 1} Aprovado{else} Aguardando Aprovação{/if}
                                                </span>                                                
                                            </td>
                                            <td class="hidden-xs">
                                                {foreach from=$curso.categorias item=categoria_curso} <span>{$categoria_curso.area}</span> <br/> {/foreach}
                                                <input type="hidden" value="{$curso.id}" id="curso_id_{$k}" />
                                                <input type="hidden" value="{$curso.servidor}" id="servidor_{$k}" />
                                            </td>
                                            
                                             <td>
                                            {if $visao_adm eq false}
                                                {if $usuario_nivel == 7}
                                                    <a href="{$admin_url}/aulas/listar/{$curso.id}" class="btn btn-warning btn-xs tooltips" data-original-title="Aulas" data-placement="bottom"><i class="fa fa-microphone"></i></a>
                                                    <a href="{$admin_url}/quiz/listar/{$curso.id}" class="btn btn-default btn-xs tooltips" data-original-title="Quizzes" data-placement="bottom"><i class="fa fa-comment"></i></a>
                                                {else}
                                                    <a data-toggle="modal" onclick="javascript:setarValores({$k})" href="#definirServidor" class="btn btn-success btn-xs tooltips" data-original-title="Servidor" data-placement="bottom"><i class="fa fa-cog"></i></a>
                                                
                                                    <a href="{$admin_url}/cursos/editar/{$curso.id}" class="btn btn-primary btn-xs tooltips" data-original-title="Editar" data-placement="bottom"><i class="fa fa-pencil"></i></a>
                                                    
                                                    {if ($usuario_nivel == 2 || $usuario_nivel == 1 || $usuario_nivel == 7 || $usuario_nivel == 6) && $curso.alunos.total == 0}
                                                    <a data-toggle="modal" href="#deletarCurso" onclick="javascript:setaDeletar({$curso.id});" class="btn btn-danger btn-xs tooltips" data-original-title="Excluir" data-placement="bottom"><i class="fa fa-trash-o"></i></a> 
                                                    {/if}
                                                    |
                                                    <a href="{$admin_url}/aulas/listar/{$curso.id}" class="btn btn-warning btn-xs tooltips" data-original-title="Aulas" data-placement="bottom"><i class="fa fa-microphone"></i></a>
                                                    <a href="{$admin_url}/quiz/listar/{$curso.id}" class="btn btn-default btn-xs tooltips" data-original-title="Quizzes" data-placement="bottom"><i class="fa fa-comment"></i></a>
                                                    <a data-toggle="modal" href="#listarAlunos" onclick="javascript:getAlunosByCurso({$curso.id});" class="btn btn-info btn-xs tooltips" data-original-title="Alunos" data-placement="bottom"><i class="fa fa-users"></i></a>
                                                {/if}
                                            {else}
                                                <a data-toggle="modal" href="#listarAlunos" onclick="javascript:getAlunosByCurso({$curso.id});" class="btn btn-info btn-xs tooltips" data-original-title="Alunos" data-placement="bottom"><i class="fa fa-users"></i></a>   
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
                                
                            <a href="{$admin_url}/cursos/novo" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar novo</a>

                        </section><!-- /col-lg-12 -->
                    
                    </section><!-- /row -->
                {/if }
            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
<!-- Modal - Deletar Curso -->
        
        <section class="modal fade modal-alert" id="deletarCurso" tabindex="-1" role="dialog" aria-labelledby="deletarCurso" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        <input type="hidden" value="" id="id_apagar" name="id_apagar" />
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Deletar Curso</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">Você deseja fazer isso?</section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Não</button>
                        <button class="btn btn-danger" onclick="javascript:confirmaDeletar();" type="submit">Sim</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section>
<!-- /modal -->

<!-- Modal - Definir Servidor -->
        
        <section class="modal fade modal-primary" id="definirServidor" tabindex="-1" role="dialog" aria-labelledby="definirServidor" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Definir Servidor</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                    
                        <form class="form-horizontal tasi-form" id="trocar_servidor" onsubmit="return false;">
                            <input type="hidden" value="" name="curso_id" id="curso_id" />
                            <input type="hidden" value="" name="posicao" id="posicao" />
                            <input type="hidden" value="1" name="editar" id="editar" />
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">Servidor</label>
                                <div id="resposta_trocar_servidor"></div>
                                
                                <section class="col-lg-10">
                                
                                    <select name="servidor" class="form-control" id="servidor_modal">
                                        
                                        <option value="0" selected>Default</option>
                                        <option value="1">Amazon</option>
                                        <option value="2">Vimeo</option>
                                        <option value="3">Youtube</option>
                                        
                                    </select>                            
                                
                                </section><!-- input-group -->
                            
                            </section><!-- form-group -->
                            
                             <section class="form-group">
                                
                                <section class="col-lg-offset-2 col-lg-10">
                                
                                    <button class="btn btn-success" onclick="javascript:mudarServidor();"><i class="fa fa-check-circle"></i> Salvar</button>                       
                                
                                </section><!-- input-group -->
                            
                            </section><!-- form-group -->
                            
                        </form>
                    
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section>
<!-- /modal -->

<section class="modal fade modal-primary" id="listarAlunos" tabindex="-1" role="dialog" aria-labelledby="listarAlunos" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Listar Alunos</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <section class="row">
                            
                            <section style="height: 328px;overflow: auto;">
                        
                            <table class="table table-striped table-hover">
                                        
                                <thead>
                                    
                                    <tr>
                                        
                                        <th><i class="fa fa-user"></i> Aluno</th>
                                        <th><i class="fa fa-envelope"></i> E-mail</th>
                                        <th><i class="fa fa-calendar"></i> Data de Expiração</th>
                                        
                                    </tr>
                                    
                                </thead>
                                
                                <tbody id="alunos_curso">

                                    
                                    
                                </tbody>
                                
                            </table>
                                
                            </section>
                            
                        </section><!-- /row -->
                        
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
        
{literal}
<script type="text/javascript">
function getAlunosByCurso(id){
    $.post('{/literal}{$admin_url}{literal}/alunos/alunos/'+id, function(json){
        dados = jQuery.parseJSON(json);
        tabela = "";
        $.each(dados, function(){    
            data_formatada = $.format.date(this.expira, 'dd/MM/yyyy');
            tabela = tabela + "<tr><td>"+this.nome+"</td><td>"+this.email+"</td><td>"+data_formatada+"</td></tr>";
        });
        $("#alunos_curso").html(tabela);
    });
}
function setaDeletar(id) {
    $('#id_apagar').val(id);
}
function confirmaDeletar() {
    window.location.href='{/literal}{$admin_url}{literal}/cursos/apagar/' + $('#id_apagar').val();
}
function mudarServidor() {
    jQuery.post('{/literal}{$admin_url}{literal}/cursos/salvarServidor',  jQuery('#trocar_servidor').serialize(), function html(html){
        jQuery('#resposta_trocar_servidor').html(html);
    });
}
function setarValores(k) {
    jQuery("#resposta_trocar_servidor").html("");    
    jQuery("#posicao").val(k);
    jQuery("#curso_id").val(jQuery("#curso_id_" + k).val());
    jQuery("#servidor_modal").val(jQuery("#servidor_" + k).val());
}
</script>
{/literal}  