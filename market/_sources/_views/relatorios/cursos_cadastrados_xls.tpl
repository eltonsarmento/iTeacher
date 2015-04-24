<table>
	<tr><td colspan="7" style="text-align:center;"><h1>CURSOS CADASTRADOS</h1></td></tr>
	
	<tr style="height:30px;"></tr>
	<tr>
		<th>CURSO</th>
		<th>CRIADO POR</th>
		<th>QUANTIDADE</th>
		<th>TOTAL</th>
		<th>ÁREA</th>
					
	</tr>
	{foreach item=curso key=key from=$cursos}
	<tr>

		<td>{$curso.curso}</td>
		
		<td style="text-align:center;"><strong>{$curso.nivel_usu_cadastrador}</strong> - {$curso.cadastrado_por}</td>
		<td style="text-align:center;">{$curso.vendas_deste_curso}</td>
		<td style="text-align:center;">R$ {$curso.total_valor_venda}</td>
		<td style="text-align:center;">
			{foreach from=$curso.areas_curso item=areas}
                <span>{$areas.area}<br/></span>
            {/foreach}
		</td>	
		
	</tr>
	{/foreach}
	
	
	<tr style="height:30px;"></tr>
	<tr><td colspan="7"></td><td> Data Atual - {$smarty.now|date_format:"%d/%m/%Y"} </td></tr>
</table>