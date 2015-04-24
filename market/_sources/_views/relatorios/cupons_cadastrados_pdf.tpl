<html>
<head>
	<title>Relatório de Cupons Cadastrados - Cursos IAG</title>

	<link href="{$url_site}lms/common/relatorio/css/style.css" type="text/css" rel="stylesheet">
	<!--<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet" type="text/css">-->

</head>

<body>

	<center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!-- <img src="{$dir_site}/common/relatorio/logo-cursosiag.png"> --></center><br>
	<hr>
	<h2>RELATÓRIO DE CUPONS</h2>
	<h3>
		<!-- 1- Unico, 2 - Intervalo de tempo, 3 - quantidade e 4 - Indeterminado -->
		<b>Tipo:</b>{if $tipo eq 1}Unico{else if $tipo eq 2}Intervalo de tempo{else if $tipo eq 3}Quantidade{else if $tipo eq 4}Indeterminado{/if}<br>
		<b>Status:</b>{if $ativo}{if $ativo eq 0}Inativo{else if $ativo eq 1}Ativo{else}-{/if}{/if}
	</h3><br>

		<!--<h2><strong>Percentual Assistido:</strong> 70%</h2>-->

		<table width="100%" collspan="0" cellspacing="0">

				<tr>

					<td style="background: #222222; color: #FFFFFF; border: 1px solid #666666; font-weight: 400; padding: 5px 10px; text-align:center;">Cupom</td>
					<td style="background: #222222; color: #FFFFFF; border: 1px solid #666666; font-weight: 400; padding: 5px 10px; text-align:center;">Tipo</td>
					<td style="background: #222222; color: #FFFFFF; border: 1px solid #666666; font-weight: 400; padding: 5px 10px; text-align:center;">Status</td>
					<td style="background: #222222; color: #FFFFFF; border: 1px solid #666666; font-weight: 400; padding: 5px 10px; text-align:center;">Utilizações</td>
					
					

				</tr>

				<tbody>
					{foreach item=cupom key=key from=$cupons}
					<tr>

						<td style="background: #F0F0F0; color: #222222; border: 1px solid #CCCCCC; padding: 8px 10px; text-align:center;">{$cupom.nome}</td>
						<td style="background: #F0F0F0; color: #222222; border: 1px solid #CCCCCC; padding: 8px 10px; text-align:center;">{if $cupom.tipo eq 1}Unico{else if $cupom.tipo eq 2}Intervalo de tempo{else if $cupom.tipo eq 3}Quantidade{else if $cupom.tipo eq 4}Indeterminado{/if}</td>
						<td style="background: #F0F0F0; color: #222222; border: 1px solid #CCCCCC; padding: 8px 10px; text-align:center;">{if $cupom.ativo eq 0}Inativo{else if $cupom.ativo eq 1}Ativo{/if}</td>
						<td style="background: #F0F0F0; color: #222222; border: 1px solid #CCCCCC; padding: 8px 10px; text-align:center;">{$cupom.utilizacao}</td>
						
					</tr>
					{/foreach}
					
				</tbody>

			</table>

		
		<hr>
		<font style="float: right !important;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{$smarty.now|date_format:"%d/%m/%Y"}</font>

</body>
</html>