<?php
//use DBConnection.php;
require "DBConnection.php";

$Client_Name =$_POST['Client_Name'];
$Client_Email =$_POST['Client_Email'];
$Client_Phone =$_POST['Client_Phone'];
$Client_Username =$_POST['Client_Username'];
$Client_Password =$_POST['Client_Password'];

$sql = "INSERT INTO master_clients(Client_Name,Client_Email, Client_Phone, Client_Username, Client_Password) VALUES 
('$Client_Name','$Client_Email','$Client_Phone','$Client_Username', '$Client_Password');";
 
 //Prepare our statement using the SQL query.
$statement = $pdo->prepare($sql);

//Execute the statement and insert our values.
$inserted = $statement->execute();

if($inserted){
    echo "Registered Successfully!<br><br>";
}
?>
