<?php
$host = 'localhost:3307';
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

function executeQuery(PDO $pdo,$query)
{
	try
	{
	$sth=$pdo->prepare($query);
	$result=$sth->execute();
	
    return $result;
	}catch (PDOException $e)
	{ 
		
		//throw $e;
	}
	
}


function runQuery(PDO $pdo,$query)
{
	try
	{
	$sth=$pdo->prepare($query);
	$sth->execute();
	$result = $sth->fetch();
    return $result;
	}
	catch (PDOException $e)
	{
		 if ($e->getCode() == 1062) 
		   {
        // Take some action if there is a key constraint violation, i.e. duplicate name
		    echo "Failed";
       	   } else 
		   {
        throw $e;
           }
	}
	
}
?>