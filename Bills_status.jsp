<%-- 
    Document   : Bills_status
    Created on : Aug 28, 2016, 4:12:12 PM
    Author     : waz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

int cust_id;
String cust_name;
String cust_complaint;
String cust_address,cust_status,cust_category;
long cust_phno;
int emp_assigned;
ResultSet rs = null;
Statement st = null;
PreparedStatement pstmt = null;

cust_id =Integer.parseInt(request.getParameter("cust_id"));
int bill_no =Integer.parseInt(request.getParameter("bill_no"));
int amount_paid = Integer.parseInt(request.getParameter("amount_paid"));
String dob=request.getParameter("dob");
String dor=request.getParameter("dor");


try 
{
String query = "insert into tae_bills values(?, ?, ? , ? ,?)";
pstmt = conn.prepareStatement(query);// create a statement
pstmt.setInt(1,cust_id ); // set input parameter 1
pstmt.setInt(2,bill_no); // set input parameter 2
pstmt.setInt(3,amount_paid);
pstmt.setString(4,dob);// set input parameter 3
pstmt.setString(5,dor);
int i = pstmt.executeUpdate();
if(i!=0)
{ 
out.println("<script language='javascript'>alert('INFO : Inserted Succesffully');</script>");
response.sendRedirect("Bills_input.jsp");
} 
else
{ 
out.println("failed to insert the data"); 
out.println ("<h2 color='red'> Failed to store the results!!!! </h2> <br/><a href='NewComplaint.jsp'>go back ... </a>");
} 
} 
catch (SQLException e)
{ 
out.println("<font color='red'><a href='NewComplaint.jsp'> ERROR while Inserting please click here ... Go Back </a></font>");
out.println("<script language='javascript'>alert('Error while inserting the value in Database');</script>");
}
%>
    </body>
</html>
