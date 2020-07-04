<?php

//include('DBConnection.php');
require "DBConnection.php";
$localpdo = $pdo;
function runQuery($query)
{
	$sth = $localpdo->prepare($query);

$sth->execute();

$result = $sth->fetchAll();
	
    return $result;
}

?>
