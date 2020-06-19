<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	try {
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		String message = request.getParameter("message");
		String add_message = "INSERT INTO Messages(message) + VALUES(?)";
		System.out.println(add_message);
		int result = stmt.executeUpdate(add_message);
		con.close();
		out.print("Message sent!");
		
	}catch (Exception e) {
		out.print(e);
		out.print("Add failed :()");
	}%>
</body>
</html>
</html>