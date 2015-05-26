
        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="dashboard.html"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Configurações de Período de Acesso</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel tasks-widget">
                            
                            <header class="panel-heading"><strong>Configurações de Período de Acesso</strong></header>
                                                        
                            <section class="panel-body">
                                {if $msg_alert}
                                    <div class="alert alert-info">{$msg_alert}</div>
                                {/if}
                                <form role="form" method="post">                                    
                                    <input type="hidden" value="{$periodo.sistema_id}" name="sistema_id"/>                                    
                                    <input type="hidden" value="1" name="editar"/> 
                                    
                                    <section class="form-group">                                       
                                        <label class="control-label col-lg-3">Informe o perído de acesso em (MESES): </label>                        
                                        <section class="col-lg-1">                              
                                            <input class="form-control" maxlength="2" name="periodo_acesso" {if $visao_adm eq true} disabled{/if} value="{$periodo.periodo_acesso}" type="number" required>                              
                                        </section><!-- /col-lg-10 --> 
                            
                                    </section><!-- /task-content -->
                                    {if $visao_adm eq false}
                                    <section class="form-group">                
                                        <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Salvar</button>
                                    </section><!-- /form-group -->
                                    {/if}
                                 </form>
                                
                            </section><!-- /panel-body -->
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->


{literal}
    <script type="text/javascript">
        function escolherperiodo(valor){
            $('#periodo').val(valor);
            if(valor == 1){
                

                $("#amazon").attr("disabled", "disabled");
                $("#vimeo").removeAttr("disabled", "disabled");
                $("#youtube").removeAttr("disabled", "disabled");
                return false;
            }
            if(valor == 2){
                

                $("#vimeo").attr("disabled", "disabled");
                $("#amazon").removeAttr("disabled", "disabled");
                $("#youtube").removeAttr("disabled", "disabled");
                return false;
            }
            if(valor == 3){
                
                $("#youtube").attr("disabled", "disabled");
                $("#vimeo").removeAttr("disabled", "disabled");
                $("#amazon").removeAttr("disabled", "disabled");
                return false;
            }
            return false;

        }
    </script>
{/literal}

     
        
      