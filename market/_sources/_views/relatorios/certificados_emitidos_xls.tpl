<table>
	<tr><td colspan="5" style="text-align:center;"><h1>CERTIFICADOS EMITIDOS</h1></td></tr>
	
	<tr style="height:30px;"></tr>
	<tr>
		<th>CODIGO</th>
		<th>ALUNO</th>
		<th>E-MAIL</th>
		<th>CURSO</th>
		<th>EMITiDO EM</th>		
	</tr>
	{foreach item=certificado key=key from=$certificados}
	<tr>

		<td style="text-align:left;">{$certificado.id}</td>
		<td style="text-align:center;">{$certificado.aluno.nome}</td>
		<td style="text-align:center;">{$certificado.aluno.email}</td>
		<td style="text-align:center;">{$certificado.curso.curso}</td>
		<td style="text-align:center;">{$certificado.data_emissao|date_format:"%d/%m/%Y"}</td>
		
	</tr>
	{/foreach}
	
	
	<tr style="height:30px;"></tr>
	<tr><td colspan="4"></td><td> Data Atual - {$smarty.now|date_format:"%d/%m/%Y"} </td></tr>
</table>