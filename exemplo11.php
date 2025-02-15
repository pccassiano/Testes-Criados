<?php
	function listaSimples(){
		$conexao = new mysqli("localhost","root","", "segna");
		$sql = "select codigo, nome from produto order by nome";
		$result = mysqli_query($conexao,$sql);
		
		while($registro = mysqli_fetch_array($result)) 
		{
			echo "<option value='". $registro['codigo'] ."'>". $registro['nome']  ."</option>";
		}
		$conexao->close();
	}

	function listaTabela(){
		$conexao = new mysqli("localhost","root","", "segna");
		$sql = "select * from produto order by codigo";
		$result = mysqli_query($conexao,$sql);
		
		while($registro = mysqli_fetch_array($result)) 
		{
			echo "<tr><td>". $registro['codigo'] ."</td><td> ". $registro['nome']  ."</td><td> ". $registro['qtd']  .
			"</td><td> ". $registro['valor'] ."</td></tr>";
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
		<tr><td>Codigo</td><td>nome</td><td>qtd</td>
		<td>valor</td></tr>
		<?php listaTabela(); ?>
		</table>
	</body>
</html>	