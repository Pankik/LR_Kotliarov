
<?php
session_start();

if (isset($_POST["email"]) && isset($_POST["pass"]) && $_POST["pass"] !="")
{
	$user_email=$_POST["email"];
	$user_pass=$_POST["pass"];
	setcookie("email",$user_email,time()+3600);
	setcookie("pass",$user_pass,time()+3600);
	header("Location:/Kotliarov/login.php");
	

}
if (isset($_POST["email"]) && isset($_POST["pass"]) && $_POST["pass"] !="")
{
	$_SESSION["email"]=$_POST["email"];
	$_SESSION["pass"]=$_POST["pass"];
	
}

?>

<form action="/Kotliarov/" method="GET" >
<input name="logout" type="hidden" value="yes"></input>
	<button type="submit" class="btn btn-primary mb-3">Logout</button>
 </form>
 
 
<body>
<h1> <?php echo"Welcome, ".$_SESSION['email']."!"; ?> </h1>
</body>


