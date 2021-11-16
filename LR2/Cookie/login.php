<?
session_start();
if (isset($_POST["email"]) && isset($_POST["pass"]) && $_POST["pass"] !="") 
{
  $_SESSION['email'] = $_POST["email"];
  $_SESSION['pass'] = $_POST["pass"];
}
else 
{
   header("Location:/Verholetov/index.php");
} 
session_write_close();
?>
<head></head>
<body>
<h1>Log IN <?=$_POST["email"]?></h1>
<div>
<a href="/Verholetov/index.php?logout=yes">Выход</a>
</div>
</body>

