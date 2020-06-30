<%-- 
    Document   : Engineers_status.jsp
    Created on : Aug 18, 2016, 10:29:05 AM
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

int emp_id;
String emp_name;
String emp_phno;
String emp_complaint;
String emp_doj;
String emp_address;
String emp_dol;
String emp_type;
String emp_proof;
ResultSet rs = null;
Statement st = null;
PreparedStatement pstmt = null;

emp_id =Integer.parseInt(request.getParameter("emp_id"));
emp_name = request.getParameter("emp_name");
emp_phno =request.getParameter("emp_phno");
emp_doj = request.getParameter("emp_doj");
emp_address=request.getParameter("emp_address");
emp_dol=request.getParameter("emp_dol");
if (emp_dol.equalsIgnoreCase("NA"))
{
    emp_dol=null;
}
emp_type=request.getParameter("emp_type");
emp_proof=request.getParameter("emp_proof");
Date created_date = new Date();

try 
{
String query = "insert into tae_employees (emp_id,emp_name,emp_phno,emp_doj,emp_address,emp_dol,emp_type,emp_proof) values(?, ?, ? ,?, ? ,?,?,?)";
pstmt = conn.prepareStatement(query);// create a statement
pstmt.setInt(1,emp_id ); // set input parameter 1
pstmt.setString(2, emp_name);
pstmt.setString(3, emp_phno);// set input parameter 2
pstmt.setString(4,emp_doj);
pstmt.setString(5, emp_address);// set input parameter 3
pstmt.setString(6, emp_dol);
pstmt.setString(7,emp_type);
pstmt.setString(8, emp_proof);
int i = pstmt.executeUpdate(); 
if(i!=0)
{ 
response.sendRedirect("newengineer.html");
} 
else
{ 
out.println("failed to insert the data"); 
out.println ("<h2 color='red'> Failed to store the results!!!! </h2> <br/><a href='newengineer.html'>go back ... </a>");
} 
} 
catch (SQLException e)
{
out.println("<script language='javascript'>alert('Error while inserting the value in Database');</script>");

}


%>

    </body>
</html>
