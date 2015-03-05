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
                    
                    <section class="col-lg-7">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Meus Cursos</strong></header><!-- /panel-heading -->
                            
                            <section class="panel-body">
                                
                                <section class="row">
                                    {foreach from=$andamento item=curso_andamento}
                                    <section class="col-lg-4">
                                        
                                        <section class="thumbnail">
                                            
                                            <img src="{$url_site}market/uploads/cursos/{$curso_andamento.destaque_arquivo}" class="img-responsive img-thumbnail" alt="Curso de Web Design">
                                            
                                            <section class="caption">
                                                
                                                <section class="caption-title">
                                                
                                                    <h4>{$curso_andamento.curso}</h4>
                                                    
                                                </section><!-- /caption-title -->
                                                
                                                <section class="info-course">
                                                    
                                                    <p><i class="fa fa-laptop"></i> Aulas: <strong>{$curso_andamento.aulas_total}</strong></p>
                                                    
                                                    <p><i class="fa fa-calendar"></i> Disponível até: <strong class="text-danger">{$curso_andamento.expira|date_format:"%d/%m/%Y"}</strong></p>
                                                
                                                </section><!-- /info-course -->
                                                    
                                                <p class="times-course"><i class="fa fa-clock-o"></i> Último Acesso: <strong>{if $curso_andamento.ultimo_acesso}{$ultimo_curso.ultimo_acesso|date_format:"%d/%m/%Y"}{else}N/a{/if}</strong></p>
                                                
                                                <section class="percentual-course">
                                                    
                                                    <section class="progress">
                                                    
                                                        <section class="progress-bar progress-bar-info"  role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: {$curso_andamento.porcentagem}%">
                                                            
                                                            <span>{$curso_andamento.porcentagem}% Concluído</span>
                                                            
                                                        </section>
                                                        
                                                    </section>
                                                
                                                </section><!-- /percentual-course -->
                                                
                                                <p class="last-class"><i class="fa fa-laptop"></i> Última Aula: <strong class="text-danger">{$curso_andamento.aula}</strong></p>
                                                
                                                <section class="caption-buttons">
                                                    
                                                <p>
                                                    {if $curso_andamento.ultimo_acesso}
                                                        <a href="{$admin_url}/cursos/verCurso/{$curso_andamento.id}" class="btn btn-warning btn-block" role="button"><i class="fa fa-refresh"></i> Retomar Curso</a>
                                                    {else}
                                                        <a href="{$admin_url}/cursos/verCurso/{$curso_andamento.id}" class="btn btn-success btn-block" role="button"><i class="fa fa-share"></i> Iniciar Curso</a>
                                                    {/if}
                                                    
                                                </p>
                                                    
                                                </section><!-- /caption-buttons -->
                                                
                                            </section><!-- /caption -->
                                            
                                        </section><!-- /thumbnail -->
                                        
                                    </section><!-- /col-lg-4 -->
                                    {/foreach}
                                    
                                    
                                </section><!-- /row -->
                            
                            </section><!-- /panel-body -->
                            
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-7 -->
                    
                    <section class="col-lg-5">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Cursos Concluídos</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-book"></i> Curso</th>
                                            <th class="hidden-xs"><i class="fa fa-clock-o"></i> Último Acesso</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach from=$concluidos item=concluido}
                                        <tr>
                                            
                                            <td>{$concluido.curso}</td>
                                            <td class="hidden-xs">{if $concluido.ultimo_acesso}{$ultimo_curso.ultimo_acesso|date_format:"%d/%m/%Y"}{else}N/a{/if}</td>
                                            <td>
                                                
                                                <a href="{$admin_url}/cursos/verCurso/{$concluido.id}" class="btn btn-warning btn-xs"><i class="fa fa-microphone"></i> Aulas</a>
                                                <a data-toggle="modal"  href="#escreverDepoimento" onclick="setaValoresDepoimento({$concluido.curso_id})" class="btn btn-info btn-xs"><i class="fa fa-comment"></i> Depoimento</a>
                                            
                                            </td>
                                                
                                            </td>
                                            
                                        </tr>
                                        {foreachelse}
                                        <tr><td colspan="100%">Não existem nenhum curso concluído</td></tr>
                                        {/foreach}
                                        
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen --> 
                        
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-5 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        

    
        <!-- Modal - Escrever Depoimento -->
    
        <section class="modal fade modal-primary" id="escreverDepoimento" tabindex="-1" role="dialog" aria-labelledby="escreverDepoimento" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Escrever Depoimento</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        <span id="retorno-form"></span>
                        <form action="#" id="form-modal" onsubmit="salvarCampos();return false;">
                            <input type="hidden" name="curso_id" id="id_curso" value="">
                            <input type="hidden" name="editar" value="1">
                            <section class="form-group">

                                <label class="control-label">Depoimento</label>

                                <textarea class="form-control" name="mensagem" cols="30" rows="5"></textarea> 

                            </section><!-- /form-group -->
                            <section class="form-group">

                                <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Salvar</button>

                            </section><!-- /form-group -->
                        </form>
                    
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
    function setaValoresDepoimento(id_curso){
        $("#id_curso").val(id_curso);
    }

    function salvarCampos() {
    $.post('{/literal}{$admin_url}{literal}/depoimentos/novo', $('#form-modal').serialize(), function(html) {
        $('#retorno-form').html('<div class="alert alert-info">'+html+'</div>');
    });
}

</script>
{/literal}

