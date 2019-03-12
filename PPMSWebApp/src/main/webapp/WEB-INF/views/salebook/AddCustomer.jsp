<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Customer</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<body>

	<div class="row">
		<!-- <div class="col-md-1"></div> -->
		<div class="col-md-11 " style="margin-left:30px;">
		
			
		<div class="row">
		
			<div style="margin-top:10px;border-bottom:2px solid #23133a;padding-bottom:10px;"><h3>Customer</h3></div>
			
			<div style="margin-top:20px;"><h4>Add New Customer</h4></div><hr>
		<form id="add-customer-form">
		<div class="col-md-6">
           <div class="form-group">
             <div class="col-md-4 inp-field">Firm Name</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="firmName" placeholder="Enter firm name"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">PAN NO.</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="panNo" placeholder="Enter PAN number"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">GST NO.</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="gstNo" placeholder="Enter GST number"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Contact Person</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="contactPerson" placeholder="Enter conntact person"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Person DOB</div>
             <div class="col-md-8 inp-field"><input type="date" class="form-control" name="personDob" placeholder="Enter date of birth"></div>
           </div>
           <div class="col-md-12"><hr></div>
           
           <div><h4>Shipping Information</h4> <hr></div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Payment</div>
             <div class="col-md-8 inp-field"><select class="form-control" name="paymentTerms">
             	<option>COD</option>
             	<option>Pay In Days</option>
             </select></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Sales Person</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="salesPersons" placeholder="Enter sales person"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Customer Group</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="customerGroup" placeholder="Enter customer group"></div>
           </div>
           <div class="form-group">
            <div class="col-md-4"></div>
             <div class="col-md-8 inp-field">
             	<input type="checkbox" id="same_as" value="on" onchange="valueChanged()">Use Mailling as Shipping Address
             </div>
           </div>
           <div class="form-group display-none">
             <div class="col-md-4 inp-field">Address</div>
             <div class="col-md-8 inp-field">
             	<textarea class="form-control" name="shipAddress" placeholder="Enter address"></textarea>
             </div>
           </div>
           <div class="form-group display-none">
             <div class="col-md-4 inp-field">City/Town</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="shipCity" placeholder="Enter city/town"></div>
           </div>
           <div class="form-group display-none">
             <div class="col-md-4 inp-field">Pincode</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="shipPinCode" placeholder="Enter pincde"></div>
           </div>
           <div class="form-group display-none">
             <div class="col-md-4 inp-field">State</div>
             <div class="col-md-8 inp-field"><select class="form-control" name="shipState">
               <option selected disabled>Select State</option>
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
           <div class="form-group display-none">
             <div class="col-md-4 inp-field">Country</div>
             <div class="col-md-8 inp-field"><select class="form-control" name="shipCountry">
             	<option>India</option>
             </select></div>
     
           </div>
           </div>
		
		<div class="col-md-6">         
        	<div class="form-group">
             <div class="col-md-4 inp-field">Address</div>
             <div class="col-md-8 inp-field">
             	<textarea class="form-control" name="address" placeholder="Enter address"></textarea>
             </div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">City/Town</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="city" placeholder="Enter city/town"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Pincode</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="pinCode" placeholder="Enter pincde"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">State</div>
             <div class="col-md-8 inp-field"><select class="form-control" name="state">
               <option selected disabled>Select State</option>
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
             	<option>India</option>
             </select></div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Contact No.</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="contactNo" placeholder="Enter contact number"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Mobile No.</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="mobileNo" placeholder="Enter mobile number"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Email Id</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="emailId" placeholder="Enter email Id"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Website</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="website" placeholder="Enter website name"></div>
           </div>
           <div class="col-md-12"><hr></div>
           <div class="form-group">
           	
             <div class="col-md-5 inp-field">Opening Bal. Date</div>
             <div class="col-md-7 inp-field"><input type="date" class="form-control" name="openingBalanceDate" placeholder="Opening balance date"></div>
          
           </div>
           
           <div class="form-group">
             <div class="col-md-4 inp-field">Opening Bal.</div>
             <div class="col-md-4 inp-field"><input type="number" class="form-control" name="openingBalance" placeholder="Opening Balance"></div>
             <div class="col-md-4 inp-field">
             	<select class="form-control" name="openingBalMode">
             		<option>Debit</option>
             		<option>Credit</option>
             	</select>
             </div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Customer Note</div>
             <div class="col-md-8 inp-field"><textarea class="form-control" rows="6" name="customerNote" placeholder="Customer note if any"></textarea></div>
           </div>
           <input type="hidden" name="status" value="active">
           </div>
          </div>
         
         
           <div class="row" >
           	<div class="col-md-10"></div>
           	<div class="col-md-2">
             		<button class="btn" style="margin-top:20px;background-color:#23133a;color:#fff">Add Customer</button>
             	</div>
           </div>
         </form>
         </div>
         </div>
         <div class="col-md-1" ></div>
		
		</div>
		

<script>
function valueChanged(){
	if($('#same_as').is(":checked"))   
        $(".display-none").hide();
   else
      $(".display-none").show();
}

$(document).ready(function(){
	var addCustomerForm = $("#add-customer-form");
	addCustomerForm.submit(function(e){
		e.preventDefault();
		$.ajax({
			type: "POST",
			url: "add-customer-details",
			data: addCustomerForm.serialize(),
			success: function(res){
				if(res=="success"){
					alert("Customer added successfully !!");
					window.location = "add-customer";
				}
				else{
					alert("<b class='text-danger'>Customer added Failed !!</b>");
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
