<%-- 
    Document   : save_employee
    Created on : Aug 28, 2016, 3:31:40 PM
    Author     : waz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

ResultSet rs = null;
Statement st = null;
PreparedStatement pstmt = null;

  int emp_id=Integer.parseInt(request.getParameter("emp_id"));
  Long  emp_phno=Long.parseLong(request.getParameter("emp_phno"));
  String  emp_address=request.getParameter("emp_address");
  String  emp_dol=request.getParameter("emp_dol");
  String  emp_type=request.getParameter("emp_type");
  String  emp_proof=request.getParameter("emp_proof");
String sqlstmt;
  
 
try 
{
  
  sqlstmt = "update tae_employees set emp_phno="+emp_phno+",emp_address='"+emp_address+"',emp_dol='"+emp_dol+"', emp_type='"+emp_type+"',emp_proof='"+emp_proof+"' where emp_id="+emp_id;
pstmt = conn.prepareStatement(sqlstmt);// create a statement
int i = pstmt.executeUpdate(); 
if(i!=0)
{
out.println("<script> alert('Successfully Executed')</script>");
out.println (sqlstmt);
//out.println(" Executed Successfully ...\n" + sqlstmt);
//response.sendRedirect("update_emp.jsp");
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

</html>
