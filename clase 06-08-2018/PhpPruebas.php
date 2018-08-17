<?php 
	$usuario="root";
	$servidor="localhost";
	$basededatos="pruebas";
	$passBase="";
	$conn=mysqli_connect($servidor, $usuario, $passBase, $basededatos);
	$Proyecto=$_POST['Proyecto'];
	$Fase =$_POST['Fase'];
	$Actividad =$_POST['Actividad'];
	$InicioP =$_POST['InicioP'];
	$InicioR =$_POST['InicioR'];
	$TerminoP =$_POST['TerminoP'];
	$TerminoR =$_POST['TerminoR'];
	$estado =$_POST['estado'];
	if (!$conn) {
		echo"Could not connect";
	}
	else{
		echo "Connected successfully";
		$insertar="insert into ProtectosVarios (Proyecto, Fase, Actividad, InicioP, InicioR, TerminoP, TerminoR, estado) VALUES 
		('$Proyecto', '$Fase', '$Actividad', '$InicioP', '$InicioR', '$TerminoP', '$TerminoR', '$estado');";
			if (mysqli_query($conn, $insertar)) {
				echo"New record created successfully";
			}
			else{
				echo "Error: " . $insertar . "<br>" . mysqli_error($conn);
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