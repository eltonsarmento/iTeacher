<section class="title-list-courses">

		<section class="container">

			<section class="row">

				<section class="col-lg-8 col-sm-12 col-xs-12">

					<h3>Cursos na Categoria: <b>{$area}</b></h3>

				</section><!-- /.col-lg-8 -->

				<section class="col-lg-4 col-sm-12 col-xs-12">

					<form class="form-horizontal" method="POST">

						<section class="form-group">

		    				<label class="col-lg-4 control-label" >Ordenar por:</label>

		    				<section class="col-lg-8">
		    					
			    				<select class="form-control" name="comboOrdenacao" onchange="this.form.submit()" >

			    					<option {if $order eq "c.data_cadastro DESC"}selected="selected"{/if} value="data_cadastro DESC">Padrão (Recentes)</option>
			    					<option {if $order eq "c.curso"}selected="selected"{/if} value="curso" >Nome (A - Z)</option>
			    					<option {if $order eq "c.curso desc"}selected="selected"{/if}value="curso_desc">Nome (Z - A)</option>
			    					<option {if $order eq "c.valor"}selected="selected"{/if}value="valor">Preço (Menor &lt; Maior)</option>
			    					<option {if $order eq "c.valor desc"}selected="selected"{/if}value="valor_desc">Preço (Maior &gt; Menor)</option>

			    				</select>
			    			

		    				</section><!-- /.col-lg-8 -->

	  					</section><!-- /.form-group -->

					</form>

				</section><!-- /.col-lg-4 -->

			</section><!-- /.row -->

		</section><!-- /.container -->

	</section>
	<section class="container">

		<section class="row">

			{foreach item=curso from=$cursos}
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
							</section><!-- /.price -->
						{/if}
						<section class="caption">

	                        <h4 class="text-center"><a href="#">{$curso.curso}</a></h4>
	                        
	                        <p class="text-center">{$curso.descricao_decode_html}</p>

	                    </section><!-- /.caption -->

	                    <section class="button">
	                    	{if $curso.gratuito eq 1}
								<a href="#" class="btn btn-success btn-block">Estude Agora</a>
							{else}
								<a href="{$url_portal}portal/curso/index/{$curso.id}" class="btn btn-success btn-block">Comprar</a>
							{/if}	                    	
	                    </section><!-- /.button -->

					</article><!-- /.thumbnail -->

				</section><!-- /.col-lg-3 -->
			{/foreach}



		</section><!-- /.row -->

	</section>
