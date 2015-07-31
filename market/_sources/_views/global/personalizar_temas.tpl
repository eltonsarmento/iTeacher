<section id="main-content">
          
            <section class="wrapper">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="{$admin_url}/dashboard/home"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="{$admin_url}/temas/gerenciar-temas">Gerenciar Temas</a></li>
                            <li class="active">Personalizar Tema</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-3">
                        
                        <section class="panel">
                         
                          <header class="panel-heading">Menu</header>
                          
                          <section class="list-group">
                             
                              <a class="list-group-item active" href="{$admin_url}/temas/personalizar-temas">
                                 
                                  <h4 class="list-group-item-heading">Aparência</h4>
                                  <p class="list-group-item-text"><i>Aqui é possível alterar logo e cores do seu tema.</i></p>
                                  
                              </a>
                              
                              <a class="list-group-item" href="{$admin_url}/temas/configuracoes-temas">
                                 
                                  <h4 class="list-group-item-heading">Configurações Gerais</h4>
                                  <p class="list-group-item-text">Aqui é possível adicionar os links de suas redes sociais e configurar seu Google Analytics.</p>
                                  
                              </a>
                              
                          </section><!-- /list-group -->
                          
                      </section><!-- /panel -->
                        
                    </section><!-- /col-lg-3 -->
                    
                    <section class="col-lg-9">

                        <form class="form-horizontal tasi-form" role="form" method="post"  enctype="multipart/form-data">
                            <input type="hidden" value="0" name="rascunho" id="rascunho" />
                            <input type="hidden" value="1" name="editar"/>
                            <input type="hidden" value="{$configuracoestemas.id}" name="id"/>

                            <section class="panel">
                                
                                <header class="panel-heading"><strong>Aparência - Tema Light</strong></header>
                                
                                <section class="panel-body">
                                    
                                        {if $msg_sucesso}
                                            <div class="alert alert-success">{$msg_sucesso}</div>
                                        {/if}

                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Logo</label>
                                            
                                            <section class="controls col-lg-10">
                                                
                                                <section class="fileupload fileupload-new" data-provides="fileupload">
                                                    
                                                    <span class="btn btn-white btn-file">
                                                        
                                                        <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Selecione a imagem</span>
                                                        <span class="fileupload-exists"><i class="fa fa-undo"></i> Alterar</span>
                                                        <input type="file" name="logo_tema" class="default" />
                                                        
                                                    </span>
                                                    
                                                    <span class="fileupload-preview" style="margin-left:5px;"></span>
                                                    
                                                    <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                                                    
                                                    - <a data-toggle="modal" href="#visualizarLogo">Visualizar Logo</a>
                                                    
                                                </section><!-- /fileupload -->
                                                
                                            </section><!-- /controls -->
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Cor Primária</label>
                                            
                                            <section class="col-lg-2">
                                                 
                                                <section data-color-format="rgb" id="cor_primaria_colorpicker" data-color="{$configuracoestemas.cor_primaria}" class="input-append colorpicker-default color">
                                                   
                                                    <input type="text" readonlys="" id="cor_primaria" name="cor_primaria" value="{$configuracoestemas.cor_primaria}" class="form-control">
                                                    
                                                    <span class="input-group-btn add-on">
                                                    
                                                        <button class="btn btn-white" type="button" style="padding: 8px">
                                                        <i style="background-color: rgb(226, 81, 67);"></i>
                                                        </button>
                                                    
                                                    </span>
                                                    
                                                </section><!-- /input-append -->
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->
                                        
                                        <section class="form-group">
                                            
                                            <label class="control-label col-lg-2">Cor Secundária</label>
                                            
                                            <section class="col-lg-2">
                                                  
                                                <section data-color-format="rgb" data-color="{$configuracoestemas.cor_secundaria}" class="input-append colorpicker-default color">
                                                   
                                                    <input type="text" readonlys="" id="cor_secundaria" name="cor_secundaria" value="{$configuracoestemas.cor_secundaria}" class="form-control">
                                                    
                                                    <span class="input-group-btn add-on">
                                                    
                                                        <button class="btn btn-white" type="button" style="padding: 8px">
                                                        <i style="background-color: rgb(0, 0, 0);"></i>
                                                        </button>
                                                    
                                                    </span>
                                                    
                                                </section><!-- /input-append -->
                                                  
                                            </section><!-- /col-lg-10 --> 
                                            
                                        </section><!-- /form-group -->

                                        <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Cor do Botão de Compra</label>
                                        
                                        <section class="col-lg-2">
                                              
                                            <section data-color-format="rgb" data-color="{$configuracoestemas.cor_btn_compra}" class="input-append colorpicker-default color">
                                               
                                                <input type="text" readonlys="" id="cor_btn_compra" value="{$configuracoestemas.cor_btn_compra}" name="cor_btn_compra" class="form-control">
                                                
                                                <span class="input-group-btn add-on">
                                                
                                                    <button class="btn btn-white" type="button" style="padding: 8px">
                                                    <i style="background-color: #84c135;"></i>
                                                    </button>
                                                
                                                </span>
                                                
                                            </section><!-- /input-append -->
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Cor do hover <br>(Botão de Compra)</label>
                                        
                                        <section class="col-lg-2">
                                              
                                            <section data-color-format="rgb" data-color="{$configuracoestemas.cor_hover_btn_compra}" class="input-append colorpicker-default color">
                                               
                                                <input type="text" readonlys="" id="cor_hover_btn_compra" value="{$configuracoestemas.cor_hover_btn_compra}" name="cor_hover_btn_compra" class="form-control">
                                                
                                                <span class="input-group-btn add-on">
                                                
                                                    <button class="btn btn-white" type="button" style="padding: 8px">
                                                    <i style="background-color: #6ea12c"></i>
                                                    </button>
                                                
                                                </span>
                                                
                                            </section><!-- /input-append -->
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                       
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Cor da Borda Inferior <br>(Botão de Compra)</label>
                                        
                                        <section class="col-lg-2">
                                              
                                            <section data-color-format="rgb" data-color="{$configuracoestemas.cor_borda_btn_compra}" class="input-append colorpicker-default color">
                                               
                                                <input type="text" readonlys="" id="cor_borda_btn_compra" value="{$configuracoestemas.cor_borda_btn_compra}" name="cor_borda_btn_compra" class="form-control">
                                                
                                                <span class="input-group-btn add-on">
                                                
                                                    <button class="btn btn-white" type="button" style="padding: 8px">
                                                    <i style="background-color: #76ad30;"></i>
                                                    </button>
                                                
                                                </span>
                                                
                                            </section><!-- /input-append -->
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->

                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Cor do hover <br>(Botões - Geral)</label>
                                        
                                        <section class="col-lg-2">
                                              
                                            <section data-color-format="rgb" data-color="{$configuracoestemas.cor_hover_btn_geral}" class="input-append colorpicker-default color">
                                               
                                                <input type="text" readonlys="" name="cor_hover_btn_geral" id="cor_hover_btn_geral" value="{$configuracoestemas.cor_hover_btn_geral}" class="form-control">
                                                
                                                <span class="input-group-btn add-on">
                                                
                                                    <button class="btn btn-white" type="button" style="padding: 8px">
                                                    <i style="background-color: #6ea12c"></i>
                                                    </button>
                                                
                                                </span>
                                                
                                            </section><!-- /input-append -->
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                       
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Cor do hover <br>(Links do Menu Principal)</label>
                                        
                                        <section class="col-lg-2">
                                              
                                            <section data-color-format="rgb" data-color="{$configuracoestemas.cor_hover_linkmenu}" class="input-append colorpicker-default color">
                                               
                                                <input type="text" readonlys="" id="cor_hover_linkmenu" value="{$configuracoestemas.cor_hover_linkmenu}"  name="cor_hover_linkmenu"  class="form-control">
                                                
                                                <span class="input-group-btn add-on">
                                                
                                                    <button class="btn btn-white" type="button" style="padding: 8px">
                                                    <i style="background-color: #080808"></i>
                                                    </button>
                                                
                                                </span>
                                                
                                            </section><!-- /input-append -->
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->

                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Cor da fonte <br> (Primária)</label>
                                        
                                        <section class="col-lg-2">
                                              
                                            <section data-color-format="rgb" data-color="{$configuracoestemas.cor_fonte_primaria}" class="input-append colorpicker-default color">
                                               
                                                <input type="text" readonlys="" id="cor_fonte_primaria" name="cor_fonte_primaria" value="{$configuracoestemas.cor_fonte_primaria}" class="form-control">
                                                
                                                <span class="input-group-btn add-on">
                                                
                                                    <button class="btn btn-white" type="button" style="padding: 8px">
                                                    <i style="background-color: #f0f0f0"></i>
                                                    </button>
                                                
                                                </span>
                                                
                                            </section><!-- /input-append -->
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Cor da fonte <br>(Secundária)</label>
                                        
                                        <section class="col-lg-2">
                                              
                                            <section data-color-format="rgb" data-color="{$configuracoestemas.cor_fonte_secundaria}" class="input-append colorpicker-default color">
                                               
                                                <input type="text" readonlys="" id="cor_fonte_secundaria" name="cor_fonte_secundaria" value="{$configuracoestemas.cor_fonte_secundaria}" class="form-control">
                                                
                                                <span class="input-group-btn add-on">
                                                
                                                    <button class="btn btn-white" type="button" style="padding: 8px">
                                                    <i style="background-color: #f0f0f0"></i>
                                                    </button>
                                                
                                                </span>
                                                
                                            </section><!-- /input-append -->
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Cor da fonte <br>(Botão de compra)</label>
                                        
                                        <section class="col-lg-2">
                                              
                                            <section data-color-format="rgb" data-color="{$configuracoestemas.cor_fonte_botao}" class="input-append colorpicker-default color">
                                               
                                                <input type="text" readonlys="" id="cor_fonte_botao" name="cor_fonte_botao" value="{$configuracoestemas.cor_fonte_botao}" class="form-control">
                                                
                                                <span class="input-group-btn add-on">
                                                
                                                    <button class="btn btn-white" type="button" style="padding: 8px">
                                                    <i style="background-color: #f0f0f0"></i>
                                                    </button>
                                                
                                                </span>
                                                
                                            </section><!-- /input-append -->
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->

                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Fonte</label>
                                        
                                        <section class="col-lg-2">
                                              
                                            <select class="form-control" name="fonte" id="fonte">

                                              <option label="Arial" value="Arial" style="font-family:Arial;"></option>
                                              <option label="Helvetica" value="Helvetica" style="font-family:Helvetica;"></option>
                                              <option label="Verdana" value="Verdana" style="font-family:Verdana;"></option>
                                              <option label="Hind" value="Hind" style="font-family: 'Hind', sans-serif;"></option>
                                              <option label="Roboto" value="Roboto" style="font-family: 'Roboto', sans-serif;"></option>
                                              <option label="Roboto Slab" value="Roboto+Slab" style="font-family: 'Roboto Slab', serif;"></option>
                                              <option label="Source Sans Pro" value="Source+Sans+Pro" style="font-family: 'Source Sans Pro', sans-serif;"></option>        
                                              <option label="Ubuntu" value="Ubuntu" style="font-family: 'Ubuntu', sans-serif;"></option>
                                              <option label="Rajdhani" value="Rajdhani" style="font-family: 'Rajdhani', sans-serif;"></option>
                                              <option label="Quicksand" value="Quicksand" style="font-family: 'Quicksand', sans-serif;"></option>

                                            </select>
                                              
                                        </section><!-- /col-lg-2 -->
                                    </section><!-- /col-lg-2 -->
                                    
                                </section><!-- /panel-body -->
                                
                            </section><!-- /panel -->
                        
                           <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Salvar </button>
                            <button class="btn btn-default" onclick="$('#rascunho').val(1)" type="submit"><i class="fa fa-plus-circle"></i> Salvar como rascunho</button>
                            <button class="btn btn-primary" type="button" id="btnConfiguracaoPadra"><i class="fa fa-check-circle"></i> Configuração Padrão </button>
                        
                        </form>
                    </section><!-- /col-lg-9 -->


                
                </section><!-- /row -->

            </section><!-- /wrapper -->

            <br><br><br>
            
            <!-- Modal Visualizar Instituição -->
        
            <section class="modal fade modal-primary" id="visualizarLogo" tabindex="-1" role="dialog" aria-labelledby="visualizarLogo" aria-hidden="true">
                
                <section class="modal-dialog">
                    
                    <section class="modal-content">
                        
                        <section class="modal-header">
                            
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">Visualizar Logo</h4>
                            
                        </section><!-- /modal-header -->
                        
                        <section class="modal-body">
                            
                            <section class="row">
                                
                                <section class="col-lg-12">
                                    
                                    <figure class="text-center"><img src="/market/uploads/logos_temas/{$configuracoestemas.logo}" class="img-resposive" height="67"></figure>
                                
                                </section><!-- /row -->

                            </section><!-- /row -->
                        
                    </section><!-- /modal-content -->
                    
                </section><!-- /modal-dialog -->
                
            </section><!-- /modal -->

            <!-- FIM Modal Visualizar Instituição -->

            
        </section><!-- /main-content -->


        

