<table>
	<tr><td colspan="4" style="text-align:center;"><h1>REPASSES FINANCEIROS PARCEIROS</h1></td></tr>
	<tr style="height:30px;"></tr>
	<tr>
		<th>PARCEIRO</th>
		<th>MÊS</th>
		<th>DATA PAGAMENTO</th>
		<th>TOTAL</th>		
		
	</tr>
	{foreach item=repasse key=key from=$repasses}
	<tr>

		<td>{$repasse.nomeParceiro}</td>		
		<td style="text-align:center;">{$repasse.mes}/{$repasse.ano}</td>
		<td style="text-align:center;">{$repasse.data_cadastro}</td>
		<td style="text-align:center;">{$repasse.total}</td>
		
	</tr>
	{/foreach}
	
	
	<tr style="height:30px;"></tr>
	<tr><td colspan="3"></td><td> Data Atual - {$smarty.now|date_format:"%d/%m/%Y"} </td></tr>
</table>