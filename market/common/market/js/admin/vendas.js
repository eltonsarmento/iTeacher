function carregaDadosVendaPorDia(categoria, de, ate) {
	
	jQuery.ajax({
		type: "POST",
		url: '/market/' + categoria + '/relatorios/carregaDadosVendaPorDia/',		
		data: { data1: de, data2: ate }}).done(
			function html(html) {				
				var data = jQuery.parseJSON(html);
				var tabela = '';
				var labelStatus = '';
				var txtStatus = '';
				var txtItem = 'Item';
				jQuery('#dia_vendas_ate').html(data.vendas_periodo);
				jQuery('#total_vendas_dia').html('R$ ' + data.total_vendas_dia);
				if(data.total_pedidos_dia > 1) txtItem = "Itens";
				jQuery('#total_pedidos_dia').html(data.total_pedidos_dia + ' <strong>(' + data.total_itens_pedidos +' '+ txtItem + ')</strong>');
				
				jQuery.each(data.ultimas_10_vendas_dia, function(i, item) {
					if(item.status == '1'){
						labelStatus = "success";
						txtStatus = "Aprovado";
					}else if(item.status == '2'){
						labelStatus = "info";
						txtStatus = "Aguardando Pagamento";
					}else{
						labelStatus = "danger";
						txtStatus = "Cancelado";
					}
					tabela += '<tr><td><a href="/market/' + categoria + '/relatorios/detalhes/' + item.id + '">' + item.numero + '</a></td>\
					<td>' + item.cliente.nome + '</td>\
					<td><a data-toggle="modal" onclick="getCursosByVenda('+item.id+');" href="#visualizarCursos">Visualizar Cursos</a></td>\
					<td><span class="label label-' + labelStatus+ '"><i class="fa fa-check-circle"></i>' + txtStatus +'</span></td>\
					<td class="center">R$ ' + item.valor_liquido + '</td>\
					<td><a data-toggle="modal" onclick="getVendasByAluno(' + item.cliente.id + ');" href="#visualizarHistorico" class="btn btn-success btn-xs tooltips" data-original-title="Histórico" data-placement="bottom"><i class="fa fa-folder"></i></a></td></tr>';					
				});
				jQuery('#tabela_vendas_dia').html(tabela);
			}
		);

}

function carregaDadosVendaPorMes(categoria, mes, ano, professor) {
	jQuery.ajax({
		type: "POST",
		url: '/market/' + categoria + '/relatorios/carregaDadosVendaPorMes/',
		data: { mes: mes, ano: ano, professor: professor }}).done(
			function html(html) {
				var data = jQuery.parseJSON(html);
				var tabela = '';
				var ValorTotalMes = 0;
				var statusRetorno = false;
				jQuery('#ano_vendas_ate').html(data.vendas_periodo);
				jQuery.each(data.ultimas_10_vendas_mes, function(i, item) {						
					if(item.status == '1'){
						labelStatus = "success";
						txtStatus = "Aprovado";
					}else if(item.status == '2'){
						labelStatus = "info";
						txtStatus = "Aguardando Pagamento";
					}else{
						labelStatus = "danger";
						txtStatus = "Cancelado";
					}
					
					ValorTotalMes = ValorTotalMes + parseFloat(item.valor_total);
					tabela += '<tr><td><a href="/market/' + categoria + '/vendas/detalhes/' + item.id + '">' + item.numero + '</a></td>\
					<td>' + item.cliente.nome + '</td>\
					<td><a data-toggle="modal" onclick="getCursosByVenda('+item.id+');" href="#visualizarCursos">Visualizar Cursos</a></td>\
					<td><span class="label label-' + labelStatus+ '"><i class="fa fa-check-circle"></i>' + txtStatus +'</span></td>\
					<td class="center">R$ ' + item.valor_liquido + '</td>\
					<td class="hidden-xs">\
					<a data-toggle="modal" onclick="getVendasByAluno(' + item.cliente.id + ');" href="#visualizarHistorico" class="btn btn-success btn-xs tooltips" data-original-title="Histórico" data-placement="bottom"><i class="fa fa-folder"></i></a></td></tr>';
				});
				//tabela += '<tr><td>Total</td><td></td><td></td><td class="center">R$ ' + parseFloat(ValorTotalMes).toFixed(2) + '</td></tr>';				
				jQuery('#tabela_vendas_mes').html(tabela);
			}
		);
}

function carregaDadosVendaPorProdutos(categoria, curso) {
	jQuery.ajax({
		type: "POST",
		url: '/market/' + categoria + '/relatorios/carregaDadosVendaPorProdutos/',
		data: { curso_id: curso }}).done(
			function html(html) {					
				var data = jQuery.parseJSON(html);
				var tabela = '';
				jQuery('.vendas_por_curso').html(data.curso);
				jQuery('#valor_total_venda_curso').html(data.valor_total_venda_curso);
				jQuery('#total_vendas_por_curso').html(data.total_venda_curso);								
				
				jQuery.each(data.lista_produtos, function(i, item) {
					tabela += '<tr><td class="center">' + item.mes + '</td><td class="center">' + item.quantidade + '</td><td>R$ ' + item.total + '</td></tr>';
				});						
				jQuery('#tabela_vendas_por_produtos').html(tabela);
			}
		);
}

