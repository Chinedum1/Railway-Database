<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Login/Register</title>
	</head>
	<body>
	<% 
	session.setAttribute("current_user", null);
    %>
	</body>
	
									  
<br>

 <!-- Show html form to i) display something, ii) choose an action via a 
  | radio button -->
<!-- forms are used to collect user input 
	The default method when submitting form data is GET.
	However, when GET is used, the submitted form data will be visible in the page address field-->
Login
<br>
	<form method="get" action="main.jsp">
		<table>
			<tr>    
				<td>Username</td><td><input type="text" name="login_username"></td>
			</tr>
			<tr>
				<td>Password</td><td><input type="text" name="login_password"></td>
			</tr>
		</table>
		<input type="submit" value="Login">
	</form>
<br>

Admin Login
<br>
	<form method="get" action="admain.jsp">
		<table>
			<tr>    
				<td>Username</td><td><input type="text" name="admin_username"></td>
			</tr>
			<tr>
				<td>Password</td><td><input type="text" name="admin_password"></td>
			</tr>
		</table>
		<input type="submit" value="Login">
	</form>
<br>

Register
<br>
	<form method="post" action="register.jsp">
	<table>
	<tr>    
	<td>Choose a username</td><td><input type="text" name="username"></td>
	</tr>
	<tr>
	<td>Email</td><td><input type="text" name="email"></td>
	</tr>
	<tr>
	<td>First Name</td><td><input type="text" name="first_name"></td>
	</tr>
	<tr>
	<td>Last Name</td><td><input type="text" name="last_name"></td>
	</tr>
	<tr>
	<td>Telephone</td><td><input type="text" name="phone"></td>
	</tr>
	<tr>
	<td>Address</td><td><input type="text" name="address"></td>
	</tr>
	<tr>
	<td>Zip Code</td><td><input type="text" name="zipcode"></td>
	</tr>
	<tr>
	<td>City</td><td><input type="text" name="city"></td>
	</tr>
	<tr>
	<td>State</td><td><input type="text" name="state"></td>
	</tr>
	<tr>
	<td>Choose a password</td><td><input type="text" name="password"></td>
	</tr>
	</table>
	<input type="submit" value="Register New User">
	</form>
<br>

</body>
</html>