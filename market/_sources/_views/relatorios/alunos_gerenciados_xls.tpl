<table>
	<tr><td colspan="5"><h1>ALUNOS CADASTRADOS</h1></td></tr>
	
	<tr style="height:30px;"></tr>
	<tr>
		<th>ALUNO</th>
		<th>EMAIL</th>
		<th>CEP</th>
		<th>CPF</th>
		<th>TELEFONE</th>
		
	</tr>
	{foreach item=aluno key=key from=$alunos}
	<tr>

		<td>{$aluno.nome}</td>
		<td style="text-align:center;">{$aluno.email}</td>
		<td style="text-align:center;">{$aluno.cep}</td>
		<td style="text-align:center;">{$aluno.cpf}</td>
		<td style="text-align:center;">{$aluno.telefone}</td>
		
	</tr>
	{/foreach}
	
	
	<tr style="height:30px;"></tr>
	<tr><td colspan="4"></td><td> Data Atual - {$smarty.now|date_format:"%d/%m/%Y"} </td></tr>
</table>