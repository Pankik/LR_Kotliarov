<?

session_start();
if (isset($_POST["email"]) && isset($_POST["pass"]) && $_POST["pass"] !=""&& $_POST["email"] !="") 
{
  $_SESSION['email'] = $_POST["email"];
  $_SESSION['pass'] = $_POST["pass"];
}
else 
{
	if(isset($_SESSION['email'])&& isset($_SESSION['pass'])&& $_SESSION['email']!=""&& $_SESSION['pass']!="")
	{
		$_POST["email"]=$_SESSION['email'];
        $_POST["pass"]=$_SESSION['pass'];
	}
	else
	{
		header("Location:/Kotliarov/index.php");
	}
} 
session_write_close();
?>
<html>
<head></head>
<body>
<h1>Log IN <?=$_POST["email"]?></h1>
<div>
<a href="/Kotliarov/index.php?logout=yes">Выход</a>
</div>
</body>
</html>
