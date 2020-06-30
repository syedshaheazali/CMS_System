<%-- 
    Document   : Complaint_status
    Created on : Aug 7, 2016, 11:01:50 AM
    Author     : waz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TAE India</title>
          <style TYPE="text/css">
             
             table, th, td {
    border: 1px solid black;width:800px; border-collapse: collapse;
}
         </style>
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
int po_number;
String cust_name;
String cust_complaint;
String cust_address,cust_status,cust_category;
String cust_sdate,cust_edate,cust_term;
long cust_phno;
int emp_assigned;
ResultSet rs = null;
Statement st = null;
PreparedStatement pstmt = null;

cust_id =Integer.parseInt(request.getParameter("cust_id"));
po_number =Integer.parseInt(request.getParameter("po_number"));
cust_name = request.getParameter("cust_name");
cust_phno=Long.parseLong(request.getParameter("cust_phno"));
cust_address=request.getParameter("cust_address");
cust_sdate=request.getParameter("cust_sdate");
cust_edate=request.getParameter("cust_edate");
cust_term=request.getParameter("cust_term");

try 
{
String query = "insert into tae_amc_customers values(?, ?, ? , ? ,?,?,?,?)";
pstmt = conn.prepareStatement(query);// create a statement
pstmt.setInt(1,cust_id );
pstmt.setInt(2,po_number); // set input parameter 1
pstmt.setString(3,cust_name); // set input parameter 2
pstmt.setLong(4,cust_phno);
pstmt.setString(5,cust_address);// set input parameter 3
pstmt.setString(6,cust_sdate);
pstmt.setString(7,cust_edate);
pstmt.setString(8, cust_term);
int i = pstmt.executeUpdate();
if(i!=0)
{ 
out.println("<script language='javascript'>alert('INFO : Inserted Succesffully');</script>"); 
} 
else
{ 
out.println("failed to insert the data"); 
out.println ("<h2 color='red'> Failed to store the results!!!! </h2> <br/><a href='NewComplaint.jsp'>go back ... </a>");
} 
} 
catch (SQLException e)
{ 
out.println (e);
out.println("<font color='red'><a href='NewAMC.jsp'> ERROR while Inserting please click here ... Go Back </a></font>");
out.println("<script language='javascript'>alert('Error while inserting the value in Database');</script>");
}
%>
          <H2 align="center">TAWAKKAL - ALLAH ENTERPRISES </H2>
         <p>Services and AMCs of all brands </p>
         <table>
             <tr>
             <table>
                 <col width="50%">
                 <col width="50%">
                 <tr >
                     <td></br>
                         <b>S.R ID :</b><%=cust_id%>
                     </br>
                     <b>Customer Name:</b><%=cust_name%>
                     </br>
                     <b>Customer Address :</b><%=cust_address%>
                     </br></br>
                     <b>Customer Phno :</b> <%=cust_phno%>
                     </td>
                     <td>
                         <%
                         SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                         Date date = new Date();
                         String date1 = dateFormat.format(date);;
                         %>
                         <b>S.R Date :</b><%=date1%>
                         </br>
                         </br>
                       
                         </br>
                         </br>
                         <b>term : </b> <%=cust_term%>
                     </td>
                 </tr>
             </td>
             
             <tr >
                  <table>
                      <col width="5%">
                      <col width="10%">
                      <col width="5%">
                      <col width="29%">
                      <col width="31%">
                      <col width="7%">
                      <col width="7%">
                      <col width="7.1%">
                      <tr>
                          <td><b>S.No</b></td>
                          <td><b>Make</b></td>
                          <td><b>Ton/Cap</b></td>
                          <td><b>Observations</b></td>
                          <td><b>Activities</b></td>
                          <td><b>1<sup>st</sup> Visit</b></td>
                          <td><b>2<sup>nd</sup> Visit</b></td>
                          <td><b>3<sup>rd</sup> Visit</b></td>
                          
                      </tr>
                      <tr height="30px">
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                      </tr>
                        <tr height="30px">
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                      </tr>
                        <tr height="30px">
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                      </tr>
                        <tr height="30px">
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                      </tr>
                        <tr height="30px">
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                      </tr>
                        <tr height="30px">
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                      </tr>
                        <tr height="30px">
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                      </tr>
                        <tr height="30px">
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                      </tr>
                  </table>
                  </tr>   
                  <tr>
                   <table >
                       <col width="50%">
                      <col width="50%">
                      <tr>
                          <td><b>Technician Name 1 : </b></br> </br>
                              <b>Technician Name 2 : </b></br> </br>
                              <b>Technician Signature :</b> </br> </br>
                              
                              ----------------------------</br>
                              <b>Technician InTime :</b></br>
                              <b>Technician OutTime : </b></br></br>
                              ----------------------------</br>
                              <b>Customer Sign/Seal :</b> </br>
                              <b>Completed Date:</b></br></br></br>
                          </td> 
                          <td>
                              <i>******Your Service is our creed******</i></bR></br></br>
                              </b> Customer Feedback -</b></br>
                              <b>Excellent:</b><br/><br/>
                              <b>Satisfactory:</b><br/><br/>
                              <b>Not Satisfied:</b></br>
                              <b>Poor </b> </br>
                          </td>
                      </tr>
                  </table>
                  </tr>
                  <tr>
                  <table>
                      <tr>
                          <td><b><i>Please contact us for any queries 9620112121,9886555263</b></i></td>
                      </tr>    
                  </tr>
                  
             </table>
    </body>
</html>
