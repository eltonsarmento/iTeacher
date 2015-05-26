<style TYPE="text/css">
/* Import fonts */

@import url(http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic);
@import url(http://fonts.googleapis.com/css?family=Fjalla+One);

/*search*/

.search {
    margin-top: 3px ;
    width: 20px;
    -webkit-transition: all .3s ease;
    -moz-transition: all .3s ease;
    -ms-transition: all .3s ease;
    -o-transition: all .3s ease;
    transition: all .3s ease;
    border: 1px solid #fff;
    box-shadow: none;
    background: url("../img/search-icon.jpg") no-repeat 10px 8px;
    padding:0 5px 0 35px;
    color: #fff;
}

.search:focus {
    margin-top: 3px ;
    width: 180px;
    border: 1px solid #eaeaea;
    box-shadow: none;
    -webkit-transition: all .3s ease;
    -moz-transition: all .3s ease;
    -ms-transition: all .3s ease;
    -o-transition: all .3s ease;
    transition: all .3s ease;
    color: #c8c8c8;
    font-weight: 300;
    margin-left: 10px;
}

/*homepage features*/

.feature-head {
    padding: 50px 0;
}

.feature-head h1{
    color: #333;
    font-size: 30px;
    font-weight: 300;
    text-transform: uppercase;
    margin-top: 0;
    font-family: 'Fjalla One', sans-serif;
}

.feature-head p{
    color: #8a8b8b;
    font-size: 18px;
    font-weight: 300;
}

.f-box {
    background: #f4f4f4;
    border-radius: 10px;
    padding: 20px;
    text-align: center;
    min-height: 210px;
    margin-bottom: 20px;
    transition-duration: 500ms;
    transition-property: width, background;
    transition-timing-function: ease;
    -webkit-transition-duration: 500ms;
    -webkit-transition-property: width, background;
    -webkit-transition-timing-function: ease;
}

/*pricing table*/

.pricing-table {
    background: #eeeeee;
    text-align: center;
    padding: 0 0 25px 0;
    border-radius: 5px;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
}

.pricing-table.most-popular {
    top: -20px;
    position: relative;
}

.most-popular {
    background: #f77b6f;
    color: #fff;
}

.most-popular h1 {
    font-size: 25px !important;
    padding-bottom: 10px;
    padding-top: 17px !important;
}

.most-popular h2 {
    background: #d76b61 !important;
    margin-top: 20px !important;
}

.most-popular ul li {
    border-bottom: 1px dotted #d76b61 !important;
}

.most-popular .price-actions .btn {
    background: #d76b61 !important;
    margin: 10px 0;
    cursor: pointer;
}

.pricing-table .price-actions .btn {
    border-radius: 5px;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    background: #acacac;
    color: #fff;
    border: none;
    box-shadow: none;
    text-shadow: none;
    padding: 10px 20px;
    cursor: pointer;
}

.pricing-head h1 {
    font-size: 18px;
    font-weight: 300;
    padding-top: 15px;
}

.pricing-head h2 {
    padding: 30px 0;
    background: #777777;
    color: #fff;
    font-size: 50px;
    font-weight: 100;
}

.pricing-table ul {
    margin: 15px 0;
    padding: 0;
}

.pricing-table ul li {
    border-bottom: 1px dotted #CCCCCC;
    margin: 0 2em;
    padding: 1em 0;
    text-align: center;
    font-weight: 300;
}

.pricing-head span.note {
    display: inline;
    font-size: 25px;
    line-height: 0.8em;
    position: relative;
    top: -18px;
}

.pricing-quotation, .team-info {
    background: #EEEEEE;
    padding: 20px 20px 35px 20px;
    margin-bottom: 100px;
    display: inline-block;
    width: 100%;
    text-align: center;
    border-radius: 5px;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
}

.pricing-quotation h3, .team-info h3 {
    font-weight: 300;
}

.pricing-quotation p, .team-info p {
    margin-bottom: 0px;
}

.pricing-plan, .team-info-wrap {
    position: relative;
}

.pricing-quotation:before, .team-info:before {
    background-color: #EEEEEE;
    border-color: #EEEEEE;
    border-image: none;
    border-right: 1px solid #EEEEEE;
    border-style: none;
    top: -7px;
    content: "";
    display: block;
    height: 14px;
    left: 48%;
    position: absolute;
    transform: rotate(45deg);
    -moz-transform: rotate(45deg);
    -webkit-transform: rotate(45deg);
    width: 15px;
}

.container {
    width: 1170px;
}
.instituicao {
    margin-bottom: 30px;
}
</style>
<div class="instituicao">
		
		<div class="container">
					
			<div class="text-center feature-head title-instituicao">

				<h1>Planos e Preços</h1>
			</div><!-- /feature-head -->
			
			
			<div class="row">
           		{foreach from=$planos item=plano}	
           			{if $plano.status eq 1}		
						<div class="col-lg-3 col-sm-3">
							<div class="pricing-table ">
								<div class="pricing-head">
									<h1>{$plano.plano}</h1>
									<h2><span class="note">R$</span>{$plano.valor|number_format:2:",":"."}</h2>
								</div><!-- /pricing-head -->
								<ul class="list-unstyled">
									<p>{$plano.descricao}</p>
								</ul>

								<div class="price-actions">
									<a  href="{$url_portal}portal/carrinho/adicionarPlano/{$plano.id}" class="btn">Assinar Agora</a>
								</div><!-- /price-actions -->
							</div><!-- /pricing-table -->
						</div><!-- /col-lg-3 -->
					{/if}
				{/foreach}				
				<!-- <div class="col-lg-3 col-sm-3">
					<div class="pricing-table most-popular">
						<div class="pricing-head">
							<h1>Premium</h1>
							<h2><span class="note">R$</span>120,00</h2>

						</div><!-- /pricing-head 
						<ul class="list-unstyled">
							<li>8 hours coverage</li>
							<li>500 digital images</li>
							<li>100 A3 Hard Copy</li>
							<li>Bridal portrait with 11X14</li>
							<li>Engagement portrait with 11X14</li>
							<li>Income Tax included</li>
						</ul>
						<div class="price-actions">
							<a href="pre-cadastro.html" class="btn">Assinar Agora</a>
						</div><!-- /price-actions 
					</div><!-- /pricing-table 
				</div><!-- /col-lg-3 -->
			</div><!-- /row -->
		
		</div><!-- /container -->
		
	</div><!-- /instituicao -->