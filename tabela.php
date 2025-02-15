<?php
	function listaSimples(){
		$conexao = new mysqli("localhost","root","", "bdweb");
		$sql = "select codigo, nome from chamado order by codigo";
		$result = mysqli_query($conexao,$sql);
		
		while($registro = mysqli_fetch_array($result)) 
		{
			echo "<option value='". $registro['codigo'] ."'>". $registro['nome']  ."</option>";
		}
		$conexao->close();
	}

	function listaTabela(){
		$conexao = new mysqli("localhost","root","", "bdweb");
		$sql = "select * from chamado order by codigo";
		$result = mysqli_query($conexao,$sql);
		
		while($registro = mysqli_fetch_array($result)) 
		{
			echo "<tr>
			
					<td>". $registro['codigo'] ."</td>
					
					<td> ". $registro['nome']  ."</td>
					
					<td> ". $registro['email']  ."</td>
					
					<td> ". $registro['titulo'] ."</td>
					
					<td> ". $registro['descritivo'] ."</td>
					
					<td> ". $registro['prioridade'] ."</td>
			
				</tr>";
		}
		$conexao->close();
	}

?>
<html>
	<body>
		<select id="produtos">
		<?php listaSimples(); ?>	
		</select>
		
		<table border="1">
		<tr>
			<td>Codigo</td>
			<td>nome</td>
			<td>email</td>
			<td>titulo</td>
			<td>descritivo</td>
			<td>prioridade</td>
		
		</tr>
		<?php listaTabela(); ?>
		</table>
	</body>
</html>	