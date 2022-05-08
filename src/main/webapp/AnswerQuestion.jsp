<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ask a Question</title>
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
		.button-submit {
    		display:block;      
    		margin:0 auto;
	        border: 3px solid black;
	        border-radius: 8px;
			background-color: #28b463;
			color: white;
			padding: 12px 26px;
			width: 275px;
			font-size: 17px;
			font-weight: 650;
			cursor: pointer;
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
		.center-hv {
			position: absolute;
			text-align: center;
			left: 50%;
			top: 50%;
			-webkit-transform: translate(-50%, -50%);
			transform: translate(-50%, -50%);
		}
		.spacer {
			margin-top: 50px;
		}
		.spacer-text {
			margin-top: 20px;
		}
    </style>
</head>
 
<body>

	<div class="center-hv">
	
		<h1>Respond to User Question</h1>
		
		<div class="spacer-text" ></div>
	
	   	<% 
				try{
					
					String qid = request.getParameter("qid"); //question id from url parameter
					
					ApplicationDB db = new ApplicationDB();	
					Connection con = db.getConnection();		
					Statement stmt = con.createStatement();
					String str = "SELECT question_title, question_body FROM questions WHERE question_id="+ qid;
					ResultSet result = stmt.executeQuery(str);
					
					while (result.next()) {
											
						  String questionTitle = result.getString(1);
						  String questionBody = result.getString(2);
						  
						  out.println("<p>"+questionTitle+"</p><p>"+questionBody+"</p>");
					}
				
				}catch (Exception e) {
					out.print(e);
				}
		%>
			
		<div class="spacer" ></div>
		
		<form action="updateQuestionAnswer.jsp" method="POST"> <!-- Need to change action here -->
			<input type="hidden" name="question_id" value="<%=request.getParameter("qid")%>" />
			<textarea class="form" type="text" name="responseBody" placeholder="enter response" required></textarea> <br/>
			<div class="spacer-text" ></div>
			<input class="button-submit" type="submit" value="submit response"/>
		</form>
	
		<div class="spacer"></div>
	
		
	</div>
	
</body> 
	
	
</html>