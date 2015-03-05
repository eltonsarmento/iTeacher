<html>
<head>
	<title>Relatório de Cursos Cadastrados - Cursos IAG</title>

	<link href="{$url_site}lms/common/relatorio/css/style.css" type="text/css" rel="stylesheet">
	<!--<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet" type="text/css">-->

</head>

<body>

	<center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!-- <img src="{$dir_site}/common/relatorio/logo-cursosiag.png"> --></center><br>
	<hr>
	<h2>RELATÓRIO DE CURSOS</h2>
	<h3>
		<!-- 1- Unico, 2 - Intervalo de tempo, 3 - quantidade e 4 - Indeterminado -->		
	</h3><br>

		<!--<h2><strong>Percentual Assistido:</strong> 70%</h2>-->

		<table width="100%" collspan="0" cellspacing="0">

				<tr>

					<td style="background: #222222; color: #FFFFFF; border: 1px solid #666666; font-weight: 400; padding: 5px 10px; text-align:center;">Curso</td>
					<td style="background: #222222; color: #FFFFFF; border: 1px solid #666666; font-weight: 400; padding: 5px 10px; text-align:center;">Criado Por</td>
					<td style="background: #222222; color: #FFFFFF; border: 1px solid #666666; font-weight: 400; padding: 5px 10px; text-align:center;">Quantidade de vendas</td>
					<td style="background: #222222; color: #FFFFFF; border: 1px solid #666666; font-weight: 400; padding: 5px 10px; text-align:center;">Total</td>
					<td style="background: #222222; color: #FFFFFF; border: 1px solid #666666; font-weight: 400; padding: 5px 10px; text-align:center;">Área</td>															
					

				</tr>

				<tbody>
					{foreach item=curso key=key from=$cursos}
					<tr>

						<td style="background: #F0F0F0; color: #222222; border: 1px solid #CCCCCC; padding: 8px 10px; text-align:center;">{$curso.curso}</td>
						<td style="background: #F0F0F0; color: #222222; border: 1px solid #CCCCCC; padding: 8px 10px; text-align:center;"><strong>{$curso.nivel_usu_cadastrador}</strong> - {$curso.cadastrado_por}</td>
						<td style="background: #F0F0F0; color: #222222; border: 1px solid #CCCCCC; padding: 8px 10px; text-align:center;">{$curso.vendas_deste_curso}</td>
						<td style="background: #F0F0F0; color: #222222; border: 1px solid #CCCCCC; padding: 8px 10px; text-align:center;">R$ {$curso.total_valor_venda}</td>
						<td style="background: #F0F0F0; color: #222222; border: 1px solid #CCCCCC; padding: 8px 10px; text-align:center;">
							{foreach from=$curso.areas_curso item=areas}
                                <span>{$areas.area}<br/></span>
                            {/foreach}
                       	</td>
												
						
					</tr>
					{/foreach}
					
				</tbody>

			</table>

		
		<hr>
		<font style="float: right !important;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{$smarty.now|date_format:"%d/%m/%Y"}</font>

</body>
</html>