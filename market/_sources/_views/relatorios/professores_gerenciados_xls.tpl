<table>
	<tr><td colspan="7" style="text-align:center;"><h1>PROFESORES CADASTRADOS</h1></td></tr>
	
	<tr style="height:30px;"></tr>
	<tr>
		<th>PROFESSOR</th>
		<th>EMAIL</th>
		<th>CEP</th>
		<th>CPF</th>
		<th>TELEFONE</th>
		<th>MÊS ATUAL</th>			
		<th>TOTAL</th>			
	</tr>
	{foreach item=professor key=key from=$professores}
	<tr>

		<td>{$professor.nome}</td>
		<td style="text-align:center;">{$professor.email}</td>
		<td style="text-align:center;">{$professor.cep}</td>
		<td style="text-align:center;">{$professor.cpf}</td>
		<td style="text-align:center;">R$ {$professor.total_venda_mes}</td>
		<td style="text-align:center;">R$ {$professor.total}</td>	
		
	</tr>
	{/foreach}
	
	
	<tr style="height:30px;"></tr>
	<tr><td colspan="7"></td><td> Data Atual - {$smarty.now|date_format:"%d/%m/%Y"} </td></tr>
</table>