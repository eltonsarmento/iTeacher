<table>
	<tr><td colspan="5"><h1>ALUNOS CADASTRADOS POR DIA</h1></td></tr>
	<tr>
		<td><strong>Periodo</strong></td><td>{$periodo1} - {$periodo2}</td>
	</tr>
	<tr style="height:30px;"></tr>
	<tr>
		<th>DATA</th>
		<th>QUANTIDADE DE ALUNOS</th>
		
	</tr>
	{foreach item=cadastro key=key from=$total_alunos_cadastros}
	<tr>

		<td>{$key}</td>
		<td style="text-align:center;">{$cadastro}</td>
		
	</tr>
	{/foreach}
	
	<tr style="background-color: #CCCCCC;"><td>Total de alunos</td><td>{$total_alunos}</td></tr>
	<tr style="height:30px;"></tr>
	<tr><td colspan="4"></td><td> Data Atual - {$smarty.now|date_format:"%d/%m/%Y"} </td></tr>
</table>