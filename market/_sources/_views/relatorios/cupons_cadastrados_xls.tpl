<table>
	<tr><td colspan="5"><h1>CUPONS CADASTRADOS</h1></td></tr>
	<tr>
		<td><strong>TIPO:</strong></td><td>{if $tipo eq 1}Unico{else if $tipo eq 2}Intervalo de tempo{else if $tipo eq 3}Quantidade{else if $tipo eq 4}Indeterminado{/if}</td>
	</tr>
	<tr>
		<td><strong>STATUS:</strong></td><td>{if $ativo}{if $ativo eq 0}Inativo{else if $ativo eq 1}Ativo{else}-{/if}{/if}</td>
	</tr>
	<tr style="height:30px;"></tr>
	<tr>
		<th>CUPON</th>
		<th>TIPO</th>
		<th>STATUS</th>
		<th>UTILIZAÇÕES</th>
		
	</tr>
	{foreach item=cupom key=key from=$cupons}
	<tr>

		<td>{$cupom.nome}</td>
		<td style="text-align:center;">{if $cupom.tipo eq 1}Unico{else if $cupom.tipo eq 2}Intervalo de tempo{else if $cupom.tipo eq 3}Quantidade{else if $cupom.tipo eq 4}Indeterminado{/if}</td>
		<td style="text-align:center;">{if $cupom.ativo eq 0}Inativo{else if $cupom.ativo eq 1}Ativo{/if}</td>
		<td style="text-align:center;">{$cupom.utilizacao}</td>
		
	</tr>
	{/foreach}
	
	
	<tr style="height:30px;"></tr>
	<tr><td colspan="4"></td><td> Data Atual - {$smarty.now|date_format:"%d/%m/%Y"} </td></tr>
</table>