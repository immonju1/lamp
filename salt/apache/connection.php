<?php

$database = "animals";
$user = "animals";
$password = "salainen";
$dns = "mysql:host=localhost;charset=UTF8;dbname=$database";
echo "$dns, $user";
$con = new PDO($dns,$user,$password);

?>
