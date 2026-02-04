<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>
<%
String pname  = request.getParameter("t1"); // Full Name
String pemail = request.getParameter("t2"); // Email
String pphone = request.getParameter("t3");
String pappod = request.getParameter("t4"); // yyyy-MM-dd
String ptslot = request.getParameter("t5");
String pdep   = request.getParameter("t6");
String pdoc   = request.getParameter("t7");

// --- Simple validation ---
// Name: must not be empty and only letters/spaces
boolean validName = (pname != null && pname.length() > 0 
                     && pname.chars().allMatch(ch -> Character.isLetter(ch) || Character.isWhitespace(ch)));

// Email: must not be empty and must contain '@'
boolean validEmail = (pemail != null && pemail.length() > 0 && pemail.contains("@"));

// Phone: must be exactly 10 digits
boolean validPhone = (pphone != null && pphone.matches("\\d{10}"));

// Date: must not be in the past
boolean validDate = false;
try {
    LocalDate today = LocalDate.now();
    LocalDate appointmentDate = LocalDate.parse(pappod);
    validDate = !appointmentDate.isBefore(today);
} catch (Exception ex) {
    validDate = false;
}

if (!validName) {
    out.println("Invalid Name: Only letters and spaces allowed.");
} else if (!validEmail) {
    out.println("Invalid Email: Must contain '@'.");
} else if (!validPhone) {
    out.println("Invalid Phone: Must be exactly 10 digits.");
} else if (!validDate) {
    out.println("Invalid Date: Cannot book appointments in the past.");
} else {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection cn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/sanchetihospitalproject",
            "root",
            "Sipcon@123"
        );

        // --- Check if slot already booked ---
        PreparedStatement check = cn.prepareStatement(
            "SELECT COUNT(*) FROM Patients WHERE pappod = ? AND ptslot = ?"
        );
        check.setString(1, pappod);
        check.setString(2, ptslot);
        ResultSet rsCheck = check.executeQuery();
        rsCheck.next();
        int count = rsCheck.getInt(1);

        if (count > 0) {
            out.println("This time slot is already booked for that day. Please choose another.");
        } else {
            // --- Insert new appointment ---
            PreparedStatement ps = cn.prepareStatement(
                "INSERT INTO Patients(pname,pemail,pphone,pappod,ptslot,pdep,pdoc) VALUES (?,?,?,?,?,?,?)"
            );
            ps.setString(1, pname);
            ps.setString(2, pemail);
            ps.setString(3, pphone);
            ps.setString(4, pappod);
            ps.setString(5, ptslot);
            ps.setString(6, pdep);
            ps.setString(7, pdoc);

            int rows = ps.executeUpdate();
            if (rows > 0) {
                out.println("Appointment Booked Successfully!");
            } else {
                out.println("Failed to book appointment.");
            }

            ps.close();
        }

        check.close();
        cn.close();
    } catch (Exception ex) {
        out.println("Error: " + ex.getMessage());
    }
}
%>
