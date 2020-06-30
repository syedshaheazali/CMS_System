<%-- 
    Document   : All_report
    Created on : Aug 28, 2016, 4:41:04 PM
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
                        <li><a href="All_report.jsp">All Report</a></li>
                        
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
                <%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.PreparedStatement" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat"%>
<%@page import= "java.util.Date" %>
<%@ page import="java.util.Calendar"%>
  <form action="Bills_status.jsp">
            
        <table class="TFtable">
      
            <tr>
                <td>
                Cust_id    
                </td>
                <td>cust_name</td>
                <td>
                    cust_phno
                </td>
                <td>
                    cust_complaint
                </td>
                <td>
                    cust_address
                </td>
                <td>
                    emp_assigned
                </td>
                <td>
                    cust_status
                </td>
                <td>
                    created_category
                </td>
                <td>
                    created_date
                </td>
                <td>
                    modified_date
                </td>
                <td>
                    closed_date
                </td>
            
                
            </tr>
<%
String Database="jdbc:mysql://localhost:3306/tae?useSSL=false";
String UserName="root";
String Password="root";
Connection conn=null;
Class.forName("com.mysql.jdbc.Driver"); 
conn =DriverManager.getConnection(Database,UserName,Password);

int cust_id;
String cust_name;
String cust_complaint;
String cust_address,cust_status,cust_category;
long cust_phno;
int emp_assigned;
ResultSet rs = null;
Statement st = null;
PreparedStatement pstmt = null;

//cust_id =Integer.parseInt(request.getParameter("cust_id"));


try 
{
String query = "select * from tae_customers where closed_date is null and closed_date  <= date(now() - interval 6 day)";
pstmt = conn.prepareStatement(query);// create a statement
rs=pstmt.executeQuery();
%>

    
<%
while(rs.next())
{
%>
<tr>
<td><%=rs.getInt("cust_id")%></td>
<td><%=rs.getString("cust_name")%></td>
<td><%=rs.getLong("cust_phno")%></td>
<td><%=rs.getString("cust_complaint")%></td>
<td><%=rs.getString("cust_address")%></td>
<td><%=rs.getString("emp_assigned")%></td>
<td><%=rs.getString("cust_status")%></td>
<td><%=rs.getString("cust_category")%></td>
<td><%=rs.getString("created_date")%></td>
<td><font color="red"> <b><%=rs.getString("modified_date")%></b></font></td>
<td><%=rs.getString("closed_date")%></td>
</tr>
<%
  }
   }
catch(Exception ex)
{out.println("<font color='white' > ERROR: Error in fetchign the details ex </font>"+ex);}

        %>
          </table>
            
        </form>
      
    </body>
</html>
