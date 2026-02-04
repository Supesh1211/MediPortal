<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password</title>
</head>
<body>

<h2>Reset Your Password</h2>

<form action="UpdatePassword.jsp" method="post">
    <!-- Hidden field carries the doctorID from previous page -->
    <input type="hidden" name="doctorID" value="<%= request.getParameter("doctorID") %>">

    <p>Enter New Password:</p>
    <input type="password" name="newPassword" required>

    <p>Confirm New Password:</p>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password</title>
</head>
<body>

<h2>Reset Your Password</h2>

<form action="UpdatePassword.jsp" method="post">
    <!-- Hidden field carries doctorID from previous page -->
    <input type="hidden" name="doctorID" value="<%= request.getParameter("doctorID") %>">

    <p>Enter New Password:</p>
    <input type="password" name="newPassword" required>

    <p>Confirm New Password:</p>
    <input type="password" name="confirmPassword" required>

    <button type="submit">Update Password</button>
</form>

</body>
</html>
    e="password" name="confirmPassword" required>

    <button type="submit">Update Password</button>
</form>

</body>
</html>
