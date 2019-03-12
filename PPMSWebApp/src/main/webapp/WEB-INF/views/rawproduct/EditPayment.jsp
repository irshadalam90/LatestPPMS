<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Payment</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

</head>
<body>
	<div class="col-md-12">
		<div class="row" style="border-bottom:2px solid #23133a;padding-bottom:10px;">
			<div class="col-md-6"><h3>Edit Payment</h3></div>
			<div class="col-md-5"></div>
			<div class="col-md-1"><a href="payments-list"><i class="fa fa-angle-left" style="font-size:20px;"></i> Back</a></div>
		</div>
					
	<div style="margin-top:20px;"><h4>Supplier Details</h4></div><hr>
 	 <form id="payment-form">
	<div class="col-md-6">
          <div class="form-group">
            <div class="col-md-4 inp-field">Supplier Name*</div>
            <div class="col-md-8 inp-field">
            	<select class="form-control" name="supplierName" id="supplier_name" onchange="getSupplerAddress()" required>
            		<option>${payment.supplierName}</option>
            		<c:forEach items="${rawSuppliers}" var="suppliers">
            		<option>${suppliers}</option>
            		</c:forEach>
            	</select>
            </div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Address</div>
            <div class="col-md-8 inp-field"><textarea rows="6" class="form-control" name="address">${payment.address}</textarea></div>
          </div>
          
          </div>
	
	<div class="col-md-6">         
       	
          <div class="form-group">
            <div class="col-md-4 inp-field">Payment Date*</div>
            <div class="col-md-8 inp-field"><input type="date" required class="form-control" name="paymentDate" value="${payment.paymentDate}"></div>
          </div>
          
           <div class="form-group">
            <div class="col-md-4 inp-field">Total Billing</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="totalBilling" value="" readonly></div>
          </div> 
          <div class="form-group">
            <div class="col-md-4 inp-field">Total Paid</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="totalPaid" value="" readonly></div>
          </div> 
          <div class="form-group">
            <div class="col-md-4 inp-field">Balance Amt.</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="balanceAmount" value="" readonly></div>
          </div> 
          </div>
          <div class="col-md-12" style="margin-top:20px;"><hr></div>
          <div class="col-md-12" style="margin-top:20px;"><h4>Payment Details</h4><hr></div>
         
          <div class="col-md-12">
          <!-- <div class="col-md-2"></div> -->
          <!-- <div class="form-group col-md-9"> -->
          <div class="col-md-2"></div>
          <div class="col-md-7">
          	  <div class="col-md-5">Payment Method</div>
             <div class="inp-field col-md-7">
              <select name="paymentMethod" class="form-control" id="payment-method" onchange="changePaymentMethod();">
              	<option>${payment.paymentMethod}</option>
              	<option>Cash</option>
              	<c:forEach items="${bankNames}" var="bankName">
              	<option>${bankName}</option>
              	</c:forEach>
              </select>
             </div>
         
          	<div class="col-md-12"></div>
            <!-- <div class="col-md-4"><input type="radio" checked name="paymentMode" value="cash" id="cash-mode" onchange="changeCashMode();"> Cash Mode</div> -->
             <div class="col-md-5 inp-field"></div>
             <div class="col-md-4 inp-field" style="display:none" id="checkordd-mode-lbl"><input type="radio" name="paymentMode" value="checkORdd" ${payment.paymentMode=='checkORdd'?'checked':''} id="checkordd-mode" onchange="changeCheckORddMode();"> Check/DD Mode</div>
             <div class="col-md-3 inp-field" style="display:none" id="digital-mode-lbl"><input type="radio" name="paymentMode" value="digital" ${payment.paymentMode=='digital'?'checked':''} id="digital-mode" onchange="changeDigitalMode();"> Digital Mode</div>
             <div class="col-md-12"></div>
          
          <div class="form-group" style="display:none" id="checkordd-no-lbl">
            <div class="col-md-5 inp-field">Check/DD No.</div>
            <div class="col-md-7 inp-field"><input type="text" class="form-control" name="checkOrddno" value="${payment.checkOrddno}" ${(empty payment.checkOrddno) ? 'disabled' : ''} id="checkordd-no"></div>
          </div> 
          <div class="form-group" style="display:none" id="digital-mode-type-lbl">
            <div class="col-md-5 inp-field">Digital Mode Type</div>
            <div class="col-md-7 inp-field"><input type="text" class="form-control" name="digitalModeType" value="${payment.digitalModeType}" ${(empty payment.digitalModeType) ? 'disabled' : ''} id="digital-mode-type"></div>
          </div> 
          <div class="form-group" style="display:none" id="transaction-no-lbl">
            <div class="col-md-5 inp-field">Transaction No.</div>
            <div class="col-md-7 inp-field"><input type="text" class="form-control" name="transactionNo" value="${payment.transactionNo}" ${(empty payment.transactionNo) ? 'disabled' : ''} id="transaction-no"></div>
          </div> 
          <div class="form-group">
            <div class="col-md-5 inp-field">Amount</div>
            <div class="col-md-7 inp-field"><input type="text" class="form-control" value="${payment.amount}" name="amount"></div>
          </div> 
          <div class="form-group">
            <div class="col-md-5 inp-field">Note if any</div>
            <div class="col-md-7 inp-field"><input type="text" class="form-control" name="notes" value="${payment.notes}"></div>
          </div> 
          </div>
          <div class="col-md-3"></div>
          </div>
          <div class="col-md-1"></div>
          
           <div class="col-md-12"><hr></div>
           <!-- <input type="hidden" > -->
        	<div class="col-md-12">
        	<div class="col-md-2"><button class="btn btn-danger" onclick="return clearAllFields()">Cancel</button></div>
        	<div class="col-md-8"></div>
		<div class="col-md-2"><button class="btn" style="background-color:#23133a;color:#fff">Add Payment</button></div>
	</div>
          
           </form> 
         </div>
        
			
