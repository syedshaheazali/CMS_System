<?php
require "DBConnection.php";


$Client_Username =$_POST['Client_Username'];
$Client_Password =$_POST['Client_Password'];

$sth = $pdo->prepare("SELECT * FROM master_clients WHERE Client_Username = '".$Client_Username."' AND Client_Password = '".$Client_Password."';");

$sth->execute();


$result = $sth->fetchAll();
//print_r($result);

				// $count = $result->rowCount();  
				if(count($result) > 0)  
                {  
                     $_SESSION["Client_Username"] = $_POST["Client_Username"];  
                     header("location:HomePage.html");  
                }  
                else  
                {  
                    echo 'Invalid Username and Password Combination';
					 
                }  
			
?>

