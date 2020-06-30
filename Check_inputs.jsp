<%-- 
    Document   : Check_inputs
    Created on : Aug 24, 2016, 8:31:18 AM
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
        <%
        out.println(Integer.parseInt(request.getParameter("cust_id")));
out.println(request.getParameter("cust_name"));
out.println(Long.parseLong(request.getParameter("cust_phno")));
out.println(request.getParameter("cust_complaint"));
out.println(request.getParameter("cust_address"));
out.println(Integer.parseInt(request.getParameter("emp_assigned")));
out.println(request.getParameter("cust_status"));
//cust_phno=
//cust_complaint = request.getParameter("cust_complaint");
//cust_address=request.getParameter("cust_address");
//emp_assigned=Integer.parseInt(request.getParameter("emp_assigned"));
//cust_status=request.getParameter("cust_status");
%>
    </body>
</html>
