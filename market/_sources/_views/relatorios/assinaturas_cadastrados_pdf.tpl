<html>
<head>
	<title>Relatório de Assinaturas - Iteacher</title>

	<link href="{$url_site}lms/common/relatorio/css/style.css" type="text/css" rel="stylesheet">
	<!--<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet" type="text/css">-->

</head>

<body>

	<center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!-- <img src="{$dir_site}/common/relatorio/logo-cursosiag.png"> --></center><br>
	<hr>
	<h2>RELATÓRIO DE ASSINATURAS</h2>
	<h3>
		{if $periodo1}
			<b>Período:</b> de: {$periodo1} a {$periodo2}<br>
		{/if}
	</h3><br>

		<!--<h2><strong>Percentual Assistido:</strong> 70%</h2>-->

		<table width="100%" collspan="0" cellspacing="0">

				<tr>

					<td style="background: #222222; color: #FFFFFF; border: 1px solid #666666; font-weight: 400; padding: 5px 10px; text-align:center;">Plano</td>
					<td style="background: #222222; color: #FFFFFF; border: 1px solid #666666; font-weight: 400; padding: 5px 10px; text-align:center;">Quantidade</td>
					<td style="background: #222222; color: #FFFFFF; border: 1px solid #666666; font-weight: 400; padding: 5px 10px; text-align:center;">Total Mensal</td>
					
				</tr>

				<tbody>
					{foreach item=assinatura key=key from=$assinaturas}
					<tr>

						<td style="background: #F0F0F0; color: #222222; border: 1px solid #CCCCCC; padding: 8px 10px; text-align:center;">{$assinatura.plano}</td>
						<td style="background: #F0F0F0; color: #222222; border: 1px solid #CCCCCC; padding: 8px 10px; text-align:center;">{$assinatura.quantidade}</td>
						<td style="background: #F0F0F0; color: #222222; border: 1px solid #CCCCCC; padding: 8px 10px; text-align:center;">{$assinatura.total}</td>
						
						
					</tr>
					{/foreach}
					
				</tbody>

			</table>		
		<hr>
		<font style="float: right !important;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{$data_atual}</font>

</body>
</html>