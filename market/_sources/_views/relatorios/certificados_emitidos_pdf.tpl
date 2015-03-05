<html>
<head>
	<title>Relatório de Certificados Emitidos - Cursos IAG</title>

	<link href="{$url_site}lms/common/relatorio/css/style.css" type="text/css" rel="stylesheet">
	<!--<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet" type="text/css">-->

</head>

<body>

	<center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!-- <img src="{$dir_site}/common/relatorio/logo-cursosiag.png"> --></center><br>
	<hr>
	<h2>RELATÓRIO DE CERTIFICADOS</h2>
	<h3>
		<!-- 1- Unico, 2 - Intervalo de tempo, 3 - quantidade e 4 - Indeterminado -->		
	</h3><br>

		<!--<h2><strong>Percentual Assistido:</strong> 70%</h2>-->

		<table width="100%" collspan="0" cellspacing="0">

				<tr>

					<td style="background: #222222; color: #FFFFFF; border: 1px solid #666666; font-weight: 400; padding: 5px 10px; text-align:center;">ID</td>
					<td style="background: #222222; color: #FFFFFF; border: 1px solid #666666; font-weight: 400; padding: 5px 10px; text-align:center;">Aluno</td>
					<td style="background: #222222; color: #FFFFFF; border: 1px solid #666666; font-weight: 400; padding: 5px 10px; text-align:center;"> E-mail</td>
					<td style="background: #222222; color: #FFFFFF; border: 1px solid #666666; font-weight: 400; padding: 5px 10px; text-align:center;">Curso</td>
					<td style="background: #222222; color: #FFFFFF; border: 1px solid #666666; font-weight: 400; padding: 5px 10px; text-align:center;">Emitido em</td>																				

				</tr>

				<tbody>
					{foreach item=certificado key=key from=$certificados}
					<tr>

						<td style="background: #F0F0F0; color: #222222; border: 1px solid #CCCCCC; padding: 8px 10px; text-align:center;">{$certificado.id}</td>
						<td style="background: #F0F0F0; color: #222222; border: 1px solid #CCCCCC; padding: 8px 10px; text-align:center;">{$certificado.aluno.nome}</td>
						<td style="background: #F0F0F0; color: #222222; border: 1px solid #CCCCCC; padding: 8px 10px; text-align:center;">{$certificado.aluno.email}</td>
						<td style="background: #F0F0F0; color: #222222; border: 1px solid #CCCCCC; padding: 8px 10px; text-align:center;">{$certificado.curso.curso}</td>
						<td style="background: #F0F0F0; color: #222222; border: 1px solid #CCCCCC; padding: 8px 10px; text-align:center;">{$certificado.data_emissao|date_format:"%d/%m/%Y"}</td>
																		
					</tr>
					{/foreach}
					
				</tbody>

			</table>

		
		<hr>
		<font style="float: right !important;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{$smarty.now|date_format:"%d/%m/%Y"}</font>

</body>
</html>