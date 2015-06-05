        <section id="main-content">
          
            <section class="wrapper site-min-height">

                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="dashboard.html"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="cursos.html">Cursos</a></li>
                            <li><a href="aulas.html">{$curso.curso}</a></li>
                            <li class="active">Aula {$aula.posicao} - {$aula.nome}</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-8">
                        
                        <section class="panel">
                            
                            <section class="panel-heading"><strong>Aula {$aula.posicao} - {$aula.nome}</strong></section><!-- /panel-heading -->
                            
                            <section class="panel-body">

                                <script src="http://jwpsrv.com/library/NfG2RuJvEeKrZRIxOQulpA.js"></script>
                                
                                
                                {if $aula.tipo == 1}
                                <video id='player2'></video>
                                    <script type='text/javascript'>
                                        /*alert(buscarVideo2('teste'));*/

                                        jwplayer('player2').setup({ldelim}
                                            
                                            file: buscarVideo2('{$aula.video}'),
                                            title: 'Aula {$aula.posicao} - {$aula.nome}',
                                            width: '100%',
                                            aspectratio: '16:9',
                                            fallback: 'false',
                                            mute: false,
                                            primary: 'html5'
                                        {rdelim});
                                    
                                    </script>
                                {elseif $aula.tipo == 2 || $aula.tipo == 3}
                                    <iframe src="http://docs.google.com/viewer?url={$aula.arquivo}&embedded=true" width="100%" height="780" style="border: none;"></iframe>
                                {elseif $aula.tipo == 4 || $aula.tipo == 5}
                                    <p>{$aula.resumo}</p>
                                {/if}

                                
                            </section><!-- /panel-body -->
                        
                        </section><!-- /panel -->
                        
                        <section class="panel">
                            
                            <section class="panel-body">
                                {if $aulaAnterior}
                                    <a href="{$admin_url}/cursos/aula/{$aulaAnterior}" ><button class="btn btn-primary pull-left" ><i class="fa fa-chevron-left"></i> Aula Anterior</button></a>
                                {/if}
                                <!-- /O Botão não será mostrado até a contagem terminar (Retirar mensagem)/ -->
                                <span id="spanAvancar"></span>
                                
                                
                                <span class="btn disabled pull-right"><i class="fa fa-coffee"></i> Você pode ir para próxima aula em: <strong><span id="tempo"></span></strong></span>
  
                            </section><!-- /panel-body -->
                        
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-8 -->
                    
                    <section class="col-lg-4">
                        
                        <section class="panel">
                            
                            <section class="panel-heading"><strong>Aulas</strong></section><!-- /panel-heading -->
                            
                            <section class="panel-body">

                                <form>
                                    
                                    <section class="row">
                    
                                        <section class="col-lg-10">
    
                                            <section class="form-group" style="margin-bottom:0 !important;">
                                                
                                                <select class="form-control" id="aulaSelect">
                                                    
                                                    <option value="" selected>Aulas</option>
                                                    
                                                   {foreach item=capituloBusca from=$capitulos}
                                                        <optgroup label="{$capituloBusca.descricao}">
                                                            {foreach item=aulaBusca from=$capituloBusca.aulas}
                                                                <option value="{$aulaBusca.aula_id}">Aula {$aulaBusca.posicao} - {$aulaBusca.nome}</option>
                                                            {/foreach}
                                                        </optgroup>
                                                    {/foreach}
                                                
                                                </select>
                                            
                                            </section><!-- /form-group -->
                                            
                                        </section><!-- /col-lg-10 -->
                                        
                                        <section class="col-lg-2">
    
                                            <section class="form-group" style="margin-bottom:0 !important;">
                                                
                                                <button class="btn btn-success btn-block" id="btnIr"><i class="fa fa-sign-in"></i> Ir</button>
                                            
                                            </section><!-- /form-group -->
                                            
                                        </section><!-- /col-lg-2 -->
                                        
                                    </section><!-- /row -->
                                
                                </form>
                                
                            </section><!-- /panel-body -->
                        
                        </section><!-- /panel -->
                        
                        <section class="panel">
                            
                            <section class="panel-heading"><strong>Informações da Aula</strong></section><!-- /panel-heading -->
                            
                            <section class="panel-body">
                            
                                <h4 class="text-margin-no">Aula {$aula.posicao} - {$aula.nome}</h4>
                                <small>{$curso.curso} - Capítulo {$capitulo.capitulo}</small>
                                
                            </section><!-- /panel-body -->
                        
                        </section><!-- /panel -->
                        
                        <section class="panel">
                            
                            <section class="panel-heading"><strong>Estatísticas</strong></section><!-- /panel-heading -->
                            
                            <section class="panel-body">
                            
                                <section class="progress progress-striped active">
                                                    
                                    <section class="progress-bar progress-bar-info"  role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: {$porcentagem}%">
                                        
                                        <span>{$porcentagem}%</span>
                                        
                                    </section>
                                    
                                </section>
                                
                            </section><!-- /panel-body -->
                        
                        </section><!-- /panel -->
                        
                        <section class="panel">
                            
                            <section class="panel-heading"><strong>Ações</strong></section><!-- /panel-heading -->
                            
                            <section class="panel-body">
                            
                                <ul class="nav nav-pills nav-stacked">
                                    
                                    <li><a href="{$admin_url}/cursos/verCurso/{$matricula_curso}">Capítulos</a></li>
                                    <li><a data-toggle="modal" href="#novaDuvida">Nova Dúvida</a></li>
                                    <li><a href="{$admin_url}/duvidas/listar/">Minhas Dúvidas</a></li>
                                    <li><a href="{$admin_url}/cursos/listar/">Meus Cursos</a></li>
                                    
                                </ul>
                                
                            </section><!-- /panel-body -->
                        
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-4 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
               
        <!-- Modal - Nova Dúvida -->
    
        <section class="modal fade modal-primary" id="novaDuvida" tabindex="-1" role="dialog" aria-labelledby="novaDuvida" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Nova Dúvida</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        <span id="resposta_duvida"></span>
                        
                        <form  id="formDuvida" method="post">
                            <input name="enviar" type="hidden" value="1">
                            <section class="form-group">
                                
                                <label class="control-label">Título</label>
                                
                                <input type="text" id="formCampoTitulo" name="titulo" class="form-control"> 
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="control-label">Capítulo</label>
                                
                                <select class="form-control" name="capitulo" onchange="getVendasByAluno(this.value)">                               
                                    <option value="" selected>Capítulo</option>
                                    {foreach from=$capitulos item=capitulo}
                                        <option value="{$capitulo.capitulo_id}">{$capitulo.descricao}</option>
                                    {/foreach}
                                
                                </select>
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="control-label">Aula</label>
                                
                                <select class="form-control" name="aula" id="selectAulas">
                                    
                                    
                                
                                </select>
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="control-label">Dúvida</label>
                                
                                <textarea class="form-control" name="duvida" id="formCampoDuvida" cols="30" rows="5"></textarea> 
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                    
                                <button class="btn btn-success" id="btnForm" onclick="enviarDuvida();"><i class="fa fa-check-circle"></i> Enviar</button>
                                
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

