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
	.listings {
		--minItemWidth: 250px;
		--contentSpacing: 5px;

		display: grid;
		grid-template-columns: repeat(
			auto-fit,
			minmax(min(var(--minItemWidth), 100%), 1fr)
		);
		gap: calc(var(--contentSpacing) * 2);
	}
	
	.listing-item-hack {
		grid-column: span 1;
	}

	.listing-item {
		grid-column: span 1;
		padding-bottom: 5px;
		border-bottom: 1px solid #ccc;
	}

	.listing-item span {
		display: block;
		padding: calc(var(--contentSpacing) / 2) 0;
	}

	.listing-item img {
		width: 100%;
		margin-bottom: calc(var(--contentSpacing) / 2);
	}

	.listing-item .title {
		font-size: 1rem;
	}

	.listing-item .price {
		font-size: 1.25rem;
	}

	.listing-item .info {
		font-size: 1rem;
		color: #555;
	}
</style>

<body>
	<nav style="display:flex;position:sticky;top:0;padding:10px;background:black;margin-bottom:10px;color:white;">
		<b>CS336-Ebay-Clone</b>
		<div style="flex:1;"></div>
		<a href="AddListing.jsp" style="color:unset;">Add listing</a>
		<a href="Login.jsp" style="color:unset;margin-left:10px;">Log out</a>
	</nav>
	
	
	<%

		out.println("Logged in User " + session.getAttribute("user_id"));
	
	%>
	
		<script language="JavaScript">
        
	        function logoutTapped()
	        {

	        	window.location = "Login.jsp";

	        } 
        
    	</script>
	
		<input type="button" value="logOut" onclick="logoutTapped();" >
		
		<div class="listings">
		<% 
		try{
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		
			Statement stmt = con.createStatement();
			String str = "SELECT itemName, itemImageURL, itemStartingPrice, itemCloseDate FROM listing";
			ResultSet result = stmt.executeQuery(str);
			
			while (result.next()) {
			  String itemName = result.getString(1);
			  String itemImageURL = result.getString(2);
			  String itemStartingPrice = result.getString(3);
			  String itemCloseDate = result.getString(4);
			  out.println("<div class='listing-item'><img src='"+itemImageURL+"' /><span class='title'>"+itemName+"</span><span class='price'>Starting Price $"+itemStartingPrice+"</span><span class='info'>Bid closes "+itemCloseDate+"</span></div>");
			}
			
		
		}catch (Exception e) {
			out.print(e);
		}
		
		%>
		
		<!-- THIS IS A HACK -->
		<div class='listing-item-hack'></div>
		<div class='listing-item-hack'></div>
		<div class='listing-item-hack'></div>
		<div class='listing-item-hack'></div>
		<div class='listing-item-hack'></div>
		<div class='listing-item-hack'></div>
		

    </div>

	
</body>
</html>