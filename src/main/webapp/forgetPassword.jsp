<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html class="hide-sidebar ls-bottom-footer" lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="Sale market | Compare prices with top branded retailers | Login or Sign up Today.">
  <meta name="author" content="Rajendra Arora.">
  <title>Enter your email to recover password.</title>
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"/>
  <link href="css/vendor/all.css" rel="stylesheet">
  <link href="css/app/app.css" rel="stylesheet">  
  <link rel="shortcut icon" href="./images/sale-market-logo.jpg">
</head>

<body class="login" style="background-color:rgb(244, 244, 244);">
  
  <div id="content">
    <div class="container-fluid">

      <div class="lock-container" style="width:50%;">
        <h1 style="color:grey;font-size:15px;">Enter your email to recover password</h1>
        <div class="panel panel-default text-center">
          <div class="panel-body">
            <form action="forgetPassword" method="post">
            	<input class="form-control" type="email" name="userEmail" placeholder="Email"/>
            	<button class="btn btn-primary">send confirmation <i class="fa fa-paper-plane"></i></button>
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