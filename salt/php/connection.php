<?php

$database = ”book”;
$user = ”book”;
$password = ”wei5EaPho4”;
$dns = ”mysql:host=localhost;charset=UTF8;dbname=$database”;
echo ”$dns, $user”;
$con = new PDO($dns,$user,$password);

?>
