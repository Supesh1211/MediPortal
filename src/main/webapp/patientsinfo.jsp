<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Online_Appointment</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>
<style>

    table {
        width: 90%;
        margin: 20px auto;
        border-collapse: collapse;
        font-family: Arial, sans-serif;
        font-size: 14px;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: center;
    }

    th {
        background-color: #4CAF50;
        color: white;
        font-weight: bold;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: #f1f1f1;
        cursor: pointer;
    }

    caption {
        caption-side: top;
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 10px;
    }
</style>
<center>
<h2>Patient Information</h2>
</center>
<table border="1px">

<tr>
<th>ID</th>
<th>Patient Name</th>
<th>Patient Email</th>
<th>Patient Phone</th>

<th>Patient Appo Date</th>
<th>Patient Dept</th>
<th>Patient Time Sloat</th>
<th>Action</th>

</tr>


<%

HttpSession sk=request.getSession();
Class.forName("com.mysql.cj.jdbc.Driver");
Connection cn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/sanchetihospitalproject",
        "root",
        "Sipcon@123"
);

PreparedStatement ps=cn.prepareStatement("SELECT * FROM Patients WHERE pdoc='"+sk.getAttribute("kp")+"' ");

ResultSet rs=ps.executeQuery();

while(rs.next()) {
%>
<tr>
    <td><%= rs.getInt(1) %></td>
    <td><%= rs.getString(2) %></td>
    <td><%= rs.getString(3) %></td>
    <td><%= rs.getString(4) %></td>
    <td><%= rs.getString(5) %></td>
    <td><%= rs.getString(6) %></td>
    <td><%= rs.getString(8) %></td>
    <td>
    <a href="Detailsinfo.jsp?ID=<%= rs.getInt(1) %>" class="btn btn-outline-info">Details</a>
    <a href="EditPatientInfo.jsp?ID=<%= rs.getInt(1) %>" class="btn btn-outline-primary">Edit</a>
    <a href="DeletePatientInfo.jsp?ID=<%= rs.getInt(1) %>" class="btn btn-outline-danger">Delete</a>
        </td>
    
</tr>
<%
}
%>


</table>
</body>
</html>