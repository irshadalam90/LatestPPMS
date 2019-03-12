<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Gst Invoice</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>

	<div class="row">
		<!-- <div class="col-md-1"></div> -->
		<div class="col-md-11 " style="margin-left:30px;">
		
			
		<div class="row">
		
			<div style="margin-top:10px;border-bottom:2px solid #23133a;padding-bottom:10px;"><h3>GST Invoice</h3></div>
				
				<div style="margin-top:20px;"><h4>Add GST Invoice</h4></div><hr>
		 	 <form id="gst-invoice-form">
			<div class="col-md-6">
            <div class="form-group">
              <div class="col-md-4 inp-field">Customer Name*</div>
              <div class="col-md-8 inp-field">
              	<select class="form-control" name="customerName" id="customer_name" onchange="getShippingAddress();" required>
              		<option>Select Customer Name</option>
              		<c:forEach items="${customerNamesList}" var="customerName">
              		<option>${customerName}</option>
              		</c:forEach>
              	</select>
              </div>
              </div>
              <div class="form-group">
	             <div class="col-md-4 inp-field">Shipping Address*</div>
	             <div class="col-md-8 inp-field">
	             	<textarea class="form-control" rows="5" name="shipAddress" id="ship_address" required></textarea>
	             </div>
              </div>
              <div class="col-md-4 inp-field">Ref. By*</div>
            <div class="col-md-6 inp-field">
              	<select class="form-control" name="referance"  required>
              		<option>Select Reference By</option>
              			<option>KB</option>
              	</select>
            </div>
            <div class="col-md-2"><a href="add-references" class="btn btn-default"><i class="fa fa-plus" style="font-size:18px;"></i></a></div>
            </div>
            
			<div class="col-md-6">         
         	
            <div class="form-group">
              <div class="col-md-4 inp-field">Date*</div>
              <div class="col-md-8 inp-field"><input type="date" required class="form-control" name="invoiceDate"></div>
            </div>
            <div class="form-group">
              <div class="col-md-4 inp-field">Due date*</div>
              <div class="col-md-8 inp-field"><input type="date" required class="form-control" name="dueDate"></div>
            </div>
            <div class="form-group">
              <div class="col-md-4 inp-field">Invoice No.*</div>
              <div class="col-md-8 inp-field"><input type="text" class="form-control" required name="invoiceNo" placeholder="Enter invoice number"></div>
            </div>
            
            </div>
		   
           <div class="col-md-12"><hr></div>
           <!-- <div style="margin-top:20px;"><h4>Add Product</h4></div> -->
           <div class="col-md-12">
           <div class="form-group col-md-4">
             <div>Product Name*</div>
             <div class="inp-field">
             	<select class="form-control" name="productName" id="product_name" onchange="getProductSize()">
             		 <option disabled selected>Select Product Name</option> 
             		<c:forEach items="${productNameList}" var="productName">
             		<option>${productName}</option>
             		</c:forEach>
             	</select>
             </div>
           </div>
           <div class="form-group col-md-2">
             <div>Product Size*</div>
             <div class="inp-field">
             	<select class="form-control" name="productSize" id="product_size" onchange="getProductGage()">
             		<option disabled selected>Select Size</option>
             	</select>
             </div>
           </div>
           <div class="form-group col-md-2">
             <div>Product Gage*</div>
             <div class="inp-field">
             	<select class="form-control" name="productGage" id="product_gage" onchange="getProductQty()">
             		<option disabled selected>Select Gage</option>
             	</select>
             </div>
           </div>
           <div class="form-group col-md-2">
             <div>Qty/Pkt*</div>
             <div class="inp-field"><input type="number" class="form-control" id="product_qtyperpkt" placeholder="Qty per packet" onkeyup="calSingleBoxWtMfgp();"></div>
           </div>
           <div class="form-group col-md-2">
             <div>Pkt/Box*</div>
             <div class="inp-field"><input type="number"  class="form-control" id="product_pktperbox" placeholder="Packet per box" onkeyup="calSingleBoxWtMfgp();"></div>
           </div>
           <input type="hidden" id="single_box_weight" name="singleBoxWeight">
           <input type="hidden" id="product_unit_weight" name="productUnitWt">
           <div class="form-group col-md-2">
             <div>Total Box*</div>
             <div class="inp-field"><input type="number" value=0 class="form-control" id="total_box" placeholder="" onkeyup="calBoxQtyKg()"></div>
           </div>
           <div class="form-group col-md-2">
             <div>Qty. (Kg)*</div>
             <div class="inp-field"><input type="number" value=0 readonly class="form-control" id="total_box_qtykg" placeholder="" onkeyup="calAmount()"></div>
           </div>
           <div class="form-group col-md-2">
             <div>Rate/Kg*</div>
             <div class="inp-field"><input type="number" value=0 class="form-control" id="rate" placeholder="" onkeyup="calAmount()"></div>
           </div>
           <div class="form-group col-md-3">
             <div><input type="radio" checked name="tax" value="gstper"> GST <input type="radio" name="tax" id="tax" value="igstper"> IGST (%)*</div>
             <div class="inp-field">
             	<select class="form-control" id="gst"  onchange="return getGstRate();">
             		<option selected>0</option>
             		<option>5</option>
             		<option>12</option>
             		<option>18</option>
             	</select>
             </div>
           </div>
           <div class="form-group col-md-3">
             <div>GST/IGST Rate</div>
             <div class="inp-field"><input type="number"  class="form-control gstRate" id="gst-rate" name="gstRate" placeholder="" value=0 onkeyup="getRate()"></div>
           </div>
           <div class="col-md-12"></div>
           
           <div class="form-group col-md-2">
             <div>Discount 1 Desc.</div>
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
             <div>Discount 2 Desc.</div>
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
           <div class="form-group col-md-2">
             <div>Discount 3 Desc.</div>
             <div class="inp-field"><input type="text" class="form-control" placeholder="Discount 3 Desc." id="disc_desc3"></div>
           </div>
           <div class="form-group col-md-2">
             <div>Discount 3(Kg)</div>
             <div class="inp-field"><input type="number" value=0 class="form-control disc-kg3" onkeyup="return discountRs3();" id="disc_kg3" placeholder=""></div>
           </div>
           <div class="form-group col-md-2">
             <div>Discount 3(Rs)</div>
             <div class="inp-field"><input type="number" value=0 class="form-control disc-rs3" id="discount3" onkeyup="discountKg3()" placeholder="Rs."></div>
           </div>
           <div class="col-md-3"></div>
           <div class="form-group col-md-3">
             <div>Amount*</div>
             <div class="inp-field"><input type="number" value=0 readonly class="form-control class amount" id="amount" placeholder=""></div>
           </div>
   
           <div class="col-md-11"></div>
           <div class="col-md-1"><a href="javascript:void(0);" class="btn btn-success" onclick="return addProductToTable();" id="savebutton"><!-- <i class="fa fa-plus"></i>  -->Add</a></div>
          <div class="col-md-12"></div>
           <div class="col-md-12" id="display-product" style="margin-top:20px;">
           	<table class="table table-striped">
           		<thead>
				<tr>
					 <!-- <th>#</th>  -->
					<th>Product Name</th>
					<th>Size(ml)</th>
					<th>Gage</th>
					<th>Qty/Pkt</th>
					<th>Pkt/Box</th>
					<th>Total Box</th>
					<th>Qty(Kg)</th>
					<th>Rate/Kg</th>
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
             <div class="col-md-6 inp-field">Shipping Charges Rs.*</div>
            <div class="col-md-6 inp-field"><input type="number" onkeyup="shipChargeGstOnkeyup()" class="form-control ship-charge" name="shippingCost" placeholder="" value="0"></div>
           </div>
           	
           <div class="form-group">
             <div class="col-md-6 inp-field">Shipping GST*</div>
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
           
           <div class="form-group">
             <div class="col-md-6 inp-field">Additional Note*</div>
             <div class="col-md-6 inp-field"><textarea class="form-control" name="additionalNote1" placeholder="Write something ..."></textarea></div>
           </div>
           <div class="form-group">
             <div class="col-md-6 inp-field">Additional Charges Rs.*</div>
             <div class="col-md-6 inp-field"><input type="number" class="form-control additional-charge1" name="additonalChg1" onkeyup="additionalCharge1GstOnkeyup()" placeholder="" value=0></div>
           </div>
           <div class="form-group">
             <div class="col-md-6 inp-field">Additional GST*</div>
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
           <div class="form-group">
             <div class="col-md-6 inp-field">Additional Note 1*</div>
             <div class="col-md-6 inp-field"><textarea class="form-control" name="additionalNote2" placeholder="Write something ..."></textarea></div>
           </div>
           <div class="form-group">
             <div class="col-md-6 inp-field">Additional Charges1 Rs.*</div>
             <div class="col-md-6 inp-field"><input type="number" class="form-control additional-charge2" name="additonalChg2" onkeyup="additionalCharge2GstOnkeyup()" value="0" placeholder=""></div>
           </div>
           <div class="form-group">
             <div class="col-md-6 inp-field">Additional1 GST*</div>
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
             <div class="col-md-6 inp-field">Sub Total Rs.*</div>
            <div class="col-md-6 inp-field"><input type="number" readonly id="sub-total" class="form-control subTotal" name="subtotal" placeholder="" value="0" style="background-color:yellow"></div>
           </div>
           <div class="form-group">
             <div class="col-md-6 inp-field">Shipping Charges*</div>
             <div class="col-md-6 inp-field"><input type="number" name="totalShippingChg" readonly class="form-control shipping-charge"  placeholder="" value="0" style="background-color:yellow"></div>
           </div>	
           <div class="form-group">
             <div class="col-md-6 inp-field">Additional Charges*</div>
             <div class="col-md-6 inp-field"><input type="number" readonly class="form-control total-additional-charge" name="totalAdditionChg" placeholder="" value="0" style="background-color:yellow"></div>
           </div>
           <div class="form-group">
             <div class="col-md-6 inp-field">SGST*</div>
             <div class="col-md-6 inp-field"><input type="number" readonly class="form-control total-sgst" id="" name="totalSGSTAmt" placeholder="" value="0" style="background-color:yellow"></div>
           </div>
           <div class="form-group">
             <div class="col-md-6 inp-field">CGST*</div>
             <div class="col-md-6 inp-field"><input type="number" readonly class="form-control total-cgst" id="" name="totalCGSTAmt" placeholder="" value="0" style="background-color:yellow"></div>
           </div>
           <div class="form-group">
             <div class="col-md-6 inp-field">Grand Total</div>
             <div class="col-md-6 inp-field"><input type="number" readonly class="form-control" id="grand-total" name="grandTotal" placeholder="" value="0" style="background-color:yellow"></div>
           </div>
           </div>
           
          <!--  <div class="col-md-12"><hr></div> -->
            <div class="col-md-12">

			    <!-- Nav tabs -->
			    <!--  <ul class="nav nav-tabs" role="tablist" id="myTab">
			        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Comments</a></li>
			        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Private Comments</a></li>
			        <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Note Comments</a></li>
			        <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Footer Comments</a></li>
			    </ul>
			
			    <br>
			    <div class="tab-content">
			        <div role="tabpanel" style="height:200px;width:600px;border:1px solid black;padding:10px;" class="tab-pane active"  id="home" contenteditable="true">[Enter invoice notes]</div>
			        <div role="tabpanel" style="height:200px;width:600px;border:1px solid black;padding:10px;" class="tab-pane" id="profile" contenteditable="true">[Enter internal notes]</div>
			        <div role="tabpanel" style="height:200px;width:600px;border:1px solid black;padding:10px;" class="tab-pane" id="messages" contenteditable="true">[Please contact us for more information about payment options.]</div>
			        <div role="tabpanel" style="height:200px;width:600px;border:1px solid black;padding:10px;" class="tab-pane" id="settings" contenteditable="true">[Thank you for your business.]</div>
			    </div>  -->
			    
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
         		<div class="col-md-10"></div>
			<div class="col-md-2"><button class="btn" style="background-color:#23133a;color:#fff">Add Gst Invoice</button></div>
		</div>
           
            </form> 
          </div>
        
         </div>
         
         
       
         <div class="col-md-1" ></div>
		
	</div>
			
