<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Representative Dashboard</title>
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
		<b>Customer Representative Dashboard - User #<% out.print(session.getAttribute("user_id")); %></b>
		<div style="flex:1;"></div>
		<a href="CustRepAnsweredQuestions.jsp" style="color:unset;margin-left:10px;">Answered Questions</a>
		<a href="ManageBidAndAuction.jsp" style="color:unset;margin-left:10px;">Manage Bids and Auctions</a>
		<a href="EditUserAccounts.jsp" style="color:unset;margin-left:10px;">Edit User Accounts</a>
		<a href="CustRepLogin.jsp" style="color:unset;margin-left:10px;">Log out</a>
	</nav>
	
	<h1>Unanswered Questions</h1>
	
	<div class="spacer"></div>
	
	<table>
	<thead>
	  <tr>
	    <th>Question Title</th>
	    <th>Question Body</th>
	    <th>Ask Date & Time</th>
	    <th>Action</th>
	  </tr>
	  </thead>
	  <tbody>
	  
	  	<% 
			try{
				
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();		
				Statement stmt = con.createStatement();
				String str = "SELECT question_id, question_title, question_body, ask_date FROM questions WHERE response_body IS NULL ORDER BY question_id DESC";
				ResultSet result = stmt.executeQuery(str);
				
				while (result.next()) {
							
					  String question_id = result.getString(1);
					
					  String questionTitle = result.getString(2);
					  String questionBody = result.getString(3);
					  String askDate = result.getString(4);
					  
					  String redirectQuery = "window.location='" + "AnswerQuestion.jsp?qid=" + question_id + "'";
					  
					  out.println("<tr><td>"+questionTitle+"</td><td>"+questionBody+"</td><td>"+askDate+"</td><td><button onClick="+redirectQuery+">Answer</button></td></tr>");
				}
			
			}catch (Exception e) {
				out.print(e);
			}
			
			%>
	 
	
	  </tbody>
	</table>
	
</body> 
	
	
</html>