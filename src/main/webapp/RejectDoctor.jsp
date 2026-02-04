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
String idStr = request.getParameter("id");

if(idStr != null){
    int id = Integer.parseInt(idStr);

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection cn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/sanchetihospitalproject",
        "root",
        "Sipcon@123"
    );

    PreparedStatement ps = cn.prepareStatement(
        "UPDATE Doctor SET status='REJECTED' WHERE did=?"
    );
    ps.setInt(1, id);
    ps.executeUpdate();

    ps.close();
    cn.close();
}

response.sendRedirect("admin.jsp");
%>


</body>
</html>