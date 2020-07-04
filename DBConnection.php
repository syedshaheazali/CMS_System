<?php
$host = 'localhost:3306';
$user = 'root';
$pass = '';
$database = 'tae';
 
//Custom PDO options.
$options = array(
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_EMULATE_PREPARES => false
);
 
//Connect to MySQL and instantiate our PDO object.
$pdo = new PDO("mysql:host=$host;dbname=$database", $user, $pass, $options);


function runQuery($query)
{
	
	
	$sth =$GLOBAL['pdo']->prepare($query);

	//$localpdo = $GLOBALS['$pdo'];
	
	//$sth =  $localpdo->prepare($query);

$sth->execute();

$result = $sth->fetchAll();
	
    return $result;
}

?>