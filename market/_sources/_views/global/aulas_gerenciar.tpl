<section id="main-content">
          
            <section class="wrapper site-min-height">
              
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/cursos/listar">Cursos</a></li>
                            <li class="active">{$cursoNome} - Aulas</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel panel-default">
                            
                            <section class="panel-heading">{$cursoNome}</section>
                            
                        </section>
                            
                        <button type="button" onclick="javascript:mudarPosicao();" class="btn btn-info"><i class="fa fa-check-circle"></i> Salvar posição dos capítulos</button>

                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <br/>
                {if $deleteSucesso == true} Excluido com sucesso {/if}
				<input type="hidden" value="{$curso_id}" name="curso_id"/>
                <section class="row" id="draggable_portlets">
                    
                    <section class="col-md-12 column Sortable">
                      
						{foreach item=capitulo key=k from=$capitulos}
							<section id="group{$capitulo.capitulo_id}" class="sessoes panel panel-default">                                                            
							
								<input type="hidden" value="{$capitulo.capitulo_id}" class="ordem_capitulo_id" name="ordem_capitulo_id[]" />
								<section class="panel-heading">
									
									Capítulo {$capitulo.capitulo}
									
									<span class="tools pull-right"><a class="fa fa-chevron-up" href="javascript:;"></a>
                                        <!-- <a class="fa fa-times" data-toggle="modal" href="#deletarCapitulo" onclick="javascript:setaDeletarCapitulo({$capitulo.capitulo_id}, {$capitulo.curso_id});"></a> -->
                                    </span>
									
								</section><!-- /panel-heading -->
                            
								<section class="panel-body" >
									
									<a href="{$admin_url}/aulas/novo/{$capitulo.capitulo_id}" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar nova aula</a> 
									
									<a href="javascript:mudarPosicao();" class="btn btn-info"><i class="fa fa-check-circle"></i> Salvar posição das aulas</a>
									
									<hr/>
									
									<!-- <section class="dd" id="nestable_list_1"> -->
                                    <section class="dd" id="nestable_list_{$capitulo.capitulo_id}">
										
										<ol class="dd-list">
											{foreach item=aulas key=v from=$capitulo.aulas}
											<li class="item" data-id="{$v+1}" id="item_{$v+1}">
												<input type="hidden" value="{$aulas.aula_id}" class="aulas" name="aulas[]" />
												<section class="dd-handle dd3-handle"></section>
												<section class="dd3-content"><a href="{$admin_url}/aulas/editar/{$aulas.aula_id}/">Aula {$v+1} - {$aulas.nome}</a> <a data-toggle="modal" href="#deletarAula" onclick="javascript:setaDeletar({$aulas.aula_id}, {$aulas.curso_id});" class="pull-right"><i class="fa fa-trash-o"></i></a></section>
											 </li>
											{/foreach}
										</ol>
											
									</section><!-- /dd -->
								
								</section><!-- /panel-body -->
                        
							</section><!-- /panel -->
                        {/foreach}
                        {$paginacao.page_string}
                    </section><!-- /column sortable -->

                </section><!-- /row-fluid -->

              
            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
		
<!-- Modal - Deletar Aula -->
        <section class="modal fade modal-alert" id="deletarAula" tabindex="-1" role="dialog" aria-labelledby="deletarAula" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        <input type="hidden" value="" id="id_apagar" name="id_apagar" />
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Deletar Aula</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">Você deseja fazer isso?</section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Não</button>
                        <button class="btn btn-danger" onclick="javascript:confirmaDeletar();" type="submit">Sim</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
        
        <!-- Modal - Deletar Capítulo -->
        <section class="modal fade modal-alert" id="deletarCapitulo" tabindex="-1" role="dialog" aria-labelledby="deletarCapitulo" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
						<input type="hidden" value="" id="id_apagar_cap" name="id_apagar_cap" />
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Deletar Capítulo</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">Você deseja fazer isso?</section><!-- /modal-body -->
                    
                    <section class="modal-footer">
					
                        <button data-dismiss="modal" class="btn btn-default" type="button">Não</button>
                        <button class="btn btn-danger" onclick="javascript:confirmaDeletarCapitulo();" type="submit">Sim</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
    
    </section><!-- /container -->

<script type="text/javascript" src="http://www.gregphoto.net/sortable/advanced/scriptaculous/prototype.js"></script>
<script type="text/javascript" src="http://www.gregphoto.net/sortable/advanced/scriptaculous/scriptaculous.js"></script>

{literal}  
<script type="text/javascript">

//Mudar Posição
{/literal}
sections = [
{foreach item=capitulo key=i from=$capitulos}
    'group{$capitulo.capitulo_id}' {if ($i+1) != $capitulos|@count},{/if}
{/foreach}
];
{literal}

function mudarPosicao() {
    var capitulos = [];
    var aulas = [];
    jQuery('.ordem_capitulo_id').each(function(){
        capitulos.push(jQuery(this).val());
    });
    for ( var i = 0; i < capitulos.length; i = i + 1 ) {
        var aulas_capitulo = [];
        jQuery('#group'+capitulos[i]+' .aulas').each(function(){
            aulas_capitulo.push(jQuery(this).val());
        });
        aulas[i] = aulas_capitulo;
    }
    
    {/literal}
    jQuery.post('{$admin_url}/aulas/salvarPosicao', {ldelim}curso:{$curso_id}, capitulos:capitulos, aulas:aulas{rdelim}, function html(html) {ldelim} jQuery('#resposta_trocar_posicao').html(html); {rdelim});
    {literal}
}

//Drag Drop
  // <![CDATA[  
for(var i = 0; i < sections.length; i++) {
      Sortable.create(sections[i],{tag:'section',dropOnEmpty: true, containment: sections,only:'item'});
}
Sortable.create('page',{tag:'section',only:'sessoes',handle:'handle'});

//Mensagem
{/literal}
{if $msg_alert} jAlert('{$msg_alert}'); {/if}
{literal}

function setaDeletar(id, curso_id) {
    $('#id_apagar').val(id);
	$('#id_curso').val(curso_id);
}

function confirmaDeletar() {
    window.location.href='{/literal}{$admin_url}{literal}/aulas/apagar/' + $('#id_apagar').val();
}

function setaDeletarCapitulo(id, curso_id) {
    $('#id_apagar_cap').val(id);
	$('#id_curso_cap').val(curso_id);
}

function confirmaDeletarCapitulo() {
    window.location.href='{/literal}{$admin_url}{literal}/aulas/apagar_capitulo/' + $('#id_apagar_cap').val();
}
</script>
{/literal}