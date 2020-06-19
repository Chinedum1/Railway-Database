<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>REGULAR MAIN</title>
	</head>
	<body style="background-color:grey;">
		<% try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp
			String login_username = request.getParameter("login_username");
			String login_password = request.getParameter("login_password");
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT * FROM Customers c where c.username = \"" + login_username + "\" and c.password = \"" + login_password + "\";";
			ResultSet result = stmt.executeQuery(str);
			result.next();
			String current_user = result.getString("username");
			result.close();
			session.setAttribute("current_user", current_user);	
			out.print("Current User: " + session.getAttribute("current_user"));
		%>
			

			
		<%} catch (Exception e) {
			out.print(e);
			out.print("Login failed please return to previous page and try again");
		}%>
		<br>
		Search 
		<br>
	<form method="get" action="browse.jsp">
		<table>
			<tr>    
				<td>Origin</td><td><input type="text" name="search_origin"></td>
			</tr>
			<tr>
				<td>Destination</td><td><input type="text" name="search_destination"></td>
			</tr>
			<tr>
				<td>Date(YYYY-MM-DD)</td><td><input type="text" name = "search_date"></td>
				</tr>
				<tr>
				<td>SortBy(AT, DT, O, D, F, N)</td><td><input type="text" name = "sort_by"></td>
				
		</table>
		
		<p>	AT: Arrival Time  DT: Destination Time  O: Origin </p><p> D: Destination  F: Fare  N: None
			</p>
			<p> All fields must be filled in </p>
		<input type="submit" value="Search">
		
	</form>
<br>
	<br>
	<form method="get" action="CustomerRepresentative.jsp">
		<input type="submit" value="Customer Rep Page">
	</form>
<br>

<br>
	<form method="get" action="message-prompt.jsp">
		<input type="submit" value="Messaging Page">
	</form>
<br>

<br>


	</body>
	
	<body>
	<br>
	<form method="get" action="index.jsp">
		<input type="submit" value="Logout">
	</form>
<br>
	
	</body>
	
</html>