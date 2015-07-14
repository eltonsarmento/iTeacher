<section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/financeiro/totais">Totais</a></li>
                            <li class="active">Instituições A Receber</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-8">
                        
                        <a data-toggle="modal" href="#filtrar" class="btn btn-info"><i class="fa fa-filter"></i> Filtrar</a>

                    </section><!-- /col-lg-8 -->
                    
                    <section class="col-lg-4">
                        
                        <form method="post">
                            <section class="input-group m-bot15">
                                    
                                <input type="text" name="palavra_chave"class="form-control">
                                    
                                <span class="input-group-btn"><button type="submit" class="btn btn-white"><i class="fa fa-search"></i></button></span>
                                    
                            </section><!-- /input-group -->
                        </form>
                        
                    </section><!-- /col-lg-4 -->
                    
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <section class="panel-heading"><strong>Instituições A Receber</strong></section><!-- /panel-heading -->
                            
                            <section id="unseen">
                            
                                <table class="table table-striped table-advance table-hover">
                                    
                                    <thead>
                                        
                                        <tr>
                                            
                                            <th><i class="fa fa-briefcase"></i> Instituição</th>
                                            <th><i class="fa fa-calendar"></i> Data Pagamento</th>
                                            <th class="hidden-xs"><i class="fa fa-signal"></i> Status</th>
                                            <th></th>
                                            
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>

                                        {foreach from=$faturasReceber item=fatura}
                                            <tr>
                                                
                                                <td>{$fatura.nome}</td>
                                                <td><strong>{$fatura.data_pagamento|date_format:"%d/%m/%Y"}</strong></td>
                                                <td>
                                                    {if $fatura.status eq 2}
                                                        <span class="label label-primary">Vencimento Próximo</span>
                                                    {elseif $fatura.status eq 3}
                                                        <span class="label label-warning">Vencida</span>
                                                    {elseif $fatura.status eq 4}
                                                        <span class="label label-danger">Bloqueada</span>
                                                    {/if}
                                                
                                                </td>

                                                <td>
                                                
                                                    <a data-toggle="modal" href="#alterarStatus" onclick='$("#fatura_id").val({$fatura.id});' class="btn btn-success btn-xs tooltips" data-original-title="Status" data-placement="bottom"><i class="fa fa-refresh"></i></a>
                                                    <a href="#" class="btn btn-warning btn-xs tooltips" data-original-title="Comprovante" data-placement="bottom"><i class="fa fa-download"></i></a>
                                                    
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




        <!-- Modal Alterar Status -->
        
        <section class="modal fade modal-primary" id="alterarStatus" tabindex="-1" role="dialog" aria-labelledby="alterarStatus" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Alterar Status</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                    
                        <form class="form-horizontal tasi-form" id="formStatus" >

                            <input type="hidden" id="fatura_id" name="fatura_id" value="">
                            <div id="msg_retorno">
                                
                            </div>
                            <section class="form-group">
                                    
                                <label class="control-label col-lg-2">Status</label>
                                
                                <section class="col-lg-10">
                                
                                    <select class="form-control" id="comboStatus" name="comboStatus">
                                        
                                        <option value="" selected>Selecione</option>
                                        <option value="1">Paga</option>                                        
                                        <option value="0">Cancelar</option>
                                        <option value="4">Bloquear por falta de pagamento</option>                                        
                                    
                                    </select>                            
                                
                                </section><!-- input-group -->
                            
                            </section><!-- form-group -->
                            
                            <section class="form-group">
                                
                                <section class="col-lg-offset-2 col-lg-10">
                                
                                    <button class="btn btn-success" ><i class="fa fa-check-circle"></i> Salvar</button>                       
                                
                                </section><!-- input-group -->
                            
                            </section><!-- form-group -->
                            
                        </form>
                    
                    </section><!-- /modal-body -->
                    
                    <section class="modal-footer">

                        <button data-dismiss="modal" class="btn btn-default" type="button">Fechar</button>
                        
                    </section><!-- /modal-footer -->
                    
                </section><!-- /modal-content -->
                
            </section><!-- /modal-dialog -->
            
        </section><!-- /modal -->
        
        <!-- Modal - Filtrar Relatorio -->
        
        <section class="modal fade modal-primary" id="filtrar" tabindex="-1" role="dialog" aria-labelledby="filtrar" aria-hidden="true">
            
            <section class="modal-dialog">
                
                <section class="modal-content">
                    
                    <section class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Filtrar</h4>
                        
                    </section><!-- /modal-header -->
                    
                    <section class="modal-body">
                        
                        <form action="{$admin_url}/financeiro/totais-receber" class="form-horizontal tasi-form" method="post">
                            <input name="filtro" value="1" type="hidden">
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">Vencimento</label>
                                
                                <section class="col-lg-9">
        
                                    <section data-date-format="dd/mm/yyyy" data-date="{$dataAtual}" class="input-append date dpYears">
                                    
                                        <input type="text" readonly="" name="dataFiltro" value="" size="16" class="form-control">
                                        
                                        <span class="input-group-btn add-on">
                                            
                                            <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                            
                                        </span>
                                        
                                    </section><!-- /date-->
                                        
                                </section><!-- /col-lg-9 -->
                                
                            </section><!-- /form-group -->
                           
                            <section class="form-group">
                                                       
                                <label class="control-label col-lg-2">Instituição</label>                      
                                                        
                                <section class="col-lg-10">

                                    <select class="selectize" placeholder="Selecione o Curso" name="instituicaoFiltro">

                                        <option value="">Instituição</option>
                                        {foreach from=$instituicoes item=instituicao}
                                            <option value="{$instituicao.sistema_id}">{$instituicao.nome}</option>
                                        {/foreach}
                                        <!-- <option value="Cursos IAG - Formação a distância">Cursos IAG - Formação a distância</option>
                                        <option value="Google EAD">Google EAD</option>
                                        <option value="Facebook EAD">Facebook EAD</option> -->

                                    </select>

                                </section><!-- /col-lg-9 -->

                            </section><!-- /form-group -->
                            
                            <section class="form-group">
                                
                                <label class="control-label col-lg-2">Plano</label>
                                
                                <section class="col-lg-10">
        
                                    <select class="form-control" name="planoFiltro">
                                        
                                        <option value="" selected>Plano</option>

                                        {foreach from=$planos item=plano}
                                            <option value="{$plano.id}">{$plano.plano}</option>
                                        {/foreach}
                                    
                                    </select>
                                        
                                </section><!-- /col-lg-9 -->
                                
                            </section><!-- /form-group -->
                            
                            <!-- <section class="form-group">
                                
                                <label class="control-label col-lg-2">Forma de Pagamento</label>
                                
                                <section class="col-lg-10">
        
                                    <select class="form-control">
                                        
                                        <option value="" selected>Forma de Pagamento</option>
                                        <option value="">Boleto</option>
                                        <option value="">Transferência Bancária</option>
                                    
                                    </select>
                                        
                                </section
                                
                            </section>-->                            
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
    
    </section><!-- /container -->


<script src="{$url_site}{$admin_dir}common/market/assets/bootstrap-select/selectize.js"></script>
{literal}
<script>
    $('.selectize').selectize();
   
/*function alteraStatus(){
      $('#formStatus').
      var id     = $('#fatura_id').val();
      var status = $('#comboStatus').val();
      alert('id = '+id + " status = "+status);
      /*$.post("{/literal}{$admin_url}{literal}/financeiro/alterar-status-fatura", {suggest: txt}, function(result){
        $("span").html(result);
    });

}*/
$('#formStatus').submit(function (e) {
      e.preventDefault();
      var id     = $('#fatura_id').val();
      var status = $('#comboStatus').val();
    $.ajax({
           type: "POST",
           url: "{/literal}{$admin_url}{literal}/financeiro/alterar-status-fatura",
           data: {id:id,status:status}, // serializes the form's elements.
           success: function(data)
           {               
                $('#msg_retorno').html(data);
           }
         });

    return false; // avoid to execute the actual submit of the form.
});
 

 $('#alterarStatus').on('hide.bs.modal', function () {
    // faça algo
    location.reload();
});
</script>
{/literal}
