<!-- This application is built by Rajendra Arora, To know more visit here: http://about.me/rajendraarora16 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
    if ((session.getAttribute("userEmail") == null) || (session.getAttribute("userEmail") == ""))
    {
%>  

<%
		response.sendRedirect("login.jsp");
	}
    else
%>

<!DOCTYPE html>
<html class="hide-sidebar ls-bottom-footer" lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="Sale market | Compare prices with top branded retailers | Login or Sign up Today.">
  <meta name="author" content="Rajendra Arora.">
  <title>Reviews</title>
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"/>
  <link href="css/vendor/all.css" rel="stylesheet">
  <link href="css/app/app.css" rel="stylesheet">
  <link rel="shortcut icon" href="./images/sale-market-logo.jpg">  
</head>

<body class="login" style="background-color:rgb(244, 244, 244);">
  
  <div id="content">
    <div class="container-fluid">

      <div class="lock-container" style="width:80%;">
        <div class="panel panel-default text-center">
          <div class="panel-body">
			
			<%
				String productQuery = request.getParameter("productQuery");
	
				try{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("Your database connection with username and password");
			
					String sqlQuery = "SELECT * FROM reviews WHERE productQuery=?";
					PreparedStatement stmt = con.prepareStatement(sqlQuery);
					stmt.setString(1, productQuery);
				
					ResultSet rs = stmt.executeQuery();
			
					while(rs.next())
					{
						String productName = rs.getString("productName");
						String buyLink = rs.getString("buyLink");
						String companyName = rs.getString("companyName");
						String price = rs.getString("price");
						String cashOnDelivery = rs.getString("cashOnDelivery");
						String imageURL = rs.getString("imageURL");
						int popularity = rs.getInt("popularity");
						String tag1 = rs.getString("tag1");
						String tag2 = rs.getString("tag2");
						String tag3 = rs.getString("tag3");
						int views = rs.getInt("views");
			
			%>
            <img src="<%=imageURL%>" alt="" style="height:250px;" />
			<br />
			<h4><%=productName %></h4>
			<p class="desc">by <%=companyName%></p>
			<p class="desc"><%=cashOnDelivery%></p>
			<h4 style="font-size: 15px; color: rgb(177, 39, 4) ! important;" class="title">
				Price: <span class="amount">&#8377; <%=price%></span>	
			</h4>
			<div class="center-align stars" style="color:#f2c14d;">
				<table>
					<tr style="float:left;">
						<td>
							<span style="color:black;">Popularity: </span>
							<%
							for(int i=0; i<popularity; i++)
							{
								out.println("<i class='fa fa-star'></i>");
							}
							%>
						</td>
					</tr>
					<tr>
						<td style="float:left;">
						<h6 style="color:grey;">
							Views: <span><%=views%></span>
						</h6>
						</td>
					</tr>
				</table>
				<a class="btn btn-primary" href="viewProduct?productQuery=<%=productQuery%>&url=<%=buyLink%>">Explore this item <i class="fa fa-shopping-cart"></i></a>
			</div>
			<%
				}
			}catch(Exception e){e.printStackTrace();}
			%>
          </div>
          
          <!-- Comments.... -->
          	<div>
          		<h1 style="color:grey;float:left;padding: 8px;">Reviews:</h1>
          		<br /><br /><br /><br />
          		<%
					try{
						Class.forName("com.mysql.jdbc.Driver");
						Connection con2 = DriverManager.getConnection("Your database connection with username and password");
						
						String sqlQuery2 = "SELECT * FROM comments WHERE productQuery=?";
						PreparedStatement stmt2 = con2.prepareStatement(sqlQuery2);
						stmt2.setString(1, productQuery);
						
						ResultSet rs = stmt2.executeQuery();
						
						while(rs.next())
						{
							String comments = rs.getString("comments");
							String firstName = rs.getString("firstName");
							String lastName = rs.getString("lastName");
							
					%>
						
						<div style="float:left;padding: 10px;">
							<table>
								<tr>
									<td>
										<p><strong><%=firstName%> <%=lastName%>:</strong>&nbsp;&nbsp;</p>
									</td>
									<td>
										<p><%=comments%></p>
									</td>
								</tr>
							</table>
						</div><br><br><br>
							
					<%
						}
						
						con2.close();
					}catch(Exception e){e.printStackTrace();}
					%>
          	</div>
          <!-- Comments... -->
          <br /><br /><br /><br />	
          <div>
			<form action="postComment" method="post">
				<div>
					<input type="hidden" name="productQuery" value="<%=productQuery%>"/> 
					<textarea name="comment" style="resize:none;height: 45px;" class="form-control" rows="3" cols="40" placeholder="What do you say about this product?"></textarea>
					<button class="btn btn-primary" type="submit" style="width:100%;">Submit my opinion <i class="fa fa-comment"></i></button>
				</div>
			</form>
		  </div>
        </div>
      </div>
    </div>
  </div>
  <footer>
		<a style="float:right;padding-right: 12px;padding-bottom: 12px;color:#9696C5;" href="https://www.rajendraarora.com">Powered by Rajendra Arora.</a>
 	</footer>
<script src="js/vendor/all.js"></script>
<script src="js/app/app.js"></script>
</body>

</html>