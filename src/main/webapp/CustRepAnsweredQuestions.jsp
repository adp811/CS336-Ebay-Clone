<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Answered Question History</title>
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
	
	<nav style="display:flex;position:sticky;top:0;padding:10px;background:black;margin-bottom:10px;color:white;">
		<b>Answered Questions - User #<% out.print(session.getAttribute("user_id")); %></b>
		<div style="flex:1;"></div>
		<a href="CustRepAnsweredQuestions.jsp" style="color:unset;margin-left:10px;">Answered Questions</a>
		<a href="ManageBidAndAuction.jsp" style="color:unset;margin-left:10px;">Manage Bids and Auctions</a>
		<a href="EditUserAccounts.jsp" style="color:unset;margin-left:10px;">Edit User Accounts</a>
		<a href="CustRepLogin.jsp" style="color:unset;margin-left:10px;">Log out</a>
	</nav>
	
	<h1>Your Answered Questions</h1>
	
	<div class="spacer"></div>
	
	<table>
	<thead>
	  <tr>
	  	<th>User ID</th>
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
				String str = "SELECT user_id, question_title, question_body, ask_date, cust_rep_id, response_body, res_date FROM questions WHERE cust_rep_id=" + currentUser + " ORDER BY res_date DESC";
				ResultSet result = stmt.executeQuery(str);
				
				while (result.next()) {
					
				      String userID = result.getString(1);
					  String questionTitle = result.getString(2);
					  String questionBody = result.getString(3);
					  String askDate = result.getString(4);
					  
					  String customerRepID = result.getString(5);
					  String responseBody = result.getString(6);
					  String responseDate = result.getString(7);
					  
					  out.println("<tr><td>"+userID+"</td><td>"+questionTitle+"</td><td>"+questionBody+"</td><td>"+askDate+"</td><td>"+customerRepID+"</td><td>"+responseBody+"</td><td>"+responseDate+"</td></tr>");
				}
			
			}catch (Exception e) {
				out.print(e);
			}
			
			%>
	 
	
	  </tbody>
	</table>
	
	<div class="spacer-button"></div>
	
	<input class="button-misc" type="button" value="return to dashboard" onclick="window.location='CustRepDashboard.jsp'" >
		
	<div class="spacer-button"></div>
	
</body> 
	
	
</html>