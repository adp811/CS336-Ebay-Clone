<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.time.*,java.time.format.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Submitting New Question...</title>
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
			String questionTitle = request.getParameter("title");
			String questionBody = request.getParameter("body");
			
			//get current date and time for when question was submitted
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("uuuu-MM-dd HH:mm");
  			LocalDateTime now = LocalDateTime.now();
  			
  			String askDateTime = dtf.format(now);
  			
			//user parameters
			//String user_id = "1"; //change to get user id of current user
			String user_id = "" + session.getAttribute("user_id");
				
			//Make an insert statement for the users table:
			String insert = "INSERT INTO questions (user_id, question_title, question_body, ask_date) "
					+ "VALUES (?, ?, ?, ?)"; 
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);
			
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, user_id);
			ps.setString(2, questionTitle);
			ps.setString(3, questionBody);
			ps.setString(4, askDateTime);
			
			//Run the query against the DB
			ps.executeUpdate(); 
	
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
	
	%>
			<a href="ViewUserQuestionHistory.jsp">Question submitted successfully.</a>
			<span>Redirecting to question history in 5 seconds.</span>
			<script>
				window.setTimeout(() => {
					window.location.href = 'ViewUserQuestionHistory.jsp'
				}, 5000)
			</script>
	<% 
			
		} catch (Exception ex) {
			out.print(ex);
			out.print("Insert failed :()");
		}	
	
	%>
</body>
</html>