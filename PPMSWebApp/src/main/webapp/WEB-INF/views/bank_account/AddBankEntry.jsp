<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Bank Entry</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

</head>
<body>

	<div class="row">
		<div class="col-md-11 " style="margin-left:30px;">
		<div class="row">
		
			<div style="margin-top:10px;border-bottom:2px solid #23133a;padding-bottom:10px;"><h3>Bank Account</h3></div>
			
		<div style="margin-top:20px;"><h4>Add Bank Entry</h4></div><hr>
	 	 <form id="bank-entry-form">
		
		<div class="col-md-6">         
        	
           <div class="form-group">
             <div class="col-md-4 inp-field">Date*</div>
             <div class="col-md-8 inp-field"><input type="date" required class="form-control" name="date"></div>
           </div>
           
            <div class="form-group">
             <div class="col-md-4 inp-field">Bank Name</div>
             <div class="col-md-8 inp-field">
             	<select class="form-control" name="bankName" >
             		<option disabled selected>Select Bank Name</option>
             		<c:forEach items="${bankNames}" var="bankName">
             		<option>${bankName}</option>
             		</c:forEach>
             	</select>
             </div>
           </div> 
           <div class="form-group">
             <div class="col-md-4 inp-field">Debit/Credit</div>
             <div class="col-md-8 inp-field">
             	<select class="form-control" name="transactionType" >
             		<option>Debit</option>
             		<option>Credit</option>
             	</select>
             </div>
           </div> 
           <div class="form-group">
             <div class="col-md-4 inp-field">Particulars</div>
             <div class="col-md-8 inp-field">
             	<select class="form-control" name="particulars" >
             		<option>Particulars</option>
             		<c:forEach items="${supplierNames}" var="supplierName">
             		<option>${supplierName}</option>
             		</c:forEach>
             		<c:forEach items="${customerNames}" var="customerName">
             		<option>${customerName}</option>
             		</c:forEach>
             	</select>
             </div>
         </div>
         </div>
         <div class="col-md-6"></div>
           <div class="col-md-12" style="margin-top:20px;"><hr></div>
           <div class="col-md-12" style="margin-top:20px;"><h4>Payment Details</h4><hr></div>
          
           <div class="col-md-12">
           <div class="col-md-2"></div>
           <div class="form-group col-md-9">
             <div class="col-md-4"><input type="radio" checked name="paymentMode" value="cash" id="cash-mode" onchange="changeCashMode();"> Cash Mode</div>
              <div class="col-md-4"><input type="radio" name="paymentMode" value="checkORdd" id="checkordd-mode" onchange="changeCheckORddMode();"> Check/DD Mode</div>
              <div class="col-md-4"><input type="radio" name="paymentMode" value="digital" id="digital-mode" onchange="changeDigitalMode();"> Digital Mode</div>
           </div>
           <div class="col-md-3"></div>
           <div class="col-md-6">
           <div class="form-group">
             <div class="col-md-5 inp-field">Check/DD No.</div>
             <div class="col-md-7 inp-field"><input type="text" class="form-control" name="checkOrddno" id="checkordd-no"></div>
           </div> 
           <div class="form-group">
             <div class="col-md-5 inp-field">Digital Mode Type</div>
             <div class="col-md-7 inp-field"><input type="text" class="form-control" name="digitalModeType" id="digital-mode-type"></div>
           </div> 
           <div class="form-group">
             <div class="col-md-5 inp-field">Transaction No.</div>
             <div class="col-md-7 inp-field"><input type="text" class="form-control" name="transactionNo" id="transaction-no"></div>
           </div> 
           <div class="form-group">
             <div class="col-md-5 inp-field">Amount</div>
             <div class="col-md-7 inp-field"><input type="text" class="form-control" name="amount"></div>
           </div> 
           <div class="form-group">
             <div class="col-md-5 inp-field">Note if any</div>
             <div class="col-md-7 inp-field"><input type="text" class="form-control" name="notes"></div>
           </div> 
           </div>
           <div class="col-md-3"></div>
           </div>
           <div class="col-md-1"></div>
           
            <div class="col-md-12"><hr></div>
            <!-- <input type="hidden" > -->
         	<div class="col-md-12">
         	<div class="col-md-2"><button class="btn btn-danger" onclick="return clearAllFields()">Cancel</button></div>
         	<div class="col-md-9"></div>
			<div class="col-md-1"><button class="btn" style="background-color:#23133a;color:#fff">Save</button></div>
		</div>
           
            </form> 
          </div>
        
         </div>
         
         <div class="col-md-1" ></div>
		
	</div>
			
<script>

	$(function(){
		changeCashMode();
	});
	
	function changeCashMode(){
		if($("#cash-mode").is(":checked")){
			$("#checkordd-no").attr('readonly', true);
			$("#digital-mode-type").attr('readonly', true);
			$("#transaction-no").attr('readonly', true);
		}
	}
	
	function changeCheckORddMode(){
		if($("#checkordd-mode").is(":checked")){
			$("#checkordd-no").attr('readonly', false);
			$("#digital-mode-type").attr('readonly', true);
			$("#transaction-no").attr('readonly', true);
		}
	}
	
	function changeDigitalMode(){
		if($("#digital-mode").is(":checked")){
			$("#checkordd-no").attr('readonly', true);
			$("#digital-mode-type").attr('readonly', false);
			$("#transaction-no").attr('readonly', false);
		}
	}
	
	$(document).ready(function(){	
		var bankEntryForm = $("#bank-entry-form");
		bankEntryForm.submit(function(e){
			e.preventDefault(); 
			
	      $.ajax({
	     type: "POST",
	     url: "submit-bank-entry", 
	     data: bankEntryForm.serialize(), 	
	     success: function(response){
	    	 if(response="success"){
		         alert("Successfully submitted !!");
		         window.location = "bank-entry-list";
	    	 }
	    	 else{
	    		 alert("Failed !!")
	    	 }
	      }
	    });  
	 
	});

	});
	
	function clearAllFields(){
		window.location = "add-bank-entry";
		return false;
	}
</script>
 </body>
</html>
