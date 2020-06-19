<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reservations for Selected Line</title>
</head>
<body>
	<%
		List<String> list = new ArrayList<String>();

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			String selectedline = request.getParameter("reservationselectedline");
			Statement stmt = con.createStatement();
			String str = "SELECT * FROM Reservation r where r.Transit_name = \"" + selectedline + "\";";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Reservation Number");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("User Name");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Date");
			out.print("</td>");
			out.print("<td>");
			out.print("Total Fare");
			out.print("</td>");
			out.print("<td>");
			out.print("Customer Rep");
			out.print("</td>");
			out.print("<td>");
			out.print("Fee");
			out.print("</td>");
			out.print("<td>");
			out.print("Transit Name");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("Reservation_number"));
				out.print("</td>");
				out.print("<td>");
				//Print out current beer name:
				out.print(result.getString("username"));
				out.print("</td>");
				out.print("<td>");
				//Print out current price
				out.print(result.getString("Date"));
				out.print("</td>");
				out.print("<td>");
				//Print out current price
				out.print(result.getString("Total_fare"));
				out.print("</td>");
				out.print("<td>");
				//Print out current price
				out.print(result.getString("Customer_rep"));
				out.print("</td>");
				out.print("<td>");
				//Print out current price
				out.print(result.getString("Fee"));
				out.print("</td>");
				out.print("<td>");
				//Print out current price
				out.print(result.getString("Transit_name"));
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