<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
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
		int res_num = Integer.parseInt("reservation_num");
		String username = request.getParameter("username");
		String date = request.getParameter("date");
		Double total_fare = Double.parseDouble("total_fare");
		String customer_rep = request.getParameter("customer_rep");
		Double fee = Double.parseDouble("fee");
		String transit_name = request.getParameter("transit_name");
		

		//Make an insert statement for the Sells table:
		String insert = "UPDATE Reservation r SET reservation_number =?, username =?, date =?, total_fare =?, customer_rep =?, fee =?, transit_name =? WHERE r.reservation_number = \"" + res_num + "\";";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setInt(1, res_num);
		ps.setString(2, username);
		ps.setString(3, date);
		ps.setDouble(4, total_fare);
		ps.setString(6, customer_rep);
		ps.setDouble(5, fee);
		ps.setString(6, transit_name);

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