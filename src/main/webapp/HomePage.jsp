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
		<% 
		try{
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		
			Statement stmt = con.createStatement();
			String str = "SELECT * FROM listing";
			ResultSet result = stmt.executeQuery(str);
			
			
		
		}catch (Exception e) {
			out.print(e);
		}
		
		%>
		
		<div class="listings">
      <div class="listing-item">
        <img src="//picsum.photos/300/200" />
        <span class="title">Item 1</span>
        <span class="price">$1,000</span>
        <span class="info">Free shipping</span>
      </div>

      <div class="listing-item">
        <img src="//picsum.photos/300/200" />
        <span class="title">Item 1</span>
        <span class="price">$1,000</span>
        <span class="info">Free shipping</span>
      </div>

      <div class="listing-item">
        <img src="//picsum.photos/300/200" />
        <span class="title">Item 1</span>
        <span class="price">$1,000</span>
        <span class="info">Free shipping</span>
      </div>

      <div class="listing-item">
        <img src="//picsum.photos/300/200" />
        <span class="title">Item 1</span>
        <span class="price">$1,000</span>
        <span class="info">Free shipping</span>
      </div>

      <div class="listing-item">
        <img src="//picsum.photos/300/200" />
        <span class="title">Item 1</span>
        <span class="price">$1,000</span>
        <span class="info">Free shipping</span>
      </div>
    </div>

	
</body>
</html>