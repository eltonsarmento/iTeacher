
        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="dashboard.html"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="active">Configurações de Servidor</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel tasks-widget">
                            
                            <header class="panel-heading"><strong>Configurações de Servidor</strong></header>
                            
                            <section class="panel-body">

                                <form role="form" method="post">
                                    <input type="hidden" id="servidor" name="servidor_padrao" value="{$servidor.servidor_padrao}"/>
                                    <input type="hidden" value="1" name="editar"/>
                                    

                                    <section class="task-content">
                                       
                                            
                                            <ul class="task-list">
                                                
                                                <li>
                                                    <section class="task-title">
                                                        
                                                        <span class="task-title-sp">Amazon</span>
                                                        {if $servidor.servidor_padrao eq 1}
                                                            <span class='badge badge-sm label-primary'>Selecionado</span>
                                                        {/if}
                                                        {if $visao_adm eq false}
                                                        <section class="pull-right">
                                                            <!-- Usa o disabled -->
                                                            <button class="btn btn-success btn-xs tooltips" data-original-title="Selecionar"  onclick="escolherServidor(1);" id="amazon" {if $servidor.servidor_padrao eq 1} disabled="disabled" {/if} data-placement="bottom"><i class="fa fa-check"></i></button>
                                                            
                                                        </section><!-- /pull-right -->
                                                        {/if}
                                                    </section><!-- /task-title -->
                                                    
                                                </li>
                                                
                                                <li>
                                                    
                                                    <section class="task-title">
                                                        
                                                        <span class="task-title-sp">Vimeo</span>
                                                        {if $servidor.servidor_padrao eq 2}
                                                            <span class='badge badge-sm label-primary'>Selecionado</span>
                                                        {/if}
                                                        {if $visao_adm eq false}
                                                        <section class="pull-right">
                                                            
                                                            <button class="btn btn-success btn-xs tooltips" data-original-title="Selecionar" onclick="escolherServidor(2);" id="vimeo" {if $servidor.servidor_padrao eq 2} disabled="disabled" {/if}  data-placement="bottom"><i class="fa fa-check"></i></button>
                                                            
                                                        </section><!-- /pull-right -->
                                                        {/if}
                                                    </section><!-- /task-title -->
                                                    
                                                </li>
                                                
                                                <li>
                                                    
                                                    <section class="task-title">
                                                        
                                                        <span class="task-title-sp">Youtube</span>
                                                        {if $servidor.servidor_padrao eq 3}
                                                            <span class='badge badge-sm label-primary'>Selecionado</span>
                                                        {/if}
                                                        {if $visao_adm eq false}
                                                        <section class="pull-right">
                                                            
                                                            <button class="btn btn-success btn-xs tooltips" data-original-title="Selecionar" onclick="escolherServidor(3);" id="youtube" {if $servidor.servidor_padrao eq 3} disabled="disabled" {/if} data-placement="bottom"><i class="fa fa-check"></i></button>
                                                            
                                                        </section><!-- /pull-right -->
                                                        {/if}
                                                    </section><!-- /task-title -->
                                                    
                                                </li>
                                                
                                            </ul>
                                       
                                        
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
        function escolherServidor(valor){
            $('#servidor').val(valor);
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

     
        
      