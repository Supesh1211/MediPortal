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

String x=request.getParameter("ID");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection cn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/sanchetihospitalproject",
        "root",
        "Sipcon@123");
 PreparedStatement ps= cn.prepareStatement("SELECT * FROM Patients WHERE pid='"+x+"'");
 ResultSet rs=ps.executeQuery();
 
 rs.next();
 
/*  out.println(rs.getInt(1));
 out.println(rs.getString(2));
 out.println(rs.getString(3));
 out.println(rs.getString(4));
 out.println(rs.getString(5));
 out.println(rs.getString(6));
 out.println(rs.getString(8)); */

      %>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
 <!-- Appointment Section -->
<section id="appointment" class="py-5 bg-light">
    <div class="container">
        <h2 class="text-center mb-4">Edit patient info</h2>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <form action="UpdatePatientInfo.jsp" method="post">
                
                
                
                <div class="mb-3">
                    
                    
  <input type="hidden" value="<%= rs.getInt(1)%>" class="form-control" 
         placeholder="Enter your name" 
         name="f" 
         pattern="[A-Za-z\s]+" 
         title="Only letters and spaces allowed" 
         required>
                
                
                
                
                    <div class="mb-3">
                    
                    
  <label class="form-label">Full Name</label>
  <input type="text" value="<%= rs.getString(2)%>" class="form-control" 
         placeholder="Enter your name" 
         name="t1" 
         pattern="[A-Za-z\s]+" 
         title="Only letters and spaces allowed" 
         required>
</div>

                    <div class="mb-3">
  <label class="form-label">Email</label>
  <input type="email" value="<%= rs.getString(3)%>"
         class="form-control" 
         placeholder="Enter your email" 
         name="t2" 
         required
         pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
         title="Please enter a valid email address">
</div>

                    <div class="mb-3">
  <label class="form-label">Phone</label>
  <input type="tel" value="<%= rs.getString(4)%>"
         class="form-control" 
         placeholder="Enter phone number" 
         name="t3" 
         pattern="[0-9]{10}" 
         title="Phone number must be exactly 10 digits" 
         required>
</div>

                    <div class="mb-3">
                        <label class="form-label">Appointment Date</label>
                        <input type="date" value="<%= rs.getString(5)%>" class="form-control" name="t4">
                    </div>
                    
                    <div class="mb-3">
  <label class="form-label">Time Slot</label> 
  <select class="form-select" name="t5"  required>
    <option selected disabled>Choose a time slot...</option>
    
    <option value="10:00 AM">10:00 AM - 10:30 AM</option>
    <option value="10:30 AM">10:30 AM - 11:00 AM</option>
    <option value="11:00 AM">11:00 AM - 11:30 AM</option>
    <option value="11:30 AM">11:30 AM - 12:00 PM</option>
    <option value="02:00 PM">02:00 PM - 02:30 PM</option>
    <option value="02:30 PM">02:30 PM - 03:00 PM</option>
    <option value="03:00 PM">03:00 PM - 03:30 PM</option>
    <option value="03:30 PM">03:30 PM - 04:00 PM</option>
    <option value="04:00 PM">04:00 PM - 04:30 PM</option>
    <option value="04:30 PM">04:30 PM - 05:00 PM</option>
  </select>
</div>

              
                    
                    <div class="mb-3">

<label for="department" class="form-Label">Department</label>

<select class="form-select" id="department" value="<%= rs.getString(6)%>" name=t6>

<option selected>Choose...</option>

<option value="General Medicine">General Medicine</option>

<option value="Cardiology">Cardiology</option>

<option value="Dermatology">Dermatology</option>
<option value="Dentel">Dentel</option>
<option value="Orthopedic">Orthopedic</option>
<option value="Pediatrician">Pediatrician</option>
</select>

</div>

        
                    
                    
                    <button type="submit" class="btn btn-primary w-100">
                        Upadate
                    </button>
                </form>
            </div>
        </div>
    </div>
</section>
 
        
</body>
</html>