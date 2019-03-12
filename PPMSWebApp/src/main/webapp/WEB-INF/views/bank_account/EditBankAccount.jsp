<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Bank Account</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<body>

	<div class="row">
		<div class="col-md-11 " style="margin-left:30px;">
		<form id="bank-account-form">
		<div class="row">
		
			<div style="margin-top:10px;border-bottom:2px solid #23133a;padding-bottom:10px;"><h3>Bank Account</h3></div>
			
			<div style="margin-top:20px;"><h4>Edit Bank Account</h4></div><hr>
		<input type="hidden" name="id" value="${bankAccount.id}">
		<div class="col-md-6">
           <div class="form-group">
             <div class="col-md-4 inp-field">Bank Name</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="bankName" value="${bankAccount.bankName}" placeholder="Enter Bank name"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Account Name</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="accountName" value="${bankAccount.accountName}" placeholder="Enter account name"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">A/C Holder's Name</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="accHolderName" value="${bankAccount.accHolderName}" placeholder="Enter A/C holder's name"></div>
           </div>
           <div class="col-md-12"></div>
           <div class="form-group">
             <div class="col-md-4 inp-field">A/C Number</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="accNumber" value="${bankAccount.accNumber}" placeholder="Enter A/C number"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">IFSC Code</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="ifscCode" value="${bankAccount.ifscCode}" placeholder="Enter IFSC Code"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Branch</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="branch" value="${bankAccount.branch}" placeholder="Enter Branch"></div>
           </div>
          <div class="form-group">
             <div class="col-md-4 inp-field">Opening Balance</div>
             <div class="col-md-4 inp-field"><input type="number" class="form-control" value="${bankAccount.openingBalance}" name="openingBalance" placeholder=""></div>
             <div class="col-md-4 inp-field">
             	<select class="form-control" name="openingBalMode">
             		<option>${bankAccount.openingBalMode}</option>
             		<option>Debit</option>
             		<option>Credit</option>
             	</select>
             </div>
           </div>
           <div class="form-group">
             <div class="col-md-5 inp-field">Opening Bal. Date</div>
             <div class="col-md-7 inp-field"><input type="date" class="form-control" name="openingBalanceDate" value="${bankAccount.openingBalanceDate}" placeholder="Opening balance date"></div>
           </div>
        </div>   
		
		<div class="col-md-6">  
		
           <div><h4>Mailing Details</h4> <hr></div>
           
			<div class="form-group">
             <div class="col-md-4 inp-field">Address</div>
             <div class="col-md-8 inp-field">
             	<textarea class="form-control" rows="5" name="address" placeholder="Enter address">${bankAccount.address}</textarea>
             </div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">City</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="city" value="${bankAccount.city}" placeholder="Enter city"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Pincode</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="pinCode" value="${bankAccount.pinCode}" placeholder="Enter pincde"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">State</div>
             <div class="col-md-8 inp-field"><select class="form-control" name="state">
               <option>${bankAccount.state}</option>
             	<option>Andaman and Nicobar Islands (35)</option>
               <option>Andhra Pradesh (28)</option>
               <option>Andhra Pradesh (37)</option>
               <option>Arunachal Pradesh (12)</option>
               <option>Assam (18)</option>
               <option>Bihar (10)</option>
               <option>Chandigarh (04)</option>
               <option>Chattisgarh (22)</option>
               <option>Dadra and Nagar Haveli (26)</option>
               <option>Daman and Diu (25)</option>
               <option>Delhi (07)</option>
               <option>Goa (30)</option>
               <option>Gujarat (24)</option>
               <option>Haryana (06)</option>
               <option>Himachal Pradesh (02)</option>
               <option>Jammu and Kashmir (01)</option>
               <option>Jharkhand (20)</option>
               <option>Karnataka (29)</option>
               <option>Kerala (32)</option>
               <option>Lakshadweep Islands (31)</option>
               <option>Madhya Pradesh (23)</option>
               <option>Maharashtra (27)</option>
               <option>Manipur (14)</option>
               <option>Meghalaya (17)</option>
               <option>Mizoram (15)</option>
               <option>Nagaland (13)</option>
               <option>Odisha (21)</option>
               <option>Pondicherry (34)</option>
               <option>Punjab (03)</option>
               <option>Rajasthan (08)</option>
               <option>Sikkim (11)</option>
               <option>Tamil Nadu (33)</option>
               <option>Telangana (36)</option>
               <option>Tripura (16)</option>
               <option>Uttar Pradesh (09)</option>
               <option>Uttarakhand (05)</option>
               <option>West Bengal (19)</option>
             </select></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Country</div>
             <div class="col-md-8 inp-field"><select class="form-control" name="country">
             	<option>${bankAccount.country}</option>
             </select></div>
           </div>
          </div>
         
          <div class="col-md-12"><hr></div>
           <div class="row" >
           	<div class="col-md-9"></div>
           	<div class="col-md-3">
             		<button class="btn" style="background-color:#23133a;color:#fff">Update Bank Account</button>
             	</div>
           </div>
         </form>
         </div>
         
         <div class="col-md-1" ></div>
		 </div>
		
		
<script>
$(document).ready(function(){
	var bankAccountForm = $("#bank-account-form");
	bankAccountForm.submit(function(e){
		e.preventDefault();
		$.ajax({
			type: "POST",
			url: "update-bank-account",
			data: bankAccountForm.serialize(),
			success: function(res){
				if(res=="success"){
					alert("Bank account edited successfully !!");
					window.location = "bank-account-list";
				}
				else{
					alert("<b class='text-danger'>Failed</b>");
				}
			},
			error: function(){
				alert(arguments[2]);
			}
		})
	});
});

</script>
	
</body>
</html>
