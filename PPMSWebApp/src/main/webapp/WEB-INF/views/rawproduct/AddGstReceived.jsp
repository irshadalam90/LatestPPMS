<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add GST Received</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
	<div class="col-md-12">	
		<div class="row" style="border-bottom:2px solid #23133a;padding-bottom:10px;">
			<div class="col-md-4"><h3>Add GST Received</h3></div>
			<div class="col-md-7"></div>
			<div class="col-md-1"><a href="view-gst-received"><i class="fa fa-angle-left" style="font-size:20px;"></i> Back</a></div>
		</div>
		
		<div style="margin-top:20px;"><h4>Supplier Information</h4></div><hr>
 	 <form id="gst-received-form-data">
	<div class="col-md-6">
         <div class="form-group">
           <div class="col-md-4 inp-field">Supplier Name*</div>
           <div class="col-md-8 inp-field">
           	<select class="form-control" name="supplierName" id="supplier_name" onchange="getSupplerAddress()" required>
           		<option selected disabled>Select Supplier Name</option>
           		<c:forEach items="${rawSuppliers}" var="suppliers">
           		<option>${suppliers}</option>
           		</c:forEach>
           	</select>
           </div>
         </div>
         <div class="form-group">
           <div class="col-md-4 inp-field">Address</div>
           <div class="col-md-8 inp-field"><textarea rows="6" class="form-control" name="shippingAddress"></textarea></div>
         </div>
         <div class="form-group">
           <div class="col-md-4 inp-field">Shipped By</div>
           <div class="col-md-8 inp-field"><input type="text" class="form-control" name="shipBy" placeholder="Enter shipped by"></div>
         </div>
         <div class="form-group">
           <div class="col-md-4 inp-field">Tracking Ref. No</div>
           <div class="col-md-8 inp-field"><input type="text" class="form-control" name="trackNo" placeholder="Enter track reference number"></div>
         </div>
         
         </div>

<div class="col-md-6">         
      	
         <div class="form-group">
           <div class="col-md-5 inp-field">Date*</div>
           <div class="input-group col-md-6 inp-field" >
      		<div class="input-group-addon">
      		 <i class="fa fa-calendar">
      		 </i>
     			 </div>
      		<input type="text" required class="form-control" name="invoiceDate" id="datepicker" style="color:#27AAE1; font-weight: bold; font-family: Arial, Helvetica, sans-serif; font-size: 0.9em;">
     		</div>
         
         </div>
           <div class="form-group">
           <div class="col-md-4 inp-field">Payment Terms</div>
           <div class="col-md-8 inp-field"><select class="form-control" name="paymentTerm" id="payment-term" onchange="changePaymentTerm();" required>
             <!-- <option selected disabled>Select Payment Term</option> -->
           	<option>COD</option>
             <option>Pay In Days</option>
           </select></div>
         </div>
          <div class="form-group">
           <div class="col-md-4 inp-field">No. of Days</div>
           <div class="col-md-8 inp-field"><input type="text" class="form-control" name="paymentDays" id="payment-days"></div>
         </div> 
         <div class="form-group">
           <div class="col-md-4 inp-field">Sales Person</div>
           <div class="col-md-6 inp-field">
           	<select class="form-control" name="salesPerson" id="sales-person">
           		<!-- <option selected disabled>Select Sales Person</option> -->
           		<c:forEach items="${salesPersons}" var="salesPerson">
           		<option>${salesPerson}</option>
           		</c:forEach>
           	</select>
           </div>
           <div class="col-md-2 inp-field"><a href="add-references" class="btn btn-default" style="font-size:18px;"><i class="fa fa-plus"></i></a></div>
         </div>
         <div class="form-group">
           <div class="col-md-4 inp-field">Order No.*</div>
           <div class="col-md-8 inp-field"><input type="text" class="form-control" name="invoiceNo" placeholder="Enter order number" required></div>
         </div>
         <div class="form-group">
           <div class="col-md-4 inp-field">Vehicle No.</div>
           <div class="col-md-8 inp-field"><input type="text" class="form-control" name="vehicleNo" placeholder="Enter vehicle number"></div>
         </div>
         <div class="form-group">
           <div class="col-md-4 inp-field">Driver Name</div>
           <div class="col-md-8 inp-field"><input type="text" class="form-control" name="driverName" placeholder="Enter driver name"></div>
         </div>
         <div class="form-group">
           <div class="col-md-4 inp-field">Driver Mobile No.</div>
           <div class="col-md-8 inp-field"><input type="text" class="form-control" name="driverNo" placeholder="Enter driver contact number"></div>
         </div>
         
         </div>
         
         <div class="col-md-12"></div>
         <div style="margin-top:20px;"><h4>Add Product</h4></div><hr>
         <div class="col-md-12">
         <div class="form-group col-md-3">
           <div>Product Name*</div>
           <div class="inp-field">
           	<select class="form-control" name="productName" id="product_name" onchange="getProductFields()">
           		 <option disabled selected>Select Product Name</option> 
           		<c:forEach items="${rawProductName}" var="rawProductName">
           		<option>${rawProductName}</option>
           		</c:forEach>
           	</select>
           </div>
         </div>
         <div class="form-group col-md-3">
           <div>Product Size*</div>
           <div class="inp-field">
           	<select class="form-control" name="productSize" id="product_size" >
           		<!-- <option>Select Product Size</option>
           		<option>3ply</option> -->
           	</select>
           </div>
         </div>
         <div class="form-group col-md-3">
           <div>Batch No.</div>
           <div class="inp-field"><input type="text" class="form-control"  id="batch_no" placeholder="Enter batch number"></div>
         </div>
         <div class="form-group col-md-3">
           <div>Unit</div>
           <div class="inp-field"><input type="text" name="unit" class="form-control measur-unit" id="measurement_unit"  placeholder="Unit" readonly></div>
         </div>
         <div class="form-group col-md-3">
           <div>Qty*</div>
           <div class="inp-field"><input type="number" value=0 class="form-control qty" id="quantity" placeholder="" onkeyup="calTotal()"></div>
         </div>
         <div class="form-group col-md-3">
           <div>Rate*</div>
           <div class="inp-field"><input type="number" value=0 class="form-control rate"  id="prate" placeholder="" onkeyup="return calTotal()"></div>
         </div>
         <div class="form-group col-md-3">
           <div><input type="radio" checked name="tax" value="gstper"> GST <input type="radio" name="tax" id="tax" value="igstper"> IGST(%)*</div>
           <div class="inp-field">
           	<select class="form-control gst" id="gstper"  onchange="return getGstRate();">
           		<option selected>0</option>
           		<option>5</option>
           		<option>12</option>
           		<option>18</option>
           	</select>
           </div>
         </div>
         <div class="form-group col-md-3">
           <div>Rate with GST/IGST</div>
           <div class="inp-field"><input type="number"  class="form-control gstRate" id="gst-rate" name="gstRate" placeholder="" value=0 onkeyup="getRate()"></div>
         </div>
         <div class="col-md-12"></div>
         <div class="form-group col-md-2">
           <div>Discount 1 (Note)</div>
           <div class="inp-field"><input type="text" class="form-control" placeholder="Discount 1 Desc." id="disc_desc1"></div>
         </div>
         <div class="form-group col-md-2">
           <div>Discount 1(%)</div>
           <div class="inp-field"><input type="number" value=0 class="form-control disc-per1"  id="disc_per1" onkeyup="return discountRs1();" placeholder="%"></div>
         </div>
         <div class="form-group col-md-2">
           <div>Discount 1(Rs)</div>
           <div class="inp-field"><input type="number" value=0 class="form-control disc-rs1" id="discount1" onkeyup="discountPer1()" placeholder="Rs."></div>
         </div>
         <div class="form-group col-md-2">
           <div>Discount 2 (Note)</div>
           <div class="inp-field"><input type="text" class="form-control" placeholder="Discount 2 Desc." id="disc_desc2"></div>
         </div>
         <div class="form-group col-md-2">
           <div>Discount 2(%)</div>
           <div class="inp-field"><input type="number" value=0 class="form-control disc-per2" onkeyup="return discountRs2();" id="disc_per2" placeholder="%"></div>
         </div>
         <div class="form-group col-md-2">
           <div>Discount 2(Rs)</div>
           <div class="inp-field"><input type="number" value=0 class="form-control disc-rs2" id="discount2" onkeyup="discountPer2()" id="" placeholder="Rs."></div>
         </div>
         <div class="col-md-8"></div>
         <div class="form-group">
           <div class="inp-field col-md-1">Amount</div>
           <div class="inp-field  col-md-3"><input type="number" value=0 readonly class="form-control class amount" id="amount" placeholder=""></div>
         </div>
         <div class="col-md-2"><a href="javascript:void(0);" class="btn btn-danger" onclick="return cancelProduct();" id="cancel_btn" style="display:none;"><!-- <i class="fa fa-plus"></i>  -->Cancel</a></div>
         <div class="col-md-8"></div>
         <div class="col-md-2"><a href="javascript:void(0);" class="btn btn-success" onclick="return addProductToTable();" id="savebutton"><!-- <i class="fa fa-plus"></i>  -->Add</a></div>
        <div class="col-md-12"></div>
         <div class="col-md-12" id="display-product" style="margin-top:20px;">
         	<table class="table table-striped">
         		<thead>
		<tr>
			 <!-- <th>#</th>  -->
			<th>Product Name</th>
			<th>Size</th>
			<th>Batch No.</th>
			<th>Qty.</th>
			<th>Unit</th>
			<th>Rate</th>
			<th>GST (%)</th>
			<th>Rate with GST / Rate +</th>
			<th>Discount</th>
			<th>Amount</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		</thead>
			<tbody>	
			</tbody>
	</table>
         </div>
         </div>
         
         <div class="col-md-12"><hr></div>
         <div id="div-id"></div>
         
         <div class="col-md-6">
         <div class="form-group">
           <div class="col-md-6 inp-field">Shipping Charges (Rs)</div>
          <div class="col-md-6 inp-field"><input type="number" onkeyup="shipChargeGstOnkeyup()" class="form-control ship-charge" name="shippingCost" placeholder="" value="0"></div>
         </div>
         	
         <div class="form-group">
           <div class="col-md-6 inp-field">GST On Shipping</div>
           <div class="col-md-6 inp-field">
           	<select class="form-control ship-gst" name=shippingGstPer id="" onchange="shipChargeGstOnchange()">
           		<option>0</option>
           		<option>5</option>
           		<option>12</option>
           		<option>18</option>
           		<option>28</option>
           	</select>
           </div>
         </div>
         <div class="col-md-12"><hr></div>
         <div class="form-group">
           <div class="col-md-6 inp-field">Additional Charges 1 (Note)</div>
           <div class="col-md-6 inp-field"><textarea class="form-control" name="additionalNote1" placeholder="Write something ..."></textarea></div>
         </div>
         <div class="form-group">
           <div class="col-md-6 inp-field">Additional Charges 1 (Rs)</div>
           <div class="col-md-6 inp-field"><input type="number" name="additonalChg1" class="form-control additional-charge1" onkeyup="additionalCharge1GstOnkeyup()" placeholder="" value=0></div>
           </div>
           <div class="form-group">
             <div class="col-md-6 inp-field">GST On Additional Charges 1 (%)
