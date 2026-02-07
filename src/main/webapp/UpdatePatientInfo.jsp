<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
String a,b,c,d,e,f;

a=request.getParameter("t1");  //new patient name
b=request.getParameter("t2");
c=request.getParameter("t3");
d=request.getParameter("t4");
e=request.getParameter("t4");

f=request.getParameter("f");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection cn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/sanchetihospitalproject",
        "root",
        "Sipcon@123"
);

cn.prepareStatement("UPDATE Patients SET pname ='"+a+"',pemail='"+b+"',pphone='"+c+"',pappod='"+d+"',pdep='"+e+"' WHERE pid='"+f+"'").executeUpdate();


out.println("<script>");
out.println("alert('Record Updated')");
out.println("window.location.href='patientsinfo.jsp'");

out.println("</script>");



%>
</body>
</html>