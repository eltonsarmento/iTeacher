<section class="container">

		<h1>Carrinho</h1>

		<hr>

		<section class="table-responsive">

		<table class="table">

			<thead>

				<tr><th></th>
				<th width="75"></th>
				<th>Curso</th>
				<th>Valor do Curso</th>

			</tr></thead>

			<tbody>

				{foreach item=curso from=$cursos}
					{if $curso.curso eq ''}{else}
					<tr>

						<td class="text-center">
							<input class="codigoCurso" type="hidden" value="{$curso.id}">
							<a href="#" onclick="RemoveTableRow(this)" class="btn btn-danger btn-xs btn-cart tooltips" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Remover Curso"><i class="fa fa-times"></i></a>

						</td>
						<td>
							<img  src="{$url_site}market/common/portal/assets/img/img-thumbnail.jpg" class="img-rounded" height="35" alt="" title="">
						</td>
						<td><b class="title-course-cart">{$curso.curso}</b></td>
						<td><span class="price-course-cart">R$ {$curso.valor}</span></td>
					</tr>
					{/if}
				{/foreach}			

				<tr>

					<td colspan="4">

						<form class="form-inline form-cart">

							<section class="form-group">

								<label>Cupom de desconto</label>

								<input type="text" id="valorCupom" class="form-control">

								<button onclick="utilizarCupom();"class="btn btn-dark">Utilizar Cupom</button>

							</section><!-- /.form-group -->

						</form>

					</td>

				</tr>

				<tr>

					<td class="text-right" colspan="4">

						Total: <b>R$ {$valor_total}</b>
						
					</td>

				</tr>

				<tr>

					<td class="text-right" colspan="4">

						<a href="{$url_site}portal" class="btn btn-success">Mais Cursos</a>
						<button class="btn btn-dark">Continuar <i class="fa fa-angle-right"></i></button>
						
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
			  url: "{/literal}{$url_site}{literal}portal/carrinho/index",
			  data: { curso_id: curso_id}
			}).done(function(data) {
			    alert( "apagado : " + data );
			    location.href="{/literal}{$url_site}{literal}portal/carrinho/index";
			});
		/*$.post('{/literal}{$url_site}{literal}/carrinho/deletarCurso', {id:curso_id}, function (json){        	        
    	});*/
	}
	function utilizarCupom(){
		var valorCupom = $("#valorCupom").val();
		$.ajax({
		  type: "POST",
		  url: "{/literal}{$url_site}{literal}portal/carrinho/utilizarCupom",
		  data: { valorCupom: valorCupom}
		}).done(function(data) {
			if(!(data == 'ok')
				alert( "msg: " + data );
		    //location.href="{/literal}{$url_site}{literal}portal/carrinho/index";
		});
	}
</script>
{/literal}