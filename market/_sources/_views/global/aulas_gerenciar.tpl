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

                        <div id="resposta_trocar_posicao"></div>
                        {if $msg}<h3 id="msg" style="text-align:center;"> {$msg} </h3>{/if}                        
                        <h3 id="msg" style="text-align:center; display:none"></h3>
                            
                        <a href="javascript:mudarPosicao();" class="btn btn-info"><i class="fa fa-check-circle"></i> Salvar posição dos capítulos</a>

                        

                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <br/>
                
                <section class="row" id="draggable_portlets">
                    
                    <section class="col-md-12 column sortable">

                        <input type="hidden" value="{$curso_id}" name="curso_id"/>
                        <input type="hidden" value="" class="capitulo_posicao_aulas" name="capitulo_posicao_aulas"/>                        
                        
                        {foreach item=capitulo key=k from=$capitulos}
                        <section class="panel panel-default">
                            
                            <section class="panel-heading">
                                
                                Capítulo {$k+1} - <span id="capitulo_{$capitulo.capitulo_id}">{$capitulo.descricao}</span></h4>
                                
                                <span class="tools pull-right" onclick="javascript:setaDeletarCapitulo({$capitulo.capitulo_id}, {$capitulo.curso_id}, '{$capitulo.descricao}');"><a class="fa fa-chevron-up" href="javascript:;"></a><a class="fa fa-times" data-toggle="modal" href="#deletarCapitulo"></a></span>

                                <!-- USO NO MODAL -->
                                <input type="hidden" id="descricao_{$capitulo.capitulo_id}" value="{$capitulo.descricao}" />
                                <input type="hidden" id="numero_{$capitulo.capitulo_id}" value="{$k+1}" />
                                <input type="hidden" id="id_{$capitulo.capitulo_id}" value="{$capitulo.capitulo_id}" />
                                <!-- FIM USO NO MODAL -->

                                <!-- USO SALVAR POSICOES CAPITULOS -->
                                <input type="hidden" value="{$capitulo.capitulo_id}" class="ordem_capitulo_id" name="ordem_capitulo_id[]" />
                                <!-- FIM USO SALVAR POSICOES CAPITULOS -->
                                
                            </section><!-- /panel-heading -->
                            
                            <section class="panel-body">
                                
                                <a href="{$admin_url}/aulas/novo/{$capitulo.capitulo_id}" class="btn btn-success"><i class="fa fa-plus-circle"></i> Adicionar nova aula</a> 
                                
                                <!-- <a href="nova-aula.html" class="btn btn-info"><i class="fa fa-check-circle"></i> Salvar posição das aulas</a> -->
                                
                                <span onclick="javascript:setarValores({$capitulo.capitulo_id});">
                                    <a href="#myModal" data-toggle="modal" class="btn btn-danger"><i class="fa fa-check-circle"></i> Editar Descrição Capítulo</a>
                                </span>

                                <hr/>
                                
                                <section class="dd" id="group{$capitulo.capitulo_id}">
                                    
                                    <ol class="dd-list">
                                        
                                        {foreach item=aulas key=v from=$capitulo.aulas}
                                        <li class="dd-item dd3-item" id="item_{$v+1}" data-id="{$capitulo.capitulo_id}_{$aulas.aula_id}">
                                            <input type="hidden" value="{$aulas.aula_id}" class="aulas" name="aulas[]"/>
                                            <section class="dd-handle dd3-handle"></section>
                                            <section class="dd3-content">
                                                <a href="/market/{$categoria}/aulas/editar/{$aulas.aula_id}/">Aula {$v+1} - {$aulas.nome}</a>

                                                <span onclick="javascript:setaDeletar({$aulas.aula_id},{$aulas.curso_id},'{$aulas.nome}');" class="pull-right"> 
                                                        <a data-toggle="modal" href="#deletarAula"><i class="fa fa-trash-o"></i></a>
                                                </span>                                       
                                            </section>
                                        </li>
                                        {/foreach}
                                                
                                    </ol>
                                        
                                </section><!-- /dd -->
                            
                            </section><!-- /panel-body -->
                        </section><!-- /panel -->
                        {/foreach}
                        
                    </section><!-- /column sortable -->
                
                </section><!-- /row-fluid -->


                     <!-- MY MODAL -->
        <div  aria-hidden="false" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" class="modal fade modal-alert in" id="myModal">

            <section class="modal-dialog">
                    
                    <section class="modal-content">
                        
                        <section class="modal-header">
                            
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title" id="myModalLabel">Editar Descrição do Capítulo</h4>
                            
                        </section><!-- /modal-header -->
                        
                        <section class="modal-body">

                            <form action="" id="trocar_descricao" method="post">
                    
                                <!-- REPOSTA -->             
                                <div id="resposta_trocar_descricao" class="alert alert-info" style="display: none"></div>
                                
                                <input type="hidden" value="1" name="editar"/>
                                <input type="hidden" value="" name="capitulo_id" id="capitulo_id"/>
                                <input type="hidden" value="" name="capitulo_posicao" id="capitulo_posicao"/>
                                
                                <p class="margintop10">
                                   <span id="numero_capitulo"></span> <input type="text" name="descricao_edicao" class="input-xlarge" id="descricao_edicao">
                                </p>

                            <button class="btn btn-primary" onclick="alterarDescricao(); return false;">Editar Descrição</button>

                            </form>


                        </section><!-- /modal-body -->
                        
                        <section class="modal-footer">

                            <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                            
                        </section><!-- /modal-footer -->
                        
                    </section><!-- /modal-content -->
                    
                </section><!-- /modal-dialog -->        
        </div>
        <!-- FIM MY MODAL -->

        <!-- Modal - Deletar Aula -->
        <section class="modal fade modal-alert" id="deletarAula" tabindex="-1" role="dialog" aria-labelledby="deletarAula" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        <input type="hidden" value="" id="id_apagar" name="id_apagar" />
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Deletar Aula</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">Você deseja deletar a aula - <strong id="nome_aula"></strong> ?</section><!-- /modal-body -->
                    
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
                    
                    <section class="modal-body">Você deseja deletar o capítulo -  <strong id="nome_cap"></strong> ?</section><!-- /modal-body -->
                    
                    <section class="modal-footer">
                    
                        <button data-dismiss="modal" class="btn btn-default" type="button">Não</button>
                        <button class="btn btn-danger" onclick="javascript:confirmaDeletarCapitulo();" type="submit">Sim</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->

              
            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
		
    </section><!-- /container -->

