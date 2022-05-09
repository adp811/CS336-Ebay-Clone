<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User History</title>
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
	
	
	<h1>User Bid and Purchase History List</h1>
	<div class="spacer"></div>
	<form id="searchForm">
	    <input id="searchInput" value = "1"></input>
	    <button>Search</button>
    </form>
        
    <script language="JavaScript">
	    const form = document.getElementById("searchForm")
	    const searchInput = document.getElementById("searchInput")
	    
	    form.addEventListener("submit", (e) => {
	        e.preventDefault();
	        
	        const searchParams = new URLSearchParams();
	        searchParams.set("id", searchInput.value || "");
	        window.location.search = searchParams.toString();
	    })
    </script>
	
	<h1> Bids By User</h1>
	<table>
	<thead>
	  <tr>
	  	<th>User ID</th>
	  	<th>Listing ID</th>
	    <th>Bid Price (USD)</th>
	  </tr>
	  </thead>
	  <tbody>
	  
	  	<% 
			try{
				
				int currentUser = Integer.parseInt("" + request.getParameter("id"));
			
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();		
				Statement stmt = con.createStatement();
				String str = "SELECT user_id, listing_id, price FROM bids WHERE user_id=" + currentUser + " ORDER BY listing_id DESC";
				ResultSet result = stmt.executeQuery(str);
				
				while (result.next()) {
					
				      String user_id = result.getString(1);
					  String listing_id = result.getString(2);
					  String price = result.getString(3);
										  
					  out.println("<tr><td>"+user_id+"</td><td>"+listing_id+"</td><td>"+price+"</td></tr>");
				}
			
			}catch (Exception e) {
				out.print(e);
			}
		  
			%>	 
	
	  </tbody>
	</table>
	
	<div class = "spacer"> </div>
	<h1> Auctions Won By Users</h1>
    <table>
    <thead>
      <tr>
          <th>Bid ID</th>
          <th>Listing ID</th>
        <th>User ID</th>
      </tr>
      </thead>
      <tbody>
      
          <% 
            try{
                
                int currentUser = Integer.parseInt("" + request.getParameter("id"));
            
                ApplicationDB db2 = new ApplicationDB();    
                Connection con2 = db2.getConnection();        
                Statement stmt2 = con2.createStatement();
                String str = "SELECT bid_id, listing_id, user_id FROM purchases ORDER by bid_id DESC";
                ResultSet result = stmt2.executeQuery(str);
                
                while (result.next()) {
                    
                      String bid_id = result.getString(1);
                      String listing_id = result.getString(2);
                      String user_id = result.getString(3);
                      
                      
                      out.println("<tr><td>"+bid_id+"</td><td>"+listing_id+"</td><td>"+user_id+"</td></tr>");
                }
            
            }catch (Exception e) {
                out.print(e);
            }
          
            %>     
    
      </tbody>
    </table>
	
	<div class="spacer"></div>
	
	
	<div class="spacer-button"></div>
	
	<input class="button-misc" type="button" value="return to homepage" onclick="window.location='HomePage.jsp'" >
		
	<div class="spacer-button"></div>
	
</body> 
	
	
</html>

