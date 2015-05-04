 <footer class="site-footer">
            
            <section class="text-center">{$smarty.now|date_format:"%Y"} &copy; iTeacher.<a href="#" class="go-top"><i class="fa fa-angle-up"></i></a></section>
            
        </footer>
    
    </section><!-- /container -->

     
     <script src="{$url_site}{$admin_dir}common/market/js/dateFormat.js"></script>

    <!-- JS -->
    
    <script src="{$url_site}{$admin_dir}common/market/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="{$url_site}{$admin_dir}common/market/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="{$url_site}{$admin_dir}common/market/js/jquery.scrollTo.min.js"></script>
    <script src="{$url_site}{$admin_dir}common/market/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="{$url_site}{$admin_dir}common/market/js/respond.min.js" ></script>
    <script src="{$url_site}{$admin_dir}common/market/assets/ckeditor/ckeditor.js"></script>  
    
    <script src="{$url_site}{$admin_dir}common/market/js/jquery.tagsinput.js"></script>
    <script src="{$url_site}{$admin_dir}common/market/js/bootstrap-switch.js"></script>


    <script src="{$url_site}{$admin_dir}common/market/js/draggable-portlet.js"></script>
    <script src="{$url_site}{$admin_dir}common/market/assets/nestable/jquery.nestable.js"></script>
    <script src="{$url_site}{$admin_dir}common/market/js/nestable.js"></script>
    <!-- COMMON JS -->
    <script src="{$url_site}{$admin_dir}common/market/js/jquery.stepy.js"></script>
    <script type="text/javascript" src="{$url_site}{$admin_dir}common/market/js/jquery.form.min.js"></script>
    <!-- JS -->
    
    <script type="text/javascript" src="{$url_site}{$admin_dir}common/market/assets/fuelux/js/spinner.min.js"></script>
    <script type="text/javascript" src="{$url_site}{$admin_dir}common/market/assets/bootstrap-fileupload/bootstrap-fileupload.js"></script>
    <script type="text/javascript" src="{$url_site}{$admin_dir}common/market/assets/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
    <script type="text/javascript" src="{$url_site}{$admin_dir}common/market/assets/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
    <script type="text/javascript" src="{$url_site}{$admin_dir}common/market/assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="{$url_site}{$admin_dir}common/market/assets/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="{$url_site}{$admin_dir}common/market/assets/bootstrap-daterangepicker/moment.min.js"></script>
    <script type="text/javascript" src="{$url_site}{$admin_dir}common/market/assets/bootstrap-daterangepicker/daterangepicker.js"></script>
    <script type="text/javascript" src="{$url_site}{$admin_dir}common/market/assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
    <script type="text/javascript" src="{$url_site}{$admin_dir}common/market/assets/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
    <script type="text/javascript" src="{$url_site}{$admin_dir}common/market/assets/jquery-multi-select/js/jquery.multi-select.js"></script>
    <script type="text/javascript" src="{$url_site}{$admin_dir}common/market/assets/jquery-multi-select/js/jquery.quicksearch.js"></script>
    
    
    <!-- COMMON JS -->
    <script language="JavaScript" type="text/javascript" src="{$url_site}{$admin_dir}common/market/js/common-scripts.js"></script>
    
    
    <script language="JavaScript" type="text/javascript" src="{$url_site}{$admin_dir}common/market/js/advanced-form-components.js"></script>
    <script language="JavaScript" type="text/javascript" src="{$url_site}{$admin_dir}common/market/js/maskMoney.js"></script>
    <!--<script type="text/javascript" src="http://jwpsrv.com/library/NfG2RuJvEeKrZRIxOQulpA.js"></script>-->
    
    <script language="JavaScript" type="text/javascript" src="{$url_site}{$admin_dir}common/market/assets/bootstrap-select/selectize.js" ></script>



    <script>
        $(function() {
            $('#default').stepy({
              backLabel: 'Voltar',
              block: true,
              nextLabel: 'Próximo',
              titleClick: true,
              titleTarget: '.stepy-tab'
            }); 
            $('#valor_saque').maskMoney();
        });
    </script>
    
    <script src="{$url_site}{$admin_dir}common/market/js/form-component.js"></script>
   
    <script type="text/javascript" src="{$url_site}{$admin_dir}common/market/assets/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
    
    <script>
        $('#texto_modal').wysihtml5();
        $('#wysihtml5_notificacao').wysihtml5();
    </script>
    {literal}
    <script>
    $(document).ready(function() {
        DraggablePortlet.init();
    });
    </script>
    {/literal}


</body>
</html>
