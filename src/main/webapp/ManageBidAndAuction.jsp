<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Bid and Auctions</title>
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
			width: 200px;
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
			margin-top: 60px;
		}
		.spacer-text {
			margin-top: 20px;
		}
    </style>
</head>
 
<body>

	<div class="center-hv">
	
		<h1>Manage Bids and Auctions</h1>
	
		<br/>
		
		<em>Removing an auction listing is final. Please make sure to verify this decision.</em> 
		 
		<div class="spacer-text"></div>
	 	
		<form action="deleteAuction.jsp" method="POST"> <!-- Need to change action here -->
			<input class="form" type="text" name="listingID" placeholder="enter listing ID # here" required /> <br/>
			<input class="button-remove" type="submit" value="remove listing"/>
		</form>
		
		<div class="spacer"></div>
		
		<em>Removing an auction bid is final. Please make sure to verify this decision.</em> 
		 
		<div class="spacer-text"></div>
		
		<form action="deleteBid.jsp" method="POST"> <!-- Need to change action here -->
			<input class="form" type="text" name="bidID" placeholder="enter bid ID # here" required /> <br/>
			<input class="button-remove" type="submit" value="remove bid"/>
		</form>
	
	</div>
	
</body> 
	
	
</html>