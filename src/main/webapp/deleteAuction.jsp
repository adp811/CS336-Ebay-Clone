<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.sql.*,java.time.*,java.time.format.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deleting Auction Listing...</title>
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
			String listingID = request.getParameter("listingID");
						
 
			//Make an insert statement for the users table:
			String delete = "DELETE FROM listing WHERE listing_id=" + listingID; 
			
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(delete);
			
			
			//Run the query against the DB
			ps.executeUpdate(); 
	
			
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
	
	%>
			<a href="ManageBidAndAuction.jsp">Auction Listing Deleted Successfully.</a>
			<span>Redirecting to Manage Bids and Auctions in 3 seconds.</span>
			<script>
				window.setTimeout(() => {
					window.location.href = 'ManageBidAndAuction.jsp'
				}, 3000)
			</script>
	<% 
			
		} catch (Exception ex) {
			out.print(ex);
			out.print("delete failed :()");
		}	
	
	%>
</body>
</html>