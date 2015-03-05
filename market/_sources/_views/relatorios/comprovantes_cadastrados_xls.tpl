<table>
	<tr><td colspan="5"><h1>COMPROVANTES CADASTRADOS</h1></td></tr>
	<tr style="height:30px;"></tr>
	<tr>
		<th>MÊS</th>
		<th>VALOR</th>
		<th>ANEXO</th>
		<th>OBSERVAÇÕES</th>
		
	</tr>
	{foreach item=comprovante key=key from=$comprovantes}
	<tr>

		<td>{$comprovante.mes}</td>
		<td style="text-align:center;">R$ {$comprovante.valor_total}</td>
		<td style="text-align:center;">{$comprovante.anexo}</td>
		<td style="text-align:center;">{$comprovante.observacao}</td>

		
	</tr>
	{/foreach}
	
	<tr><td colspan="4"></td><td> Data Atual - {$smarty.now|date_format:"%d/%m/%Y"} </td></tr>
</table>