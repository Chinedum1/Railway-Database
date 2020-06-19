<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sales Report by Month</title>
</head>
<body>
	<%
		List<String> list = new ArrayList<String>();

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			String transit_name = request.getParameter("transit_name");
			String train_id = request.getParameter("train_id");
			Statement stmt = con.createStatement();
			String str = "SELECT c.username FROM Customers c, Reservation r, Based_on b, Uses u WHERE b.train_id = \"" + train_id + "\" AND b.transit_name = r.transit_name AND r.transit_name = \"" + transit_name + "\" AND u.reservation_num = r.reservation_num AND c.reservation_num = u.reservation_num";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a rowl
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Transit Name/ Train ID");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Username");
			out.print("</td>");
			out.print("<td>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("transit_name"));
				out.print(result.getString("transit_id"));
				out.print("</td>");
				out.print("<td>");
				//Print out current beer name:
				out.print(result.getString("username"));
				out.print("</td>");
				out.print("<td>");

			}
			out.print("</table>");

			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>

</body>
</html>