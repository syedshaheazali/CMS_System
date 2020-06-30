<%-- 
    Document   : save_complaint
    Created on : Aug 28, 2016, 1:34:12 PM
    Author     : waz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TAE India</title>
    </head>
    <body>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.PreparedStatement" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat"%>
<%@page import= "java.util.Date" %>
<%@ page import="java.util.Calendar"%>

<%

String Database="jdbc:mysql://localhost:3306/tae?useSSL=false";
String UserName="root";
String Password="root";
Connection conn=null;
Class.forName("com.mysql.jdbc.Driver"); 
conn =DriverManager.getConnection(Database,UserName,Password);

String cust_complaint,cust_id;
String cust_address;
String emp_assigned;
String cust_category;
String cust_status;
String modified_date,closed_date;
ResultSet rs = null;
Statement st = null;
PreparedStatement pstmt = null;

cust_id=request.getParameter("cust_id");
cust_complaint = request.getParameter("cust_complaint");
cust_address =request.getParameter("cust_address");
emp_assigned = request.getParameter("emp_assigned");
cust_status=request.getParameter("cust_status");
cust_category=request.getParameter("cust_category");
modified_date=request.getParameter("datepicker1");
closed_date=request.getParameter("datepicker2");
String sqlstmt;
try 
{
    if(modified_date.equals("null") && !(closed_date.equals("null")))
    {
        cust_status="CLS";
        sqlstmt = "update tae_customers set cust_complaint='"+cust_complaint+"',cust_address='"+cust_address+"',emp_assigned="+emp_assigned+",cust_status='"+cust_status+"',cust_category='"+cust_category+"',closed_date='"+closed_date+"' where cust_id="+cust_id;
        
    }
    else if (closed_date.equals("null") && !(modified_date.equals("null")))
    { 
        sqlstmt = "update tae_customers set cust_complaint='"+cust_complaint+"',cust_address='"+cust_address+"',emp_assigned="+emp_assigned+",cust_status='"+cust_status+"',cust_category='"+cust_category+"',modified_date='"+modified_date+"' where cust_id="+cust_id;
    }
    else
    {
       cust_status="CLS";
       sqlstmt = "update tae_customers set cust_complaint='"+cust_complaint+"',cust_address='"+cust_address+"',emp_assigned="+emp_assigned+",cust_status='"+cust_status+"',cust_category='"+cust_category+"',modified_date='"+modified_date+"',closed_date='"+closed_date+"' where cust_id="+cust_id;
    }
  

pstmt = conn.prepareStatement(sqlstmt);// create a statement
int i = pstmt.executeUpdate(); 
if(i!=0)
{
//out.println("<script> alert('Successfully Executed')</script>");
//out.println(" Executed Successfully ...\n" + sqlstmt);
response.sendRedirect("Update_complaint.jsp");
} 
else
{ 
out.println("failed to insert the data"); 
out.println ("<h2 color='red'> Failed to store the results!!!! </h2> <br/><a href='newengineer.html'>go back ... </a>");
} 
} 
catch (SQLException e)
{
out.println("<script language='javascript'>alert('Error while inserting the value in Database');</script>"+e);

}


%>

    </body>
</html>
