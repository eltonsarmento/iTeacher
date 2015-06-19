<table>
	<tr><td colspan="5"><h1>RELATÓRIO DE ASSINATURAS</h1></td></tr>
	<tr>
		<td><strong>Periodo</strong></td><td>{$periodo1} - {$periodo2}</td>
	</tr>
	<tr style="height:30px;"></tr>
	<tr>
		<th>PLANO</th>
		<th>QUANTIDADE DE ALUNOS</th>
		<th>VALOR TOTAL</th>
		
	</tr>
	{foreach item=plano key=key from=$planos}
	<tr>

		<td>{$plano.plano}</td>
		<td style="text-align:center;">{$plano.quantidade}</td>
		<td style="text-align:center;">R$ {$plano.total|string_format:"%.2f"}</td>		
		
	</tr>
	{/foreach}
	
	<tr style="height:30px;"></tr>
	<tr><td colspan="4"></td><td> Data Atual - {$smarty.now|date_format:"%d/%m/%Y"} </td></tr>
</table>