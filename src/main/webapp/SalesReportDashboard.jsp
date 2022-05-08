<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<style>
	table {
	  font-family: arial, sans-serif;
	  border-collapse: collapse;
	  width: 100%;
	}
	
	td, th {
	  border: 1px solid #dddddd;
	  text-align: left;
	  padding: 8px;
	}
	
	tr:nth-child(even) {
	  background-color: #dddddd;
	}
	center-text {
	  text-align: center;
	}
	.spacer {
	  margin-top: 60px;
	}
	.spacer-text {
	  margin-top: 20px;
	}
</style>

<body>

	<nav style="display:flex;position:sticky;top:0;padding:10px;background:black;margin-bottom:10px;color:white;">
		<b>Admin Dashboard - User #<% out.print(session.getAttribute("user_id")); %></b>
		<div style="flex:1;"></div>
		<a href="RegisterCustRep.jsp" style="color:unset;margin-left:10px;">Register Customer Representative</a>
		<a href="SalesReportDashboard.jsp" style="color:unset;margin-left:10px;">Sales Reports</a>
		<a href="AdminLogin.jsp" style="color:unset;margin-left:10px;">Log out</a>
	</nav>

	<div class="spacer-text"></div>

	<h1>Generate Sales Reports</h1>
	
	<table>
		<thead>
			<tr>
				<th>Report Type</th>
				<th>Pick Date Range</th>
				<th>Download Report</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>total earnings</td>
				<td><input type="date"></input> - <input type="date"></input></td>
				<td><button>Download PDF</button> <button>Download CSV</button></td>
			</tr>
			<tr>
				<td>earnings per item</td>
				<td><input type="date"></input> - <input type="date"></input></td>
				<td><button>Download PDF</button> <button>Download CSV</button></td>
			</tr>
			<tr>
				<td>earnings per item type</td>
				<td><input type="date"></input> - <input type="date"></input></td>
				<td><button>Download PDF</button> <button>Download CSV</button></td>
			</tr>
			<tr>
				<td>earnings per end-user</td>
				<td><input type="date"></input> - <input type="date"></input></td>
				<td><button>Download PDF</button> <button>Download CSV</button></td>
			</tr>
			<tr>
				<td>best selling items</td>
				<td><input type="date"></input> - <input type="date"></input></td>
				<td><button>Download PDF</button> <button>Download CSV</button></td>
			</tr>
			<tr>
				<td>best buyers</td>
				<td><input type="date"></input> - <input type="date"></input></td>
				<td><button>Download PDF</button> <button>Download CSV</button></td>
			</tr>
		</tbody>
	</table>
	
</body>
</html>