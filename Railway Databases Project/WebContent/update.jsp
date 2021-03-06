<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update</title>
</head>
<body>
	<%
	try {
	

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the HelloWorld.jsp
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String first = request.getParameter("first_name");
		String last = request.getParameter("last_name");
		String email = request.getParameter("email");
		int telephone = Integer.parseInt(request.getParameter("phone"));
		String address = request.getParameter("address");
		int zipcode = Integer.parseInt(request.getParameter("zipcode"));
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		

		//Make an insert statement for the Sells table:
		String insert = "UPDATE Customers c SET username =?, password =?, email =?, first_name =?, last_name =?, telephone =?, address =?, zipcode =?, city =?, state =? WHERE c.username = \"" + username + "\";";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, username);
		ps.setString(2, password);
		ps.setString(3, email);
		ps.setString(4, first);
		ps.setString(5, last);
		ps.setInt(6, telephone);
		ps.setString(7, address);
		ps.setInt(8, zipcode);
		ps.setString(9, city);
		ps.setString(10, state);
		//Run the query against the DB
		ps.executeUpdate();

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		out.print("Update succeeded!");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Update faileda :()");
	}
%>
</body>
</html>