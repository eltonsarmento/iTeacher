    <div class="breadcrumbs">
       
        <div class="container">
           
            <div class="row">
               
                <div class="col-lg-12 col-sm-12">
                   
                    <h1 class="text-center">Instituição</h1>
                    
                </div><!-- /col-lg-12 -->
                
            </div><!-- /row -->
            
        </div><!-- /container -->
        
    </div><!-- /breadcrumbs -->

	<div class="instituicao">
		
		<div class="container">
		
			<div class="text-center feature-head title-instituicao">

				<h1>Planos e Preços</h1>
				
			</div><!-- /feature-head -->
			
			<div class="row">
           		

           		{foreach item=plano from=$planos}

					<div class="col-lg-3 col-sm-3">

						<div class="pricing-table">

							<div class="pricing-head">

								<h1>{$plano.plano}</h1>
								<h2><span class="note">R$</span>{$plano.valor|number_format:2:",":"."}</h2>

							</div><!-- /pricing-head -->
							<ul class="list-unstyled">
								<p>{$plano.descricao}</p>
							</ul>							

							<div class="price-actions">

								<a href="{$url_site}instituicao/cadastrar/{$plano.id}" class="btn">Assinar Agora</a>

							</div><!-- /price-actions -->

						</div><!-- /pricing-table -->

					</div><!-- /col-lg-3 -->
				{/foreach}
				<!-- <div class="col-lg-3 col-sm-3">

					<div class="pricing-table">

						<div class="pricing-head">

							<h1>Pro</h1>
							<h2><span class="note">R$</span>80,00</h2>

						</div>

						<ul class="list-unstyled">

							<li>8 hours coverage</li>
							<li>500 digital images</li>
							<li>100 A3 Hard Copy</li>
							<li>Bridal portrait with 11X14</li>
							<li>Engagement portrait with 11X14</li>
							<li>Income Tax included</li>

						</ul>

						<div class="price-actions">

							<a href="{$url_site}/instituicao/cadastrar?plano=Pro" class="btn">Assinar Agora</a>

						</div>

					</div>

				</div> -->

				

				

			</div><!-- /row -->
		
		</div><!-- /container -->
		
	</div><!-- /instituicao -->