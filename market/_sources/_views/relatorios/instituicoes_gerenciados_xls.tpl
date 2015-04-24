<table>
	<tr><td colspan="6" style="text-align:center;"><h1>INSTITUIÇÕES CADASTRADAS</h1></td></tr>
	
	<tr style="height:30px;"></tr>
	<tr>
		<th>INSTITUIÇÃO</th>
		<th>CNPJ</th>
		<th>RESPONSÁVEL</th>
		<th>E-MAIL RESPONSÁVEL</th>
		<th>PLANO</th>
		<th>STATUS</th>			
	</tr>
	{foreach item=instituicao key=key from=$instituicoes}
	<tr>

		<td>{$instituicao.nome}</td>
		<td style="text-align:center;">{$instituicao.cnpj}</td>
		<td style="text-align:center;">{$instituicao.nome_responsavel}</td>
		<td style="text-align:center;">{$instituicao.email_responsavel}</td>
		<td style="text-align:center;">Básico</td>
		<td style="text-align:center;">{if $instituicao.ativo eq 1}Ativa{else}Desativada{/if}</td>	
		
	</tr>
	{/foreach}
	
	
	<tr style="height:30px;"></tr>
	<tr><td colspan="4"></td><td> Data Atual - {$smarty.now|date_format:"%d/%m/%Y"} </td></tr>
</table>