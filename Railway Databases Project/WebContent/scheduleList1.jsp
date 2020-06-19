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
			String origin = request.getParameter("origin");
			String destination = request.getParameter("destination");
			Statement stmt = con.createStatement();
			String str = "SELECT * FROM Schedules where origin = \"" + origin + "\" AND destination = \"" + destination + "\";";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a rowl
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Origin/Destination");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Transit name");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Train");
			out.print("</td>");
			out.print("<td>");
			out.print("Seats Available");
			out.print("</td>");
			out.print("<td>");
			out.print("Stops");
			out.print("</td>");
			out.print("<td>");
			out.print("Departure");
			out.print("</td>");
			out.print("<td>");
			out.print("Arrival");
			out.print("</td>");
			out.print("</tr>");
			out.print("Travel time");
			out.print("</td>");
			out.print("</tr>");
			out.print("Travel fare");
			out.print("</td>");
			out.print("</tr>");
			out.print("isDelayed");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("origin"));
				out.print(result.getString("destination"));
				out.print("</td>");
				out.print("<td>");
				//Print out current beer name:
				out.print(result.getString("transit_name"));
				out.print("</td>");
				out.print("<td>");
				//Print out current price
				out.print(result.getString("train"));
				out.print("</td>");
				out.print("<td>");
				//Print out current price
				out.print(result.getString("seats_available"));
				out.print("</td>");
				out.print("<td>");
				//Print out current price
				out.print(result.getString("stops"));
				out.print("</td>");
				out.print("<td>");
				//Print out current price
				out.print(result.getString("departure"));
				out.print("</td>");
				out.print("<td>");
				//Print out current price
				out.print(result.getString("arrival"));
				out.print("</td>");
				out.print("</tr>");
				out.print(result.getString("travel_time"));
				out.print("</td>");
				out.print("</tr>");
				out.print(result.getString("travel_fare"));
				out.print("</td>");
				out.print("</tr>");
				out.print(result.getString("isdelayed"));
				out.print("</td>");
				out.print("</tr>");

			}
			out.print("</table>");

			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>

</body>
</html>