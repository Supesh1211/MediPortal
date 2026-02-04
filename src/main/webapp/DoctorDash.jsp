<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Doctor Dashboard</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <div class="dashboard">
    <!-- Sidebar -->
    <div class="sidebar">
      <h2>Doctor Panel</h2>
      <ul>
        <li><a href="#">🏠 Dashboard</a></li>
        <li><a href="patientsinfo.jsp">👨‍⚕️ Patients</a></li>
        <li><a href="#">📅 Appointments</a></li>
        <li><a href="#">💊 Prescriptions</a></li>
        <li><a href="#">📈 Reports</a></li>
        <li><a href="#">⚙️ Settings</a></li>
        <li><a href="#">🚪 Logout</a></li>
      </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
      <h1>Welcome, Doctor ! <% HttpSession s1=request.getSession(); out.println(s1.getAttribute("kp")); %></h1>
      <p>Select an option from the left menu to get started.</p>
    </div>
  </div>
</body>
</html>


</body>
</html>

<style>


/* General Reset */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Segoe UI", sans-serif;
}

/* Dashboard Layout */
.dashboard {
  display: flex;
  min-height: 100vh;
}

/* Sidebar */
.sidebar {
  width: 250px;
  background: #2c3e50;
  color: #fff;
  padding: 20px;
}

.sidebar h2 {
  text-align: center;
  margin-bottom: 30px;
  font-size: 22px;
  border-bottom: 1px solid #444;
  padding-bottom: 10px;
}

.sidebar ul {
  list-style: none;
}

.sidebar ul li {
  margin: 15px 0;
}

.sidebar ul li a {
  text-decoration: none;
  color: #ddd;
  font-size: 16px;
  display: block;
  padding: 10px;
  border-radius: 5px;
  transition: background 0.3s, color 0.3s;
}

.sidebar ul li a:hover {
  background: #1abc9c;
  color: #fff;
}

/* Main Content */
.main-content {
  flex: 1;
  background: #ecf0f1;
  padding: 40px;
}

.main-content h1 {
  margin-bottom: 20px;
  color: #2c3e50;
}
</style>