jQuery('#btnIr').click(function() {
    {/literal} window.location.href='{$admin_url}/cursos/aula/' + jQuery('#aulaSelect').val(); {literal}
    return false;
        
});


function enviarDuvida(){
    if (!jQuery('#formCampoTitulo').val()) {
        jQuery('#resposta_duvida').html('Preencha o título');
        return false;
    } else if (!jQuery('#formCampoDuvida').val()) {
        jQuery('#resposta_duvida').html('Preencha a duvida');
        return false;
    } else {
        jQuery.post('{/literal}{$admin_url}{literal}/cursos/duvida/{/literal}{$relacionamentoId}{literal}', jQuery('#formDuvida').serialize(), function html(html) {
            jQuery('#resposta_duvida').html(html); 
        });
    }
    return false;
}

function limparForm() {
    jQuery('#formCampoTitulo').val('');
    jQuery('#formCampoDuvida').val('');
}

{/literal}
{if $bloqueio.bloqueado == true && $bloqueio.tempo > 0}

var linkAvancar = false; //Link Avançar não Liberado
var tempo = {$bloqueio.tempo}

function liberarBotao() {ldelim}
    if (tempo == 0) {ldelim}
        jQuery('#spanAvancar').html('<button class="btn btn-primary pull-right" id="botaoAvancar"onclick="avancar();" >Avançar <i class="fa fa-chevron-right"></i></button> ');
        jQuery.post('{$admin_url}/cursos/buscarLink/', {ldelim}aula_id: {$aula.aula_id}{rdelim}, function html(html) {ldelim} 
            linkAvancar = html 
            console.log(html);
        {rdelim});
    {rdelim} else {ldelim}

        segundos = tempo/1000;
    
        //cronometro = hora + ':' + minuto + ':' + segundos;
        jQuery('#tempo').html(segundos + ' Segundos ');
    {rdelim}
{rdelim}

setInterval(function() {ldelim}
    if (tempo != 0) {ldelim}
        tempo = tempo - 1000;
        liberarBotao();
    {rdelim}
{rdelim}, 1000);

{else}
var linkAvancar = '{$linkAvancar}'; //Link Avançar Liberado
jQuery('#spanAvancar').html('<button class="btn btn-primary pull-right" id="botaoAvancar"onclick="avancar();" >Avançar <i class="fa fa-chevron-right"></i></button> ');

{/if}
{literal}

function avancar(){
    if (linkAvancar) {
        window.location.href = buscarVideo2(linkAvancar);
    }
}

function getVendasByAluno(id){
    var options_aulas = "";
    $.post('{/literal}{$admin_url}{literal}/cursos/aulaByCapitulo/'+id, function(json){
        dados = jQuery.parseJSON(json);
        tabela = "";
        curso = ""
        label = "";
        status = "";
        $.each(dados, function(){
            options_aulas += '<option value="' + this.aula_id + '">' + this.nome + '</option>';       
        });
        $("#selectAulas").html(options_aulas);
    });
}
</script>
{/literal}

