<section class="container">

		<h1>Carrinho</h1>

		<hr>

		<section class="table-responsive">
			{if $msg_error}
                <!-- ERROR -->                        
                <span class="alert alert-error">
                    {$msg_error} <strong>=(</strong>
                </span>
             {/if}

		<table class="table">

			<thead>

				<tr><th></th>
				<th width="50"></th>
				<th >Curso</th>
				<th>Valor do Curso</th>
				<th>Total</th>

			</tr></thead>

			<tbody>

				{foreach item=produto key=k from=$produtos}
					<tr>
						<td class="text-center">
							<input class="codigoCurso" type="hidden" value="{$curso.id}">
							<a href="{$url_portal}portal/carrinho/removerCarrinho/{$k}" class="btn btn-danger btn-xs btn-cart tooltips" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Remover Curso"><i class="fa fa-times"></i></a>
						</td>
						<td>
							<img  src="{$url_site}market/common/portal/assets/img/img-thumbnail.jpg" class="img-rounded" height="35" alt="" title="">
						</td>
						<td><b class="title-course-cart">{$produto.produto}</b></td>
						<td><b class="title-course-cart">{$produto.preco}</b></td>
						<td><span class="price-course-cart">R$ {$produto.precoTotal}</span></td>
					</tr>
				{/foreach}			

				<tr>

					<td colspan="5">

						<form class="form-inline form-cart" action="{$url_portal}portal/carrinho/adicionarCupom/" method="post">
							<section class="form-group">
								<label>Cupom de desconto</label>
								<input type="text" name="cupom" required="" class="form-control">
								<button class="btn btn-dark">Utilizar Cupom</button>
							</section><!-- /.form-group -->
						</form>
						{if $cupom}
							Usando cupom: {$cupom.nome}<br/> <a href="{$url_portal}portal/carrinho/removerCupom">Clique aqui para remover o cupom</a>
                        {/if}
					</td>					

				</tr>

				<tr>

					<td class="text-right" colspan="5">

						Total: <b>R$ {$total}</b>
						
					</td>

				</tr>

				<tr>

					<td class="text-right" colspan="5">

						<a href="{$url_portal}portal" class="btn btn-success">Mais Cursos</a>
						<button class="btn btn-dark" onclick="window.location.href='{$url_portal}portal/carrinho/verificaLogin/'">Continuar <i class="fa fa-angle-right"></i></button>
						
					</td>

				</tr>

			</tbody>

		</table>

		</section><!-- /.table-responsive -->

	</section>

{literal}
<script type="text/javascript">
	(function($) {


	  RemoveTableRow = function(handler) {
	    var tr = $(handler).closest('tr');
	    var curso_id = tr.closest('tr').find('.codigoCurso').val();
	    
	    deletarCursoDoCarrinho(curso_id);
	    tr.fadeOut(400, function(){ 
	      tr.remove(); 
	    }); 

	    return false;
	  };
	})(jQuery);

	function deletarCursoDoCarrinho(curso_id){
			
			$.ajax({
			  type: "POST",
			  url: "{/literal}{$url_portal}{literal}portal/carrinho/index",
			  data: { curso_id: curso_id}
			}).done(function(data) {
			    alert( "apagado : " + data );
			    location.href="{/literal}{$url_portal}{literal}portal/carrinho/index";
			});
		/*$.post('{/literal}{$url_site}{literal}/carrinho/deletarCurso', {id:curso_id}, function (json){        	        
    	});*/
	}
	function utilizarCupom(){
		var valorCupom = $("#valorCupom").val();
		$.ajax({
		  type: "POST",
		  url: "{/literal}{$url_portal}{literal}portal/carrinho/utilizarCupom",
		  data: { valorCupom: valorCupom}
		}).done(function(data) {
			if(!(data == 'ok')
				alert( "msg: " + data );
		    //location.href="{/literal}{$url_site}{literal}portal/carrinho/index";
		});
	}
</script>
{/literal}