</div>
             <div class="col-md-6 inp-field">
             	<select class="form-control additional-gst1" name="additonalChg1Per" id="" onchange="additionalCharge1GstOnchange()">
             		<option>0</option>
             		<option>5</option>
             		<option>12</option>
             		<option>18</option>
             		<option>28</option>
             	</select>
             </div>
           </div>
           <div class="col-md-12"><hr></div>
           <div class="form-group">
             <div class="col-md-6 inp-field">Additional Charges 2 (Note)</div>
             <div class="col-md-6 inp-field"><textarea class="form-control" name="additonalNote2" placeholder="Write something ..."></textarea></div>
           </div>
           <div class="form-group">
             <div class="col-md-6 inp-field">Additional Charges 2 (Rs)</div>
             <div class="col-md-6 inp-field"><input type="number" class="form-control additional-charge2" name="additonalChg2" onkeyup="additionalCharge2GstOnkeyup()" value="0" placeholder=""></div>
           </div>
           <div class="form-group">
             <div class="col-md-6 inp-field">GST On Additional Charges 2 (%)
</div>
             <div class="col-md-6 inp-field">
             	<select class="form-control additional-gst2" name="additonalChg2Per" id="" onchange="additionalCharge2GstOnchange()">
             		<option>0</option>
             		<option>5</option>
             		<option>12</option>
             		<option>18</option>
             		<option>28</option>
             	</select>
             </div>
           </div>
           </div>
		
		<div class="col-md-6">         
        	
           <div class="form-group">
             <div class="col-md-6 inp-field">Sub Total (Rs)</div>
            <div class="col-md-6 inp-field"><input type="number" readonly id="sub-total" class="form-control subTotal" name="subtotal" placeholder="" value="0" style="background-color:yellow"></div>
         </div>
         <div class="form-group">
           <div class="col-md-6 inp-field">Discount (Rs)</div>
          <div class="col-md-6 inp-field"><input type="number" readonly id="sub-tot-discount" class="form-control" name="subtotDiscount" placeholder="" value="0" style="background-color:yellow"></div>
         </div>
         <div class="form-group">
           <div class="col-md-6 inp-field">Shipping Charges (Rs)</div>
           <div class="col-md-6 inp-field"><input type="number" name="shippingGstAmt" readonly class="form-control shipping-charge"  placeholder="" value="0" style="background-color:yellow"></div>
         </div>	
         <div class="form-group">
           <div class="col-md-6 inp-field">Additional Charges (Rs)</div>
           <div class="col-md-6 inp-field"><input type="number" readonly class="form-control total-additional-charge" name="totalAdditionChg" placeholder="" value="0" style="background-color:yellow"></div>
         </div>
         <div class="form-group">
           <div class="col-md-6 inp-field">SGST (Rs)</div>
           <div class="col-md-6 inp-field"><input type="number" readonly class="form-control total-sgst" name="totalSGSTAmt" id="" placeholder="" value="0" style="background-color:yellow"></div>
         </div>
         <div class="form-group">
           <div class="col-md-6 inp-field">CGST (Rs)</div>
           <div class="col-md-6 inp-field"><input type="number" readonly class="form-control total-cgst" id="" name="totalCGSTAmt" placeholder="" value="0" style="background-color:yellow"></div>
         </div>
         <div class="form-group">
           <div class="col-md-6 inp-field">Grand Total (Rs)</div>
           <div class="col-md-6 inp-field"><input type="number" readonly class="form-control" id="grand-total" name="grandTotal" placeholder="" value="0" style="background-color:yellow"></div>
         </div>

         </div>
         
         <div class="col-md-12"><hr></div>
          <div class="col-md-12">

	    <!-- Nav tabs -->
	     <ul class="nav nav-tabs" role="tablist" id="myTab">
	        <li role="presentation" class="active"><a href="#comments" aria-controls="comments" role="tab" data-toggle="tab">Comments</a></li>
	        <li role="presentation"><a href="#private-comments" aria-controls="private-comments" role="tab" data-toggle="tab">Private Comments</a></li>
	        <li role="presentation"><a href="#note-comments" aria-controls="note-comments" role="tab" data-toggle="tab">Note Comments</a></li>
	        <li role="presentation"><a href="#footer-comments" aria-controls="footer-comments" role="tab" data-toggle="tab">Footer Comments</a></li>
	    </ul>
	
	    <br>
	    <div class="tab-content">
	        <div role="tabpanel" style="height:200px;width:600px;border:1px solid black;padding:10px;" class="tab-pane active"  id="comments" contenteditable="true" placeholder="[Enter invoice notes]"></div>
	        <div role="tabpanel" style="height:200px;width:600px;border:1px solid black;padding:10px;" class="tab-pane" id="private-comments" contenteditable="true" placeholder="[Enter internal notes]"></div>
	        <div role="tabpanel" style="height:200px;width:600px;border:1px solid black;padding:10px;" class="tab-pane" id="note-comments" contenteditable="true" placeholder="[Please contact us for more information about payment options.]"></div>
	        <div role="tabpanel" style="height:200px;width:600px;border:1px solid black;padding:10px;" class="tab-pane" id="footer-comments" contenteditable="true" placeholder="[Thank you for your business.]"></div>
	    </div> 
	    
	    <textarea id="comments-val" name="comments" style="display:none"></textarea>
	    <textarea id="private-comments-val" name="privateComments" style="display:none"></textarea>
	    <textarea id="note-comments-val" name="noteComments" style="display:none"></textarea>
	    <textarea id="footer-comments-val" name="footerComments" style="display:none"></textarea>
	    
	    <!-- <ul class="nav nav-tabs">
		    <li class="active"><a href="#">Home</a></li>
		    <li><a href="#">Menu 1</a></li>
		    <li><a href="#">Menu 2</a></li>
		    <li><a href="#">Menu 3</a></li>
		 </ul>
		<br>
		<div contenteditable="true"></div>   -->          
          </div>
          <div class="col-md-12"><hr></div>
          <!-- <input type="hidden" > -->
       	<div class="col-md-12">
       	<div class="col-md-2"><button class="btn btn-danger" onclick="return clearAllFields()">Cancel</button></div>
       	<div class="col-md-8"></div>
	<div class="col-md-2"><button class="btn" style="background-color:#23133a;color:#fff">Save</button></div>
