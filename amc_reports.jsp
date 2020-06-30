<%-- 
    Document   : reports
    Created on : Aug 24, 2016, 9:22:45 AM
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
        <div class="wrap_table">      
            <form action="reports.jsp" method="get">
                        <table style="color:white;" >
                            <tr>
                                <td>
                                   From :
                                </td>
                                 <td>
                                    <input type="text" id="datepicker1" name="datepicker1" />
                                 </td>
                                 <td>
                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
                                 </td>
                                 <td>
                                    <input type="text"  id="datepicker2" name="datepicker2" />
                                 </td>
                            <tr> <td><input type="Submit" value="Search" /></td></tr>
                </table>
                
</form>                    
        </div>
            <hr/>
                      
            <table align="center" class="TFtable" color="white">
<tr>

</tr>
<tr>
<th>SNO</th>
<th>C ID</th>
<th>PO Number</th>
<th>C Name</th>
<th>C Phone</th>
<th>C Address</th>
<th>Start Date</th>
<th>End Date</th>
<th>Term</th>
</tr>
      
<%
    String from_date=request.getParameter("datepicker1");
    String to_date=request.getParameter("datepicker2");
    statement = conn.createStatement();
    String sqlstmt;
    Date created_date = new Date();
    created_date = Calendar.getInstance().getTime();
    DateFormat formatter = new SimpleDateFormat("yyyy/mm/dd");
    String today = formatter.format(created_date);
    int with_status=0;
    sqlstmt = "select * from tae_amc_customers";       
 try {
     resultSet = statement.executeQuery(sqlstmt);
     int i =0;
    while (resultSet.next()) {
     i=i+1;
%>
<tr>
<td> <%=i%></td>
<td><%=resultSet.getString("cust_id")%></td>
<td><%=resultSet.getString("po_number")%></td>
<td><%=resultSet.getString("cust_name")%></td>
<td><%=resultSet.getString("cust_phno")%></td>
<td><%=resultSet.getString("cust_address")%></td>
<td><%=resultSet.getString("cust_sdate")%></td>
<td><%=resultSet.getString("cust_edate")%></td>
<td><%=resultSet.getString("cust_term")%></td>
</tr>
<%
}
} catch (Exception e) {
e.printStackTrace();
}
%>
                            </table>

        
            </center>
  
</div>
    </body>
</html>
                                    
                                    
                                    
                                    
                                    