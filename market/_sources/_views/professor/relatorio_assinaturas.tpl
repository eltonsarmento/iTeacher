
        
        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="dashboard.html"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Relatórios de Assinaturas</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                    
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-8">
                        
                        <a data-toggle="modal" href="#filtrarRelatorio" class="btn btn-info"><i class="fa fa-filter"></i> Filtrar Relatório</a>

                        <section class="btn-group">
                            

                            <button data-toggle="dropdown" class="btn btn-white dropdown-toggle" type="button"><i class="fa fa-download"></i> Exportar Dados <span class="caret"></span></button>
                            
                            <ul role="menu" class="dropdown-menu">
                                
                                
                                    
                                <li><a  href="{$admin_url}/relatorios/relatorio/?tipo=pdf&dados=assinatura&data_de={$data_de}&data_ate={$data_ate}" target="_blank">Exportar em PDF</a></li>
                                <li><a href="{$admin_url}/relatorios/relatorio/?tipo=xls&dados=assinatura&data_de={$data_de}&data_ate={$data_ate}" target="_blank">Exportar em XLS</a></li>

                            </ul>
                            
                        </section><!-- /btn-group -->

                    </section><!-- /col-lg-8 -->
                    
                    <section class="col-lg-4">
                        
                        <section class="input-group m-bot15">
                                
                            <input type="text" class="form-control">
                                
                            <span class="input-group-btn"><button type="submit" class="btn btn-white"><i class="fa fa-search"></i></button></span>
                                
                        </section><!-- /input-group -->
                        
                    </section><!-- /col-lg-4 -->
                    
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Relatórios de Assinaturas</strong></header>
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-credit-card"></i> Plano</th>
                                            <th class="hidden-xs"><i class="fa fa-users"></i> Quantidade de Assinantes</th>
                                            <th><i class="fa fa-money"></i> Total Mensal</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        {foreach item=plano from=$planos}
                                            <tr>
                                                
                                                <td>{$plano.plano}</td>
                                                <td class="hidden-xs">{$plano.quantidade}</td>
                                                <td>R$ {$plano.total}</td>
                                                <td>
                                                    
                                                    <a data-toggle="modal" href="#listarAlunos" onclick="obterUsuariosByPlano('{$plano.id}')"class="btn btn-info btn-xs tooltips" data-original-title="Alunos" data-placement="bottom"><i class="fa fa-users"></i></a>
                                                
                                                </td>
                                                
                                            </tr>
                                        {/foreach}
                                    </tbody>
                                    
                                </table>
                                
                            </section><!-- /unseen --> 
                        
                        </section><!-- /panel -->
                        
                    </section><!-- /col-lg-12 -->
                    
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
        <footer class="site-footer">
            
            <section class="text-center">2014 &copy; iTeacher.<a href="#" class="go-top"><i class="fa fa-angle-up"></i></a></section>
            
        </footer>
        
        <!-- Modal - Filtrar Relatorio 
        <section class="modal fade modal-primary" id="filtrarRelatorio" tabindex="-1" role="dialog" aria-labelledby="filtrarRelatorio" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Filtrar Relatório</h4>
                        
                    </section>
                    
                    <section class="modal-body">
                        
                        <form action="#" class="form-horizontal tasi-form">
                            
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">Ano</label>
                                
                                <section class="col-lg-10">
        
                                    <select class="form-control">
                                                                
                                        <option>2014</option>
                                    
                                    </select>
                                        
                                </section>

                            </section>
                            
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">Mês</label>
                                
                                <section class="col-lg-10">
        
                                    <select class="form-control">
                                                                
                                        <option>01</option>
                                        <option>02</option>
                                        <option selected>03</option>
                                        <option>04</option>
                                        <option>05</option>
                                        <option>06</option>
                                        <option>07</option>
                                        <option>08</option>
                                        <option>09</option>
                                        <option>10</option>
                                        <option>11</option>
                                        <option>12</option>
                                    
                                    </select>
                                        
                                </section>
                                
                            </section>
                            
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">Tipo</label>
                                
                                <section class="col-lg-10">
        
                                    <select class="form-control">
                                        
                                        <option value="" selected>Tipo</option>
                                        <option value="">Ativas</option>
                                        <option value="">Inativas</option>
                                    
                                    </select>
                                        
                                </section>
                                
                            </section>
                            
                            <section class="form-group">
                                
                                <section class="col-lg-offset-2 col-lg-10">
                                    
                                    <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Filtrar</button>
                                    
                                </section>
                                
                            </section>
                            
                        </form>
                    
                    </section>
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                        
                    </section>
                    
                </section>
                
            </section>
            
        </section>
         /modal -->

        <section class="modal fade modal-primary" id="filtrarRelatorio" tabindex="-1" role="dialog" aria-labelledby="filtrarRelatorio" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Filtrar Relatório</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <form action="" class="form-horizontal tasi-form" method="post">
                            <input type="hidden" name="filtrar" id="filtrar" value="1"/>
                    
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">De</label>
                                
                                <section class="col-lg-9">
        
                                    <section data-date-format="dd/mm/yyyy" data-date="18/03/2014" class="input-append date dpYears">
                                    
                                        <input type="text" readonly="" name="de" value="18/03/2014" size="16" class="form-control">
                                        
                                        <span class="input-group-btn add-on">
                                            
                                            <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                            
                                        </span>
                                        
                                    </section><!-- /date-->
                                        
                                </section><!-- /col-lg-9 -->
                                
                            </section><!-- /form-group -->
                                
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">Até</label>
                                
                                <section class="col-lg-9">
        
                                    <section data-date-format="dd/mm/yyyy" data-date="18/03/2014" class="input-append date dpYears">
                                    
                                        <input type="text" readonly="" name="ate" value="18/03/2014" size="16" class="form-control">
                                        
                                        <span class="input-group-btn add-on">
                                            
                                            <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                            
                                        </span>
                                        
                                    </section><!-- /date-->
                                        
                                </section><!-- /col-lg-9 -->
                                
                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <section class="col-lg-offset-2 col-lg-10">
                                    
                                    <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Filtrar</button>
                                    
                                </section><!-- /col-lg-10 -->
                                
                            </section><!-- /form-group -->
                            
                        </form>
                    
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
        
        <!-- Modal Listar Alunos -->
        
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
                                        
                                    </tr>
                                    
                                </thead>
                                
                                <tbody id="dadosAluno">
                                    
                                    <tr>
                                        
                                        <td>Adriano Gianini</td>
                                        <td>adriano@cursosiag.com.br</td>
                                        
                                    </tr>
                                    
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
    
    </section><!-- /container -->

{literal}
<script type="text/javascript">
function obterUsuariosByPlano(plano_id){
    
    $.post('{/literal}{$admin_url}{literal}/relatorios/obterAlunosByPlano/',{plano_id:plano_id}, function(json){    
        dados = jQuery.parseJSON(json);
        lista = "";            
        $.each(dados, function(){
            lista = lista + "<tr><td>"+this.nome+"</a></td><td>"+this.email+"</td></tr>";                
        });
        $("#dadosAluno").html(lista);
        
    });
}

     
</script>

{/literal}