<script>
var i=0;
currentRow = null;
var subTotal=0;
var totalGst=0;
var productList=[];
var sno;
var j;
/* function updateProduct(){
	
	var bool = $("#savebutton").text() == "Update";
	//alert(bool);
	if(bool){
		updateProductToTable();
	}
	else{
		addProductToTable();
	}
} */
 	
 	
function addProductToTable(){
	
	var productName=$("#product_name").val();
    var productSize=$("#product_size").val();
    var productGage=$("#product_gage").val();   
    var qtyPerPkt=$("#product_qtyperpkt").val();
    var pktPerBox=$("#product_pktperbox").val();
    var totalBox=$("#total_box").val();
    var boxQtyKg=$("#total_box_qtykg").val();
    var rate=$("#rate").val();
    var tax=$("#tax").val();
    var gstPer=$("#gst").val();
    var gstRate=$("#gst-rate").val();
    var discountDesc1=$("#disc_desc1").val();
    var discountDesc2=$("#disc_desc2").val();
    var discountDesc3=$("#disc_desc3").val();
    var discountPer1=parseFloat($("#disc_per1").val());
    var discountPer2=parseFloat($("#disc_per2").val());
    var discountKg=parseFloat($("#disc_kg3").val());
    var discount1=parseFloat($("#discount1").val()).toFixed(2);
    var discount2=parseFloat($("#discount2").val()).toFixed(2);
    var discount3=parseFloat($("#discount3").val()).toFixed(2);
    if(isNaN(discount1)){
    	discount1=0;
    }
    if(isNaN(discount2)){
    	discount2=0;
    }
    
    var totalDiscount=(+discount1 + +discount2).toFixed(2);
    var amount=parseFloat($("#amount").val()).toFixed(2);
    var singleBoxWeight=parseFloat($("#single_box_weight").val()).toFixed(2);
    var productUnitWeight=parseFloat($("#product_unit_weight").val()).toFixed(2);
    if(isNaN(productUnitWeight)){
    	productUnitWeight=0;
    }
    
    if($("#savebutton").text() == "Update"){
    	productList.splice(j,1);
    	productList.push({
    		productName: productName,
    	    productSize: productSize,
    	    productGage: productGage,  
    	    qtyPerPkt: qtyPerPkt,
    	    pktPerBox: pktPerBox,
    	    totalBox: totalBox,
    	    boxQtyKg: boxQtyKg,
    	    rate: rate,
    	    tax: tax,
    	    gstPer: gstPer,
    	    gstRate: gstRate,
    	    totalDiscount: totalDiscount,
    	    amount: amount,
    	    discountPer1: discountPer1,
    	    discountPer2: discountPer2,
    	    discount1: discount1,
    	    discount2: discount2,
    	    singleBoxWeight: singleBoxWeight,
    	    productUnitWeight: productUnitWeight,
    	    discountDesc1: discountDesc1,
    	    discountDesc2: discountDesc2,
    	    discountDesc3: discountDesc3,
    	    discountKg: discountKg,
    	    discount3: discount3
    	});
		var new_row = "<tr class='dynamic' class='info'>"
		
						+"<td style='display:none' class='sNo'>"+ i +"</td>"
						+"<td class='productName'>" + productName + "</td>"
						+"<td class='productSize'>" + productSize + "</td>"
						+"<td class='productGage'>" + productGage + "</td>"
						+"<td class='qtyPerPkt'>" + qtyPerPkt + "</td>"
						+"<td class='pktPerBox'>" + pktPerBox + "</td>"
						+"<td class='totalBox'>" + totalBox + "</td>"
						+"<td class='boxQtyKg'>" + boxQtyKg + "</td>"
						+"<td class='rate'>" + rate + "</td>"
						+"<td class='tax' style='display:none'>" + tax + "</td>"
						+"<td class='gstPer' style='display:none'>" + gstPer + "</td>"
						+"<td class='gstRate' style='display:none'>" + gstRate + "</td>"
						+"<td class='totalDiscount' style='display:none'>" + totalDiscount + "</td>"
						+"<td class='discountPer1' style='display:none'>" + discountPer1 + "</td>"
						+"<td class='discountPer2' style='display:none'>" + discountPer2 + "</td>"
						+"<td class='discount1' style='display:none'>" + discount1 + "</td>"
						+"<td class='discount2' style='display:none'>" + discount2 + "</td>"
						+"<td class='singleBoxWeight' style='display:none'>" + singleBoxWeight + "</td>"
						+"<td class='productUnitWeight' style='display:none'>" + productUnitWeight + "</td>"
						+"<td class='amount'>" + amount + "</td>"
						+"<td class='discountDesc1' style='display:none'>" + discountDesc1 + "</td>"
						+"<td class='discountDesc2' style='display:none'>" + discountDesc2 + "</td>"
						+"<td class='discountDesc3' style='display:none'>" + discountDesc3 + "</td>"
						+"<td class='discountKg' style='display:none'>" + discountKg + "</td>"
						+"<td class='discount3' style='display:none'>" + discount3 + "</td>"
						+"<td><span class='editrow'><a class='fa fa-edit' href='javascript: void(0);'onclick='editProduct("+j+",this)'></a></span></td>"
						+"<td><span class='deleterow'><a class='glyphicon glyphicon-trash' href='javascript: void(0);' onclick='deleteProduct("+j+",this)'></a></span></td>"
						+"</tr>";
		
 	    $("table tbody").find($(currentRow)).replaceWith(new_row);
        currentRow = null;
    	$("#savebutton").text("Add");
    }
    else{
    	productList.push({
    		productName: productName,
    	    productSize: productSize,
    	    productGage: productGage,  
    	    qtyPerPkt: qtyPerPkt,
    	    pktPerBox: pktPerBox,
    	    totalBox: totalBox,
    	    boxQtyKg: boxQtyKg,
    	    rate: rate,
    	    tax: tax,
    	    gstPer: gstPer,
    	    gstRate: gstRate,
    	    totalDiscount: totalDiscount,
    	    amount: amount,
    	    discountPer1: discountPer1,
    	    discountPer2: discountPer2,
    	    discount1: discount1,
    	    discount2: discount2,
    	    singleBoxWeight: singleBoxWeight,
    	    productUnitWeight: productUnitWeight,
    	    discountDesc1: discountDesc1,
    	    discountDesc2: discountDesc2,
    	    discountDesc3: discountDesc3,
    	    discountKg: discountKg,
    	    discount3: discount3
    	});
		/* var new_row = "<tr class='dynamic' class='info'><td style='display:none' class='sNo'>"+ i +"</td><td class='productName'>" + productName + "</td><td class='productSize'>" + productSize + "</td><td class='batchNo'>" + batchNo + "</td><td class='quantity'>" + quantity + "</td><td class='unit'>" + unit + "</td><td class='rate'>" + rate + "</td><td class='gstPer'>" + gstPer + "</td><td class='gstRate'>" + gstRate + "</td><td class='totalDiscount'>" + totalDiscount + "</td><td class='amount'>" + amount + "</td><td><span class='editrow'><a class='fa fa-edit' href='javascript: void(0);'onclick='editProduct("+j+",this)'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href='javascript: void(0);' onclick='deleteProduct("+j+",this)'></a></span></td></tr>";
    	$("table tbody").append(new_row); */
    	var new_row="";
        for(i=0; i<productList.length; i++){
        	
       	new_row += "<tr class='dynamic' class='info'>"
		       		+"<td style='display:none' class='sNo'>"+ i +"</td>"
					+"<td class='productName'>" + productList[i].productName + "</td>"
					+"<td class='productSize'>" + productList[i].productSize + "</td>"
					+"<td class='productGage'>" + productList[i].productGage + "</td>"
					+"<td class='qtyPerPkt'>" + productList[i].qtyPerPkt + "</td>"
					+"<td class='pktPerBox'>" + productList[i].pktPerBox + "</td>"
					+"<td class='totalBox'>" + productList[i].totalBox + "</td>"
					+"<td class='boxQtyKg'>" + productList[i].boxQtyKg + "</td>"
					+"<td class='rate'>" + productList[i].rate + "</td>"
					+"<td class='tax' style='display:none'>" + productList[i].tax + "</td>"
					+"<td class='gstPer' style='display:none'>" + productList[i].gstPer + "</td>"
					+"<td class='gstRate' style='display:none'>" + productList[i].gstRate + "</td>"
					+"<td class='totalDiscount' style='display:none'>" + productList[i].totalDiscount + "</td>"
					+"<td class='discountPer1' style='display:none'>" + productList[i].discountPer1 + "</td>"
					+"<td class='discountPer2' style='display:none'>" + productList[i].discountPer2 + "</td>"
					+"<td class='discount1' style='display:none'>" + productList[i].discount1 + "</td>"
					+"<td class='discount2' style='display:none'>" + productList[i].discount2 + "</td>"
					+"<td class='singleBoxWeight' style='display:none'>" + productList[i].singleBoxWeight + "</td>"
					+"<td class='productUnitWeight' style='display:none'>" + productList[i].productUnitWeight + "</td>"
					+"<td class='amount'>" + productList[i].amount + "</td>"
					+"<td class='discountDesc1' style='display:none'>" + productList[i].discountDesc1 + "</td>"
					+"<td class='discountDesc2' style='display:none'>" + productList[i].discountDesc2 + "</td>"
					+"<td class='discountDesc3' style='display:none'>" + productList[i].discountDesc3 + "</td>"
					+"<td class='discountKg' style='display:none'>" + productList[i].discountKg + "</td>"
					+"<td class='discount3' style='display:none'>" + productList[i].discount3 + "</td>"
					+"<td><span class='editrow'><a class='fa fa-edit' href='javascript: void(0);'onclick='editProduct("+j+",this)'></a></span></td>"
					+"<td><span class='deleterow'><a class='glyphicon glyphicon-trash' href='javascript: void(0);' onclick='deleteProduct("+j+",this)'></a></span></td>"
					+"</tr>";
			$("table tbody").html(new_row);
        }
    }
    
        calSubTotal();
        calAllCgst();
        calAllSgst();
	    calGrandTotal();
    	$("#product_name").val('Select Product Name');
   	    $("#product_size").val('');
   	    $("#product_gage").val('');   
   	   	$("#product_qtyperpkt").val('');
   	 	$("#product_pktperbox").val('');
   	 	$("#total_box").val('0');
   	    $("#total_box_qtykg").val('0')
   	    $("#rate").val('0');
   	    $("#discount1").val('0');
   	    $("#disc_per1").val('0')
   	    $("#disc_per2").val('0')
   	    $("#discount2").val('0'); 
   	    $("#gst").val('0');
   	    $("#gst-rate").val('0');
   	    $("#amount").val('0');
   	 	$("#single_box_weight").val('0');
   	    $("#product_unit_weight").val('0');
   	 	$("#disc_desc1").val('');
   		$("#disc_desc2").val('');
   		$("#disc_desc3").val('');
   		$("#disc_kg3").val('0');
   		$("#discount3").val('0')
  
} 	

