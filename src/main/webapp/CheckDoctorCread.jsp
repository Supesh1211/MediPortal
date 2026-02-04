<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%

String x,y;

x=request.getParameter("t1");
y=request.getParameter("t2");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection cn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/sanchetihospitalproject",
        "root",
        "Sipcon@123");


PreparedStatement ps=cn.prepareStatement("SELECT * FROM Doctor WHERE dname='"+x+"' AND dpass='"+y+"' ");
ResultSet rs=ps.executeQuery();

if(rs.next())
{
	//out.println("Login Successfull");
	HttpSession s1=request.getSession();
	s1.setAttribute("kp", x);
	out.println("<script>");
	out.println("alert('Login Successfull')");
	out.println("window.location.href='DoctorDash.jsp'");
	out.println("</script>");

}
else
{
	//out.println("Login faild");
	out.println("<script>");
	out.println("alert('Login Faild')");
	out.println("window.location.href='DoctorLogin.html'");

	out.println("</script>");

	
}





























%>
</body>
</html>