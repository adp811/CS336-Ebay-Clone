<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
    
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
		aspect-ratio: 1;
	    object-fit: contain;
	    background: black;
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
		<a href="AskQuestion.jsp" style="color:unset;margin-left:10px;">Help</a>
		<a href="Login.jsp" style="color:unset;margin-left:10px;">Log out</a>
	</nav>
	
	
	<%
	  	Date current = new Date(); 


		out.println("Current Time: " + current + " </br> Logged in User " + session.getAttribute("user_id"));
	
	%>
	
		<script language="JavaScript">
        
	        function logoutTapped()
	        {

	        	window.location = "Login.jsp";

	        } 
        
    	</script>
	
		<input type="button" value="logOut" onclick="logoutTapped();" >
		
		
	
		<form id="searchForm">
			<input id="searchInput"></input>
			<select id="searchCategory">
				<option value="cateogry1">Cateogry1</option>
				<option value="cateogry2">Cateogry2</option>
			</select>
			<button>Search</button>
		</form>
		
		<script language="JavaScript">
        	const form = document.getElementById("searchForm")
        	const searchInput = document.getElementById("searchInput")
        	const searchCategory = document.getElementById("searchCategory")
        	
        	form.addEventListener("submit", (e) => {
        		e.preventDefault();
        		
        		const searchParams = new URLSearchParams();
        	    searchParams.set("q", searchInput.value || "");
        	    searchParams.set("category", searchCategory.value || "");
        	    window.location.search = searchParams.toString();
        	})
    	</script>
		
		<div class="listings">
		<% 
		try{
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		
			Statement stmt = con.createStatement();
			String str = "SELECT listing_id, itemName, itemImageURL, itemStartingPrice, itemCloseDate FROM listing ORDER BY itemCloseDate";
			ResultSet result = stmt.executeQuery(str);
			
			while (result.next()) {
		      String listingID = result.getString(1);
		      String itemName = result.getString(2);
			  String itemImageURL = result.getString(3);
			  String itemStartingPrice = result.getString(4);
			  String tempDate = result.getString(5);
			  String userID = "" + session.getAttribute("user_id");
			  String testStringDate = "2022-05-09 17:48:00.0";
			  //Date testDate = new SimpleDateFormat("yyyy-MM-dd H:m:s.S").parse(testStringDate);  
			  Date itemCloseDate = new SimpleDateFormat("yyyy-MM-dd H:m:s.S").parse(tempDate);  

			  
			  String topBidderQRY = "SELECT price, user_id, bid_id FROM bids WHERE listing_id = " + listingID + " ORDER BY price DESC LIMIT 1";
			  Statement stmt2 = con.createStatement();
			  ResultSet resultBids = stmt2.executeQuery(topBidderQRY);
			  
			  String color = "red";
			  String topBid = "0";
			  String topBid_ID = "0";
			  String userBid = "0";
			  int min = Integer.parseInt(itemStartingPrice);
			  boolean changed = false;
			  while(resultBids.next()){
				  topBid = resultBids.getString(1);
				  userBid = resultBids.getString(2);
				  topBid_ID = resultBids.getString(3);
				  changed = true;
				  if(userBid.equals("" + session.getAttribute("user_id")))
					  color = "green";
				  int topBidINT = Integer.parseInt(topBid);
				  if(topBidINT > min)
					  min = topBidINT;
			  }
			  if(current.compareTo(itemCloseDate) < 0){
				  out.println("<div class='listing-item'> <img src='"+itemImageURL+"' /> <span class='title'>"+itemName+"</span> <span class='price'>Starting Price $"+itemStartingPrice+"</span> <span class='price' style='color:"+color+";'>Highest Bid $"+topBid+"</span> <span class='info'>Bid Closes: </br>"+itemCloseDate+"</span> <span class='bid'> <form action='registerNewBid.jsp' method='POST'> <input type='hidden' name='listingID' value="+listingID+"> <br/> <input type='number' name='bidAmount' min= "+ min + " placeholder='Bid Amount ($)' /> <br/> <input class='button-register' type='submit' value='Submit Bid'/> </form> <form action='ListingDetails.jsp' method='POST'> <input type='hidden' name='listingID' value="+listingID+"> <input class='button-register' type='submit' value='Details'/> </form> </span> </div>");
		      }else{
				  String winnerQRY = "SELECT listing_id FROM purchases WHERE listing_id = " + listingID;
				  Statement stmt3 = con.createStatement();
				  ResultSet winnerResult = stmt3.executeQuery(winnerQRY);
				  if(!winnerResult.next() && changed){
						String insert = "INSERT INTO purchases (bid_id, listing_id, user_id) "
								+ "VALUES (?, ?, ?)"; 
						PreparedStatement ps = con.prepareStatement(insert);
						ps.setString(1, topBid_ID);
						ps.setString(2, listingID);
						ps.setString(3, userBid);

						ps.executeUpdate(); 
				  }
		      }
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