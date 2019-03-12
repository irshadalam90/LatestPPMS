<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">

<style>
 .signup-form{
 	padding:40px;
	background: #fafafa;
	border: 1px solid #ebebeb;
	box-shadow: rgba(0,0,0,0.14902) 0px 1px 1px 0px,rgba(0,0,0,0.09804) 0px 1px 2px 0px;
 }
 </style> 
</head>
<body style="background:#566D7E">
	<div class="container"><br>
		<form action="create_user" method="post">
		<center><span style="color:#fff;"><h3>Create User Account</h3></span></center>
		
		<div class="row" style="margin-top:30px;margin-bottom:30px; ">
			<div class="col-md-3"></div>
			<div class="col-md-6 signup-form">
			<div class="row">
			<!-- <div class="col-md-6"> -->
				<input type="hidden" name="userType" value="admin">
				<!-- <p><label>First Name</label>
				<input type="text" name="fname" placeholder="First Name" class="form-control"></p>
				<p><label>Last Name</label> 
				<input type="text" name="lname" placeholder="Last Name" class="form-control"></p>-->
				<p><label>User Name</label>
				<input type="text" name="userName" placeholder="User Name" class="form-control" required></p>
				<p><label>Password</label>
				<input type="password" name="password" placeholder="Password" class="form-control" required></p>
				<p><label>Email</label>
				<input type="text" name="email" placeholder="Email" class="form-control" required></p>
				<p><label>Mobile Number</label>
				<input type="text" name="mobileno" placeholder="Mobile Number" class="form-control" required></p>
				<p><label>School Name</label>
				<input type="text" name="schoolName" placeholder="School Name" class="form-control" required></p>
				<p><label>School Locatin</label>
				<input type="text" name="location" placeholder="School Location" class="form-control" required></p>
			<!-- </div> -->
			<!-- <div class="col-md-6">
				<p><label>Mobile Number</label>
				<input type="text" name="mobileno" placeholder="Mobile Number" class="form-control"></p>
				<p><label>School Name</label>
				<input type="text" name="schoolName" placeholder="School Name" class="form-control"></p>
				<p><label>Upload School Logo</label>
				<input type="file" name="logo" placeholder="upload School Logo" class="form-control"></p>
				<p><label>School Code</label> 
				<input type="text" name="schoolCode" placeholder="School Code" class="form-control"></p>
				<p><label>School Locatin</label>
				<input type="text" name="location" placeholder="School Location" class="form-control"></p>
				
				
			</div> -->
		
			</div>
			<div class="row" style="margin-top:20px;">
			<div class="col-md-8"></div>
			<div class="col-md-4"><button type="submit" class="btn btn-primary form-control">Sign Up</button></div>
			<!-- <div class="col-md-4"></div> -->
			</div>
			<div class="col-md-3"></div>
		</div>
		
		</div>
	
	</div>
	</form>
</body>
</html>