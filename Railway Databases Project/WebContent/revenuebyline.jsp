<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Revenue By Line</title>
</head>
<body>
	<%

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			Statement stmt = con.createStatement();
			String str = "SELECT SUM(Total_fare) AS TotalSales, Transit_name AS Line FROM Reservation GROUP BY Line ORDER BY TotalSales DESC";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			result.next();
			out.println("Revenue by Line");
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Total Sales");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Transit Name");
			out.print("</td>");
			out.print("</tr>");
			result.previous();
			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("TotalSales"));
				out.print("</td>");
				out.print("<td>");
				//Print out current beer name:
				out.print(result.getString("Line"));
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