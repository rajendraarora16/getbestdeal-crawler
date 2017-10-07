<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="./styleCss/productStyle.css">
<title>Insert products here..</title>
</head>
<body>
	
	<form action="postProduct" method="post">
		<h1>Product name:</h1>
		<input type="text" name="product" />
		<br><br>

		<h1>Buy link:</h1>
		<input type="text" name="buyLink" />
		<br><br>
		
		<h1>Company name:</h1>
		<input type="text" name="companyName" />
		<br><br>
	
		<h1>Price: </h1>
		<input type="text" name="price" />
		<br><br>
		
		<h1>Digit price:</h1>
		<input type="text" name="digitPrice" />
		<br><br>
	
		<h1>Cash on Delivery:</h1>
		<select name="cashOnDelivery">
  			<option value="Cash on delivery eligible.">Cash on delivery eligible</option>
  			<option value="Cash on delivery is not eligible.">Cash on delivery is not eligible</option>
		</select>
		<br><br>
	
		<h1>1st Tag: </h1>
		<input type="text" name="tag1" />
		<br><br>
	
		<h1>2nd Tag: </h1>
		<input type="text" name="tag2" />
		<br><br>
	
		<h1>3rd Tag: </h1>
		<input type="text" name="tag3" />
		<br><br>
	
		<h1>Image URL: </h1>
		<input type="text" name="imageURL" />
		<br><br>
	
		<h1>Popularity:</h1>
		<select name="popularity">
  			<option value="1">1</option>
  			<option value="2">2</option>
  			<option value="3">3</option>
  			<option value="4">4</option>
  			<option value="5">5</option>
		</select>
		<br><br>
		
	
		<input type="submit" value="Submit" />
	</form>
	
</body>
</html>