function carregaDadosVendaMaisVendidos(categoria, de, ate) {
	jQuery.ajax({
		type: "POST",
		url: '/market/' + categoria + '/relatorios/carregaDadosVendaMaisVendidos/',
		data: { data1: de, data2: ate }}).done(
			function html(html) {
				//alert(html);
				var data = jQuery.parseJSON(html);
				var tabela = '';
				var dataMaisVendidos = data.dataMaisVendidosDeAte
				jQuery(".dataMaisVendidos").html(dataMaisVendidos);
				jQuery.each(data.lista_produtos, function(i, item) {
					tabela += '<tr><td>' + item.curso + '</td><td>' + item.quantidade + '</td><td>R$ ' + item.total + '</td></tr>';
				});
				jQuery('#tabela_vendas_por_mais_vendidos').html(tabela);
			}
		);
}

function carregaDadosVendaTopConsumidores(categoria, mes, ano) {
	jQuery.ajax({
		type: "POST",
		url: '/market/' + categoria + '/relatorios/carregaDadosVendaTopConsumidores/',
		data: { mes: mes, ano: ano }}).done(
			function html(html) {
				//alert(html);
				var data = jQuery.parseJSON(html);
				var tabela = '';
				jQuery(".dataTopVendas").html(data.dataTopVendas);
				jQuery.each(data.ultimas_vendas, function(i, item) {
					tabela += '<tr><td>' + item.nome + '</td><td class="center">' + item.compras + '</td><td class="center">' + item.total_cursos + '</td><td>R$ ' + item.total + '</td></tr>';
				});
				jQuery('#tabela_vendas_top_consumidores').html(tabela);
			}
		);
}

function carregaDadosVendaPorAreas(categoria, mes, ano, area_curso) {
	jQuery.ajax({
		type: "POST",
		url: '/market/' + categoria + '/relatorios/carregaDadosVendaPorCategorias/',
		data: { mes: mes, ano: ano, categoria: area_curso }}).done(
			function html(html) {
				//alert(html);
				var data = jQuery.parseJSON(html);
				var tabela = '';
				jQuery("#area_venda").html(data.area_venda);
				jQuery.each(data.ultimas_vendas, function(i, item) {
					tabela += '<tr><td>' + item.numero + '</td>\
					<td class="center">' + item.cliente.nome + '</td>\
					<td><a data-toggle="modal" onclick="getCursosByVenda('+item.id+');" href="#visualizarCursos">Visualizar Cursos</a></td>\
					<td class="center">R$ ' + item.valor_total + '</td></tr>';
				});
				jQuery('#tabela_vendas_por_categorias').html(tabela);
			}
		);
}

function carregaDadosVendaCupons(categoria, de, ate) {
	jQuery.ajax({
		type: "POST",
		url: '/market/' + categoria + '/relatorios/carregaDadosVendaCupons/',
		data: { data1: de, data2: ate }}).done(
			function html(html) {
				var data = jQuery.parseJSON(html);
				var tabela = '';
				jQuery('#cupons_total_pedidos').html(data.total_vendas);
				jQuery('#cupons_porcentagem_pedidos').html(data.porcentagem + '%');
				jQuery('#cupons_total_descontos').html(data.total_cupons);
				jQuery.each(data.mais_usados, function(i, item) {
					tabela += item.nome + '('+ item.total+')<br />';
				});
				jQuery('#cupons_mais_populares').html(tabela);
			}
		);
}

function carregaDadosCertificados(categoria, curso, de, ate) {
	jQuery.ajax({
		type: "POST",
		url: '/market/' + categoria + '/relatorios/carregaDadosCertificados/',
		data: { curso_id: curso, data1: de, data2: ate }}).done(
			function html(html) {
				jQuery('#certificado_quantidade').html(html);
				var data = jQuery.parseJSON(html);
				var tabela = '';
				jQuery('#certificado_quantidade').html(data.total_certificados);
				jQuery.each(data.certificados, function(i, item) {
					var data = item.data_emissao.split(/[-]/);
					tabela += '<tr><td>' + item.id + '</td><td class="center">' + item.aluno.nome + '</td><td class="center">' + item.curso.curso + '</td><td class="center">' + item.aluno.email + '</td><td class="center">' + data[2] + '/' + data[1] + '/' + data[0] + '</td></tr>';
				});
				jQuery('#certificado_total_mes').html(data.mes_certificados);
				jQuery('#tabela_certificados').html(tabela);
			}
		);
}

function carregaDadosAssinatura(categoria, tipo_assinatura, ano, mes) {
	jQuery.ajax({
		type: "POST",
		url: '/market/' + categoria + '/relatorios/carregaDadosAssinatura/',
		data: { tipo_assinatura: tipo_assinatura, ano: ano, mes:mes }}).done(
			function html(html) {
				if (tipo_assinatura == 1) {
					jQuery('#tabela_assinaturas_ativas').html(html);
				} else {
					jQuery('#tabela_assinaturas_expiradas').html(html);
				}
			}
		);
}
