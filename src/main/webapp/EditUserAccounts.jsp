<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit User Accounts</title>
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
		.button-remove {
    		display:block;      
    		margin:0 auto;
	        border: 3px solid black;
	        border-radius: 8px;
			background-color: #cc0000 ;
			color: white;
			padding: 12px 26px;
			width: 300px;
			font-size: 17px;
			font-weight: 650;
			cursor: pointer;
	    }
	    .button-update {
    		display:block;      
    		margin:0 auto;
	        border: 3px solid black;
	        border-radius: 8px;
			background-color: #28b463 ;
			color: white;
			padding: 12px 26px;
			width: 230px;
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
			width: 60%;
		}
		.spacer {
			margin-top: 60px;
		}
		.spacer-text {
			margin-top: 20px;
		}
    </style>
</head>
 
<body>

	<nav style="display:flex;position:sticky;top:0;padding:10px;background:black;margin-bottom:10px;color:white;">
		<b>Edit User Accounts - User #<% out.print(session.getAttribute("user_id")); %></b>
		<div style="flex:1;"></div>
		<a href="CustRepAnsweredQuestions.jsp" style="color:unset;margin-left:10px;">Answered Questions</a>
		<a href="ManageBidAndAuction.jsp" style="color:unset;margin-left:10px;">Manage Bids and Auctions</a>
		<a href="EditUserAccounts.jsp" style="color:unset;margin-left:10px;">Edit User Accounts</a>
		<a href="CustRepLogin.jsp" style="color:unset;margin-left:10px;">Log out</a>
	</nav>

	<div class="center-hv">
	
		<div class="spacer-text"></div>
		
		<em>Please select the field to update in the drop down and input the user ID #. Enter the new information in the form and submit to update.</em> 
		 
		<div class="spacer-text"></div>
		 	
		<form action="updateUserAccountInformation.jsp" method="POST"> <!-- Need to change action here -->
			<input class="form" type="text" name="userID" placeholder="enter user ID # here" required /> <br/>
			<label for="userInfoSelection">Choose User Information to Update:</label>
			<select name="userInfoSelection" id="userInfoSelection" required >
			    <option value="first_name">First Name</option>
			    <option value="last_name">Last Name</option>
			    <option value="email">Email</option>
			    <option value="phone_number">Phone Number</option>
			    <option value="address">Address</option>
			 </select>
			<div class="spacer-text"></div>
			<input class="form" type="text" name="newInformation" placeholder="enter new information here" required /> <br/>
			<div class="spacer-text"></div>
			<input class="button-update" type="submit" value="update information"/>
		</form>
		
		<div class="spacer"></div>
		
		<em>Delete user account, all bids from user, or all auction listings from user. Removing this information is FINAL so please verify your decision.</em> 
		 
		<div class="spacer-text"></div>
		
		<form action="deleteUserInfo.jsp" method="POST"> <!-- Need to change action here -->
			<input class="form" type="text" name="userID" placeholder="enter user ID # here" required /> <br/>
			<input class="button-remove" type="submit" name="delete_user" value="delete user"/> <br/>
			<input class="button-remove" type="submit" name="delete_bids" value="delete all bids"/> <br/>
			<input class="button-remove" type="submit" name="delete_listings" value="delete all listings"/> <br/>
		</form>
	
	</div>
	
</body> 
	
	
</html>