</div>
         
          </form> 
        </div>
        
<script>
var i=0;
currentRow = null;
var subTotal=0;
var totalGst=0;
var productList=[];
var sno;
var j;

function addProductToTable(){
    var productName=$("#product_name").val();
    var productSize=$("#product_size").val();
    var batchNo=$("#batch_no").val();   
    var quantity=parseFloat($("#quantity").val());
    var rate=parseFloat($("#prate").val());
    var discDesc1=$("#disc_desc1").val();
    var discDesc2=$("#disc_desc2").val();
    var discPer1=parseFloat($("#disc_per1").val());
    var discPer2=parseFloat($("#disc_per2").val());
    var discount1=parseFloat($("#discount1").val());
    var discount2=parseFloat($("#discount2").val());
    if(isNaN(discount1)){
    	discount1=0;
    }
    if(isNaN(discount2)){
    	discount2=0;
    }
    var totalDiscount=(+discount1 + +discount2).toFixed(2);
    var gstPer=$("#gstper").val();
    var gstRate=$("#gst-rate").val();
    var amount=parseFloat($("#amount").val()).toFixed(2);
    var unit=$("#measurement_unit").val();
    
    if($("#savebutton").text() == "Update"){
    	productList.splice(j,1);
    	productList.push({
    		productName: productName,
       		productSize: productSize,
       		batchNo: batchNo,
       		quantity: quantity,
       		unit: unit,
       		rate: rate,
       		gstPer: gstPer,
       		gstRate: gstRate,
       		discDesc1: discDesc1,
       		discDesc2: discDesc2,
       		discPer1: discPer1,
       		discPer2: discPer2,
       		discount1: discount1,
       		discount2: discount2,
       		totalDiscount: totalDiscount,
       		amount: amount
    	});
		var new_row = "<tr class='dynamic' class='info'>"
			+"<td style='display:none' class='sNo'>"+ i +"</td>"
			+"<td class='productName'>" + productName + "</td>"
			+"<td class='productSize'>" + productSize + "</td>"
			+"<td class='batchNo'>" + batchNo + "</td>"
			+"<td class='quantity'>" + quantity + "</td>"
			+"<td class='unit'>" + unit + "</td>"
			+"<td class='rate'>" + rate + "</td>"
			+"<td class='gstPer'>" + gstPer + "</td>"
			+"<td class='gstRate'>" + gstRate + "</td>"
			+"<td class='discDesc1' style='display:none'>" + discDesc1 + "</td>"
			+"<td class='discDesc2' style='display:none'>" + discDesc2 + "</td>"
			+"<td class='discPer1' style='display:none'>" + discPer1 + "</td>"
			+"<td class='discPer2' style='display:none'>" + discPer2 + "</td>"
			+"<td class='discount1' style='display:none'>" + discount1 + "</td>"
			+"<td class='discount2' style='display:none'>" + discount2 + "</td>"
			+"<td class='totalDiscount'>" + totalDiscount + "</td>"
			+"<td class='amount'>" + amount + "</td>"
			+"<td><span class='editrow'><a class='fa fa-edit' href='javascript: void(0);'onclick='editProduct("+j+",this)'></a></span></td>"
			+"<td><span class='deleterow'><a class='glyphicon glyphicon-trash' href='javascript: void(0);' onclick='deleteProduct("+j+",this)'></a></span></td>"
		+"</tr>";
		
 	    $("table tbody").find($(currentRow)).replaceWith(new_row);
        currentRow = null;
    	$("#savebutton").text("Add");
    }
    
   /*  else{
    	
    	
        for(var k=0; k<productList.length; k++){
        	if(productList[k].productName==productName && productList[k].productSize==productSize  && 
            		productList[k].batch_no==batch_no && productList[k].quantity==quantity && productList[k].prate==prate && 
            		productList[k].disc_desc1==disc_desc1 && productList[k].disc_desc2==disc_desc2 && productList[k].disc_per1==disc_per1
            		 && productList[k].disc_per2==disc_per2 && productList[k].discount1==discount2 && productList[k].discount1==discount2
            		 && productList[k].gstper==gstper && productList[k].gst-rate==gst-rate && productList[k].unit==unit ){
        			alert(productList[k].productName==productName) 
        		//productList.splice(i,1);
        		var oldQty;
        	    var newQty;
        	    var updQty	
        	   	oldQty=productList[k].quantity;
        		newQty=quantity;
        		updQty=oldQty+newQty; 
        		//productList.splice(k,1);
        		productList.push({
            		productName: productName,
               		productSize: productSize,
               		batchNo: batchNo,
               		quantity: updQty,
               		unit: unit,
               		rate: rate,
               		gstPer: gstPer,
               		gstRate: gstRate,
               		discDesc1: discDesc1,
               		discDesc2: discDesc2,
               		discPer1: discPer1,
               		discPer2: discPer2,
               		discount1: discount1,
               		discount2: discount2,
               		totalDiscount: totalDiscount,
               		amount: amount
            	});
        		//productList[i].quantity=updQty;
        		//alert(productList[i].quantity);
        		var new_row="";
        		for(i=0; i<productList.length; i++){
	        		new_row += "<tr class='dynamic' class='info'>"
	    				+"<td style='display:none' class='sNo'>"+ i +"</td>"
	    				+"<td class='productName'>" + productList[i].productName + "</td>"
	    				+"<td class='productSize'>" + productList[i].productSize + "</td>"
	    				+"<td class='batchNo'>" + productList[i].batchNo + "</td>"
	    				+"<td class='quantity'>" + productList[i].quantity + "</td>"
	    				+"<td class='unit'>" + productList[i].unit + "</td>"
	    				+"<td class='rate'>" + productList[i].rate + "</td>"
	    				+"<td class='gstPer'>" + productList[i].gstPer + "</td>"
	    				+"<td class='gstRate'>" + productList[i].gstRate + "</td>"
	    				+"<td class='discDesc1' style='display:none'>" + productList[i].discDesc1 + "</td>"
	    				+"<td class='discDesc2' style='display:none'>" + productList[i].discDesc2 + "</td>"
	    				+"<td class='discPer1' style='display:none'>" + productList[i].discPer1 + "</td>"
	    				+"<td class='discPer2' style='display:none'>" + productList[i].discPer2 + "</td>"
	    				+"<td class='discount1' style='display:none'>" + productList[i].discount1 + "</td>"
	    				+"<td class='discount2' style='display:none'>" + productList[i].discount2 + "</td>"
	    				+"<td class='totalDiscount'>" + productList[i].totalDiscount + "</td>"
	    				+"<td class='amount'>" + productList[i].amount + "</td>"
	    				+"<td><span class='editrow'><a class='fa fa-edit' href='javascript: void(0);'onclick='editProduct("+j+",this)'></a></span></td>"
	    				+"<td><span class='deleterow'><a class='glyphicon glyphicon-trash' href='javascript: void(0);' onclick='deleteProduct("+j+",this)'></a></span></td>"
	    			+"</tr>";
	    	       	$("table tbody").html(new_row);
        		}
        		 
        	}
        	
        	else{
        		productList.push({
            		productName: productName,
               		productSize: productSize,
               		batchNo: batchNo,
               		quantity: quantity,
               		unit: unit,
               		rate: rate,
               		gstPer: gstPer,
               		gstRate: gstRate,
               		discDesc1: discDesc1,
               		discDesc2: discDesc2,
               		discPer1: discPer1,
               		discPer2: discPer2,
               		discount1: discount1,
               		discount2: discount2,
               		totalDiscount: totalDiscount,
               		amount: amount
            	});
            	var new_row="";
                for(i=0; i<productList.length; i++){
        	       	new_row += "<tr class='dynamic' class='info'>"
        				+"<td style='display:none' class='sNo'>"+ i +"</td>"
        				+"<td class='productName'>" + productList[i].productName + "</td>"
        				+"<td class='productSize'>" + productList[i].productSize + "</td>"
        				+"<td class='batchNo'>" + productList[i].batchNo + "</td>"
        				+"<td class='quantity'>" + productList[i].quantity + "</td>"
        				+"<td class='unit'>" + productList[i].unit + "</td>"
        				+"<td class='rate'>" + productList[i].rate + "</td>"
        				+"<td class='gstPer'>" + productList[i].gstPer + "</td>"
        				+"<td class='gstRate'>" + productList[i].gstRate + "</td>"
        				+"<td class='discDesc1' style='display:none'>" + productList[i].discDesc1 + "</td>"
        				+"<td class='discDesc2' style='display:none'>" + productList[i].discDesc2 + "</td>"
        				+"<td class='discPer1' style='display:none'>" + productList[i].discPer1 + "</td>"
        				+"<td class='discPer2' style='display:none'>" + productList[i].discPer2 + "</td>"
        				+"<td class='discount1' style='display:none'>" + productList[i].discount1 + "</td>"
        				+"<td class='discount2' style='display:none'>" + productList[i].discount2 + "</td>"
        				+"<td class='totalDiscount'>" + productList[i].totalDiscount + "</td>"
        				+"<td class='amount'>" + productList[i].amount + "</td>"
        				+"<td><span class='editrow'><a class='fa fa-edit' href='javascript: void(0);'onclick='editProduct("+j+",this)'></a></span></td>"
        				+"<td><span class='deleterow'><a class='glyphicon glyphicon-trash' href='javascript: void(0);' onclick='deleteProduct("+j+",this)'></a></span></td>"
        			+"</tr>";
        	       	$("table tbody").html(new_row);
               
        	}
        	
        }
    	
    	
    }
    }
    */
     else{
    	productList.push({
    		productName: productName,
       		productSize: productSize,
       		batchNo: batchNo,
       		quantity: quantity,
       		unit: unit,
       		rate: rate,
       		gstPer: gstPer,
       		gstRate: gstRate,
       		discDesc1: discDesc1,
       		discDesc2: discDesc2,
       		discPer1: discPer1,
       		discPer2: discPer2,
       		discount1: discount1,
       		discount2: discount2,
       		totalDiscount: totalDiscount,
       		amount: amount
    	});
    	var new_row="";
        for(i=0; i<productList.length; i++){
	       	new_row += "<tr class='dynamic' class='info'>"
				+"<td style='display:none' class='sNo'>"+ i +"</td>"
				+"<td class='productName'>" + productList[i].productName + "</td>"
				+"<td class='productSize'>" + productList[i].productSize + "</td>"
				+"<td class='batchNo'>" + productList[i].batchNo + "</td>"
				+"<td class='quantity'>" + productList[i].quantity + "</td>"
				+"<td class='unit'>" + productList[i].unit + "</td>"
				+"<td class='rate'>" + productList[i].rate + "</td>"
				+"<td class='gstPer'>" + productList[i].gstPer + "</td>"
				+"<td class='gstRate'>" + productList[i].gstRate + "</td>"
				+"<td class='discDesc1' style='display:none'>" + productList[i].discDesc1 + "</td>"
				+"<td class='discDesc2' style='display:none'>" + productList[i].discDesc2 + "</td>"
				+"<td class='discPer1' style='display:none'>" + productList[i].discPer1 + "</td>"
				+"<td class='discPer2' style='display:none'>" + productList[i].discPer2 + "</td>"
				+"<td class='discount1' style='display:none'>" + productList[i].discount1 + "</td>"
				+"<td class='discount2' style='display:none'>" + productList[i].discount2 + "</td>"
				+"<td class='totalDiscount'>" + productList[i].totalDiscount + "</td>"
				+"<td class='amount'>" + productList[i].amount + "</td>"
				+"<td><span class='editrow'><a class='fa fa-edit' href='javascript: void(0);'onclick='editProduct("+j+",this)'></a></span></td>"
				+"<td><span class='deleterow'><a class='glyphicon glyphicon-trash' href='javascript: void(0);' onclick='deleteProduct("+j+",this)'></a></span></td>"
			+"</tr>";
	       	$("table tbody").html(new_row);
       
    	}
    } 
    
    		
    // sno = productList.length;
   	// var new_row = "<tr class='dynamic' class='info'><td style='display:none' class='sNo'>"+ sno +"</td><td class='productName'>" + productName + "</td><td class='productSize'>" + productSize + "</td><td class='batchNo'>" + batchNo + "</td><td class='quantity'>" + quantity + "</td><td class='unit'>" + unit + "</td><td class='rate'>" + rate + "</td><td class='gstPer'>" + gstPer + "</td><td class='gstRate'>" + gstRate + "</td><td class='totalDiscount'>" + totalDiscount + "</td><td class='amount'>" + amount + "</td><td><span class='editrow'><a class='fa fa-edit' href='javascript: void(0);'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href='javascript: void(0);'></a></span></td></tr>";
   	// $("table tbody").append(new_row);
 	//alert(productList[0].productName);
 	//alert(productList[1].productName);
    /* var new_row="";
    for(i=0; i<productList.length; i++){
    	
   	new_row += "<tr class='dynamic' class='info'><td style='display:none'class='sNo'>"+ i +"</td><td class='productName'>" + productList[i].productName + "</td><td class='productSize'>" + productList[i].productSize + "</td><td class='batchNo'>" + productList[i].batchNo + "</td><td class='quantity'>" + productList[i].quantity + "</td><td class='unit'>" + productList[i].unit + "</td><td class='rate'>" + productList[i].rate + "</td><td class='gstPer'>" + productList[i].gstPer + "</td><td class='gstRate'>" + productList[i].gstRate + "</td><td class='totalDiscount'>" + productList[i].totalDiscount + "</td><td class='amount'>" + productList[i].amount + "</td><td><span class='editrow'><a class='fa fa-edit' href='javascript: void(0);' onclick='editProduct("+i+",this)'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href='javascript: void(0);' onclick='deleteProduct("+i+",this)'></a></span></td></tr>";
    	$("table tbody").html(new_row);
    }  */
        var subTotal = calSubTotal();
        calAllCgst();
        calAllSgst();
	    calGrandTotal();
    	$("#product_name").val('Select Product Name');
   	    $("#product_size").val('');
   	    $("#batch_no").val('');   
   	   	$("#quantity").val('0');
   	 	$("#measurement_unit").val('');
   	    $("#prate").val('0');
   	    $("#disc_desc1").val('');
   	    $("#disc_desc2").val('');
   	    $("#discount1").val('0');
   	    $("#disc_per1").val('0')
   	    $("#disc_per2").val('0')
   	    $("#discount2").val('0'); 
   	    $("#gstper").val('0');
   	    $("#gst-rate").val('0');
   	    $("#amount").val('0');
} 	

