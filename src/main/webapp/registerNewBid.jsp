<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registering New Bid...</title>
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
			
			String listing_id = "" + request.getParameter("listingID");
			String user_id = "" + session.getAttribute("user_id");
			String price = request.getParameter("bidAmount");

			//Make an insert statement for the users table:
			String insert = "INSERT INTO bids (listing_id, user_id, price) "
					+ "VALUES (?, ?, ?)"; 
			
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);
			
	
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, listing_id);
			ps.setString(2, user_id);
			ps.setString(3, price);
			
			//Run the query against the DB
			ps.executeUpdate(); 
	
			
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
			response.sendRedirect("HomePage.jsp");	
			
		} catch (Exception ex) {
			out.print(ex);
			out.print("Insert failed :()");
		}	
	
	%>
</body>
</html>