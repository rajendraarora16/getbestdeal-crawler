<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	String email = request.getParameter("email");
	String name = request.getParameter("name");
%>    
<!DOCTYPE html>
<html class="hide-sidebar ls-bottom-footer" lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="Sale market | Compare prices with top branded retailers | Login or Sign up Today.">
  <meta name="author" content="Rajendra Arora.">
  <title>Check your mail and enter 5 digits code here to verify.</title>
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"/>
  <link href="css/vendor/all.css" rel="stylesheet">
  <link href="css/app/app.css" rel="stylesheet"> 
  <link rel="shortcut icon" href="./images/sale-market-logo.jpg"> 
</head>

<body class="login" style="background-color:rgb(244, 244, 244);">
  
  <div id="content">
    <div class="container-fluid">

      <div class="lock-container" style="width:50%;">
        <h1 style="color:grey;">Verify your account</h1>
        <div class="panel panel-default text-center">
          <div class="panel-body">
            <form action="verifyAccount?email=<%=email%>" method="post">
            	<h5>Check your mail and enter your 5 digits code here.</h5>
            	<input class="form-control" type="text" name="passCode" placeholder="5 digits code"/>
            	<button class="btn btn-primary">Verify <i class="fa fa-check"></i></button>
            </form>            
            <h5>Did not received? Click<a href="resendCode?email=<%=email%>&name=<%=name%>" style="color:grey;"> here</a> to resend.</h5>
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