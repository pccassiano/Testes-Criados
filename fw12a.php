<html>
<body>
	<table border="1">
	<tr>
		<td>Codigo</td>
		<td>Nome</td>
		<td>Email</td>
	</tr>
	<?php listar(); ?>
	</table>
</body>
</html>
<?php 
function listar(){
	$con = new mysqli("localhost","root","","segna");
	$sql = "select * from usuario order by nome";
	$resultado = mysqli_query($con,$sql);
	while($reg = mysqli_fetch_array($resultado)){
		echo "<tr><td>".$reg["codigo"]."</td>";	
		echo "<td>".$reg["nome"]."</td>";
		echo "<td>".$reg["email"]."</td></tr>";
	}
	$con->close();
}
?>
	
	
	