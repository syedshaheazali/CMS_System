<%-- 
    Document   : NewComplaint
    Created on : Aug 27, 2016, 11:35:03 AM
    Author     : waz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
            String Database="jdbc:mysql://localhost:3306/tae?useSSL=false&allowPublicKeyRetrieval=true";
            String UserName="root";
            String Password="root";
            Connection conn=null;
            Class.forName("com.mysql.jdbc.Driver"); 
            conn =DriverManager.getConnection(Database,UserName,Password);
            statement = conn.createStatement();
            String sqlstmt = "select cust_id from tae_customers order by cust_id desc limit 1";   
    
             try {
     resultSet = statement.executeQuery(sqlstmt);
    while (resultSet.next()) {
        int nextcid=Integer.parseInt(resultSet.getString("cust_id"));
        nextcid=nextcid +1;
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
                    <marquee><b>T A E</b></marquee>
                 </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav" >
                        <li class="active"><a href="index.html"><i class="icon-home"></i></a></li>
                        <li><a href="newengineer.jsp">Employee</a></li>
                        <li><a href="NewComplaint.jsp">New Complaints</a></li>
                        <li><a href="NewAMC.jsp">New AMC</a></li>
                        <li><a href="UpdateLogin.html">Update</a></li>
                        <li><a href="All_report.jsp">Pending</a></li>
                        <li><a href="reports.jsp">Report</a></li>
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
        <font color="white" size="3px" > <a href='PrintNewComplaint.jsp' >Print Empty FSR</a> </font>
        <center>
            <div >      
            <form action="Complaint_status.jsp" method="POST">
                        <table style="color:white" >
                            <tr>
                                <td>
                                    Cust Id   
                                </td>
                                <td></td>
                                <td>
                                    <input  type="text" class="css_input" name="cust_id" value="<%=nextcid%>" />
                                    ----------------------
                                </td>
                            </tr>
                            <tr></tr>
                            <tr>
                                <td>
                                    Name 
                                </td>
                                <td></td>
                                <td>
                                    <input type="text" class="css_input" name="cust_name" required />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Contact No 
                                </td>
                                <td></td>
                                <td>
                                    <input type="text"  class="css_input" name="cust_phno" required />
                                </td>
                            </tr>
                               <tr>
                                <td>
                                    Complaint
                                </td>
                                <td></td>
                                <td>
                                    <textarea   name="cust_complaint"  class="css_input" required ></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Address
                                </td>
                                <td></td>
                                <td>
                                    <textarea   name="cust_address"  class="css_input" required ></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    E Assign:
                                </td>
                                <td></td>
                                <td>
                                    <input type="text" name="emp_assigned" class="css_input" required/><font size='1'>please provide the existing emp id</font>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Cust Status
                                </td>
                                <td></td>
                                <td>
                                   <select  class="css_input" name="cust_status" required>
                                      <option value="NR">&nbsp;New</option>
                                      <option value="PFA">Pending for Approval</option>
                                      <option value="PFS">Pending for Spares</option>
                                   </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Cust Category
                                </td>
                                <td></td>
                                <td>
                                   <select class ="css_input" name="cust_category" required>
                                      <option value="WARRANTY">WARRANTY</option>
                                      <option value="CHARGEABLE">CHARGEABLE</option>
                                   </select>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="reset" value="Cancel"/></td>
                                <td></td>
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
  

</html>
