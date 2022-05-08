<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.sql.*,java.time.*,java.time.format.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Updating User Account Information...</title>
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
			String userID = request.getParameter("userID");
			String selection = request.getParameter("userInfoSelection");
			String newInformation = request.getParameter("newInformation");
			  		
			
			//Make an insert statement for the users table:
			String update = "UPDATE users SET " + selection + "='" + newInformation + "' WHERE user_id=" + userID; 
			
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(update);
			
			
			//Run the query against the DB
			ps.executeUpdate(); 
	
			
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
	
	%>
			<a href="EditUserAccounts.jsp">Account Information Updated Successfully.</a>
			<span>Redirecting to Edit User Accounts in 5 seconds.</span>
			<script>
				window.setTimeout(() => {
					window.location.href = 'EditUserAccounts.jsp'
				}, 5000)
			</script>
	<% 
			
		} catch (Exception ex) {
			out.print(ex);
			out.print("update failed :()");
		}	
	
	%>
</body>
</html>