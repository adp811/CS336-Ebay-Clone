<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Dashboard</title>

	<style>
	    .button {
    		display:block;      
    		margin:0 auto;
	        border: 4px solid black;
	        border-radius: 8px;
			background-color: white;
			color: black; 
			padding: 14px 28px;
			font-size: 18px;
			font-weight: 675;
			cursor: pointer;
	    }
		.center-hv {
			position: absolute;
			left: 50%;
			top: 50%;
			-webkit-transform: translate(-50%, -50%);
			transform: translate(-50%, -50%);
		}
    </style>

</head>
<body>
	
	<nav style="display:flex;position:sticky;top:0;padding:10px;background:black;margin-bottom:10px;color:white;">
		<b>Admin Dashboard - User #<% out.print(session.getAttribute("user_id")); %></b>
		<div style="flex:1;"></div>
		<a href="RegisterCustRep.jsp" style="color:unset;margin-left:10px;">Register Customer Representative</a>
		<a href="SalesReportDashboard.jsp" style="color:unset;margin-left:10px;">Sales Reports</a>
		<a href="AdminLogin.jsp" style="color:unset;margin-left:10px;">Log out</a>
	</nav>
	
	<div class="center-hv">
		
		<input class="button" type="button" value="Create Customer Representative Account" onclick="window.location='RegisterCustRep.jsp'" >
	
		<br/>
	
		<input class="button" type="button" value="Generate and Manage Sales Reports" onclick="window.location='SalesReportDashboard.jsp'" >
		
	</div>
	
</body>
</html>