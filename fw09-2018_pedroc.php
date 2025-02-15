<html>

	<body>
		<form method="post" action="tabuada2.php">
			N1 <input type="text" id="num1" name="num1">
			N2 <input type="text" id="num2" name="num2">
			</p>			
			<input type="submit" name="tabuada" value="Tabuada">
			<input type="submit" name="soma" value="Soma">
			<input type="submit" name="subtrair" value="Subtrair">
			<input type="submit" name="multiplicar" value="Multiplicar">
			<input type="submit" name="dividir" value="Dividir">			
		</form>
		<table border="1">
		<?php
			// isset = verifica se uma variavel tem valor
			if(isset($_POST["tabuada"]))
				{
				$numero = $_POST["num1"];
				$cont = 1;
				
				while($cont <= 10)
					{
					$prod = $numero * $cont;
					echo "<tr><td>$numero X $cont </td><td>= $prod </td></tr>";
					$cont = $cont + 1;
					}
				}
			
			if(isset($_POST["soma"]))
				{
				$num1 = $_POST ["num1"];
				$num2 = $_POST ["num2"];
				$valor = $num1 + $num2;
				echo "A soma eh = $valor";
				}
				
			if(isset($_POST["subtrair"]))
				{
				$num1 = $_POST ["num1"];
				$num2 = $_POST ["num2"];
				$valor = $num1 - $num2;
				echo "O resultado eh = $valor";
				}

			if(isset($_POST["multiplicar"]))
				{
				$num1 = $_POST ["num1"];
				$num2 = $_POST ["num2"];
				$valor = $num1 * $num2;
				echo "O resultado eh = $valor";				
				}
				
			if(isset($_POST["dividir"]))
				{
				$num1 = $_POST ["num1"];
				$num2 = $_POST ["num2"];
				$valor = $num1 / $num2;
				echo "O resultado eh = $valor";
				}
		?>
</table></body></html>	
	
	
