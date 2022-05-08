<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listing Details</title>
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
		.listing-item {
			display: grid;
  		align-items: center;
		}
		.listing-item img {
			width: 300px;
			margin-bottom: calc(var(--contentSpacing) / 2);
			aspect-ratio: 1;
		    object-fit: contain;
		    background: black;
		}

		.listing-item .title {
			text-align: center;
			font-size: 30px;
		}

		.listing-item .info{
			text-align: center;
			font-size: 20px;
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
		}s
  </style>
</head>
<body>
<div class = 'center-hv'> 
<div class = 'listing-item'> 
	<%	
		try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();			
			String listingID = request.getParameter("listingID");
			String listingQRY = "SELECT itemImageURL, itemName, itemBrand, itemSubcategory, itemDescription, itemStartingPrice, itemCloseDate FROM listing WHERE listing_id = " + listingID;
			ResultSet result = stmt.executeQuery(listingQRY);
			while(result.next()){
				  String itemImageURL = result.getString(1);
			      String itemName = result.getString(2);
			      String itemBrand = result.getString(3);
			      String itemSubcategory = result.getString(4);			      
				  String itemDescription = result.getString(5);
				  String itemStartingPrice = result.getString(6);
				  String itemCloseDate = result.getString(7);
				  

				  out.print("<img src="+itemImageURL+"/> </br> <span class='title'>"+itemName+"</span> </br> <hr style=width:100%;text-align:center;> <span class='info'>Starting Price ($): "+itemStartingPrice+"</span> </br> <span class='info'>Closing Date: "+itemCloseDate+"</span> <hr style='width:100%;text-align:center;'> </br> <span class='info'>Brand: "+itemBrand+"</span> </br> <span class='info'>Subcategory: "+itemSubcategory+"</span> </br> <span class='info'>Description: "+itemDescription+"</span> </br></br></br></br> <span class='title'>Current Bids</span> </br>");

				  Statement stmt2 = con.createStatement();			
				  String bidQRY = "SELECT bid_id, user_id, price FROM bids WHERE listing_id = " + listingID + " ORDER BY price DESC";
				  ResultSet result2 = stmt2.executeQuery(bidQRY);
				  
				  %>
				<table>
				<thead>
				  <tr>
				    <th>Bid ID</th>
				    <th>User ID</th>
				    <th>Price</th>
				  </tr>
				  </thead>
				  <tbody>
				  
				  <%
				  while(result2.next()){
					  String bid_id = result2.getString(1);
					  String user_id = result2.getString(2);
					  String price = result2.getString(3);

					  out.print("<tr><td>"+bid_id+"</td><td>"+user_id+"</td><td>"+price+"</td></tr>");
		
				  }
				  %>
				  </tbody> 
				  </table> 
				  </div> 
				  </div>  
				  <%
				  	 
			}
			
			con.close();
			
		} catch (Exception ex) {
			out.print(ex);
			out.print("Insert failed :()");
		}	
	
	%>
	
	

</body>
</html>