function deleteProduct(index,cr){	 
	j = $(this).closest('tr').find('td.sNo').text();
	$(cr).parents('tr').remove();
    productList.splice(index,1);
    calSubTotal();
    calAllCgst();
    calAllSgst();
    calGrandTotal();
 } 

 
function editProduct(index,cr){
	currentRow= $(cr).parents('tr');  
	j = index;
	$("#product_name").val($(cr).closest('tr').find('td.productName').text());
	$("#product_size").val($(cr).closest('tr').find('td.productSize').text());
	$("#batch_no").val($(cr).closest('tr').find('td.batchNo').text());   
	$("#quantity").val($(cr).closest('tr').find('td.quantity').text());
	$("#measurement_unit").val($(cr).closest('tr').find('td.unit').text());
	$("#prate").val($(cr).closest('tr').find('td.rate').text());
	$("#gstper").val($(cr).closest('tr').find('td.gstPer').text());
	$("#gst-rate").val($(cr).closest('tr').find('td.gstRate').text());
	$("#disc_desc1").val($(cr).closest('tr').find('td.discDesc1').text());
	$("#disc_desc2").val($(cr).closest('tr').find('td.discDesc2').text());
	$("#disc_per1").val($(cr).closest('tr').find('td.discPer1').text());
	$("#disc_per2").val($(cr).closest('tr').find('td.discPer2').text());
	$("#discount1").val($(cr).closest('tr').find('td.discount1').text()); 
	$("#discount2").val($(cr).closest('tr').find('td.discount2').text());
	$("#amount").val($(cr).closest('tr').find('td.amount').text());
	$("#product_name").attr("disabled",true);	
	$("#product_size").attr("disabled",true);
	$("#savebutton").text("Update");
	$("#cancel_btn").show();
}

