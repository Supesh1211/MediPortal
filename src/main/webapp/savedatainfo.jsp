<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%


String a,b,c,d,e,f;
a=request.getParameter("t1");
b=request.getParameter("t2");
c=request.getParameter("t3");
d=request.getParameter("t4");
e=request.getParameter("t5");
f=request.getParameter("t6");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection cn=DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/sanchetihospitalproject",
    "root",
    "Sipcon@123"
);

cn.prepareStatement(
    "INSERT INTO Doctor(dname,demail,dphone,dspec,dmnumber,dpass,status) " +
    "VALUES('"+a+"','"+b+"','"+c+"','"+d+"','"+e+"','"+f+"','PENDING')"
).executeUpdate();

out.println("Doctor Registered Successfully! Waiting for Admin Approval.");

%>




</body>
</html>