<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DELETE</title>
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
		String selecteduser = request.getParameter("deleteselecteduser");
		

		//Make an insert statement for the Sells table:
		String str = "DELETE FROM Customers WHERE username = \"" + selecteduser + "\";";
		System.out.println(str);
		int result = stmt.executeUpdate(str);
		con.close();

		out.print("Delete succeeded!");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Delete failed :()");
	}
%>
<br>
</body>
</html>