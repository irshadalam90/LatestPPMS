<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <title>Login Form</title>
  
  
  
      <!-- <link rel="stylesheet" href="css/loginStyle.css"> -->
		<link rel="stylesheet" href="css/bootstrap.min.css" >
  
 <style>
 .login-form{
 	padding:30px;
	background: #fafafa;
	border: 1px solid #ebebeb;
	box-shadow: rgba(0,0,0,0.14902) 0px 1px 1px 0px,rgba(0,0,0,0.09804) 0px 1px 2px 0px;
 }
 </style> 
</head>

 <%--<body>
  <hgroup>
  <h1 style="color:#fff;">User Account</h1>
</hgroup>

<form action="user_login" method="post">
	<center><p style="color:red;">${errorMessage}</p></center>
  <div class="group">
    <input type="text" name="username"><span class="highlight"></span><span class="bar"></span>
    <label>Email</label>
  </div>
  <div class="group">
    <input type="password" name="password"><span class="highlight"></span><span class="bar"></span>
    <label>Password</label>
  </div>
  <button type="submit" class="button buttonBlue">Login
    <div class="ripples buttonRipples"><span class="ripplesCircle"></span></div>
  </button>
  <center><a href="signup">Create New Account</a></center>
</form>
	
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script src="js/login.js"></script>
 
</body>--%>
<body style="background:#566D7E">
	<div class="container"><br><br><br>
		<form action="user_login" method="post">
		<center><span style="color:#fff;"><h3>User Login</h3></span></center>
		<div class="row" style="margin-top:30px;">
			<div class="col-md-4"></div>
			<div class="col-md-4 login-form" >
				<p style="color:red;">${errorMessage}</p>
				<p><label>Select User Type</label>
				<select name="role" class="form-control" required>
					<!-- <option selected disabled>Select User Type</option> -->
					<option selected value="admin">Admin</option>
					
					
				</select></p>
				<p><label>Email</label>
				<input type="text" name="email" placeholder="Enter email Id" class="form-control" required></p>
				<p><label>Password</label>
				<input type="password" name="password" placeholder="Enter Password" class="form-control" required></p>
				<p><a href="#" style="text-align:right; text-decoration: none">Forgot Password</a></p>
				<p style="margin-top:20px;"><button type="submit" class="btn btn-primary form-control">Submit</button></p>
				<!-- <p><center><a href="signup" style="text-decoration: none">Create New Account</a></center></p> -->
			</div>
			<div class="col-md-4"></div>
		</div>
		
	</div>
	</form>
</body>
</html>
