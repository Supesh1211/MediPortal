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
String doctorID = request.getParameter("doctorID");   // comes from hidden field
String newPassword = request.getParameter("newPassword");
String confirmPassword = request.getParameter("confirmPassword");

if(newPassword.equals(confirmPassword)) {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection cn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/sanchetihospitalproject",
            "root",
            "Sipcon@123"
        );

        PreparedStatement ps = cn.prepareStatement("UPDATE Doctor SET dpass=? WHERE did=?");
        ps.setString(1, newPassword);
        ps.setInt(2, Integer.parseInt(doctorID));  // since did is serial (integer)

        int rows = ps.executeUpdate();

        if(rows > 0) {
            out.println("<script>alert('Password Updated Successfully'); window.location='DoctorLogin.html';</script>");
        } else {
            out.println("<script>alert('Doctor ID not found'); window.location='ForgotPassword.jsp';</script>");
        }

        cn.close();
    } catch(Exception e) {
        out.println("<script>alert('Error: "+e.getMessage()+"'); window.location='ForgotPassword.jsp';</script>");
    }
} else {
    out.println("<script>alert('Passwords do not match'); window.location='ResetPassword.jsp?doctorID="+doctorID+"';</script>");
}
%>


</body>
</html>