<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>ADMAIN</title>
	</head>
	<body>
	
		<% try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp
			String login_username = request.getParameter("admin_username");
			String login_password = request.getParameter("admin_password");
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT * FROM Customers c where c.username = \"" + login_username + "\" and c.password = \"" + login_password + "\";";
			ResultSet result = stmt.executeQuery(str);
			result.next();
			String current_user = result.getString("username");
			result.close();
			session.setAttribute("current_user", current_user);	
			out.println("Admin is logged in");
			con.close();
			
			db = new ApplicationDB();
			con = db.getConnection();
		    stmt = con.createStatement();
		    str = "SELECT c.username FROM Customers c";
		    result = stmt.executeQuery(str);
		    int i = 0;
		    while(result.next())
		    {
		    	i++;
		    }
		    List<String> users = new ArrayList<String>();
		    result.first();
		    for(int l = 0; l < i; l++)
		    {
		    	users.add(result.getString("username"));
		    	result.next();
		    }
		    request.setAttribute("users", users);
		    con.close();
		    
		    db = new ApplicationDB();
			con = db.getConnection();
		    stmt = con.createStatement();
		    str = "SELECT Transit_name FROM Reservation";
		    result = stmt.executeQuery(str);
		    i = 0;
		    while(result.next())
		    {
		    	i++;
		    }
		    List<String> Transit_names = new ArrayList<String>();
		    result.first();
		    for(int z = 0; z < i; z++)
		    {
		    	if(!Transit_names.contains(result.getString("Transit_name")))
		    	{
		    		Transit_names.add(result.getString("Transit_name"));
		    	}
		    		result.next();
		    }
		    request.setAttribute("Transit_names", Transit_names);
		    con.close();
		%>
			

			
		<%} catch (Exception e) {
			out.print(e);
			out.print("Admin login failed please return to previous page and try again");
		}%> 
				</br>
	            <form action = "edit.jsp">
				<select name = "editselecteduser">
   				<c:forEach var="line" items="${users}">
        		<option><c:out value="${line}"/></option>
   				</c:forEach>
 				</select>
 				<input type = "submit" value = "Edit Selected User">
 				</form>
				
				
		
				</br>
	            <form action = "delete.jsp">
				<select name = "deleteselecteduser">
   				<c:forEach var="line" items="${users}">
        		<option><c:out value="${line}"/></option>
   				</c:forEach>
 				</select>
 				<input type = "submit" value = "Delete Selected User">
 				</form>
				
				</br>
	            <form action = "creservationlist.jsp">
				<select name = "reservationselecteduser">
   				<c:forEach var="line" items="${users}">
        		<option><c:out value="${line}"/></option>
   				</c:forEach>
 				</select>
 				<input type = "submit" value = "See Reservations List for Selected User">
 				</form>
 				
 				
 				</br>
	            <form action = "reservationtransit.jsp">
				<select name = "reservationselectedline">
   				<c:forEach var="line" items="${Transit_names}">
        		<option><c:out value="${line}"/></option>
   				</c:forEach>
 				</select>
 				<input type = "submit" value = "Get Reservations for Selected Transit Line">
 				</form>
				
			<br>
			<form method="get" action="salesreport.jsp">
			<br> <input type="submit" value="Get Sales Report by Month">
	</form>
<br>
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
	<br>
	<form method="get" action="bestcustomer.jsp">
		<input type="submit" value="Best Customers List">
	</form>
	<br>
	
	<br>
	<form method="get" action="top5lines.jsp">
		<input type="submit" value="Top 5 Most Active Lines">
	</form>
	<br>
	
	<br>
	<form method="get" action="revenuebyline.jsp">
		<input type="submit" value="Revenue by Transit Line">
	</form>
	<br>
	
	<body>
	<br>
	<form method="get" action="index.jsp">
		<input type="submit" value="Logout">
	</form>
<br>
	
	</body>
	
</html>

