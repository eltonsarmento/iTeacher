<section class="container course">

        <section class="row">

            <section class="col-lg-5">

                <section class="row">

                    <section class="col-lg-12">

                        <h3>{$curso.curso}</h3>

                        <hr>

                    </section><!-- /.col-lg-12 -->

                    <section class="col-lg-12">

                        <p>Valor do Curso:  <span class="pull-right"><b>R$ {$curso.valor}</b> ou 12x de <b>R$ {$curso.valor_dividido}</b></span></p>

                        <hr>

                    </section><!-- /.col-lg-12 -->

                    <section class="col-lg-12">

                        <p>Carga Horária:  <span class="pull-right"><b>{$curso.carga_horaria} Horas*</b></span></p>

                        <hr>

                    </section><!-- /.col-lg-12 -->

                    <!--
                    <section class="col-lg-12">

                        <p class="text-center">Variações do Curso</p>

                        <section class="checkbox">

                            <label>
                            
                                <input type="checkbox" name="suporte"> Suporte <b>(R$ 20,00)</b>
                            
                            </label>

                        </section>

                        <section class="checkbox">

                            <label>
                            
                                <input type="checkbox" name="certificado" > Certificado <b>(R$ 20,00)</b>
                            
                            </label>

                        </section>

                        <hr>

                    </section>--><!-- /.col-lg-12 -->

                    <section class="col-lg-5">

                        <b class="price-end">R$ {$curso.valor}</b>

                    </section><!-- /.col-lg-5 -->

                    <section class="col-lg-7">

                        <!-- <a href="{$url_site}portal/carrinho/index/{$curso.id}" class="btn btn-success btn-block btn-lg">Comprar</a> -->
                        <a href="{$url_portal}portal/carrinho/adicionarCurso/{$curso.id}" class="btn btn-success btn-block btn-lg">Comprar</a>

                    </section><!-- /.col-lg-7 -->

                </section><!-- /.row -->

            </section><!-- /.col-lg-5 -->

            <section class="col-lg-7 col-sm-12 hidden-xs">
                {if $aulaGratuita}
                        <div id="aulaGratuita"></div>
                {/if}
                <!-- <iframe width="100%" height="367" src="//www.youtube.com/embed/o3mP3mJDL2k" frameborder="0" allowfullscreen=""></iframe> -->

            </section><!-- /.col-lg-7 -->

        </section><!-- /.row -->

        <hr>

        <section class="row">

            <section class="col-lg-12">

                <h3>Descrição do Curso</h3>

                <p>{$curso.descricao}</p>

            </section><!-- /.col-lg-12 -->

        </section><!-- /.row -->

        <hr>

        <section class="row">

            <section class="col-lg-8">

                <h3>Conteúdo Programático</h3>

                <section class="panel panel-dark">

                    <section class="table-responsive">

                    <table class="table">

                        <tbody>
                            {foreach item=capitulo key=k from=$capitulos}
                                <tr>
                                    <td coldspan="2"><b>Capítulo {$capitulo.capitulo} </b></td>
                                    <td></td>
                                </tr>
                                    {foreach item=aula from=$capitulo.aulas}
                                        <tr>
                                            <td>
                                                {if $aula.gratuito}
                                                <a href="#" onclick="abrirVideoGratuito('{if ($servidor == 1)}{$aula.amazon}{else if $servidor == 2}{$aula.vimeo}{else}{$aula.youtube}{/if}', '{$aula.posicao}', '{$aula.nome}')" data-toggle="modal" data-target="#myModal">
                                                {/if}
                                                <b>Aula {$aula.posicao} </b> - {$aula.nome}</a>
                                                {if $aula.gratuito}
                                                </a>
                                                {/if}
                                            </td>
                                            <td class="text-right"><span class="label label-default">{$aula.duracao}</span></td>
                                        </tr>
                                    {/foreach}
                            {/foreach}
                        </tbody>

                    </table>

                    </section><!-- /.table-responsive -->

                </section><!-- /.panel -->

            </section><!-- /.col-lg-8 -->
            {if $professor}
            <section class="col-lg-4">

                <h3>Sobre o Professor</h3>

                <section class="media">

                    <span class="pull-left"><img src="{$url_site}market/uploads/avatar/{$professor.avatar}" alt="" title="" class="media-object"></span>

                    <section class="media-body">
                        
                        <h4 class="media-heading">{$professor.nome}</h4>
                        {$professor.minicurriculo}
                    
                    </section><!-- /.media-body -->

                </section><!-- /.media -->
            {/if}   
            </section><!-- /.col-lg-4 -->

        </section><!-- /.row -->

    </section>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel"><strong id="aula_numero"></strong> - <span id="aula_nome"></span></h4>
                </div>
                <div class="modal-body">
                    <div class="embed-responsive embed-responsive-16by9" id="aula_video">
                    </div>
                </div>
                <div class="modal-footer"></div>
            </div><!-- /modal-content -->
        </div><!-- /modal-dialog -->
    </div><!-- /modal -->

<script type="text/javascript" src="{$url_site}market/common/portal/assets/js/jquery.base64.js"></script>
<script type="text/javascript" src="{$url_site}market/common/portal/assets/js/kmf.jquery.js"></script>
<script type="text/javascript" src="{$url_site}market/common/portal/assets/js/jquery.modal.js" ></script>
<script type="text/javascript" src="{$url_site}market/common/portal/assets/js/jwplayer/jwplayer.js" ></script>
<script type="text/javascript" src="{$url_site}market/common/portal/assets/js/jwplayer/jwplayer.html5.js"></script>
<script type="text/javascript">jwplayer.key="iutRDqcT78F7yRwhJrXKoCvFzYyfVxWm4kAJuA==";</script>
<script type="text/javascript" src="{$url_site}market/common/portal/assets/js/expand.js" ></script>
<div id="retorno_preco"></div>
{literal}
<script type="text/javascript">
function abrirVideo(video) {
    jwplayer("videoModal").setup({
        logo: {
            {/literal}
            file: "{$url_site}market/common/portal/assets/jwplayer/imagens/logo-iteacher.png",
            link: "{$url_site}"
            {literal}
        },
        file: buscarVideo(video),
        width: 770,
        height: 400
    });
}
{/literal}

{if $aulaGratuita}
jwplayer("aulaGratuita").setup({ldelim}
    logo: {ldelim}
        file: "{$url_site}market/common/portal/assets/js/jwplayer/imagens/logo-iteacher.png",
        link: "{$url_site}"
      {rdelim},
    file: buscarVideo('{$aulaGratuita}'),
    width: 653,
    height: 367,
    autostart: true
{rdelim});
{/if}

function abrirVideoGratuito(video, aula_numero, aula_nome) {
    $('#aula_numero').html(aula_numero);
    $('#aula_nome').html(aula_nome);
    jwplayer("aula_video").setup({ldelim}
        logo: {ldelim}
            file: "{$url_site}market/common/portal/assets/js/jwplayer/imagens/logo-iteacher.png",
            link: "{$url_site}"
          {rdelim},
        file: buscarVideo(video),
        width: 570,
        height: 281,
        autostart: true
    {literal}}{/literal});
}
</script>
