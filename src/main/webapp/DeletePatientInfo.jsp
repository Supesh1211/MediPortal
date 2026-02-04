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
String x=request.getParameter("ID");
//out.println(x);


Class.forName("com.mysql.cj.jdbc.Driver");
Connection cn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/sanchetihospitalproject",
        "root",
        "Sipcon@123"
);

cn.prepareStatement("DELETE FROM Patients WHERE pid='"+x+"'").executeUpdate();

out.println("<script>");
out.println("alert('Record Deleted')");
out.println("window.location.href='patientsinfo.jsp");
out.println("</script>");

%>

</body>
</html>