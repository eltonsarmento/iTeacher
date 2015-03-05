<table>
	<tr><td colspan="5"><h1>SAQUES EFETUADOS</h1></td></tr>
	<tr>
		<td><strong>Periodo</strong></td><td>{$periodo1} - {$periodo2}</td>
	</tr>
	<tr style="height:30px;"></tr>
	<tr>
		<th>DATA</th>
		<th>CODIGO</th>
		<th>STATUS</th>
		<th>VALOR</th>
		
	</tr>
	{foreach item=saques key=key from=$saques_efetuados}
	<tr>

		<td>{$saques.data}</td>
		<td style="text-align:center;">{$saques.codigo}</td>
		<td style="text-align:center;">
			{if $saques.status eq 0}
				Aguardando Pagamento
			{else if $saques.status eq 1}
				Pago
			{else if $saques.status eq 2}
				Cancelado
			{/if}
		</td>
		<td style="text-align:center;">{$saques.valor}</td>
		
	</tr>
	{/foreach}
	
	
	<tr style="height:30px;"></tr>
	<tr><td colspan="4"></td><td> Data Atual - {$smarty.now|date_format:"%d/%m/%Y"} </td></tr>
</table>