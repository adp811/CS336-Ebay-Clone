<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registering New Item...</title>
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
			String itemImageURL = request.getParameter("itemImageURL");
			String itemName = request.getParameter("itemName");
			String itemBrand = request.getParameter("itemBrand");
			String itemSubcategory = request.getParameter("itemSubcategory");
			String itemDescription = request.getParameter("itemDescription");
			String itemStartingPrice = request.getParameter("itemStartingPrice");
			String itemSafetyPrice = request.getParameter("itemSafetyPrice");
			String itemCloseDate = request.getParameter("itemCloseDate");

			//Make an insert statement for the users table:
			String insert = "INSERT INTO listing (itemImageURL, itemName, itemBrand, itemSubcategory, itemDescription, itemStartingPrice, itemSafetyPrice, itemCloseDate) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)"; 
			
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);
			
	
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, itemImageURL);
			ps.setString(2, itemName);
			ps.setString(3, itemBrand);
			ps.setString(4, itemSubcategory);
			ps.setString(5, itemDescription);
			ps.setString(6, itemStartingPrice);
			ps.setString(7, itemSafetyPrice);			
			ps.setString(8, itemCloseDate);			

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