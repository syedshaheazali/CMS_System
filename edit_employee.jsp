<%-- 
    Document   : edit_employee
    Created on : Aug 26, 2016, 12:45:53 AM
    Author     : waz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TAE India</title>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<script>
    $(function() {
    $( "#datepicker1" ).datepicker();
    $( "#datepicker1" ).datepicker( "option", "dateFormat", "yy/mm/dd");
    $( "#datepicker2" ).datepicker();
    $( "#datepicker2" ).datepicker( "option", "dateFormat", "yy/mm/dd");
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
    <link rel="stylesheet" href="css/table_style.css">
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
                        <li><a href="newengineer.jsp">Employee</a></li>
                        <li><a href="NewComplaint.jsp">New Complaints</a></li>
                        <li><a href="UpdateLogin.html">Update</a></li>
                        <li><a href="All_report.jsp">Pending</a></li>
                        <li><a href="reports.jsp">Reports</a></li>
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
        <%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.Connection"%>
        <%@ page import="java.text.DateFormat"%>
        <%@page import= "java.util.Date"%>
        <%@ page import ="java.text.SimpleDateFormat" %>
        <%@ page import="java.util.Calendar"%>
         <%
         String driverName = "com.mysql.jdbc.Driver";
         long emp_phno; int emp_id;
         emp_id=Integer.parseInt(request.getParameter("emp_id"));
       try {
       Class.forName(driverName);
         } catch (ClassNotFoundException e) {
          e.printStackTrace();
           }
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
            String Database="jdbc:mysql://localhost:3306/tae?useSSL=false";
            String UserName="root";
            String Password="root";
            Connection conn=null;
            Class.forName("com.mysql.jdbc.Driver"); 
            conn =DriverManager.getConnection(Database,UserName,Password);
            
%>
        <center>
        <hr/>
                      
            <table align="center" class="TFtable" color="white">
<tr>

</tr>
          
<form action="save_employee.jsp">
 <tabl style="color:white;width: 30%">
<%
    statement = conn.createStatement();
   String sqlstmt = "SELECT * FROM tae_employees where emp_id="+emp_id;   
     try {
     resultSet = statement.executeQuery(sqlstmt);
     while (resultSet.next()) {
%>
<tr><td>Emp ID</td><td><input type="text" name="emp_id" value="<%=resultSet.getString("emp_id")%>" /></td></tr>
<tr><td>Emp Name</td><td><%=resultSet.getString("emp_name")%></td></tr>
<tr><td>Emp Phone</td><td><input type="text" name="emp_phno" value="<%=resultSet.getString("emp_phno")%>"/></td></tr>
<tr><td>Emp DOJ</td><td><%=resultSet.getString("emp_doj")%></td></tr>
<tr><td>EMP Address</td><td><%=resultSet.getString("emp_address")%></td></tr>
<tr><td>EMP DOL</td><td><input type="text" name="emp_dol" value="<%=resultSet.getString("emp_dol")%>"/></td></tr>
<tr><td>EMP type</td><td><select name="emp_type" value="<%=resultSet.getString("emp_type")%>">
            <option value="Permanent">Permanent</option>
            <option value="Permanent">Contract</option>
        </select></td></tr>
<tr><td>EMP proof</td><td><input type="text" name="emp_proof" value="<%=resultSet.getString("emp_proof")%>"></td></tr>
<tr><td><input type="submit" value="Save"/></td><td><input type="reset" name="cancel"/></tr>

<!--<tr><td><a href="edit_employee.jsp?empid=>edit</a></td></tr>-->
<%
}
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
 </form>
        </div>
        </body>
        
</html>
