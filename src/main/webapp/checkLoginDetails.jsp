<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Checking Details...</title>
</head>
<body>
	<%

	
		try {
					
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			
			//Create a SQL statement
			Statement stmt = con.createStatement();

			
			//Get parameters from the HTML form at Login.jsp
			String user_email = request.getParameter("email");
			String user_pass = request.getParameter("password");
			
			
			//make a SELECT query to retrieve user credentials
			String select = "SELECT user_id, email, password FROM users WHERE email='" + user_email + "' AND password='" + user_pass + "'";
			
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(select);
			
			
			//check if credentials exist in users table
			if(!result.next()) {
			
				out.print("Account does not exist or email/password is incorrect.");
				
			} else {
				
				out.print("Account credentials found! Moving on to the homepage user " + result.getInt("user_id"));
				session.setAttribute("user_id", result.getInt("user_id"));
				response.sendRedirect("HomePage.jsp");
				
			}
			
			
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
			
		} catch (Exception e){
			out.print(e);
			
		}
	
	
	%>
</body>
</html>