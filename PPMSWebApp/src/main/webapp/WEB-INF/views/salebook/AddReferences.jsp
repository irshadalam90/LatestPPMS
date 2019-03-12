<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add References</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<body>

	<div class="row">
		<div class="col-md-11 " style="margin-left:30px;">
		<div class="row">
		
			<div style="margin-top:10px;border-bottom:2px solid #23133a;padding-bottom:10px;"><h3>References</h3></div>
			
			<div style="margin-top:20px;"><h4>Add References</h4></div><hr>
		<form id="add-references-form">
		<div class="col-md-6">
           <div class="form-group">
             <div class="col-md-6 inp-field">Is Existing Employee</div>
             <div class="col-md-6 inp-field"><input type="checkbox" name="existEmployee" id="exist_emp" onchange="isExistEmp();"> Yes</div>
           </div>
           <div class="col-md-12"><h4>Personal Details</h4><hr></div>
           <div class="form-group" id="name">
             <div class="col-md-4 inp-field">Name</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="name" placeholder="Enter name"></div>
           </div>
           <div class="form-group" id="exist_emp_name" style="display:none;">
             <div class="col-md-4 inp-field">Name</div>
             <div class="col-md-8 inp-field"><select class="form-control" name="existName">
             	<option>Alam</option>
             </select>
             </div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Reference Code*</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="referenceCode" placeholder="Reference Code"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">DOB</div>
             <div class="col-md-8 inp-field"><input type="date" class="form-control" name="dob" placeholder="Enter date of birth"></div>
           </div>
         
           <div class="form-group">
             <div class="col-md-4 inp-field">Gender</div>
             <div class="col-md-8 inp-field"><select class="form-control" name="gender">
             	<option>Male</option>
             	<option>Female</option>
             </select></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Blood Group</div>
             <div class="col-md-8 inp-field"><select class="form-control" name="bloodGroup">
             	<option>A+</option>
             	<option>A-</option>
             	<option>AB+</option>
             	<option>AB-</option>
             	<option>O+</option>
             	<option>O-</option>
             </select></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Referred By</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="referredBy" placeholder=""></div>
           </div>
           </div>
		
		<div class="col-md-6"> 
			<div class="col-md-12"><h4>Contact Details</h4><hr></div>        
        	<div class="form-group">
             <div class="col-md-4 inp-field">Address</div>
             <div class="col-md-8 inp-field">
             	<textarea class="form-control" name="address" rows="4"></textarea>
             </div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">City/Town</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="city" placeholder="Enter city/town"></div>
           </div>
           <!-- <div class="form-group">
             <div class="col-md-4 inp-field">Pincode</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="pinCode" placeholder="Enter pincde"></div>
           </div> -->
           <div class="form-group">
             <div class="col-md-4 inp-field">State</div>
             <div class="col-md-8 inp-field"><select class="form-control" name="state">
               <option selected disabled>Select State</option>
               <option>Maharastra</option>
             	<!-- <option>Andaman and Nicobar Islands (35)</option>
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
               <option>West Bengal (19)</option> -->
             </select></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Country</div>
             <div class="col-md-8 inp-field"><select class="form-control" name="country">
             	<option>India</option>
             </select></div>
             </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Contact No.</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="contactNo" placeholder="Enter contact number"></div>
           </div>
           <!-- <div class="form-group">
             <div class="col-md-4 inp-field">Mobile No.</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="mobileNo" placeholder="Enter mobile number"></div>
           </div> -->
           <div class="form-group">
             <div class="col-md-4 inp-field">Email Id</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="emailId" placeholder="Enter email Id"></div>
           </div>
           </div>
           
           <div class="row" >
           	<div class="col-md-10"></div>
           	<div class="col-md-2">
             		<button class="btn" style="margin-top:20px;background-color:#23133a;color:#fff">Add References</button>
             	</div>
           </div>
         </form>
         </div>
         </div>
         <div class="col-md-1" ></div>
		
		</div>
		

<script>
function isExistEmp(){
	if($('#exist_emp').is(":checked")) {
    	$("#exist_emp_name").show();
		$("#name").hide();
	}
   else {
      $("#name").show();
      $("#exist_emp_name").hide();
   }
	  
}

$(document).ready(function(){
	var addReferencesForm = $("#add-references-form");
	addReferencesForm.submit(function(e){
		e.preventDefault();
		$.ajax({
			type: "POST",
			url: "submit-references",
			data: addReferencesForm.serialize(),
			success: function(res){
				if(res=="success"){
					alert("References added successfully !!");
					window.location = "add-references";
				}
				else{
					alert("<b class='text-danger'>References added Failed !!</b>");
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
