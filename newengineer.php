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

$emp_id =$_POST['emp_id'];
$emp_name =$_POST['emp_name'];
$emp_phno =$_POST['emp_phno'];
$emp_doj =$_POST['emp_doj'];
$emp_address =$_POST['emp_address'];
$emp_dol =$_POST['emp_dol'];
$emp_type =$_POST['emp_type'];
//$emp_proof =$_POST['emp_proof'];

$sql = "INSERT INTO tae_employees(emp_id, emp_name,emp_phno,emp_doj,emp_address,emp_dol,emp_type) VALUES 
('$emp_id','$emp_name','$emp_phno','$emp_doj','$emp_address', '$emp_dol','$emp_type'
);";
 
 //Prepare our statement using the SQL query.
$statement = $pdo->prepare($sql);

//Execute the statement and insert our values.
$inserted = $statement->execute();

if($inserted){
    echo "New employee has been registered successfully.!<br><br>";
	//<a href="HomePage.html" >Click here to go to home page! <br></a>
	
	//<a href="newengineer.html" >Click here to add another employee! <br></a>
}
?>
