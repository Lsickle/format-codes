<?php 
	$usuario="root";
	$servidor="localhost";
	$basededatos="pruebas";
	$passBase="";
	$conn=mysqli_connect($servidor, $usuario, $passBase, $basededatos);
	$Proyecto=$_POST['Proyecto'];
	$Actividad =$_POST['Actividad'];
	$InicioR =$_POST['InicioR'];
	$estado =$_POST['estado'];
	echo($InicioR);
	$fechita = new datetime();
	$fechita->setdate($InicioR)
	echo $fechita->format('Y-m-d');
	if (!$conn) {
		echo"Could not connect";
	}
	else{
		echo "Connected successfully";
		$actualizar="UPDATE ProtectosVarios SET InicioR = '$fechita', estado = '$estado' WHERE Proyecto= '$Proyecto' and Actividad='$Actividad';";
			if (mysqli_query($conn, $actualizar)) {
				echo"New record created successfully";
			}
			else{
				echo "Error: " . $actualizar . "<br>" . mysqli_error($conn);
			}

		$cerrado=mysqli_close($conn);
		if ($cerrado) {
			echo "NO sigue conectado";
		}
		else{
			echo" aun esta conectado";
		}
	}
 ?>