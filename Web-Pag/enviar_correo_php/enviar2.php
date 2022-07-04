<?php
if(isset($_POST['ENVIAR'])){
    if(!empty($_POST['nombre']) && !empty($_POST['correo'])&&!empty($_POST['telefono'])&&!empty($_POST['mensaje']))
         $nombre = $_POST["nombre"];
         $correo = $_POST["correo"];
         $telefono = $_POST["telefono"];
         $mensaje = $_POST["mensaje"];
$header = "From: andromeda1718@gmail.com". "\r\n";
$header = "Reply-To: noreply@example.com". "\r\n";
$header = "X-Mailer: PHP/".phpversion();
$mail = @mail($nombre,$correo,$telefono,$mensaje);

if($mail)
    
    echo "Email sent";
    
else
    echo "Email sending failed";
}

?>