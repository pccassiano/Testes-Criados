<html>
	<body>
		<table border="1">
		<?php
			$numero = $_POST["tabuada"];
			$cont = 1;
			while($cont <= 10)
			{
				$prod = $numero * $cont;
				echo "<tr><td>$numero X $cont </td><td>= $prod </td></tr>";
				$cont = $cont + 1;
			}
		?>
		</table>
	</body>
</html>	
	
	
	
