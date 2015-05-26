<footer class="footer">

		<section class="footer-primary">

			<section class="container">

				<section class="row">

					<section class="col-lg-6 col-sm-12 col-xs-12 footer-item">

						<b>Formas de Pagamento</b> 

						<span class="pull-right">
							{if $configs_pagamentos.pagseguro_status}
							<a href="#" target="_blank" class="btn btn-default"><img src="{$url_site}market/common/portal/assets/img/logo-pagseguro.png"></a>
							{/if}

							{if $configs_pagamentos.pagarme_status}
							<a href="#" target="_blank" class="btn btn-default"><img src="{$url_site}market/common/portal/assets/img/logo-pagarme.png"></a>
							{/if}
						</span>

					</section><!-- /.col-lg-6 -->

					<section class="col-lg-3 col-sm-12 col-xs-12 footer-item">

						<b>Siga-nos!</b> 

						<span class="pull-right">
							{if $cliente.facebook}
								<a href="{$cliente.facebook}" target="_blank" class="btn btn-dark tooltips" data-toggle="tooltip" data-placement="top" title="Facebook"><i class="fa fa-facebook"></i></a>
							{/if}	
							{if $cliente.twitter}	
								<a href="{$cliente.twitter}" target="_blank" class="btn btn-dark tooltips" data-toggle="tooltip" data-placement="top" title="Twitter"><i class="fa fa-twitter"></i></a>
							{/if}
							{if $cliente.instagram}	
							<a href="{$cliente.instagram}" target="_blank" class="btn btn-dark tooltips" data-toggle="tooltip" data-placement="top" title="Instagram"><i class="fa fa-instagram"></i></a>							
							{/if}
							{if $cliente.youtube}	
							<a href="{$cliente.youtube}" target="_blank" class="btn btn-dark tooltips" data-toggle="tooltip" data-placement="top" title="Youtube"><i class="fa fa-youtube-play"></i></a>
							{/if}

						</span>

					</section><!-- /.col-lg-3 -->

					<section class="col-lg-3 col-sm-12 col-xs-12">

						<address>

						  	<strong>{$cliente.nome}</strong><br>
						  	<strong>Endereço:</strong> {$cliente.endereco} - {$cliente.bairro}, {$cliente.cidade}/{$cliente.estado}<br>
						  	<strong>Telefone:</strong> {$cliente.telefone}

						</address>

					</section><!-- /.col-lg-3 -->

				</section><!-- /.row -->

			</section><!-- /.container -->

		</section><!-- /.footer-primary -->

		<section class="footer-secundary">

			<section class="container">

				<p class="text-center">

					© iTeacher <b>2014</b> - Todos os Direitos Reservados

					<span class="pull-right col-sm-12 col-xs-12">Plataforma <a href="{$url_site}" target="_blank">iTeacher</a></span>

				</p>

			</section><!-- /.container -->

		</section><!-- /.footer-secundary -->

	</footer><!-- /.footer -->

	<!-- ========== Modal ========== -->

	<section class="modal fade" id="certificate-consult" tabindex="-1" role="dialog" aria-labelledby="certificate-consult" aria-hidden="true">

		<section class="modal-dialog">

			<section class="modal-content">

				<section class="modal-header">

					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        			<h4 class="modal-title" id="myModalLabel">Consultar Certificado</h4>

				</section><!-- /.modal-header -->

				<section class="modal-body">

					<form role="form">

						<section class="alert alert-danger fade in">

							<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>

							Certificado inválido!

						</section><!-- /.alert -->

						<section class="form-group">

							<label>Número do Certificado</label>
							<input type="text" class="form-control" required autofocus>

						</section><!-- /.form-group -->

					</form>

				</section><!-- /.modal-body -->

				<section class="modal-footer">

					<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
        			<button type="button" class="btn btn-dark">Consultar</button>

				</section><!-- /.modal-footer -->

			</section><!-- /.modal-content -->

		</section><!-- /.modal-dialog -->

	</section><!-- /.modal -->

	

	<!-- ========== JS ========== -->
	<script src="{$url_site}market/common/portal/assets/js/bootstrap.min.js"></script>

	<!-- ========== FUNCTIONS ========== -->
	<script src="{$url_site}market/common/portal/assets/js/functions.js" type="text/javascript"></script>

	<!-- ========== AREA FOR GOOGLE ANALYTICS ========== -->
	<script type="text/javascript" src="{$url_site}market/common/market/assets/analytics.js"></script>
	
	<script type="text/javascript">		
		/*$("#combo").change(function () {                                
     		alert('oi');
     	}).change(); */
	</script>

</body>
</html>