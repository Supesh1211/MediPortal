<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clinic Appointment Booking</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
        }

        /* Hero Section Orange + Blue */
        .hero {
            background: linear-gradient(135deg, #0d6efd, #fd7e14);
            height: 90vh;
            color: white;
            padding-top: 80px; /* navbar fix */
        }

        .hero h1 {
            font-size: 3rem;
            font-weight: bold;
        }

        .hero .btn {
            background-color: white;
            color: #0d6efd;
            font-weight: 600;
            border: none;
        }

        .hero .btn:hover {
            background-color: #fd7e14;
            color: white;
        }

        .service-card {
            transition: transform 0.3s;
        }

        .service-card:hover {
            transform: translateY(-10px);
        }

        footer {
            background-color: #0d6efd;
            color: white;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">HealthCare+</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="#services">Services</a></li>
                <li class="nav-item"><a class="nav-link" href="#appointment">Appointment</a></li>
                <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                <li class="nav-item"><a class="nav-link" href="DoctorRegister.html">Doctor Register</a></li>
                <li class="nav-item"><a class="nav-link" href="admin.jsp">Admin</a></li>
                
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero d-flex align-items-center">
    <div class="container text-center">
        <h1>Your Health, Our Priority</h1>
        <p class="lead mt-3">Book doctor appointments easily and quickly</p>
        <a href="#appointment" class="btn btn-lg mt-3">
            Book Appointment
        </a>
    </div>
</section>

<!-- Services Section -->
<section id="services" class="py-5">
    <div class="container">
        <h2 class="text-center mb-5">Our Services</h2>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card service-card text-center p-3">
                    <h4>General Checkup</h4>
                    <p>Routine health examinations and consultations.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card service-card text-center p-3">
                    <h4>Dental Care</h4>
                    <p>Advanced dental treatments and oral care.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card service-card text-center p-3">
                    <h4>Specialist Doctors</h4>
                    <p>Consult experienced medical specialists.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Appointment Section -->
<section id="appointment" class="py-5 bg-light">
    <div class="container">
        <h2 class="text-center mb-4">Book an Appointment</h2>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <form action="SavePatientInfo.jsp" method="post">
                    <div class="mb-3">
  <label class="form-label">Full Name</label>
  <input type="text" class="form-control" 
         placeholder="Enter your name" 
         name="t1" 
         pattern="[A-Za-z\s]+" 
         title="Only letters and spaces allowed" 
         required>
</div>

                    <div class="mb-3">
  <label class="form-label">Email</label>
  <input type="email" 
         class="form-control" 
         placeholder="Enter your email" 
         name="t2" 
         required
         pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
         title="Please enter a valid email address">
</div>

                    <div class="mb-3">
  <label class="form-label">Phone</label>
  <input type="tel" 
         class="form-control" 
         placeholder="Enter phone number" 
         name="t3" 
         pattern="[0-9]{10}" 
         title="Phone number must be exactly 10 digits" 
         required>
</div>

                    <div class="mb-3">
                        <label class="form-label">Appointment Date</label>
                        <input type="date" class="form-control" name="t4">
                    </div>
                    
                    <div class="mb-3">
  <label class="form-label">Time Slot</label>
  <select class="form-select" name="t5" required>
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

<select class="form-select" id="department" name=t6>

<option selected>Choose...</option>

<option value="General Medicine">General Medicine</option>

<option value="Cardiology">Cardiology</option>

<option value="Dermatology">Dermatology</option>
<option value="Dentel">Dentel</option>
<option value="Orthopedic">Orthopedic</option>
<option value="Pediatrician">Pediatrician</option>
</select>

</div>

<div class="mb-3">

<label for="Select Doctor" class="form-label">Select Doctor</label>

<select class="form-select" id="Select Doctor" name="t7">

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection cn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/sanchetihospitalproject",
        "root",
        "Sipcon@123"
);

PreparedStatement ps = cn.prepareStatement("SELECT dname FROM Doctor WHERE status='APPROVED'");
ResultSet rs = ps.executeQuery();

while (rs.next()) {
%>
    <option value="<%= rs.getString("dname")%>"><%= rs.getString("dname") %></option>
<%
}
%>

</select>
</div>
        
                    
                    
                    <button type="submit" class="btn btn-primary w-100">
                        Confirm Appointment
                    </button>
                </form>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer id="contact" class="py-4 text-center">
    <p class="mb-0">Â© 2026 HealthCare+ Clinic | All Rights Reserved</p>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
