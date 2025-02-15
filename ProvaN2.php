<?php
	$codigo = 0;
	$nome = "";
	$email = "";
	$titulo = "";
	$descritivo = "";
	$prioridade = 0;
	
	//verifica se a pagina foi recarregada	
	if(count($_POST) > 0){
		$conn	= new mysqli("localhost","root","", "bdweb");
		$codigo = $_POST["codigo"];
		$nome   = $_POST["nome"];
		$email  = $_POST["email"];
		$titulo  = $_POST["titulo"];
		$descritivo  = $_POST["descritivo"];
		$prioridade  = $_POST["prioridade"];
		
		if(isset($_POST["btnInserir"])){
			$sql= "INSERT INTO chamado(nome, email, titulo,descritivo, prioridade) 
					values('".$nome."','".$email."','".$titulo."','".$descritivo."','".$prioridade."')"; 
			//echo $sql;
			if (!mysqli_query($conn,$sql)) {
				die("Error: " . mysqli_error($conn));
			}
			echo "<Br>1 registro adicionado";
		}	
		$conn->close();
	}
?>












<html>
	<head>
		<title>Prova N2</title>
		<link rel="stylesheet" href="style.css" />
	</head>
	<body>
		<h1 class="titulo">Chamado</h1>
		<br>
		<p>Preencha os dados abaixo para cadastrar um novo chamado</p>
		<br>
		
		<form method="post" action="ProvaN2.php" >
		
			<p>Nome: <input type="text" name="nome" id="nome" size="50" maxlength="50" placeholder="Digite seu nome e sobrenome"></p>
			<p>E-Mail: <input type="text" name="email"id="email" size="50" maxlength="50" placeholder="Digite seu e-mail"></p>
			
			<p>Codigo: <input type="text" name="codigo" value="<?php echo $codigo; ?>">	<br></p>
			
			<p>Prioridade: <input type="text" name="prioridade" id="prioridade" size="50" maxlength="50" placeholder="1 para baixo, 2 para meio e 3 para grave"></p>
			
			<p>Titulo: <input type="text" name="titulo" id="titulo" size="50" maxlength="50" placeholder="Digite seu nome e sobrenome"></p>
			
			<p><br/>Descreva o problema:</p>
			<p><textarea id="descritivo" name="descritivo" rows="5" cols="50"></textarea><br/></p>
			
			<p><input type="submit" value="Inserir" name="btnInserir"></p>
		</form>
	</body>
</html>