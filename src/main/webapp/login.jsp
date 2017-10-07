<!-- This application is built by Rajendra Arora, To know more visit here: http://about.me/rajendraarora16 -->
<!DOCTYPE html>
<html class="hide-sidebar ls-bottom-footer" lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="Sale market | Compare prices with top branded retailers | Login or Sign up Today.">
  <meta name="author" content="Rajendra Arora.">
  <title>Sale market | Compare prices with top branded retailers | Login or Sign up Today.</title>
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"/>
  <link href="css/vendor/all.css" rel="stylesheet">
  <link href="css/app/app.css" rel="stylesheet">
  <link rel="shortcut icon" href="./images/sale-market-logo.jpg">  
</head>

<body class="login" style="background-color:rgb(244, 244, 244);">
  
  <div id="content">
    <div class="container-fluid">

      <div class="lock-container">
        <h1 style="color:grey;">Account Access</h1>
        <div class="panel panel-default text-center">
          <img src="./images/avatar.png" class="img-circle" style="height: 100px;">
          <div class="panel-body">
            <form action="Login" method="post">
            	<input class="form-control" type="email" placeholder="email" name="userEmail" required="required">
            	<input class="form-control" type="password" placeholder="Enter Password" name="userPassword" required="required">
				<button class="btn btn-primary">Login <i class="fa fa-lock"></i></button>
            </form>
            <a href="forgetPassword.jsp" class="forgot-password">Forgot password?</a>
            
            <h5>Or Create account</h5>
            <a href="signup.jsp" class="btn btn-primary">Create Account <i class="fa fa-user"></i></a>
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