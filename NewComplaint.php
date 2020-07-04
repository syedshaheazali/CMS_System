<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>TAE | Tawakkal Allah Enterprises</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
     <link rel="stylesheet" href="css/reset.css">
    <!--<link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />-->
    <link rel="stylesheet" href="css/table_style.css">
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head>
<?php
require "DBConnection.php";

$query = 'SELECT (max(complaint_id)+1) FROM complaints;';
$result = runQuery($query);

echo $result;

?>
<body data-spy="scroll" data-offset="0">
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
                        <li><a href="newengineer.html">Employee</a></li>
                        <li><a href="NewComplaint.html">New Complaints</a></li>
                        <li><a href="NewAMC.html">New AMC</a></li>
                        <li><a href="Update_complaint.html">Update</a></li>
                        <li><a href="All_report.html">Pending</a></li>
                        <li><a href="reports.html">Report</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </header><!--/#header-->
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <font color="white" size="3px" > <center><a href='PrintNewComplaint.html' >Print Empty FSR</a> </center></font>
		<br/>
        <br/>
        <center>
            <div >      
           <!-- <form action="Complaint_status.html" method="POST -->
		   <form action="NewComplaintInsert.php" method="POST">
                        <table style="color:white" >
                            <tr> <td>
                                    Cust Id   
                                </td><td></td> <td><input value="<?php echo $result; ?>" type="text" class="css_input" name="cust_id" />
								<br/>
                                </td>
                            </tr>
                            <tr></tr>
                            <tr><td>Name </td> <td></td>  <td>
                                    <input type="text" class="css_input" name="cust_name" required />
									<br/>
                                </td></tr>
                            <tr><td>Contact No   </td>
                                <td></td> <td>
                                    <input type="text"  class="css_input" name="cust_phno" required />
									<br/>
                                </td> </tr>
                               <tr><td>  Complaint   </td>
                                <td></td>
                                <td>
                                    <textarea   name="cust_complaint"  class="css_input" required ></textarea>
									<br/>
                                </td> </tr>
                            <tr> <td>    Address </td>
                                <td></td>  <td>
                                    <textarea   name="cust_address"  class="css_input" required ></textarea>
									<br/>
                                </td>
                            </tr>
                            <tr> <td> Complaint owner:
                                </td> <td></td>  <td>
                                    <input type="text" name="emp_assigned" class="css_input" required/><font size='1'>please provide the existing employee id</font>
								<br/>                               
							   </td>
                            </tr>
                            <tr> <td> Cust Status </td>
                                <td></td><td>
                                   <select  class="css_input" name="cust_status" required>
                                      <option value="NR">&nbsp;New</option>
                                      <option value="PFA">Pending for Approval</option>
                                      <option value="PFS">Pending for Spares</option>
                                   </select>
								   <br/>
                                </td>
                            </tr>
                            <tr>  <td> Cust Category</td>
                                <td></td> <td>
                                   <select class ="css_input" name="cust_category" required>
                                      <option value="WARRANTY">WARRANTY</option>
                                      <option value="CHARGEABLE">CHARGEABLE</option>
                                   </select>
								   <br/>
								   <br/>
                                </td> </tr>
                            <tr>
                                <td><input type="reset" value="Reset"/></td>
                                <td></td>
                                <td><input type="submit" value="Submit"/></td>
                            </tr>
                        </table>
                                
</form>                  
                                
                              
        </div>
            </center>
  

</html>