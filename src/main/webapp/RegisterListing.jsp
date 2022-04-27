<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="main.css" />
  </head>

  <body>
    <center>
      <h1>Add a new listing</h1>
      <form>
        Item Image URL: <input id="image" type="text" name="itemImageURL" /> <br />
        Item Name: <input type="text" name="itemName" /> <br />
        Brand: <input type="text" name="itemBrand" /> <br />
        Subcategory: <input type="text" name="itemSubcategory" /> <br />
        Description: <input type="text" name="itemDscription" /> <br />
        Starting Price ($): <input type="number" name="startingPrice" /> <br />
        Safety/Minimum Price ($): <input type="number" name="minimumPrice" />
        <br />
        <input type="submit" value="Start Listing" />
      </form>
    </center>
  </body>
</html>