<script>
	
function getSupplerAddress(){
	
	var supplierName = $("#supplier_name").val();
	
	$.ajax({
		type: 'GET',
		url: 'get-supplier-address/'+supplierName+'',
		dataType: 'json', 
		
		success: function(data){
			
			$("textarea[name='address']").html("Address: "+data[0]+"\nCity:  "+data[1]+ "\nState: "+data[2]+ "\nCountry: "+data[3]+"\nPin Code: "+data[4]); 
		},
		error: function(){
			alert(arguments[2]);
		}
	});
}

	
	$(function(){
		changePaymentMethod();
	});
		
	function changePaymentMethod(){
		var paymentMethod = $("#payment-method").val();
		if(paymentMethod != "Cash"){
			$("#checkordd-mode-lbl").show();
			$("#digital-mode-lbl").show();
			$("#checkordd-no-lbl").show();
			$("#digital-mode-type-lbl").show();
			$("#transaction-no-lbl").show();
			if($("#checkordd-mode").is(":checked")){
				changeCheckORddMode();
			}
			else if($("#checkordd-mode").is(":checked")){
				changeDigitalMode();
			}
		}
		else{
			$("#checkordd-mode-lbl").hide();
			$("#digital-mode-lbl").hide();
			$("#checkordd-no-lbl").hide();
			$("#digital-mode-type-lbl").hide();
			$("#transaction-no-lbl").hide();
		}
	}
	
	function changeCheckORddMode(){
		//if($("#checkordd-mode").is(":checked")){
			$("#checkordd-no").attr('disabled', false);
			$("#digital-mode-type").attr('disabled', true);
			$("#transaction-no").attr('disabled', true);
		//}
	}
	
	function changeDigitalMode(){
		//if($("#digital-mode").is(":checked")){
			$("#checkordd-no").attr('disabled', true);
			$("#digital-mode-type").attr('disabled', false);
			$("#transaction-no").attr('disabled', false);
		//}
	}

	$(document).ready(function(){	
		var paymentForm = $("#payment-form");
		paymentForm.submit(function(e){
			e.preventDefault(); 
	     $.ajax({
	     type: "POST",
	     url: "submit-payment", 
	     data: paymentForm.serialize(), 
	     success: function(response){
	    	 if(response="success"){
		         alert("Successfully submitted !!");
		         window.location = "add-payment";
	    	 }
	    	 else{
	    		 alert("Failed !!")
	    	 }
	      }
	    });  
	 
	});

	});
	
	function clearAllFields(){
		window.location.reload();
		return false;
	}
</script>
 </body>
</html>
