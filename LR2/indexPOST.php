<?
$bg_color = "#fff";
if (isset($_POST["iv_color"]))
	$bg_color = $_POST["iv_color"];
else
	$bg_color = "#fff";	
?>
<head>
</head>
<body style ="background-color: <?=$bg_color?>">
<form action="/Kotliarov/index.php" method="POST">
<div class="mb-3">
  <label for="exampleColorInput" class="form-label">Color picker</label>
  <input name="iv_color" type="color" class="form-control-color" id="exampleColorInput" value = "#ffffff" title = "Chose your color">
</div>
<button type="submit" class="btn btn-primary">Submit</button>
</form>
<div class = "container">
<h1><?
echo "Выбери любимый цвет"?></h1>
</body>
