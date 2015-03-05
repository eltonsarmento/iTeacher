	<footer class="footer">
	
		<div class="container">
		
			<div class="row">
			
				<div class="col-lg-4">
				
					<p>&copy; 2014 - <strong>iTeacher</strong> | Todos os direitos reservados.</p>
					
				</div><!-- /col-lg-4 -->
			
				<div class="col-lg-2 col-sm-3">
				
					<h1>Home</h1>
					
					<ul class="list-unstyled">
					
						<li><a href="{$admin_url}/sobre/index">Sobre o iTeacher</a></li>
						<li><a href="#">Preços</a></li>
						<li><a href="{$admin_url}/clintes/index">Clientes</a></li>
					
					</ul>
					
				</div><!-- /col-lg-2 -->
				
				<div class="col-lg-2 col-sm-3">
				
					<h1>Cadastre-se</h1>
					
					<ul class="list-unstyled">
					
						<li><a href="{$admin_url}/professor/index">Professor</a></li>
						<li><a href="{$admin_url}/instituicao/index">Instituição</a></li>
					
					</ul>
					
				</div><!-- /col-lg-2 -->
				
				<div class="col-lg-2 col-sm-3">
				
					<h1>Contato</h1>
					
					<ul class="list-unstyled">
					
						<li><a href="#">Fale Conosco</a></li>
						<li><a href="{$admin_url}/blog/index">Blog</a></li>
					
					</ul>
					
				</div><!-- /col-lg-2 -->
				
				<div class="col-lg-2">
				
					<h1>Social</h1>
					
					<ul class="social-link-footer list-unstyled">
					
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-youtube"></i></a></li>
					
					</ul>
					
				</div><!-- /col-lg-2 -->
				
			</div><!-- /row -->
			
		</div><!-- /container -->
		
	</footer><!-- /footer -->

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="{$url_site}market/common/site/js/jquery.js"></script>
    <script src="{$url_site}market/common/site/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="{$url_site}market/common/site/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="{$url_site}market/common/site/js/hover-dropdown.js"></script>
    <script defer src="{$url_site}market/common/site/js/jquery.flexslider.js"></script>
    <script type="text/javascript" src="{$url_site}market/common/site/assets/bxslider/jquery.bxslider.js"></script>

    <script type="text/javascript" src="{$url_site}market/common/site/js/jquery.parallax-1.1.3.js"></script>

    <script src="{$url_site}market/common/site/js/jquery.easing.min.js"></script>
    <script src="{$url_site}market/common/site/js/link-hover.js"></script>

    <script src="{$url_site}market/common/site/assets/fancybox/source/jquery.fancybox.pack.js"></script>

    <script type="text/javascript" src="{$url_site}market/common/site/assets/revolution_slider/rs-plugin/js/jquery.themepunch.plugins.min.js"></script>
    <script type="text/javascript" src="{$url_site}market/common/site/assets/revolution_slider/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>

    <!--common script for all pages-->
    <script src="{$url_site}market/common/site/js/common-scripts.js"></script>

    <script src="{$url_site}market/common/site/js/revulation-slide.js"></script>
    
    <script src="{$url_site}market/common/site/js/bootstrap.youtubepopup.min.js"></script>


    {literal}
	<script>

	  RevSlide.initRevolutionSlider();

	  $(window).load(function() {
		  $('[data-zlname = reverse-effect]').mateHover({
			  position: 'y-reverse',
			  overlayStyle: 'rolling',
			  overlayBg: '#fff',
			  overlayOpacity: 0.7,
			  overlayEasing: 'easeOutCirc',
			  rollingPosition: 'top',
			  popupEasing: 'easeOutBack',
			  popup2Easing: 'easeOutBack'
		  });
	  });

	  $(window).load(function() {
		  $('.flexslider').flexslider({
			  animation: "slide",
			  start: function(slider) {
				  $('body').removeClass('loading');
			  }
		  });
	  });

	  //    fancybox
	  jQuery(".fancybox").fancybox();

	</script>
  
	<script type="text/javascript">
		$(function () {
			$(".youtube").YouTubeModal({autoplay:0, width:640, height:480});
		});
	</script>
	{/literal}
  </body>
</html>
