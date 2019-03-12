<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Creditor Account</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<body>

	<div class="row">
		
		<div class="col-md-11 " style="margin-left:30px;">
		
			
		<div class="row" style="margin-top:10px;border-bottom:2px solid #23133a;padding-bottom:10px;">
		
			<div style="margin-top:10px;border-bottom:2px solid #23133a;padding-bottom:10px;"><h3>Raw Received Payments</h3></div>
			
			<div style="margin-top:20px;"><h4>Add Payment</h4></div><hr>
		<form action="" method="post" id="">
		<div class="col-md-6">
           <div class="form-group">
             <div class="col-md-4 inp-field">Supplier Name*</div>
             <div class="col-md-8 inp-field">
             	<select class="form-control" name="fname">
             		<option>Google</option>
             		<option>Microsoft</option>
             	</select>
             </div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Contact Person*</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="" placeholder="Enter contact person"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Supplier Id*</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="" placeholder="Enter supplier Id"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">City*</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="fname" placeholder="Enter city"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Total Billing*</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="fname" placeholder="Enter total billing"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Total Paid*</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="fname" placeholder="Enter total paid"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Balance Amount*</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="fname" placeholder="Enter Balance Amount"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Payment Date*</div>
             <div class="col-md-8 inp-field"><input type="date" class="form-control" name="fname"></div>
           </div>
           </div>
		
		<div class="col-md-6">         
        	
           <div class="form-group">
             <div class="col-md-4 inp-field"><input type="radio" name="mode">Cash Mode</div> 
             <div class="col-md-4 inp-field"><input type="radio" name="mode">Check/DD Mode</div>
             <div class="col-md-4 inp-field"><input type="radio" name="mode">Digital Mode</div>
             
           </div>
       
           <div class="form-group">
             <div class="col-md-4 inp-field">Check/DD NO.*</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="fname" placeholder="Enter check/DD number"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Digital Mode Type*</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="fname" placeholder="Enter digital mode type"></div>
           </div>
           <div class="col-md-12"></div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Transaction No.*</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="fname" placeholder="Enter taransaction number"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Amount*</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="fname" placeholder="Enter Amount"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Note If Any</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="" placeholder=""></div>
           </div>
           
           </div>
           <div class="col-md-12">	<hr></div>
         
           <div class="row" style="margin-bottom:20px">
           	<div class="col-md-2"><button class="btn btn-default">Cancel</button></div>
           	 <div class="col-md-8">
             		
             	</div>
           	<div class="col-md-2">
             		<button class="btn" style="margin-top:20px;background-color:#23133a;color:#fff">Add Payment</button>
             	</div>
           </div>
           </form>
          </div>
         <div class="" >
         <jsp:include page="ViewPayment.jsp"></jsp:include>
         </div>
         
         <div class="row"style="margin-top:30px;border-top:2px solid #23133a;padding-bottom:10px;"></div>
         <jsp:include page="PaymentOutstanding.jsp"></jsp:include>
         
         </div>
      		
         <div class="col-md-1" ></div>
         
		
	</div>

 </body>
</html>
