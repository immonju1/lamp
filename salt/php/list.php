<!DOCTYPE html>

<html>
<head>
<title>Book list</title>
</head>

<body>

<h1>Book list</h1>

<table>

<tr>
<th>
Name
</th>
<th>
Id
</th>

<?php

include("connection.php");

$sql = "SELECT id, name FROM books
ORDER BY name DESC";

$query = $con->prepare($sql);
$query->execute();

while ($row = $query->fetch()) {

$name = $row["name"];
$id = $row["id"];
echo "<tr>";
echo "<td>{$name}</td>";
echo "<td>{$id}</td>";
echo "<td><a href='modify.php?id={$id}'>M</td></a";
echo "<td><a href='delete.php?id={$id}'>X</td></a>";
echo "</tr>";

}
?>

</table>
<a href="add.php">Add book</a>

</body>

</html>
