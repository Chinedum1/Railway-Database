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
	</body>
	
									  
<br>

 <!-- Show html form to i) display something, ii) choose an action via a 
  | radio button -->
<!-- forms are used to collect user input 
	The default method when submitting form data is GET.
	However, when GET is used, the submitted form data will be visible in the page address field-->
Add Res
<br>
	<form method="get" action="addRes.jsp">
		<table>
			<tr>    
				<td>Reservation Number</td><td><input type="text" name="reservation_num"></td>
			</tr>
		</table>
		<input type="submit" value="Add Reservation">
	</form>
<br>
Delete Res
<br>
	<form method="get" action="deleteRes.jsp">
		<table>
			<tr>    
				<td>Reservation Number</td><td><input type="text" name="reservation_num"></td>
			</tr>
		</table>
		<input type="submit" value="Delete Reservation">
	</form>
<br>
Edit Res
<br>
	<form method="get" action="editRes.jsp">
			<table>
			<tr>    
				<td>Reservation Number</td><td><input type="text" name="reservation_num"></td>
			</tr>
		</table>
	<input type="submit" value="Edit Reservation">
	</form>
<br>
Add Schedule
<br>
	<form method="get" action="addSched.jsp">
		<table>
			<tr>    
				<td>Transit Name</td><td><input type="text" name="transit_name"></td>
			</tr>
		</table>
		<input type="submit" value="Add Schedule">
	</form>
<br>
Delete Schedule
<br>
	<form method="get" action="deleteRes.jsp">
		<table>
			<tr>    
				<td>Transit Name</td><td><input type="text" name="transit_name"></td>
			</tr>
		</table>
		<input type="submit" value="Delete Schedule">
	</form>
<br>
Edit Schedule
<br>
	<form method="get" action="editSched.jsp">
			<table>
			<tr>    
				<td>Transit Name</td><td><input type="text" name="transit_name"></td>
			</tr>
		</table>
	<input type="submit" value="Edit Schedule">
	</form>
<br>
Schedule
<br>
	<form method="get" action="scheduleList1.jsp">
			<table>
			<tr>    
				<td>Origin</td><td><input type="text" name="origin"></td>
			</tr>
						<tr>    
				<td>Destination</td><td><input type="text" name="destination"></td>
			</tr>
		</table>
	<input type="submit" value="View List">
	</form>
<br>
Name List
<br>
	<form method="get" action="customerList.jsp">
			<table>
			<tr>    
				<td>Transit Name</td><td><input type="text" name="transit_name"></td>
			</tr>
						<tr>    
				<td>Train ID</td><td><input type="text" name="train_id"></td>
			</tr>
		</table>
	<input type="submit" value="View List">
	</form>
<br>
Origin/Destination List
<br>
	<form method="get" action="UpdateSched2.jsp">
			<table>
			<tr>    
				<td>Transit Name</td><td><input type="text" name="transit_name"></td>
			</tr>
		</table>
	<input type="submit" value="View List">
	</form>
<br>
Message Customer
<br>
	<form method="get" action="CustomerQuestion.jsp">
		<table>
			<tr>    
				<td>Message</td><td><input type="text" name="message"></td>
			</tr>
		</table>
		<input type="submit" value="Send">
	</form>
<br>
</body>
</html>