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
		.button-misc {
    		display:block;      
    		margin:0 auto;
	        border: 3px solid black;
	        border-radius: 8px;
			background-color: black;
			color: white;
			padding: 10px 24px;
			width: 275px;
			font-size: 15px;
			font-weight: 600;
			cursor: pointer;
	    }
		.spacer {
			margin-top: 40px;
		}
		.spacer-button {
			margin-top: 50px;
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
	
	<h1>Your Customer Representative Question History</h1>
	
	<div class="spacer"></div>
	
	<table>
	<thead>
	  <tr>
	    <th>Question Title</th>
	    <th>Question Body</th>
	    <th>Ask Date & Time</th>
	    <th>Customer Representative ID</th>
	    <th>Response</th>
	    <th>Response Date & Time</th>
	  </tr>
	  </thead>
	  <tbody>
	  
	  	<% 
			try{
				
				int currentUser = (Integer)session.getAttribute("user_id");
				
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();		
				Statement stmt = con.createStatement();
				String str = "SELECT question_title, question_body, ask_date, cust_rep_id, response_body, res_date FROM questions WHERE user_id=" + currentUser + " ORDER BY question_id DESC";
				ResultSet result = stmt.executeQuery(str);
				
				while (result.next()) {
					
					  String questionTitle = result.getString(1);
					  String questionBody = result.getString(2);
					  String askDate = result.getString(3);
					  
					  String customerRepID = result.getString(4);
					  String responseBody = result.getString(5);
					  String responseDate = result.getString(6);
					  
					  //null checks
					  customerRepID = customerRepID == null ? "question not answered" : customerRepID;
					  responseBody = responseBody == null ? "question not answered" : responseBody;
					  responseDate = responseDate == null ? "question not answered" : responseDate;
					  
					  out.println("<tr><td>"+questionTitle+"</td><td>"+questionBody+"</td><td>"+askDate+"</td><td>"+customerRepID+"</td><td>"+responseBody+"</td><td>"+responseDate+"</td></tr>");
				}
			
			}catch (Exception e) {
				out.print(e);
			}
			
			%>
	 
	
	  </tbody>
	</table>
	
	<div class="spacer-button"></div>
	
	<input class="button-misc" type="button" value="return to question form" onclick="window.location='AskQuestion.jsp'" >
		
	<div class="spacer-button"></div>
	
</body> 
	
	
</html>