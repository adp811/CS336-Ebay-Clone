<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Question History</title>
	<style>
		.center-hv {
			position: absolute;
			left: 50%;
			top: 50%;
			-webkit-transform: translate(-50%, -50%);
			transform: translate(-50%, -50%);
		}
		.spacer {
			margin-top: 60px;
		}
		
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
    </style>
</head>
 
<body>

	<div class="center-hv">
	
	<h3>Questions</h3>
	
	<table>
	<thead>
	  <tr>
	    <th>Title</th>
	    <th>Body</th>
	    <th>Ask Date</th>
	    <th>Response Body</th>
	  </tr>
	  </thead>
	  <tbody>
	  
	  	<% 
			try{
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();		
				Statement stmt = con.createStatement();
				String str = "SELECT question_title, question_body, ask_date, response_body FROM questions";
				ResultSet result = stmt.executeQuery(str);
				
				while (result.next()) {
					  String questionTitle = result.getString(1);
					  String questionBody = result.getString(2);
					  String askDate = result.getString(3);
					  String responseBody = result.getString(4);
					  responseBody = responseBody == null ? "not answered" : responseBody;
					  out.println("<tr><td>"+questionTitle+"</td><td>"+questionBody+"</td><td>"+askDate+"</td><td>"+responseBody+"</td></tr>");
					}
			
			}catch (Exception e) {
				out.print(e);
			}
			
			%>
	 
	
	  </tbody>
	</table>
	
		
		
	</div>
	
</body> 
	
	
</html>