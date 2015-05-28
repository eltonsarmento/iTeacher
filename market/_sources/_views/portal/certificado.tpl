<section class="container certificate">

        <h1 class="text-center">
        {if $certificado.id}
            Certificado de Conclusão de Curso
        {else}
            Esse certificado não consta em nossa base
        {/if}
        </h1>

        {if $certificado.id}
        <section class="row">

            <section class="col-lg-12">

                <section class="panel panel-default">

                    <section class="panel-body text-center">

                        <p>Certificamos que <b>{$aluno.nome}</b></p>

                        <p>Concluiu o <b>{$curso.curso}</b> em <b>{$certificado.data_solicitacao|date_format:"%d/%m/%Y"}</b></p>

                        <hr>

                        <section class="row">

                            <section class="col-lg-6">

                                Autentificação do documento <b>CITE{$certificado.id}</b>

                            </section><!-- /.col-lg-6 -->

                            <section class="col-lg-6">

                                Número de matrícula <b>{$aluno.id}</b>

                            </section><!-- /.col-lg-6 -->

                        </section><!-- /.row -->

                    </section><!-- /.panel-body -->

                </section><!-- /.panel -->

            </section><!-- /.col-lg-12 -->

        </section><!-- /.row -->
        {/if}

    </section>