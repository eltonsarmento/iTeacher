
        
        <section id="main-content">
          
            <section class="wrapper site-min-height">
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <ul class="breadcrumb">
                            
                            <li><a href="dashboard.html"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li><a href="gerenciar-cupons.html">Cupons</a></li>
                            <li class="active">Adicionar Novo</li>
                            
                        </ul>
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row -->
                
                <section class="row">
                    
                    <section class="col-lg-12">
                        
                        <section class="panel">
                            
                            <header class="panel-heading"><strong>Adicionar Novo - Cupom</strong></header>
                            
                            <section class="panel-body">
                                
                                <form class="form-horizontal tasi-form" action="">
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Cupom</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <input class="form-control" name="" type="text" autofocus required>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Tipo</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <section class="radios">
                                            
                                                <label class="label_radio" for="radio-01"><input name="sample-radio" id="radio-01" value="1" type="radio"> Único</label>
                                                    
                                                <label class="label_radio" for="radio-02"><input name="sample-radio" id="radio-02" value="1" type="radio"> Intervalo de Tempo</label>
                                                    
                                                <label class="label_radio" for="radio-03"><input name="sample-radio" id="radio-03" value="1" type="radio"> Quantidade</label>
                                                
                                                <label class="label_radio" for="radio-04"><input name="sample-radio" id="radio-04" value="1" type="radio"> Indeterminado</label>

                                            </section><!-- /radios -->
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group" id="quantidade">
                                        
                                        <label class="control-label col-lg-2">Quantidade</label>
                                        
                                        <section class="col-lg-1">
                                            
                                            <div id="spinner1">
                                                
                                                <div class="input-group input-small">
                                                    
                                                    <input type="text" class="spinner-input form-control" maxlength="3" readonly>
                                                    
                                                    <div class="spinner-buttons input-group-btn btn-group-vertical">
                                                        
                                                          <button type="button" class="btn spinner-up btn-xs btn-default"><i class="fa fa-angle-up"></i></button>
                                                        
                                                          <button type="button" class="btn spinner-down btn-xs btn-default"><i class="fa fa-angle-down"></i></button>
                                                        
                                                    </div>
                                                    
                                                </div>
                                                
                                            </div>
                                            
                                        </section><!-- /col-lg-1 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group" id="tempo">
                                        
                                        <label class="control-label col-lg-2">Tempo</label>
                                        
                                        <section class="col-lg-4">
                                            
                                            <section class="input-group input-large">
                                                
                                                <span class="input-group-addon">De</span>
                                                
                                                <input type="text" class="form-control dpd1" name="from" data-date-format="dd/mm/yyyy">
                                                
                                                <span class="input-group-addon">Até</span>
                                                
                                                <input type="text" class="form-control dpd2" name="to" data-date-format="dd/mm/yyyy">
                                                
                                            </section><!-- /input-group -->
                                    
                                        </section><!-- /col-lg-4 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Curso Específico</label>
                                        
                                        <section class="col-lg-10">
                                              
                                            <select id="selectize" multiple placeholder="Selecione o Curso">
                    
                                                <option value="">Selecione o Curso</option>
                                                <option value="Todos os Cursos">Todos os Cursos</option>
                                                <option value="Curso de Web Design">Curso de Web Design</option>
                                                <option value="Curso de Programação">Curso de Programação</option>
                                                        
                                            </select>
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Status</label>
                                        
                                        <section class="col-lg-10">
                                              
                                             <section class="btn-row">
                                                
                                                <section data-toggle="buttons">
                                                     
                                                    <label class="btn btn-success">
                                                          
                                                        <input type="radio" name="options" id=""> <i class="fa fa-check"></i> Ativo
                                                          
                                                    </label>
                                                    
                                                    <label class="btn btn-danger">
                                                          
                                                        <input type="radio" name="options" id=""> <i class="fa fa-minus"></i> Inativo
                                                          
                                                    </label>
                                                     
                                                </section><!-- /btn-group --> 
                                            
                                            </section><!-- /btn-row --> 
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->
                                    
                                    <section class="form-group">
                                        
                                        <label class="control-label col-lg-2">Valor</label>
                                        
                                        <section class="col-lg-2">
                                            
                                            <section class="input-group m-bot15">
                                                
                                                <span class="input-group-addon">R$</span>
                                                <input class="form-control" name="" type="text" required>
                                                
                                            </section><!-- /input-group -->
                                              
                                        </section><!-- /col-lg-10 --> 
                                        
                                    </section><!-- /form-group -->

                                    <section class="form-group">
                                          
                                        <section class="col-lg-offset-2 col-lg-10">
                                              
                                            <button class="btn btn-success" type="submit"><i class="fa fa-check-circle"></i> Salvar</button>
                                            <button class="btn btn-default" type="submit"><i class="fa fa-plus-circle"></i> Salvar e adicionar outro</button>
                                            <span>ou <a href="gerenciar-cupons.html">voltar a listagem</a></span>
                                              
                                        </section><!-- /col-lg-offset-2 col-lg-10 --> 
                                          
                                    </section><!-- /form-group --> 
                                      
                                </form>

                            </section><!-- /panel-body --> 
                        
                        </section><!-- /panel --> 
                        
                    </section><!-- /col-lg-12 -->
                
                </section><!-- /row --> 

            </section><!-- /wrapper -->
            
        </section><!-- /main-content -->
        
        <footer class="site-footer">
            
          <section class="text-center">2014 &copy; CursosIAG.<a href="#" class="go-top"><i class="fa fa-angle-up"></i></a></section>
            
        </footer>
    
    </section><!-- /container -->

    <!-- JS -->
    
    <script type="text/javascript" language="javascript" src="assets/advanced-datatable/media/js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="js/respond.min.js" ></script>
    
    <script type="text/javascript" src="assets/fuelux/js/spinner.min.js"></script>
    <script type="text/javascript" src="assets/bootstrap-fileupload/bootstrap-fileupload.js"></script>
    <script type="text/javascript" src="assets/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
    <script type="text/javascript" src="assets/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
    <script type="text/javascript" src="assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="assets/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="assets/bootstrap-daterangepicker/moment.min.js"></script>
    <script type="text/javascript" src="assets/bootstrap-daterangepicker/daterangepicker.js"></script>
    <script type="text/javascript" src="assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
    <script type="text/javascript" src="assets/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
    <script type="text/javascript" src="assets/jquery-multi-select/js/jquery.multi-select.js"></script>
    <script type="text/javascript" src="assets/jquery-multi-select/js/jquery.quicksearch.js"></script>

    <!-- COMMON JS -->
    
    <script src="js/common-scripts.js"></script>
    <script src="js/advanced-form-components.js"></script>
    
    <script src="assets/bootstrap-select/selectize.js" ></script>
    <script>
    
        $('#selectize').selectize();
        
    </script>
    
    <script>
        
    $(document).ready(function(){

        $('#quantidade').hide();
        $('#tempo').hide();
        
        $("#radio-01").click(function(){          
            
            $('#quantidade').hide();
            $('#tempo').hide();         
            
        });
        
        $("#radio-02").click(function(){          
            
            if($(this).is(":checked")){

                $('#tempo').show();
                $('#quantidade').hide();
            
            }           
            
        });
        
        $("#radio-03").click(function(){          
            
            if($(this).is(":checked")){

                $('#quantidade').show();
                $('#tempo').hide();
            
            }           
            
        });
        
        $("#radio-04").click(function(){          
            
            if($(this).is(":checked")){

                $('#quantidade').hide();
                $('#tempo').hide();
            
            }           
            
        });
        
    });
    
    </script>

</body>
</html>
