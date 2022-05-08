<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add a new listing</title>
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
		.button-register {
    		display:block;      
    		margin:0 auto;
	        border: 3px solid black;
	        border-radius: 8px;
			background-color: black ;
			color: white;
			padding: 12px 26px;
			width: 200px;
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
	
		<h1>Add a new auction item</h1>
	
		<form action="registerNewListing.jsp" method="POST">
			
		  <input class="form" type="text" name="itemImageURL" placeholder="Item Image URL" /> <br/>
		  <input class="form" type="text" name="itemName" placeholder="Item Name" /> <br/>
		  <input class="form" type="text" name="itemBrand" placeholder="Brand" /> <br/>
		  <input class="form" type="text" name="itemSubcategory" placeholder="Subcategory" /> <br/>
		  <input class="form" type="text" name="itemDescription" placeholder="Description" /> <br/>
		  <input class="form" type="number" name="itemStartingPrice" placeholder="Starting Price ($)" /> <br/>
		  <input class="form" type="number" name="itemSafetyPrice" placeholder="Safety/Minimum Price ($)" /> <br/>
		  <input class="form" type=datetime-local name="itemCloseDate"/> <br/>
			 
		  <input class="button-register" type="submit" value="register"/>
		  
		</form>
	
	</div>
	
</body> 
	
	
</html>