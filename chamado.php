<html>
	<head>
		<title>Abertura de Chamados</title>
		<link rel="stylesheet" href="style.css" />
	</head>
	<body>
		<h1 class="titulo">Abertura de Chamados</h1>
		<br>
		<p>Preencha os dados abaixo para cadastrar um novo chamado</p>
		<br>
<form method="post" action="chamado.php">
Codigo:<input type="text" id="codigo" name="codigo" /><br>
Nome:<input type="text" id="nome" name="nome" /><br>
E-mail:<input type="text" id="email" name="email" /><br>
Titulo:<input type="text" id="titulo" name="titulo" /><br>
Descritivo:<textarea id="descritivo" name="descritivo" rows="5" cols="40"></textarea><br>
Prioridade:<input type="text" id="codigo" name="codigo" /><br>

<input type="submit" value="Inserir" name="b1" />
<input type="submit" value="Pesquisar" name="b2" />
<input type="submit" value="Alterar" name="b3" />
<input type="submit" value="Excluir" name="b4" />
</form>
<?php
if(isset($_POST["b1"])) inserir();
if(isset($_POST["b2"])) pesquisar();
if(isset($_POST["b3"])) alterar();
if(isset($_POST["b4"])) excluir();
?>
</body>
</html>
<?php
function inserir(){
$con = new mysqli("localhost","root","","segbd");
$nome	= $_POST["nome"];
$email	= $_POST["email"];
$titulo	= $_POST["titulo"];
$descritivo = $_POST["descritivo"];
$prioridade = $_POST["prioridade"];

$sql = "insert into chamado(nome, email, titulo, descritivo, prioridade) values('$nome','$email','$titulo','$descritivo', '$prioridade')";
mysqli_query($con, $sql);
echo "Registro inserido com sucesso!";
$con->close();
}

function pesquisar(){
$con = new mysqli("localhost","root","","segbd");
$codigo = $_POST["codigo"];
$sql = "select * from chamado where codigo=$codigo";		
$resultado = mysqli_query($con, $sql);	
if($reg = mysqli_fetch_array($resultado)){
	$codigo = $reg["codigo"];
	$nome = $reg["nome"];
	$email = $reg["email"];
	$titulo = $reg["titulo"];
	$descritivo = $reg["descritivo"];
	$prioridade = $reg["prioridade"];

	echo "<script lang='javascript'>";
	echo "codigo.value=$codigo;";
	echo "nome.value='$nome';";
	echo "email.value='$email';";
	echo "titulo.value='$titulo';";
	echo "descritivo.value='$descritivo';";
	echo "prioridade.value=$prioridade;";
	echo "</script>";
} else {
	echo "registro não encontrado";
}
$con->close();	
}

function alterar(){
$con = new mysqli("localhost","root","","segbd");
$nome	= $_POST["nome"];
$email	= $_POST["email"];
$titulo	= $_POST["titulo"];
$descritivo = $_POST["descritivo"];
$prioridade = $_POST["prioridade"];

$sql = "update chamado set nome='$nome', email='$email', titulo='$titulo', descritivo='$descritivo', prioridade=$prioridade where codigo=$codigo";
mysqli_query($con, $sql);
echo "Registro alterado com sucesso!";
$con->close();
}


function excluir(){
$con = new mysqli("localhost","root","","segbd");
$codigo 	= $_POST["codigo"];
$sql = "delete from chamado where codigo=$codigo";
mysqli_query($con, $sql);
echo "Registro removido com sucesso!";
$con->close();
}

?>