<script type="text/javascript">
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
    jQuery.post('/market/{$categoria}/aulas/salvarPosicao', {ldelim}curso:{$curso_id}, capitulos:capitulos, aulas:aulas{rdelim}, function html(html) {ldelim} 
        document.getElementById("msg").style.display="block";        
        $('#msg').html('Aulas atualizada com sucesso! ');
        jQuery('#1111resposta_trocar_posicao').html(html); {rdelim});
    {literal}
}

$(document).ready(function() {
    
    var updateOutput = function (e) {
        var list = e.length ? e : $(e.target),
            output = list.data('output');
        if (window.JSON) {
            $('#msg').html('');
            $('.capitulo_posicao_aulas').val(window.JSON.stringify(list.nestable('serialize')));
            //alert(window.JSON.stringify(list.nestable('serialize')));
        } else {
            output.val('JSON browser support required for this demo.');
        }
    };
{/literal}
{foreach item=capitulo key=k from=$capitulos}
  // activate Nestable for list 1
    $('#group{$capitulo.capitulo_id}').nestable(
    {literal}
        {group: {/literal}{$capitulo.capitulo_id}{literal}, maxDepth: 1}).on('change', updateOutput);
    {/literal}
    // output initial serialised data
    //updateOutput($('#group{$capitulo.capitulo_id}').data('output', $('#group{$capitulo.capitulo_id}_output')));
{/foreach}
{literal}
});

//Edição de capítulos//
function setarValores(capitulo) {
    document.getElementById("resposta_trocar_descricao").style.display="none";
    jQuery("#resposta_trocar_descricao").html("");    
    jQuery("#capitulo_id").val(jQuery("#id_"+capitulo).val());
    jQuery("#capitulo_posicao").val(capitulo);
    jQuery("#numero_capitulo").html("Cápítulo " + jQuery("#numero_"+capitulo).val() + " - ");
    jQuery("#descricao_edicao").val(jQuery("#descricao_"+capitulo).val());
}

function alterarDescricao() {
    {/literal}
    jQuery.post('/market/{$categoria}/aulas/mudarDescricao', jQuery('#trocar_descricao').serialize(), function html(html) {ldelim} 
        document.getElementById("resposta_trocar_descricao").style.display="block";
        jQuery('#resposta_trocar_descricao').html(html); {rdelim});    
    {literal}
}
// FIM Edição de capítulos//

// DELEÇÃO DE AULAS//
function setaDeletar(id, curso_id, aula_descricao) {    
    $('#id_apagar').val(id);
    $('#id_curso').val(curso_id);
    $("#nome_aula").html(aula_descricao);   
}
function confirmaDeletar() {
    window.location.href='{/literal}{$admin_url}{literal}/aulas/apagar/' + $('#id_apagar').val();
}
// FIM  DELEÇÃO DE AULAS//

// DELEÇÃO CAPITULO//
function setaDeletarCapitulo(id, curso_id, cap_descricao) {
    $('#id_apagar_cap').val(id);
    $('#id_curso_cap').val(curso_id);
    $("#nome_cap").html(cap_descricao);  
}

function confirmaDeletarCapitulo() {
    window.location.href='{/literal}{$admin_url}{literal}/aulas/apagar_capitulo/' + $('#id_apagar_cap').val();
}
//FIM DELEÇÃO CAPITULO//
{/literal}
</script>
