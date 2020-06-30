<%-- 
    Document   : newengineer
    Created on : Aug 28, 2016, 7:49:38 AM
    Author     : waz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->
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
            statement = conn.createStatement();
            String sqlstmt = "select emp_id from tae_employees order by emp_id desc limit 1";   
    
             try {
     resultSet = statement.executeQuery(sqlstmt);
    while (resultSet.next()) {
        
%>
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
                        <li><a href="newengineer.html">Employee</a></li>
                        <li><a href="NewComplaint.jsp">New Complaints</a></li>
                        <li><a href="UpdateLogin.html">Update</a></li>
                        <li><a href="All_report.jsp">Pending</a></li>
                        <li><a href="reports.jsp">Report</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </header><!--/#header-->
    <form action="Engineers_status.jsp">
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <center>
        <div class="wrap_table">      
            <%
         int newemp_id =Integer.parseInt(resultSet.getString("emp_id"));
         newemp_id++;
            %>
            <form action="Engineers_status.jsp" method="POST">
                        <table style="color:white;" >
                            <tr>
                                <td>
                                    Emp Id  
                                </td>
                                <td>
                                    <input type="text" name="emp_id" value="<%=newemp_id%>" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Name 
                                </td>
                                <td>
                                    <input type="text" name="emp_name" required />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Contact No 
                                </td>
                                <td>
                                    <input type="text" name="emp_phno" required />
                                </td>
                            </tr>
                               <tr>
                                <td>
                                    Joining Date &nbsp;
                                </td>
                                <td>
                                    <input type="text" name="emp_doj" required />yyyy-mm-dd
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Address
                                </td>
                                <td>
                                    <textarea   name="emp_address" ></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Resign Date 
                                </td>
                                <td>
                                    <input type="text" value="NA" name="emp_dol" required/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Emp Type
                                </td>
                                <td>
                                   <select name="emp_type">
                                      <option value="Permanent">-------Permanent-------</option>
                                      <option value="Contract">-------Contract-------</option>
                                   </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Proof Id</td>
                                <td><input type="text" name="emp_id_proof"/></td>
                            </tr>
                            <tr>
                                <td><input type="reset" value="Cancel"/></td>
                                <td><input type="submit" value="Submit"/></td>
                            </tr>
                        </table>
                       
                                   
                    </form>

                                           <%
}
} catch (Exception e) {
e.printStackTrace();
}
%>
        
        </div>
            </center>
    </form>

</body>
</html>
