<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>TAE - New Engineer </title>
    <!--<link rel="stylesheet" href="css/reset.css">-->
    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
	    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
	<script src="js/sweetalert.min.js"> </script>
	
</head>


<?php
require "DBConnection.php";

$query = "SELECT (max(emp_id)+1) as emp_id FROM tae_employees;";
$result = runQuery($pdo,$query);

if(isset($_POST['submit'])) 
{
	//$query = "SELECT (max(emp_id)+1) as emp_id FROM tae_employees;";
    //$result = runQuery($pdo,$query);
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
 
	$result = executeQuery($pdo,$sql);// this returns boolean
	if ($result)
	{
		$_SESSION['status']="Added $emp_name to your esteem org";
		//echo "Successfully inserted into the table";
		$msg= "New Employee is added successfully";
		
		// header("location:HomePage.html");
	}
    else
    {
		$_SESSION['status']="Failed to add";
		
	    //header("location:newengineer.php");
		
	}
	
}
?>   

<body style="background-color: #1586c3">
 <header id="header" role="banner">
        <div class="container">
            <div id="navbar" class="navbar navbar-default">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="HomePage.html"></a></br>
                    <marquee><b>T A E</b></marquee>
                 </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav" >
                        <li class="active"><a href="HomePage.html"><i class="icon-home"></i></a></li>
                        <li><a href="newengineer.php">Employee</a></li>
                        <li><a href="NewComplaint.php">New Complaints</a></li>
                        <li><a href="NewAMC.html">New AMC</a></li>
                        <li><a href="Update_complaint.html">Update</a></li> <!--/#TBC-->
                        <li><a href="All_report.html">Pending</a></li>
                        <li><a href="report_redirect.html">ALL Reports</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </header>
            <form action="<?php echo $_SERVER['PHP_SELF'];?>" method="POST">
						<div class="wrap">		
                        <table style="color:white;" >
                            <tr>  <td>Emp Id </td><td><input value="<?php echo $result[0]; ?>" type="text" class="css_input" name="emp_id"  readonly />
								  </td> </tr>
                            <tr> <td> Name </td><td>   <input type="text" name="emp_name" required /> </td>  </tr>
                            <tr> <td> Contact No </td>    <td>  <input type="text" name="emp_phno" required /></td></tr>
                               <tr><td>  Joining Date &nbsp;  </td><td>  <input type="date" name="emp_doj" required /> </td></tr>
                            <tr> <td> Address </td> <td>&nbsp;<textarea   name="emp_address" ></textarea></td> </tr>
                            <tr><td>  Resign Date </td> <td> <input type="text" value="NA" name="emp_dol" readonly /></td> </tr>
                            <tr><td> Emp Type </td><td> &nbsp;&nbsp;
                                   <select name="emp_type">
                                      <option value="Permanent">   Permanent    </option>
                                      <option value="Contract">   Contract    </option>
                                   </select>
                            </td></tr>
                            <!-- <tr><td>Proof Id</td><td><input type="text" name="emp_proof"/></td> </tr> -->
                            <tr> <td><input type="reset" value="Reset"/></td>
                                <td><input type="submit" name="submit" value="Submit"/></td>
                            </tr>
                        </table>
                       </div>                                   
                    </form>


</body>
<?php
if(isset($_SESSION['status']) && isset($_SESSION['status']) != '')
{
?>

<script>
 swal({
  title: "Success!!",
  text: "<?php echo $_SESSION['status'];?>",
  icon: "success",
  button: "Ok!",
});

 //window.location.href="newengineer.php";
</script>

<?php
 unset($_SESSION['status']);
 
 header('location:newengineer.php');
 }
?>

</html>
                                          