<link rel="stylesheet" type="text/css" href="/market/common/portal/assets/css/import-fonts.css" />
<link rel="stylesheet" type="text/css" href="/market/common/market/assets/bootstrap-colorpicker/css/colorpicker.css" />
<script src="/market/common/market/js/advanced-form-components.js"></script>
<script type="text/javascript" src="/market/common/market/assets/bootstrap-daterangepicker/daterangepicker.js"></script>
<script type="text/javascript" src="/market/common/market/assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
<script type="text/javascript" src="/market/common/market/assets/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>

<script type="text/javascript">
    {literal}
        $('#btnConfiguracaoPadra').click(function(e){
            
            $('#cor_primaria').val('');        
            $('#cor_secundaria').val('');
            $('#cor_btn_compra').val('');
            $('#cor_borda_btn_compra').val('');
            $('#cor_hover_btn_compra').val('');
            $('#cor_hover_btn_geral').val('');
            $('#cor_hover_linkmenu').val('');
            $('#cor_fonte_primaria').val(''); 
            $('#cor_fonte_secundaria').val(''); 
            $('#cor_fonte_botao').val(''); 
            $('#fonte').val('Arial');                       

            $('.color').colorpicker('destroy');
            //window.document.getElementById("cor_primaria_colorpicker").style.data-color= '#000000';
            
            //$('#cor_primaria_colorpicker').attr('data-color', '');
            

            
        });
    {/literal}

    $('#fonte').val('{$configuracoestemas.fonte}');

</script>
