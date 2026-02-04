<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin - Verify Doctors</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f8f9fa;
    }
    header {
      background-color: #0d6efd;
      color: white;
      padding: 15px;
      margin-bottom: 20px;
    }
    .card {
      transition: transform 0.2s;
    }
    .card:hover {
      transform: translateY(-5px);
    }
    .btn-confirm {
      background-color: #28a745;
      color: white;
    }
    .btn-reject {
      background-color: #dc3545;
      color: white;
    }
  </style>
</head>
<body>

  <!-- Header -->
  <header class="text-center">
    <h2>Admin Panel - Doctor Verification</h2>
  </header>

  <!-- Doctor Verification Table -->
  
  
<div class="container">
<h4 class="mb-4">Pending Doctor Registrations</h4>

<table class="table table-bordered">
<tr>
  <th>Name</th>
  <th>Email</th>
  <th>Phone</th>
  <th>Specialization</th>
  <th>Action</th>
</tr>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection cn=DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/sanchetihospitalproject",
    "root",
    "Sipcon@123"
);

PreparedStatement ps = cn.prepareStatement(
    "SELECT * FROM Doctor WHERE status='PENDING'"
);
ResultSet rs = ps.executeQuery();

while(rs.next()){
%>
<tr>
  <td><%=rs.getString("dname")%></td>
  <td><%=rs.getString("demail")%></td>
  <td><%=rs.getString("dphone")%></td>
  <td><%=rs.getString("dspec")%></td>
  <td>
  <a href="<%=request.getContextPath()%>/approvedoctor.jsp?id=<%=rs.getInt("did")%>"
   class="btn btn-confirm btn-sm">Approve</a>

<a href="<%=request.getContextPath()%>/rejectDoctor.jsp?id=<%=rs.getInt("did")%>"
   class="btn btn-reject btn-sm">Reject</a>

  </td>
</tr>
<% } %>

<%
rs.close();
ps.close();
cn.close();
%>

</table>
</div>

    

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
