<?
if (isset($_POST["email"]) && isset($_POST["pass"]) && $_POST["pass"] !="" && $_POST["email"] !="")
{
	$user_email=$_POST["email"];
	$user_pass=$_POST["pass"];
	setcookie("email",$user_email,time()+3600);
	setcookie("pass",$user_pass,time()+3600);
	
}
else 
{
   header("Location:/Kotliarov/index.php");
} 
session_write_close();
?>
<head></head>
<body>
<h1>Log IN <?=$_POST["email"]?></h1>
<div>
<a href="/Kotliarov/index.php?logout=yes">Выход</a>
</div>
</body>