function cancelProduct(){
	$("#product_name").val('Select Product Name');
	    $("#product_size").val('');
	    $("#batch_no").val('');   
	   	$("#quantity").val('0');
	 	$("#measurement_unit").val('');
	    $("#prate").val('0');
	    $("#disc_desc1").val('');
	    $("#disc_desc2").val('');
	    $("#discount1").val('0');
	    $("#disc_per1").val('0')
	    $("#disc_per2").val('0')
	    $("#discount2").val('0'); 
	    $("#gstper").val('0');
	    $("#gst-rate").val('0');
	    $("#amount").val('0');
	    $("#cancel_btn").hide();
	    $("#savebutton").text("Add");
}

 function getGstRate(){
		var rate = parseFloat($('.rate').val());
		var quantity = parseInt($('.qty').val());
		var gstper = parseFloat($('.gst').val()/100);
		
		if(isNaN(rate)){
			rate=0;
		}
		if(isNaN(gstper)){
			gstper=0;
		}
		if(isNaN(quantity)){
			quantity=0;
		}

		var gst = rate*gstper;
		var gstRate= (rate + gst).toFixed(2);
		$('#gst-rate').val(gstRate);
		
		/* $('.disc-per1').val('');
		$('.disc-rs1').val('');
		$('.disc-per2').val('');
		$('.disc-rs2').val(''); */
		return gstRate;
	}

	function getRate(){
		var quantity = parseInt($('.qty').val());
		var rate = parseFloat($('.rate').val());
		var gstRate = parseFloat($('#gst-rate').val());
		var gstper = parseFloat($('.gst').val());
		//var discRs1 = parseFloat($('.disc-rs1').val());
		//var discRs2 = parseFloat($('.disc-rs2').val());
		var discPer1 = parseFloat($('.disc-per1').val());
		var discPer2 = parseFloat($('.disc-per2').val());
		var gst = 100/(100+gstper);

		if(isNaN(gstRate)){
			gstRate=0;
		}
		if(isNaN(gstper)){
			gstper=0;
		}
		if(isNaN(quantity)){
			quantity=0;
		}
		if(isNaN(rate)){
			rate=0;
		}
		/* if(isNaN(discRs1)){
			discRs1=0;
		}
		if(isNaN(discRs2)){
			discRs2=0;
		} */
		if(isNaN(discPer1)){
			discPer1=0;
		}
		if(isNaN(discPer2)){
			discPer2=0;
		}
		
		var afterCalRate = (gstRate*gst).toFixed(2);
		//alert(afterCalRate);
		$('.rate').val(afterCalRate);
		//var amount = rate*quantity;
		var newrate = parseFloat($('.rate').val());
		var amount = (quantity*newrate);
		var discRs1 = amount*(discPer1/100);
		var discRs2 = (amount-discRs1)*(discPer2/100);
		var total = amount-(discRs1+discRs2);
		$('.disc-rs1').val(discRs1.toFixed(2));
		$('.disc-rs2').val(discRs2.toFixed(2));
		$('.amount').val(total.toFixed(2));
	    /* var newrate = parseFloat($('.rate').val());
		var amount = (quantity*newrate)-(discRs1+discRs2);
		$('.amount').val(amount.toFixed(2));  */
		/* $('.disc-per1').val('');
		$('.disc-rs1').val('');
		$('.disc-per2').val('');
		$('.disc-rs2').val(''); */
		
	}

	function discountRs1(){
		var rate = parseFloat($('.rate').val());
		var quantity = parseInt($('.qty').val());
		var discRs2 = parseFloat($('.disc-rs2').val());
		var discPer1 = parseFloat($('.disc-per1').val());
		if(isNaN(quantity)){
			quantity=0;
		}
		if(isNaN(rate)){
			rate=0;
		}
		if(isNaN(discPer1)){
			discPer1=0;
		}
		if(isNaN(discRs2)){
			discRs2=0;
		}
		var total = rate*quantity;
		var discRs1 = total*(discPer1/100);
		
		$('.disc-rs1').val(discRs1);
		total -= (discRs1+discRs2);
		$('.amount').val(total.toFixed(2));
		return discRs1;
	}

	function discountPer1(){
		var rate = parseFloat($('.rate').val());
		var quantity = parseInt($('.qty').val());
		var discPer1 = parseFloat($('.disc-per1').val());
		var discRs1 = parseFloat($('.disc-rs1').val());
		var amount = parseFloat($('.amount').val());
		var discRs2 = parseFloat($('.disc-rs2').val());
		
		if(isNaN(quantity)){
			quantity=0;
		}
		if(isNaN(rate)){
			rate=0;
		}
		if(isNaN(discPer1)){
			discPer1=0;
		}
		if(isNaN(discRs1)){
			discRs1=0;
		}
		if(isNaN(amount)){
			amount=0;
		}
		if(isNaN(discRs2)){
			discRs2=0;
		}
		
		var total = rate*quantity;
		var discPer1 = (discRs1*100)/total;
		var total = total-(discRs1+discRs2);
		$('.disc-per1').val(discPer1);
		$('.amount').val(total.toFixed(2));
		
	}

	function discountRs2(){
		var rate = parseFloat($('.rate').val());
		var quantity = parseInt($('.qty').val());
		var discRs1 = parseInt($('.disc-rs1').val());
		var discPer2 = parseFloat($('.disc-per2').val());
		if(isNaN(quantity)){
			quantity=0;
		}
		if(isNaN(rate)){
			rate=0;
		}
		if(isNaN(discRs1)){
			discRs1=0;
		}
		if(isNaN(discPer2)){
			discPer2=0;
		}
		
		var total = (rate*quantity)-discRs1;
		
		
		var discRs2 = (total*(discPer2/100)).toFixed(2);

		$('.disc-rs2').val(discRs2);
		
		total -= discRs2;
		$('.amount').val(total.toFixed(2));
		return discRs2;
	}

	function discountPer2(){
		var rate = parseFloat($('.rate').val());
		var quantity = parseInt($('.qty').val());
		var discRs1 = parseInt($('.disc-rs1').val());
		var discPer2 = parseFloat($('.disc-per2').val());
		var discRs2 = parseFloat($('.disc-rs2').val());
		
		if(isNaN(quantity)){
			quantity=0;
		}
		if(isNaN(discRs1)){
			discRs1=0;
		}
		if(isNaN(rate)){
			rate=0;
		}
		if(isNaN(discPer2)){
			discPer2=0;
		}
		if(isNaN(discRs2)){
			discRs2=0;
		}
		
		var total = (rate*quantity)-discRs1;
		var discPer2 = (discRs2*100)/total;
		$('.disc-per2').val(discPer2);
		total = total-discRs2;
		$('.amount').val(total.toFixed(2));

	}

	function calTotal(){
		var rate = parseFloat($('.rate').val());
		var quantity = parseInt($('.qty').val());
		var amount = parseFloat($('.amount').val());
		var discPer1 = parseFloat($('.disc-per1').val());
		var discPer2 = parseFloat($('.disc-per2').val());
		//var discRs1 = parseFloat($('.disc-rs1').val());
		//var discRs2 = parseFloat($('.disc-rs2').val());
		//var discRs1 = discountRs1();
		//var discRs2 = discountRs2();
		var gstper = parseFloat($('.gst').val()/100);
		
		if(isNaN(rate)){
			rate=0;
		}
		if(isNaN(quantity)){
			quantity=0;
		}
		if(isNaN(amount)){
			amount=0;
		}
		if(isNaN(discPer1)){
			discPer1=0;
		}
		if(isNaN(discPer2)){
			discPer2=0;
		}
		/* if(isNaN(discRs1)){
			discRs1=0;
		}
		if(isNaN(discRs2)){
			discRs2=0;
		} */
		var gst = rate*gstper;
		var gstRate= (rate + gst).toFixed(2);
		$('#gst-rate').val(gstRate);
		
		//var amount = parseFloat($('.amount').val());
		var amount = rate*quantity;
		var discRs1 = amount*(discPer1/100);
		var discRs2 = (amount-discRs1)*(discPer2/100);
		var total = amount-(discRs1+discRs2);
		$('.disc-rs1').val(discRs1);
		$('.disc-rs2').val(discRs2);
		$('.amount').val(total.toFixed(2));
		
		/* $('.disc-per1').val('');
		$('.disc-rs1').val('');
		$('.disc-per2').val('');
		$('.disc-rs2').val(''); */
		return total;
	}
	
	function calTotalSgst(){
		
		var gst=[]; 
		var subtotGst=[];
		var totalGst=0;
		for(var i=0; i<productList.length; i++){
			var rate = [];
			var quantity = [];
			var gstper = [];
			var amount = [];
			gstper[i] = parseInt(productList[i].gstPer);
			amount[i] = parseInt(productList[i].amount);
			subtotGst[i]= amount[i]*(gstper[i]/100);
			totalGst +=  subtotGst[i];
		}
		var totalSgst = totalGst/2;
		$('.total-sgst').val(totalSgst.toFixed(2));
		return 	totalSgst;
	}
	
