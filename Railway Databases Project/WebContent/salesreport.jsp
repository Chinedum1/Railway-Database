<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
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
			
			Statement stmt = con.createStatement();
			String str = "SELECT YEAR(date) as SalesYear,MONTH(date) as SalesMonth,SUM(Total_fare) AS TotalSales FROM Reservation GROUP BY YEAR(date), MONTH(date) ORDER BY YEAR(date), MONTH(date);";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Sales Year");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Sales Month");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Total Sales");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("SalesYear"));
				out.print("</td>");
				out.print("<td>");
				//Print out current beer name:
				out.print(result.getString("SalesMonth"));
				out.print("</td>");
				out.print("<td>");
				//Print out current price
				out.print(result.getString("TotalSales"));
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