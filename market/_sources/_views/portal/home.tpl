	<section class="container">
		<section class="row">

			<section class="col-lg-12 col-sm-12 hidden-xs">

				<section id="slider" class="carousel slide" data-ride="carousel">

					<ol class="carousel-indicators">
						{foreach from=$cursos key=key item=curso}
				  			{if $key < 2}
					    		<li data-target="#slider" data-slide-to="{$key}" {if $key eq '0'}class="active"{/if}></li>					    		
					    	{/if}
					    {/foreach}		
				  	</ol>

				  	<section class="carousel-inner">

				  		{foreach from=$cursos key=key item=curso}
				  			{if $key < 2}
				  				{if $curso.banner_arquivo}
				  					<section class="item {if $key eq '0'}active{/if}">
						    			<a href="#"><img src="{$url_site}market/uploads/imagens/{$curso.banner_arquivo}" width="1170" height="270" alt="" title=""></a>
						    		</section>
				  				{else}
							    	<section class="item {if $key eq '0'}active{/if}">
							    		<a href="#"><img src="{$url_site}market/common/portal/assets/img/img1.jpg" alt="" title=""></a>
							    	</section><!-- /.item -->
							    {/if}
							 {/if}
						 {/foreach}   
<!-- 
					    <section class="item">
					    	<a href="#"><img src="{$url_site}market/common/portal/assets/img/img2.jpg" alt="" title=""></a>
					    </section><!-- /.item 

					    <section class="item">
					    	<a href="#"><img src="{$url_site}market/common/portal/assets/img/img3.jpg" alt="" title=""></a>
					    </section><!-- /.item 
 -->
				  	</section><!-- /.carousel-inner -->

				  	<a class="left carousel-control" href="#slider" data-slide="prev"><span class="fa fa-chevron-left"></span></a>
				  	<a class="right carousel-control" href="#slider" data-slide="next"><span class="fa fa-chevron-right"></span></a>

				</section><!-- /.carousel -->

			</section><!-- /.col-lg-12 -->

		</section><!-- /.row -->

		<hr/>

		<section class="row">
		{foreach from=$cursos item=curso}
			<section class="col-lg-3 col-sm-6 col-xs-12">
				
				<article class="thumbnail">
					
					{if $curso.destaque_arquivo}
						<img src="{$url_site}market/uploads/imagens/{$curso.destaque_arquivo}" alt="" title="">							
					{else}
						<img src="{$url_site}market/common/portal/assets/img/img-thumbnail.jpg" alt="" title="">
					{/if}

					{if $curso.gratuito eq 1}
					<section class="price offer">

						<span>Gratuito</span>

					</section><!-- /.price -->
					{else}
					<section class="price">

						<span>R$ {$curso.valor}</span>

					</section>
					{/if}
					<section class="caption">

                        <h4 class="text-center"><a href="#">{$curso.curso}</a></h4>
                        
                        <p class="text-center">{$curso.descricao_decode_html|truncate:150:"..."}</p>

                    </section><!-- /.caption -->

                    {if $curso.gratuito eq 1}
                    <section class="button">

                    	<a href="#" class="btn btn-success btn-block">Estude Agora</a>

                    </section><!-- /.button -->
                    {else}
                    <section class="button">

                    	<a href="{$url_portal}portal/curso/index/{$curso.id}" class="btn btn-success btn-block">Comprar</a>

                    </section><!-- /.button -->
                    {/if}

				</article><!-- /.thumbnail -->
				
			</section><!-- /.col-lg-3 -->
		{/foreach}		
			

		</section><!-- /.row -->

	</section><!-- /.container -->

	