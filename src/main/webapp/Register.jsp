<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<center>
		
		<head>
	      <title>Register Form</title>
	 	</head>
	   
		<body>
		
			<h1>Register on Group 58's eBay Clone</h1>
			
			<form action="registerNewUser.jsp" method="POST"> <!-- Need to change action here -->
			
			  First Name: <input type="text" name="firstName"/> <br/>
			  Last Name: <input type="text" name="lastName"/> <br/>
			  Email: <input type="text" name="email"/> <br/>
			  Password: <input type="password" name="password"/> <br/>
			  Phone Number: <input type="text" name="phonenumber"/> <br/>
			  Birth Date: <input type="date" name="birthdate"/> <br/>
			  Address: <input type="text" name="address"/> <br/>
			  
			  <input type="submit" value="register"/>
			</form>
			
		</body> 
		
		<br/>
		
		<input type="button" value="Already have an account? Log in here!" onclick="window.location='Login.jsp'" >
		
	</center>
</html>