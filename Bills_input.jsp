<%-- 
    Document   : Bills_input
    Created on : Aug 28, 2016, 3:18:35 PM
    Author     : waz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script>
    $(function() {
    $( "#dob" ).datepicker();
    $( "#dob" ).datepicker( "option", "dateFormat", "yy/mm/dd");
    $( "#dor" ).datepicker();
    $( "#dor" ).datepicker( "option", "dateFormat", "yy/mm/dd");
});
</script>

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
    <link rel="stylesheet" href="css/table_style.css" type="text/css"/>
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

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
                    <a class="navbar-brand" href="index.html"></a></br>
                    <marquee><b>Tawakkal Allah Enterprises</b></marquee>
                 </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav" >
                        <li class="active"><a href="index.html"><i class="icon-home"></i></a></li>
                        <li><a href="update_emp.jsp">Update EMP</a></li>
                        <li><a href="Update_complaint.jsp">Update Complaints</a></li>
                        <li><a href="billsinput.html">Update Bills</a></li>
                        <li><a href="All_report.jsp">Pending</a></li>
                        
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
        <form action="Bills_status.jsp">
        <table class="TFtable">
            <tr><td>Cust_id</td><td><input type="text" name="cust_id"/></td></tr>
            <tr><td>Bill_no</td><td><input type="text" name="bill_no"/></td></tr>
            <tr><td>ammount_paid</td><td><input type="text" name="amount_paid"/></td></tr>
            <tr><td>Date of billing</td><td><input type="text" name="dob"/></td></tr>
            <tr><td>Date of receiving</td><td><input type="text" name="dor"/></td></tr>
        </table>
            <input type="submit" value="submit"/>&nbsp;&nbsp;&nbsp;
            <input type="reset" value="cancel"/>
        </form>
    </body>
</html>
