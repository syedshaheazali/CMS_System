<?php
use DBConnection.php;

$cust_id =$_POST['cust_id'];
$cust_name =$_POST['cust_name'];
$cust_phno =$_POST['cust_phno'];
$cust_complaint =$_POST['cust_complaint'];
$cust_address =$_POST['cust_address'];
$emp_assigned =$_POST['emp_assigned'];
$cust_status =$_POST['cust_status'];
$cust_category =$_POST['cust_category'];

$sql = "INSERT INTO tae_customers(cust_id, cust_name, cust_phno,cust_complaint,cust_address,emp_assigned,cust_status,cust_category) VALUES 
('$cust_id','$cust_name','$cust_phno','$cust_complaint','$cust_address', '$emp_assigned','$cust_status','$cust_category'
);";
 
 //Prepare our statement using the SQL query.
$statement = $pdo->prepare($sql);

//Execute the statement and insert our values.
$inserted = $statement->execute();

if($inserted){
    echo "New complaint has been entered successfully.!<br><br>";
	//<a href="HomePage.html" >Click here to go to home page! <br></a>
	
	//<a href="newengineer.html" >Click here to add another employee! <br></a>
}
?>
