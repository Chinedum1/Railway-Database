<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Browsing</title>

</head>
<body style="background-color:grey;">

		<br>
		<%
		List<String> list = new ArrayList<String>();

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			String input_origin = request.getParameter("search_origin");
			String input_dest = request.getParameter("search_destination");
			String input_date = request.getParameter("search_date");
			String input_sort = request.getParameter("sort_by");
		
			Statement stmt = con.createStatement();
			String str;
			if (input_sort.equals("AT")){
				 str = "SELECT * FROM Train_Itineraries T where T.Origin = \"" + input_origin + "\" AND T.Destination = \"" + input_dest+"\" AND T.Date = \"" + input_date+"\"ORDER BY T.Arrival;";
			}else if(input_sort.equals("DT")){
				str = "SELECT * FROM Train_Itineraries T where T.Origin = \"" + input_origin + "\" AND T.Destination = \"" + input_dest+"\" AND T.Date = \"" + input_date+"\"ORDER BY T.Departure;";
			}else if(input_sort.equals("O")){
				str = "SELECT * FROM Train_Itineraries T where T.Origin = \"" + input_origin + "\" AND T.Destination = \"" + input_dest+"\" AND T.Date = \"" + input_date+"\"ORDER BY T.Origin;";
			}
			else if(input_sort.equals("D")){
				str = "SELECT * FROM Train_Itineraries T where T.Origin = \"" + input_origin + "\" AND T.Destination = \"" + input_dest+"\" AND T.Date = \"" + input_date+"\"ORDER BY T.Destination;";
			}
			else if(input_sort.equals("F")){
				str = "SELECT * FROM Train_Itineraries T where T.Origin = \"" + input_origin + "\" AND T.Destination = \"" + input_dest+"\" AND T.Date = \"" + input_date+"\"ORDER BY T.FARE;";
			}
			else {
				 str = "SELECT * FROM Train_Itineraries T where T.Origin = \"" + input_origin + "\" AND T.Destination = \"" + input_dest+"\" AND T.Date = \"" + input_date+"\";";
			}
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			
			out.print("Departure Time");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Arrival Time");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Origin");
			out.print("</td>");
			out.print("<td>");
			out.print("Stops"); 
			out.print("</td>");
			out.print("<td>"); 
			out.print("Destination");
			out.print("</td>");
			out.print("<td>");
			out.print("Fare");
			out.print("</td>");
			
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("Departure"));
				out.print("</td>");
				out.print("<td>");
				//Print out current beer name:
				out.print(result.getString("Arrival"));
				out.print("</td>");
				out.print("<td>");
				//Print out current price
				out.print(result.getString("Origin"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("Stops")); 
				out.print("</td>");
				out.print("<td>");
				//Print out current price
				out.print(result.getString("Destination"));
				out.print("</td>");
				out.print("<td>");
				//Print out current price
				out.print(result.getString("Fare"));
				out.print("</td>");
				out.print("<td>");
				//Print out current price
				

			}
			out.print("</table>");

			//close the connection.
			con.close();

		} catch (Exception e) {
			out.print("ERRRORRRRR"); 
		}
	%><br>
	
		<form method="get" action="index.jsp">
		<input type="submit" value="Logout">
	</form>
	
	
</body>
</html>