<?php
// Check for empty fields
if(empty($_POST['name'])      ||
   empty($_POST['email'])     ||
   empty($_POST['asunto'])     ||
   empty($_POST['message'])   ||
   !filter_var($_POST['email'],FILTER_VALIDATE_EMAIL))
   {
   echo "No ingresaste algun argumento >:v";
   return false;
   }
   
$nombre = strip_tags(htmlspecialchars($_POST['name']));
$correo = strip_tags(htmlspecialchars($_POST['email']));
$asunto = strip_tags(htmlspecialchars($_POST['asunto']));
$mensaje = strip_tags(htmlspecialchars($_POST['message']));
   
$to = 'imanol.rivero7@gmail.com';
$email_subject = "Formulario de contacto de:  $name";
$email_body = "Has recibido un nuevo mensaje para SmartGreen.\n\n"."Aqui estan los detalles.\n\nNombre: $nombre\n\nEmail: $correo\n\nAsunto: $asunto\n\nMensaje:\n$mensaje";
$headers = "De: noreply@outlook.com\n"; // This is the email address the generated message will be from. We recommend using something like noreply@yourdomain.com.
$headers .= "Reply-To: $correo";   
mail($to,$email_subject,$email_body,$headers);
return true;         
?>
