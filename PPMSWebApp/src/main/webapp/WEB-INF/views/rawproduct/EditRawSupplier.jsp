<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Supplier</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script>

</script>
</head>
<body>
	<div class="col-md-12">
		<form id="update-supplier-form">
		<div class="row" style="margin-top:10px;border-bottom:2px solid #23133a;padding-bottom:10px;">
			<div class="col-md-6"><h3>Raw Material Supplier</h3></div>
			<div class="col-md-5"></div>
			<div class="col-md-1"><a href="raw-supplier"><i class="fa fa-angle-left" style="font-size:20px;"></i> Back</a></div>
		</div>
		<!-- <div style="margin-top:10px;border-bottom:2px solid #23133a;padding-bottom:10px;"><h3>Raw Material Supplier</h3></div> -->
		
		<div style="margin-top:20px;"><h4>Edit Raw Supplier</h4></div><hr>
	
	<input type="hidden" name="id" value="${rawSupplier.id}">
	<div class="col-md-6">
          <div class="form-group">
            <div class="col-md-4 inp-field">Firm Name</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="firmName" placeholder="Enter firm name" value="${rawSupplier.firmName}"></div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">PAN</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="panNo" placeholder="Enter PAN number" value="${rawSupplier.panNo}"></div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">GSTIN</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="gstNo" placeholder="Enter GST number" value="${rawSupplier.gstNo}"></div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Contact Person</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="contactPerson" placeholder="Enter conntact person" value="${rawSupplier.contactPerson}"></div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Person DOB</div>
            <div class="col-md-8 inp-field"><input type="date" class="form-control" name="personDob" placeholder="Enter date of birth" value="${rawSupplier.personDob}"></div>
          </div>
          <div class="col-md-12"><hr></div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Address</div>
            <div class="col-md-8 inp-field">
            	<textarea class="form-control" name="address" placeholder="Enter address">${rawSupplier.address}</textarea>
            </div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">City/Town</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="city" placeholder="Enter city/town" value="${rawSupplier.city}"></div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Pincode</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="pinCode" placeholder="Enter pincde" value="${rawSupplier.pinCode}"></div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">State</div>
            <div class="col-md-8 inp-field"><select class="form-control" name="state">
              <option value="${rawSupplier.country}">${rawSupplier.country}</option>
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
            	<option value="${rawSupplier.country}">${rawSupplier.country}</option>
            </select></div>
           </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Contact No.</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="contactNo" placeholder="Enter contact number" value="${rawSupplier.contactNo}"></div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Mobile No.</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="mobileNo" placeholder="Enter mobile number" value="${rawSupplier.mobileNo}"></div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Email Id</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="emailId" placeholder="Enter email Id" value="${rawSupplier.emailId}"></div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Website</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="website" placeholder="Enter website name" value="${rawSupplier.website}"></div>
          </div>
          
          </div>
	
	<div class="col-md-6">         
          <div><h4>Shipping Information</h4> <hr></div>
          <div class="form-group">
           <div class="col-md-4"></div>
            <div class="col-md-8 inp-field">
            	<input type="checkbox" id="same_as" value="on" onchange="valueChanged()">Use Mailling as Shipping Address
            </div>
          </div>
          <div class="form-group display-none">
            <div class="col-md-4 inp-field">Address</div>
            <div class="col-md-8 inp-field">
            	<textarea class="form-control" name="shipAddress" placeholder="Enter address">${rawSupplier.shipAddress}</textarea>
            </div>
          </div>
          <div class="form-group display-none">
            <div class="col-md-4 inp-field">City/Town</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="shipCity" placeholder="Enter city/town" value="${rawSupplier.shipCity}"></div>
          </div>
          <div class="form-group display-none">
            <div class="col-md-4 inp-field">Pincode</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="shipPinCode" placeholder="Enter pincde" value="${rawSupplier.shipPinCode}"></div>
          </div>
          <div class="form-group display-none">
            <div class="col-md-4 inp-field">State</div>
            <div class="col-md-8 inp-field"><select class="form-control" name="shipState">
              <option value="${rawSupplier.shipState}">${rawSupplier.shipState}</option>
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
            	<option value="${rawSupplier.shipCountry}">${rawSupplier.shipCountry}</option>
            </select></div>
   		</div>
   		
   		 <c:if test="${fn:length(customerGroup) eq 0}">
          <div class="form-group">
            <div class="col-md-4 inp-field">Suppliers Group</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="customerGroup" placeholder="Enter suppliers group" value="${rawSupplier.customerGroup}"></div>
          </div>
          </c:if>
          <c:if test="${fn:length(customerGroup) ne 0}">
          <div class="form-group">
            <div class="col-md-4 inp-field">Suppliers Group</div>
            <div class="col-md-8 inp-field">
            	<select class="form-control" name="customerGroup">
            		<option>${rawSupplier.customerGroup}</option>
            		<c:forEach items="${customerGroup}" var="cg">
            		<option>${cg}</option>
            		</c:forEach>
            	</select>
            </div>
            <!-- <div class="col-md-2 inp-field"><a href="#" class="btn btn-default" style="font-size:18px;"><i class="fa fa-plus"></i></a></div> -->
          </div>
          </c:if> 
          <div class="form-group">
            <div class="col-md-4 inp-field">Sales Person</div>
            <div class="col-md-6 inp-field">
            	<select class="form-control" name="salesPersons">
            		<option>${rawSupplier.salesPersons}</option>
            		<c:forEach items="${salesPersons}" var="salesPerson">
            		<option>${salesPerson}</option>
            		</c:forEach>
            	</select>
            </div>
            <div class="col-md-2 inp-field"><a href="add-references" class="btn btn-default" style="font-size:18px;"><i class="fa fa-plus"></i></a></div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Payment Terms</div>
            <div class="col-md-8 inp-field"><select class="form-control" name="paymentTerms" id="payment-term" onchange="changePaymentTerm();">
            	<option value="${rawSupplier.paymentTerms}">${rawSupplier.paymentTerms}</option>
            	<option>COD</option>
            	<option>Pay In Days</option>
            </select></div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">No. of Days</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="paymentDays" id="payment-days" value="${rawSupplier.paymentDays}"></div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Opening Balance</div>
            <div class="col-md-4 inp-field"><input type="number" class="form-control" name="openingBalance" value="${rawSupplier.openingBalance}"></div>
            <div class="col-md-4 inp-field">
            	<select class="form-control" name="openingBalMode">
            		<option>${rawSupplier.openingBalMode}</option>
            		<option>Debit</option>
            		<option>Credit</option>
            	</select>
            </div>
          </div>
          <div class="form-group">
            <div class="col-md-5 inp-field">Opening Bal. Date</div>
            <div class="col-md-7 inp-field"><input type="date" class="form-control" name="openingBalanceDate" placeholder="Opening balance date"></div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Customer Note</div>
            <div class="col-md-8 inp-field"><textarea class="form-control" rows="6" name="customerNote" placeholder="Customer note if any">${rawSupplier.customerNote}</textarea></div>
          </div>
          <input type="hidden" name="status" value="active">
          </div>
      
        <div class="row" >
          	<div class="col-md-10"></div>
          	<div class="col-md-2">
            		<button class="btn" style="margin-top:20px;background-color:#23133a;color:#fff">Update Supplier</button>
            	</div>
          </div>
        </form>
        </div>
        
	
<script>
function valueChanged(){
	if($('#same_as').is(":checked"))   
        $(".display-none").hide();
   else
      $(".display-none").show();
}

$(document).ready(function(){
	var updateSupplierForm = $("#update-supplier-form");
	updateSupplierForm.submit(function(e){
		e.preventDefault();
		$.ajax({
			type: "POST",
			url: "update-raw-supplier",
			data: updateSupplierForm.serialize(),
			success: function(res){
				if(res=="success"){
					alert("Supplier Updated successfully !!");
					window.location = "raw-supplier";
				}
				else{
					alert("<b class='text-danger'>Failed !!</b>");
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