function deleteProduct(index,cr){	 
	//j = $(this).closest('tr').find('td.sNo').text();
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
	$("#product_gage").val($(cr).closest('tr').find('td.productGage').text());
	$("#product_qtyperpkt").val($(cr).closest('tr').find('td.qtyPerPkt').text());
 	$("#product_pktperbox").val($(cr).closest('tr').find('td.pktPerBox').text());
 	$("#total_box").val($(cr).closest('tr').find('td.totalBox').text());
 	$("#total_box_qtykg").val($(cr).closest('tr').find('td.boxQtyKg').text());
    $("#rate").val($(cr).closest('tr').find('td.rate').text()); 
    $("#gst").val($(cr).closest('tr').find('td.gstPer').text());
    $("#gst-rate").val($(cr).closest('tr').find('td.gstRate').text());
    $("#disc_per1").val($(cr).closest('tr').find('td.discountPer1').text())
    $("#disc_per2").val($(cr).closest('tr').find('td.discountPer2').text())
    $("#discount1").val($(cr).closest('tr').find('td.discount1').text());
    $("#discount2").val($(cr).closest('tr').find('td.discount2').text());
    $("#amount").val($(cr).closest('tr').find('td.amount').text());
 	$("#single_box_weight").val($(cr).closest('tr').find('td.singleBoxWeight').text());
    $("#product_unit_weight").val($(cr).closest('tr').find('td.productUnitWeight').text());
    $("#disc_desc1").val($(cr).closest('tr').find('td.discountDesc1').text());
    $("#disc_desc2").val($(cr).closest('tr').find('td.discountDesc2').text());
    $("#disc_desc3").val($(cr).closest('tr').find('td.discountDesc3').text());
    $("#disc_kg3").val($(cr).closest('tr').find('td.discountKg').text());
    $("#discount3").val($(cr).closest('tr').find('td.discount3').text());
	$("#savebutton").text("Update")

}
   
 function calBoxQtyKg(){
	 var singleBOxWt = parseFloat($('#single_box_weight').val());
	 var totalBox = parseFloat($('#total_box').val());
	 if(isNaN(singleBOxWt)){
		 singleBOxWt=0;
	 }
	 if(isNaN(totalBox)){
		 totalBox=0;
	 }
	 
	 var totalBoxQtyKg = totalBox*singleBOxWt;
	 $('#total_box_qtykg').val(totalBoxQtyKg.toFixed(2));
 }
 
 function calSingleBoxWtMfgp(){
	 var unitWeight = parseFloat($('#product_unit_weight').val());
	 var qtyPerPkt = parseFloat($('#product_qtyperpkt').val());
	 var pktPerBox = parseFloat($('#product_pktperbox').val());
	 if(isNaN(qtyPerPkt)){
		 qtyPerPkt=0;
	 }
	 if(isNaN(pktPerBox)){
		 pktPerBox=0;
	 }
	 if(isNaN(unitWeight)){
		 unitWeight=0;
	 }
	 var singleBoxWt = qtyPerPkt*pktPerBox*unitWeight;
	 $('#single_box_weight').val(singleBoxWt);
	 return singleBoxWt;
 }
 
 function calAmount(){
		var ratePerKg = parseFloat($('#rate').val());
		var boxQtyKg = parseInt($('#total_box_qtykg').val());
		var gstper = parseFloat($('#gst').val()/100);
		
		if(isNaN(boxQtyKg)){
			boxQtyKg=0;
		}
		if(isNaN(ratePerKg)){
			ratePerKg=0;
		}
		if(isNaN(gstper)){
			gstper=0;
		}
		
		$("#discount1").val('0');
   	    $("#disc_per1").val('0')
   	    $("#disc_per2").val('0')
   	    $("#discount2").val('0'); 
		var amount = (ratePerKg*boxQtyKg).toFixed(2);
		$('#amount').val(amount);
		var gst = ratePerKg*gstper;
		var gstRate= (ratePerKg + gst).toFixed(2);
		$('#gst-rate').val(gstRate);
		
		return amount;
	}
 
 function getGstRate(){
	 	var ratePerKg = parseFloat($('#rate').val());
		var boxQtyKg = parseInt($('#total_box_qtykg').val());
		var gstper = parseFloat($('#gst').val()/100);
		
		if(isNaN(ratePerKg)){
			ratePerKg=0;
		}
		if(isNaN(gstper)){
			gstper=0;
		}
		if(isNaN(boxQtyKg)){
			boxQtyKg=0;
		}

		var gst = ratePerKg*gstper;
		var gstRate= (ratePerKg + gst).toFixed(2);
		$('#gst-rate').val(gstRate);
		
		/* $('.disc-per1').val('');
		$('.disc-rs1').val('');
		$('.disc-per2').val('');
		$('.disc-rs2').val(''); */
		return gstRate;
	}

	function getRate(){
		var ratePerKg = parseFloat($('#rate').val());
		var boxQtyKg = parseInt($('#total_box_qtykg').val());
		var gstRate = parseFloat($('#gst-rate').val());
		var gstper = parseFloat($('#gst').val());
		var gst = 100/(100+gstper);

		if(isNaN(gstRate)){
			gstRate=0;
		}
		if(isNaN(gstper)){
			gstper=0;
		}
		if(isNaN(boxQtyKg)){
			boxQtyKg=0;
		}
		if(isNaN(ratePerKg)){
			ratePerKg=0;
		}
		
		var afterCalRate = (gstRate*gst).toFixed(2);
		$('#rate').val(afterCalRate);
	}

	function discountRs1(){
		var ratePerKg = parseFloat($('#rate').val());
		var boxQtyKg = parseInt($('#total_box_qtykg').val());
		var discPer1 = parseFloat($('.disc-per1').val());
		if(isNaN(boxQtyKg)){
			boxQtyKg=0;
		}
		if(isNaN(ratePerKg)){
			ratePerKg=0;
		}
		if(isNaN(discPer1)){
			discPer1=0;
		}
		
		var total = ratePerKg*boxQtyKg;
		var discRs1 = total*(discPer1/100);
		
		$('.disc-rs1').val(discRs1);
		total -= discRs1;
		$('.amount').val(total.toFixed(2));
		$('.disc-rs2').val('0');
		$('.disc-rs3').val('0');
		$('.disc-per2').val('0');
		$('.disc-kg3').val('0');
		return discRs1;
	}

	function discountPer1(){
		var ratePerKg = parseFloat($('#rate').val());
		var boxQtyKg = parseInt($('#total_box_qtykg').val());
		var discPer1 = parseFloat($('.disc-per1').val());
		var discRs1 = parseFloat($('.disc-rs1').val());
		var amount = parseFloat($('.amount').val());
		
		if(isNaN(boxQtyKg)){
			boxQtyKg=0;
		}
		if(isNaN(ratePerKg)){
			ratePerKg=0;
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
		
		var total = ratePerKg*boxQtyKg;
		var discPer1 = (discRs1*100)/total;
		var total = total-discRs1;
		$('.disc-per1').val(discPer1);
		$('.amount').val(total.toFixed(2));
		$('.disc-rs2').val('0');
		$('.disc-rs3').val('0');
		$('.disc-per2').val('0');
		$('.disc-kg3').val('0');
		
	}

	function discountRs2(){
		var ratePerKg = parseFloat($('#rate').val());
		var boxQtyKg = parseInt($('#total_box_qtykg').val());
		var discRs1 = parseInt($('.disc-rs1').val());
		var discPer2 = parseFloat($('.disc-per2').val());
		if(isNaN(boxQtyKg)){
			boxQtyKg=0;
		}
		if(isNaN(ratePerKg)){
			ratePerKg=0;
		}
		if(isNaN(discRs1)){
			discRs1=0;
		}
		if(isNaN(discPer2)){
			discPer2=0;
		}
		
		var total = (ratePerKg*boxQtyKg)-discRs1;
		
		
		var discRs2 = total*(discPer2/100);

		$('.disc-rs2').val(discRs2);
		
		total -= discRs2;
		$('.amount').val(total.toFixed(2));
		return discRs2;
	}

	function discountPer2(){
		var ratePerKg = parseFloat($('#rate').val());
		var boxQtyKg = parseInt($('#total_box_qtykg').val());
		var discRs1 = parseInt($('.disc-rs1').val());
		var discPer2 = parseFloat($('.disc-per2').val());
		var discRs2 = parseFloat($('.disc-rs2').val());
		
		if(isNaN(boxQtyKg)){
			boxQtyKg=0;
		}
		if(isNaN(discRs1)){
			discRs1=0;
		}
		if(isNaN(ratePerKg)){
			ratePerKg=0;
		}
		if(isNaN(discPer2)){
			discPer2=0;
		}
		if(isNaN(discRs2)){
			discRs2=0;
		}
		
		var total = (ratePerKg*boxQtyKg)-discRs1;
		var discPer2 = (discRs2*100)/total;
		$('.disc-per2').val(discPer2);
		total = total-discRs2;
		$('.amount').val(total.toFixed(2));
	}
	
	function discountRs3(){
		var boxQtyKg = parseInt($('#total_box_qtykg').val());
		var ratePerKg = parseFloat($('#rate').val());
		var discountKg3 = parseInt($('#disc_kg3').val());
		var discRs1 = parseInt($('.disc-rs1').val());
		var discRs2 = parseInt($('.disc-rs2').val());
		if(isNaN(boxQtyKg)){
			boxQtyKg=0;
		}
		if(isNaN(ratePerKg)){
			ratePerKg=0;
		}
		if(isNaN(discountKg3)){
			discountKg3=0;
		}
		if(isNaN(discRs1)){
			discRs1=0;
		}
		if(isNaN(discRs2)){
			discRs2=0;
		}
		
		var discRs3 = discountKg3*boxQtyKg;
		$(".disc-rs3").val(discRs3);
		var total = (ratePerKg*boxQtyKg)-(discRs1+discRs2+discRs3);
		$(".amount").val(total.toFixed(2)); 
	}
	
	function discountKg3(){
		var boxQtyKg = parseInt($('#total_box_qtykg').val());
		var ratePerKg = parseFloat($('#rate').val());
		var discRs3 = parseInt($('.disc-rs3').val());
		var discRs1 = parseInt($('.disc-rs1').val());
		var discRs2 = parseInt($('.disc-rs2').val());
		if(isNaN(boxQtyKg)){
			boxQtyKg=0;
		}
		if(isNaN(ratePerKg)){
			ratePerKg=0;
		}
		if(isNaN(discRs3)){
			discRs3=0;
		}
		if(isNaN(discRs1)){
			discRs1=0;
		}
		if(isNaN(discRs2)){
			discRs2=0;
		}
		
		var discKg3 = discRs3/boxQtyKg;
	    $(".disc-kg3").val(discKg3);
	    var total = (ratePerKg*boxQtyKg)-(discRs1+discRs2+discRs3);
	    $(".amount").val(total.toFixed(2)); 
	}

	function calTotalSgst(){
		
		var gst=[]; 
		var subtotGst=[];
		var totalGst=0;
		for(var i=0; i<productList.length; i++){
			var rate = [];
			var quantity = [];
			var gstper = [];
			rate[i] = parseFloat(productList[i].rate).toFixed(2);
			quantity[i] = parseInt( productList[i].boxQtyKg);
			gstper[i] = parseInt(productList[i].gstPer);
			gst[i] = rate[i]*(gstper[i]/100);
			subtotGst[i]= gst[i]*quantity[i];
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
			rate[i] = parseFloat(productList[i].rate).toFixed(2);
			quantity[i] = parseInt( productList[i].boxQtyKg);
			gstper[i] = parseInt(productList[i].gstPer);
			gst[i] = rate[i]*(gstper[i]/100);
			subtotGst[i]= gst[i]*quantity[i];
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
		//subTotal = subTotal-currentRowAmt;
		//alert(subTotal);
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
	
	function getShippingAddress(){
		var customerName = $("#customer_name").val();

		$.ajax({
			type: 'GET',
			url: 'get-shipping-address?customerName='+customerName+'',
			dataType: 'json', 
			
			success: function(data){
				//alert(data.shipAddress);
				$("textarea[name='shipAddress']").html("address: "+data[0]+"\nCity:  "+data[1]+ "\nState: "+data[2]+ "\nCountry: "+data[3]+"\nPin Code: "+data[4]); 
			},
			error: function(){
				alert("something is wrong");
			}
		});
	}
	
	function getProductSize(){
		var productName = $("#product_name").val();
		
		$.ajax({
			type: 'GET',
			url: 'get-product-size?productName='+productName+'',
			dataType: 'json', 
			
			success: function(data){
			var options = "";
			$('#product_size').html('');
			options += '<option disabled selected>Select Size</option>';
			 for(var i=0; i<data.length; i++){ 
				options +=  '<option>'+data[i]+'</option>';
			 } 
			$('#product_size').append(options);
			},
			error: function(){
				alert(arguments[2]);
			}
		});
	}
	
	function getProductGage(){
		var productName = $("#product_name").val();
		var productSize = $("#product_size").val();
		$.ajax({
			type: 'GET',
			url: 'get-product-gage?productName='+productName+'&productSize='+productSize+'',
			dataType: 'json', 
			
			success: function(data){
			var options = "";
			$('#product_gage').html('');
			options += '<option disabled selected>Select Gage</option>';
			 for(var i=0; i<data.length; i++){ 
				options +=  '<option>'+data[i]+'</option>';
			 } 
			$('#product_gage').append(options);
			},
			error: function(){
				alert(arguments[2]);
			}
		});
	}

	function getProductQty(){
		var productName = $("#product_name").val();
		var productSize = $("#product_size").val();
		var productGage = $("#product_gage").val();
		$.ajax({
			type: 'GET',
			url: 'get-product-qty?productName='+productName+'&productSize='+productSize+'&productGage='+productGage+'',
			dataType: 'json', 
			
			success: function(data){
				if(data[0]=="qtyNotFound"){
					alert("Quantity not found for this product. please enter new quantity.");
					getProductUnitWt();
				}
				else{
					$('#product_qtyperpkt').val(data[1]);
					$('#product_pktperbox').val(data[2]); 
					$('#single_box_weight').val(data[3]);
				}
			},
			error: function(){
				alert(arguments[2]);
			}
		});
	}
	
	function getProductUnitWt(){
		var productName = $("#product_name").val();
		var productSize = $("#product_size").val();
		var productGage = $("#product_gage").val();
		$.ajax({
			type: 'GET',
			url: 'get-product-unit-weight?productName='+productName+'&productSize='+productSize+'&productGage='+productGage+'',
			dataType: 'json', 
			
			success: function(data){
				$('#product_unit_weight').val(data);
			},
			error: function(){
				alert(arguments[2]);
			}
		});
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
		var submitGstInvoiceForm = $("#gst-invoice-form");
		submitGstInvoiceForm.submit(function(e){
			e.preventDefault(); 
		
	    var jsonObj = [];
	    i=0;
	$("tbody tr.dynamic").each(function(){

	    var td = $(this).find('td');
		
	    var productName=td.eq(1).text();
	    var productSize=td.eq(2).text();
	    var productGage=td.eq(3).text();   
	    var qtyPerPkt=td.eq(4).text();
	    var pktPerBox=td.eq(5).text();
	    var totalBox=td.eq(6).text();
	    var boxQtyKg=td.eq(7).text();
	    var rate=td.eq(8).text(); 
	    var tax=td.eq(9).text();
	    var gstPer=td.eq(10).text();
	    var gstRate=td.eq(11).text();
	    var totalDiscount=td.eq(12).text();
	    var discountPer1=td.eq(13).text();
	    var discountPer2=td.eq(14).text();
	    var discount1=td.eq(15).text();
	    var discount2=td.eq(16).text();
	    var singleBoxWeight=td.eq(17).text();
	    var productUnitWeight=td.eq(18).text();
	    var amount=td.eq(19).text();
	    var discountDesc1=td.eq(20).text();
	    var discountDesc2=td.eq(21).text();
	    var discountDesc3=td.eq(22).text();
	    var discountKg=td.eq(23).text();
	    var discount3=td.eq(24).text();
	    

	    jsonObj.push({
	    	productName: productName,
    	    productSize: productSize,
    	    productGage: productGage,  
    	    qtyPerPkt: qtyPerPkt,
    	    pktPerBox: pktPerBox,
    	    totalBox: totalBox,
    	    boxQtyKg: boxQtyKg,
    	    rate: rate,
    	    tax: tax,
    	    gstPer: gstPer,
    	    gstRate: gstRate,
    	    totalDiscount: totalDiscount,
    	    discountPer1: discountPer1,
    	    discountPer2: discountPer2,
    	    discount1: discount1,
    	    discount2: discount2,
    	    singleBoxWeight: singleBoxWeight,
    	    productUnitWeight: productUnitWeight,
    	    amount: amount,
    	    discountDesc1: discountDesc1,
    	    discountDesc2: discountDesc2,
    	    discountDesc3: discountDesc3,
    	    discountKg: discountKg,
    	    discount3: discount3
	    });
	    i++
	});

	var productData = JSON.stringify(jsonObj);
	var gstInvoiceForm = JSON.stringify($('form').serializeObject());
	console.log(productData);
	console.log(gstInvoiceForm);
	     $.ajax({
	     type: "POST",
	     url: "submit-gst-invoice", 
	     data:{
	    	 	  gstInvoiceForm: gstInvoiceForm, 
		    	  productData: productData
	     	  }, 
	   	 
	     success: function(response){
	    	 if(response=="success"){
	    		alert("Successfully submitted !!");
	        	window.location = "add-gst-invoice";
	    	 }
	    	 else{
	    		 alert("failed");
	    	 }
	     },
	     error: function(){
	    	 alert(arguments[2])
	     }
	  });  
	 
	});

	});
</script>
 </body>
</html>
