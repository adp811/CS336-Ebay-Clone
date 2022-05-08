<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.sql.*,java.time.*,java.time.format.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Updating Question with Response...</title>
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
			String question_id = request.getParameter("question_id");
			String responseBody = request.getParameter("responseBody");
			
			//Get current user
			int currentUser = (Integer)session.getAttribute("user_id");
			
			//get current date and time for when question was answered
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("uuuu-MM-dd HH:mm");
  			LocalDateTime now = LocalDateTime.now();
  			
  			String resDateTime = dtf.format(now);
  			
			//Make an insert statement for the users table:
			String update = "UPDATE questions SET cust_rep_id=" + currentUser + ", response_body='" + responseBody + "', res_date='" + resDateTime + "' WHERE question_id=" + question_id; 
			
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(update);
			
			
			//Run the query against the DB
			ps.executeUpdate(); 
	
			
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
	
	%>
			<a href="CustRepAnsweredQuestions.jsp">Question Answered Successfully.</a>
			<span>Redirecting to answer history in 5 seconds.</span>
			<script>
				window.setTimeout(() => {
					window.location.href = 'CustRepAnsweredQuestions.jsp'
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