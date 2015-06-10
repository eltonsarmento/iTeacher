
<br/><br/><br/>
<div class="text-center">
				
		<p>Resumo do seu pedido</p>
				
	</div><!-- /text-center -->
	
	<br/><br/>
	
	<div class="property gray-bg" style="padding: 40px 0;">
		
		<div class="container">
			
			<div class="row">
			   
				<div class="col-lg-12">
					
					<ul class="list-group">
					   
						{foreach item=produto key=k from=$produtos}
							 <li class="list-group-item">
							
								<span class="badge">R$ {$produto.precoTotal}</span>
								{$produto.produto}
							
							</li>                            
						{/foreach}                        
						
					</ul>
					
				</div><!-- /col-lg-12 -->
				
				<div class="col-lg-12 text-center">
					
					<h3>Total</h3>
					<h3><strong>R$ {$total}</strong></h3>
					
				</div><!-- /col-lg-12 -->
				
			</div><!-- /row -->
			
		</div><!-- /container -->
		
	</div><!-- /property -->
	
	<br/><br/>
	
	<div class="container">
	
		<div class="row">
				
			<div class="col-lg-12">
			   

								
				<div class="text-center">
					<input type="checkbox" name="check-payment" id="check-termos" value=""><label class="check-payment"></label> <p>Li e concordo com os <a href="{$url_site}pagina/termos" target="_blank">Termos de Serviços</a></p>
					<br/><br/>  
					<p>Escolha o método de pagamento</p>
				
				</div><!-- /text-center -->
				
				<div class="row">
					
					{if $configs_pagamentos.pagseguro_status}
					<div class="col-lg-4">
						<button onclick="finalizarPagamento();"  class="btn btn-white btn-block btn-round btn-lg">Pagseguro</button>
					</div><!-- /col-lg-4 -->
					{/if}

					{if $configs_pagamentos.pagarme_status}
					<!-- <div class="col-lg-4">
						<form  method="POST" action="{$url_portal}portal/carrinho/concluirPagarme/">
							<input type="hidden" name="enviado" value="1">                                
							<script type="text/javascript"
								src="https://pagar.me/assets/checkout/checkout.js"
								data-button-text="Pagar.Me"
								data-encryption-key="{$pagarme_key_encryption}"
								data-max-installments="12"
								data-customer-data="false"
								data-max-installments="12"
								data-create-token="false"
								data-amount="{$totalPagarme}">
							</script>
						</form>
					</div> --><!-- /col-lg-4 -->
					{/if}

					<!--
					<div class="col-lg-4">

						<a href="#" class="btn btn-white btn-block btn-round btn-lg">Pagar.Me</a>

					</div><!-- /col-lg-4 -->

					<!-- <div class="col-lg-4">

						<a href="#" class="btn btn-white btn-block btn-round btn-lg">PayPal</a>

					</div> -->
				
				</div>
				
			</div>
			
			<div class="col-lg-12">
			  
				<hr>
			   
				<div class="text-center">
				
					<a onclick="window.location.href='{$url_portal}portal/carrinho/cancelar/'" href="#" class="btn btn-link">Cancelar pedido e restaurar carrinho</a>                    
				
				</div><!-- /text-center -->
				
				<br/><br/>
			
			</div><!-- /col-lg-12 -->
		
		</div><!-- /row -->
		
	</div><!-- /container -->

</div><!-- /text-center -->
<style type="text/css">
#popUp {
	display: none;
	position: fixed;
	left: 25%;
	top: 25%;
	padding: 25px;
	border: 2px solid #000;
	background-color: #FFF;
	width: 50%;
	height: 25%;
	z-index: 100;
	text-align: center;
}
</style>
<div id="retornoPagamento"></div>
<script type="text/javascript" src="{$url_site}lms/common/site/js/tabs.checkout.min.js"></script> 
<script type="text/javascript" src="{$url_site}lms/common/site/js/jquery.mask.js"></script>
<script type="text/javascript" src="{$url_site}lms/common/site/js/jquery.mask.min.js"></script>
<div id="popUp">
	<h1>Você será redirecionado para a pagina de pagamento!</h1><br/>
	<input type="hidden" value="" id="linkEscondido"/>
	<input type="button" value="Clique aqui para continuar!" onclick="abrePaginaPagamento();"/>
</div>
{literal}
<script type="text/javascript">
////// PagSeguro ////
function pagarPagSeguro() {
	$.post('{/literal}{$url_portal}{literal}portal/carrinho/concluirPagSeguro/', function html(html) { $('#retornoPagamento').html(html)});
}

function finalizarPagamento() {
	if ($('#check-termos').is(':checked')) {
		pagarPagSeguro();
	} else {
		alert('Aceite os termos de compromisso!');
	}
}

function abrePaginaPagamento() {
	window.open($('#linkEscondido').val(), '_blank');
	{/literal}
	window.location.href='{$url_portal}portal/carrinho/confirmacao';
	{literal}
}
</script>
{/literal}