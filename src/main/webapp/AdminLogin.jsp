<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
	<style>
		.form {
			display: block;
			border: 3px solid black;
			border-radius: 5px;
			height: 40px;
			background-color: #ffffff;
			color: black;
			width: 100%;
			user-select: auto;
			font-size: 16px;
			padding-left: 10px;
			box-sizing: border-box;
		}
		.button-login {
    		display:block;      
    		margin:0 auto;
	        border: 3px solid black;
	        border-radius: 8px;
			background-color: #28b463 ;
			color: white;
			padding: 12px 26px;
			width: 275px;
			font-size: 17px;
			font-weight: 650;
			cursor: pointer;
	    }
		.center-hv {
			position: absolute;
			left: 50%;
			top: 50%;
			-webkit-transform: translate(-50%, -50%);
			transform: translate(-50%, -50%);
		}
		.spacer {
			margin-top: 75px;
		}
    </style>
</head>
 
<body>

	<div class="center-hv">
	
		<h1>eBay Clone Admin Login</h1>
	
		<br/>
		
		<form action="checkAdminLoginDetails.jsp" method="POST"> <!-- Need to change action here -->
			<input class="form" type="text" name="email" placeholder="email address" /> <br/>
			<input class="form" type="password" name="password" placeholder="password"/> <br/>
			<input class="button-login" type="submit" value="login to admin dashboard"/>
		</form>
	
		
	</div>
	
</body> 
	
	
</html>