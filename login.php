<html>
<body>
<form method="post" action="login.php">
Email:<input type="text" name="email" /><br>
senha:<input type="password" name="senha" /><br>
<input type="submit" name="bt1" value="entrar" />
</form>
<?php 
if(isset($_POST["bt1"])) fazLogin(); 
?>
</body>
</html>
<?php 
function fazLogin(){
	$con = new mysqli("localhost","root","","segna");
	$email = $_POST["email"];
	$senha = $_POST["senha"];
	$sql = "select * from usuario where email='$email' and senha=md5('$senha')";
	$resultado = mysqli_query($con, $sql);
	if($reg = mysqli_fetch_array($resultado)){
		echo "Usuario Liberado";
		session_start();
		$_session["nome"] = $reg["nome"];
	} else {
		echo "Usuario ou senha invalidos";
	}		
	$con->close();
}

?>