function calTotalCgst(){
		
		var gst=[]; 
		var subtotGst=[];
		var totalGst=0;
		for(var i=0; i<productList.length; i++){
			var rate = [];
			var quantity = [];
			var gstper = [];
			var amount = [];
			gstper[i] = parseInt(productList[i].gstPer);
			amount[i] = parseInt(productList[i].amount);
			subtotGst[i]= amount[i]*(gstper[i]/100);
			totalGst +=  subtotGst[i];
		}
		var totalCgst = totalGst/2;
		$('.total-cgst').val(totalCgst.toFixed(2));
		return 	totalCgst;
	}
	
	function calAllCgst(){
		var totalCgst = calTotalCgst();
		var shipGst = calShipGst();
		var additionalGst1 = calAdditionalGst1();
		var additionalGst2 = calAdditionalGst2();
		var allCgst = totalCgst+shipGst/2+additionalGst1/2+additionalGst2/2;
		$('.total-cgst').val(allCgst.toFixed(2));
	}
	
	function calAllSgst(){
		var totalSgst = calTotalSgst();
		var shipGst = calShipGst();
		var additionalGst1 = calAdditionalGst1();
		var additionalGst2 = calAdditionalGst2();
		var allSgst = totalSgst+shipGst/2+additionalGst1/2+additionalGst2/2;
		$('.total-sgst').val(allSgst.toFixed(2));
	}
	
	function calSubTotal(){
		var subTotal = 0;
		for(var i=0; i<productList.length; i++){
			var amount = [];
			amount[i] = productList[i].amount;
			subTotal += +amount[i];
		}
		$("#sub-total").val(subTotal.toFixed(2));
		return 	subTotal;
	}
	
	function calShipGst(){
		var shipCharge = parseFloat($('.ship-charge').val());
		var shipGstper = parseFloat($('.ship-gst').val()/100);
		 if(isNaN(shipCharge)){
			shipCharge=0;
		}
		if(isNaN(shipGstper)){
			shipGstper=0;
		}
		
		shipGst = shipCharge*shipGstper;
		return shipGst;
	}
	
	function calAdditionalCharge(){
		var additionnalCharge1 = parseFloat($('.additional-charge1').val());
		var additionnalCharge2 = parseFloat($('.additional-charge2').val());
		if(isNaN(additionnalCharge1)){
			additionnalCharge1=0;
		}
		if(isNaN(additionnalCharge2)){
			additionnalCharge2=0;
		}
		var totalAdditionalCharge = additionnalCharge1+additionnalCharge2;
		$('.total-additional-charge').val(totalAdditionalCharge);
		return totalAdditionalCharge;
	}
	
	function calAdditionalGst1(){
		var additionnalCharge1 = parseFloat($('.additional-charge1').val());
		var additionalper1 = parseFloat($('.additional-gst1').val()/100);
		if(isNaN(additionnalCharge1)){
			additionnalCharge1=0;
		}
		if(isNaN(additionalper1)){
			additionalper1=0;
		}
		var additionalGst1 = additionnalCharge1*additionalper1;
		return additionalGst1
	}
	
	function calAdditionalGst2(){
		var additionnalCharge2 = parseFloat($('.additional-charge2').val());
		var additionalper2 = parseFloat($('.additional-gst2').val()/100);
		if(isNaN(additionnalCharge2)){
			additionnalCharge2=0;
		}
		if(isNaN(additionalper2)){
			additionalper2=0;
		}
		var additionalGst2 = additionnalCharge2*additionalper2;
		return additionalGst2
	}
	
	function calGrandTotal(){
		var subTotal = parseFloat($("#sub-total").val());
		var shippingCharges = parseFloat($(".shipping-charge").val());
		var totalAdditionCharge = parseFloat($(".total-additional-charge").val());
		var totalSgst = parseFloat($(".total-sgst").val());
		var totalCgst = parseFloat($(".total-cgst").val());
		
		if(isNaN(subTotal)){
			subTotal=0;
		}
		if(isNaN(shippingCharges)){
			shippingCharges=0;
		}
		if(isNaN(totalAdditionCharge)){
			totalAdditionCharge=0;
		}
		if(isNaN(totalSgst)){
			totalSgst=0;
		}
		if(isNaN(totalCgst)){
			totalCgst=0;
		}
		var grandTotal = (subTotal+shippingCharges+totalAdditionCharge+totalSgst+totalCgst).toFixed(2);
		$("#grand-total").val(grandTotal);
		
	}

	function shipChargeGstOnkeyup(){
		var shipCharge = parseFloat($(".ship-charge").val());
		if(isNaN(shipCharge)){
			shipCharge=0;
		}
		
		var totalCGst=calTotalCgst();
		var totalSGst=calTotalSgst();
		var shipGst = calShipGst();
		var additionalGst1 = calAdditionalGst1();
		var additionalGst2 = calAdditionalGst2();
		var totalCgsts = totalCGst+shipGst/2+additionalGst1/2+additionalGst2/2;
		var totalSgsts = totalSGst+shipGst/2+additionalGst1/2+additionalGst2/2;
		$(".shipping-charge").val(shipCharge.toFixed(2));
		$('.total-cgst').val((totalCgsts).toFixed(2));
		$('.total-sgst').val((totalSgsts).toFixed(2));
		calGrandTotal();
	}
	
	function shipChargeGstOnchange(){
		var totalCGst=calTotalCgst();
		var totalSGst=calTotalSgst();
		var shipGst = calShipGst();
		totalCgst = totalCGst+shipGst/2;
		totalSgst = totalSGst+shipGst/2;
		$('.total-cgst').val(totalCgst.toFixed(2));
		$('.total-sgst').val(totalSgst.toFixed(2));
		calGrandTotal();
	}
	
	function additionalCharge1GstOnkeyup(){
		var additionalCharge1 = parseFloat($('.additional-charge1').val());
		var totalCGst=calTotalCgst();
		var totalSGst=calTotalSgst();
		var shipGst = calShipGst();
		calGrandTotal();
		var additionalGst1 = calAdditionalGst1();
		var additionalGst2 = calAdditionalGst2();
		totalCgst = totalCGst+additionalGst1/2+additionalGst2/2+shipGst/2;
		totalSgst = totalSGst+additionalGst1/2+additionalGst2/2+shipGst/2;
		var totalAdditionalCharge = calAdditionalCharge();
		$('.total-additional-charge').val(totalAdditionalCharge.toFixed(2));
		$('.total-cgst').val(totalCgst.toFixed(2));
		$('.total-sgst').val(totalSgst.toFixed(2));
		calGrandTotal();
	}
	
	function additionalCharge1GstOnchange(){
		var totalCGst=calTotalCgst();
		var totalSGst=calTotalSgst();
		var shipGst = calShipGst();
		var additionalGst1 = calAdditionalGst1();
		var additionalGst2 = calAdditionalGst2();
		totalCgst = totalCGst+additionalGst1/2+additionalGst2/2+shipGst/2;
		totalSgst = totalSGst+additionalGst1/2+additionalGst2/2+shipGst/2;
		$('.total-cgst').val(totalCgst.toFixed(2));
		$('.total-sgst').val(totalSgst.toFixed(2));
		calGrandTotal();
	}
	
	function additionalCharge2GstOnkeyup(){
		var totalCGst=calTotalCgst();
		var totalSGst=calTotalSgst();
		var additionalGst1 = calAdditionalGst1();
		var additionalGst2 = calAdditionalGst2();
		totalCgst = totalCGst+additionalGst1/2+additionalGst2/2+shipGst/2;
		totalSgst = totalSGst+additionalGst1/2+additionalGst2/2+shipGst/2;
		var totalAdditionalCharge = calAdditionalCharge();
		$('.total-additional-charge').val(totalAdditionalCharge.toFixed(2));
		$('.total-cgst').val(totalCgst.toFixed(2));
		$('.total-sgst').val(totalSgst.toFixed(2));
		calGrandTotal();
	}
	
	function additionalCharge2GstOnchange(){
		var additionnalCharge2 = parseFloat($('.additional-charge2').val());
		var totalCGst=calTotalCgst();
		var totalSGst=calTotalSgst();
		var additionalGst1 = calAdditionalGst1();
		var additionalGst2 = calAdditionalGst2();
		totalCgst = totalCGst+additionalGst1/2+additionalGst2/2+shipGst/2;
		totalSgst = totalSGst+additionalGst1/2+additionalGst2/2+shipGst/2;
		$('.total-cgst').val(totalCgst.toFixed(2));
		$('.total-sgst').val(totalSgst.toFixed(2));
		calGrandTotal();
	}
	
	/* $(function() {
	    $('a[data-toggle="tab"]').on('click', function(e) {
	        window.localStorage.setItem('activeTab', $(e.target).attr('href'));
	    });
	    var activeTab = window.localStorage.getItem('activeTab');
	    if (activeTab) {
	        $('#myTab a[href="' + activeTab + '"]').tab('show');
	        window.localStorage.removeItem("activeTab");
	    }
	}); */
	
	
	function getSupplerAddress(){
		var supplierName = $("#supplier_name").val();

		$.ajax({
			type: 'GET',
			url: 'get-supplier-address/'+supplierName+'',
			dataType: 'json', 
			
			success: function(data){
				$("textarea[name='shippingAddress']").html("Address: "+data[0]+"\nCity:  "+data[1]+ "\nState: "+data[2]+ "\nCountry: "+data[3]+"\nPin Code: "+data[4]); 
				$("#payment-days").val(data[6]);
				
				var optionsPayTerm = "";
				$('#payment-term').html('');
					 optionsPayTerm +=  '<option>'+data[5]+'</option>';
					 optionsPayTerm +=  '<option>COD</option>';
					 optionsPayTerm +=  '<option>Pay In Days</option>';
				 $("#payment-term").append(optionsPayTerm);
				 
				var optionsSalePerson;
				$("#sales-person").html("");
				optionsSalePerson =  '<option>'+data[7]+'</option>';
				$("#sales-person").append(optionsSalePerson);
				changePaymentTerm();
			},
			error: function(){
				alert(arguments[2]);
			}
		});
	}

	function getProductFields(){
		var productName = $("#product_name").val();
		
		$.ajax({
			type: 'GET',
			url: 'get-product-fields/'+productName+'',
			dataType: 'json', 
			
			success: function(data){
			var options = "";
			$('#product_size').html('');
			 for(var i=0; i<data.length; i++){ 
				options +=  '<option value="'+data[i].productSize+'">'+data[i].productSize+'</option>';
			 } 
			$('#product_size').append(options);
			$('#measurement_unit').val(data[0].measurmentUnit);
			},
			error: function(){
				alert(arguments[2]);
			}
		});

	}

	function commentsValue() {
		var comments = $("#comments").text();
		var privateComments = $("#private-comments").text();
		var noteComments = $("#note-comments").text();
		var footerComments = $("#footer-comments").text();
		$('#comments-val').val(comments);
	    $('#private-comments-val').text(privateComments);
		$('#note-comments-val').html(noteComments);
		$('#footer-comments-val').html(footerComments); 
	}

	$.fn.serializeObject = function()
	{
	    var o = {};
	    var a = this.serializeArray();
	    $.each(a, function() {
	        if (o[this.name] !== undefined) {
	            if (!o[this.name].push) {
	                o[this.name] = [o[this.name]];
	            }
	            o[this.name].push(this.value || '');
	        } else {
	            o[this.name] = this.value || '';
	        }
	    });
	    return o;
	};


	$(document).ready(function(){	
		var gstReceivedFormData = $("#gst-received-form-data");
		gstReceivedFormData.submit(function(e){
			e.preventDefault(); 
			commentsValue();
	    var jsonObj = [];
	    i=0;
	$("tbody tr.dynamic").each(function(){
		
	    var td = $(this).find('td');
		
	    var productName=td.eq(1).text();
	    var productSize=td.eq(2).text();
	    var batchNo=td.eq(3).text();   
	    var quantity=td.eq(4).text();
	    var unit=td.eq(5).text();
	    var rate=td.eq(6).text();
	    var gstPer=td.eq(7).text();
	    var gstRate=td.eq(8).text();
	    var discDesc1=td.eq(9).text();
	    var discDesc2=td.eq(10).text();
	    var discPer1=td.eq(11).text();
	    var discPer2=td.eq(12).text();
	    var discount1=td.eq(13).text();
	    var discount2=td.eq(14).text();
	    var totalDiscount=td.eq(15).text(); 
	    var amount=td.eq(16).text();
	    var discountRat1=td.eq(17).text();

	    jsonObj.push({
	    	productName: productName,
       		productSize: productSize,
       		batchNo: batchNo,
       		quantity: quantity,
       		unit: unit,
       		rate: rate,
       		gstPer: gstPer,
       		gstRate: gstRate,
       		discDesc1: discDesc1,
       		discDesc2: discDesc2,
       		discPer1: discPer1,
       		discPer2: discPer2,
       		discount1: discount1,
       		discount2: discount2,
       		totalDiscount: totalDiscount,
       		amount: amount
	    });
	    i++
	});
	
	var dataString = JSON.stringify(jsonObj);
	var gstReceivedForm = JSON.stringify($('form').serializeObject());
	//alert(gstReceivedForm);
	//console.log(dataString);
	      $.ajax({
	     type: "POST",
	     url: "submit-gst-received", 
	     
	      data:{
	    	  gstReceivedForm: gstReceivedForm, 
	    	  dataString: dataString
	    	 }, 
	   	 
	     success: function(response){
	    	 if(response="success"){
		         alert("Successfully submitted !!");
		         //$('#raw-received-form')[0].reset();
		         window.location = "view-gst-received";
	    	 }
	    	 else{
	    		 alert("Failed !!")
	    	 }
	      }
	    });  
	 
	});

	});
	
	function clearAllFields(){
		window.location = "add-gst-received";
		return false;
	}
	
	$(document).ready(function(){
		var date_input=$('#datepicker'); //our date input has the name "date"
		var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
		date_input.datepicker({
			//"setDate": new Date(),
			format: 'dd/mm/yyyy',
			container: container,
			todayHighlight: true,
			autoclose: true,
		}).datepicker("setDate",'now');
	})
	
	/* $(function() {
	    var currentDate = new Date();
	    $('#datepicker').datepicker({
	        inline: true,
	        showOtherMonths: true,
	        dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
	        dateFormat: 'dd/mm/yy'
	    });
	    $("#datepicker").datepicker("setDate", currentDate);
	}); */
	
	$(function(){
		changePaymentTerm();
	});
	
	function changePaymentTerm(){
		if($("#payment-term").val()=="COD"){
			$("#payment-days").attr('readonly', true);
		}
		else{
			$("#payment-days").attr('readonly', false);
		}
	}
</script>

<style>
[contenteditable=true]:empty:before{
  content: attr(placeholder);
  display: block; /* For Firefox */
}
</style>
			
 </body>
</html>
