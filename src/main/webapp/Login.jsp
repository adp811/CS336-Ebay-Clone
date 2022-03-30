<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<center>

		<head>
	      <title>Login Form</title>
	 	</head>
	   
		<body>
		
			<h1>Login to Group 58's eBay Clone</h1>
			
			<form action="checkLoginDetails.jsp" method="POST"> <!-- Need to change action here -->
			  email: <input type="text" name="email"/> <br/>
			  Password:<input type="password" name="password"/> <br/>
			  <input type="submit" value="login"/>
			</form>
			
		</body> 
		
		<br/>
		
		<input type="button" value="Don't have an account? Create one here!" onclick="window.location='Register.jsp'" >

	</center>
</html>