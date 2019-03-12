<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Raw Received</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script>


</script>
</head>
<body>

	<div class="row">
		<!-- <div class="col-md-1"></div> -->
		<div class="col-md-11 " style="margin-left:30px;">
		
			
		<div class="row">
		
			<div style="margin-top:10px;border-bottom:2px solid #23133a;padding-bottom:10px;"><h3>Add Raw Received</h3></div>
			
			<div style="margin-top:20px;"><h4>Supplier Information</h4></div><hr>
	 	 <form id="raw-received-form">
		<div class="col-md-6">
           <div class="form-group">
             <div class="col-md-4 inp-field">Supplier Name*</div>
             <div class="col-md-8 inp-field">
             	<select class="form-control" name="supplierName" id="supplier_name" onchange="getSupplerAddress()" required>
             		<option>Select Supplier Name</option>
             		<c:forEach items="${rawSuppliers}" var="suppliers">
             		<option>${suppliers}</option>
             		</c:forEach>
             	</select>
             </div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Shipping Address*</div>
             <div class="col-md-8 inp-field"><textarea rows="6" class="form-control" required name="shippingAddress" placeholder="Enter Shipping Address"></textarea></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Shipped By</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" required name="shipBy" placeholder="Enter shipped by"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Tracking Ref. No</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" required name="trackNo" placeholder="Enter track reference number"></div>
           </div>
           
           </div>
		
		<div class="col-md-6">         
        	
           <div class="form-group">
             <div class="col-md-4 inp-field">Date*</div>
             <div class="col-md-8 inp-field"><input type="date" required class="form-control" name="invoiceDate"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Payment Term</div>
             <div class="col-md-8 inp-field"><select class="form-control" name="paymentTerm" required>
               <option selected disabled>Select Payment Term</option>
             	<option>COD</option>
               <option>Pay In Days</option>
             </select></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Sales Person*</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" required name="salesPerson" placeholder="Enter sales person"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Invoice No.*</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" required name="invoiceNo" placeholder="Enter invoice number"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Vehicle No.*</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" required name="vehicleNo" placeholder="Enter vehicle number"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Driver Name*</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" required name="driverName" placeholder="Enter driver name"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Driver Contact Number*</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" required name="driverNo" placeholder="Enter driver contact number"></div>
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
             <div>Qty*</div>
             <div class="inp-field"><input type="number" value=0 class="form-control qty" id="quantity" placeholder="" onkeyup="calTotal()"></div>
           </div>
           
           <div class="form-group col-md-3">
             <div>Unit</div>
             <div class="inp-field"><input type="text" name="unit" class="form-control measur-unit" id="measurement_unit"  placeholder=""></div>
           </div>
           <div class="form-group col-md-3">
             <div>Rate*</div>
             <div class="inp-field"><input type="number" value=0 class="form-control rate"  id="prate" placeholder="" onkeyup="return calTotal()"></div>
           </div>
           <div class="form-group col-md-3">
             <div>GST %*</div>
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
             <div>GST Rate</div>
             <div class="inp-field"><input type="number"  class="form-control gstRate" id="gst-rate" name="gstRate" placeholder="" value=0 onkeyup="getRate()"></div>
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
             <div>Discount 2(%)</div>
             <div class="inp-field"><input type="number" value=0 class="form-control disc-per2" onkeyup="return discountRs2();" id="disc_per2" placeholder="%"></div>
           </div>
           <div class="form-group col-md-2">
             <div>Discount 2(Rs)</div>
             <div class="inp-field"><input type="number" value=0 class="form-control disc-rs2" id="discount2" onkeyup="discountPer2()" id="" placeholder="Rs."></div>
           </div>
           <div class="form-group col-md-4">
             <div>Amount*</div>
             <div class="inp-field"><input type="number" value=0 readonly class="form-control amount" id="amount" placeholder=""></div>
           </div>
           
           <div class="col-md-10"></div>
           <div class="col-md-2"><a href="javascript:void(0);" class="btn btn-success" onclick="return productUpdate();" id="updateButton"><i class="fa fa-plus"></i> Add</a></div>
          <div class="col-md-12"></div>
           <div class="col-md-12" id="display-product" style="margin-top:20px;">
           	<table class="table table-striped" id="productTable">
           		<thead>
				<tr>
					<!--  <th>#</th>  -->
					<th>Product Name</th>
					<th>Product Size</th>
					<th>Batch No.</th>
					<th>Qty.</th>
					<th>Unit</th>
					<th>Rate</th>
					<th>Gst(%)</th>
					<th>GstRate</th>
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
           
           <div class="col-md-6">
           <div class="form-group">
             <div class="col-md-6 inp-field">Shipping Charges Rs.*</div>
            <div class="col-md-6 inp-field"><input type="number" onkeyup="shipChargeGstOnkeyup()" class="form-control ship-charge" name="shippingCost" placeholder="" value="0"></div>
           </div>
           	
           <div class="form-group">
             <div class="col-md-6 inp-field">Shipping GST*</div>
             <div class="col-md-6 inp-field">
             	<select class="form-control ship-gst" name=shippingGst id="" onchange="shipChargeGstOnchange()">
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
             <div class="col-md-6 inp-field"><input type="number" name="additionalChargeRs1" class="form-control additional-charge1" name="additonalChg1" onkeyup="additionalCharge1GstOnkeyup()" placeholder="" value=0></div>
           </div>
           <div class="form-group">
             <div class="col-md-6 inp-field">Additional GST*</div>
             <div class="col-md-6 inp-field">
             	<select class="form-control additional-gst1" name="additionalChargeRs1" id="" onchange="additionalCharge1GstOnchange()">
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
             <div class="col-md-6 inp-field"><textarea class="form-control" placeholder="Write something ..."></textarea></div>
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
             <div class="col-md-6 inp-field"><input type="number" name="totalSGST" readonly class="form-control total-sgst" id="" placeholder="" value="0" style="background-color:yellow"></div>
           </div>
           <div class="form-group">
             <div class="col-md-6 inp-field">CGST*</div>
             <div class="col-md-6 inp-field"><input type="number" name="totalCGST" readonly class="form-control total-cgst" id="" name="totalCGSTAmt" placeholder="" value="0" style="background-color:yellow"></div>
           </div>
           <div class="form-group">
             <div class="col-md-6 inp-field">Grand Total</div>
             <div class="col-md-6 inp-field"><input type="number" readonly class="form-control" id="grand-total" name="grandTotal" placeholder="" value="0" style="background-color:yellow"></div>
           </div>
           </div>
           
           <div class="col-md-12"><hr></div>
            <div class="col-md-12">

			    <!-- Nav tabs -->
			    <ul class="nav nav-tabs" role="tablist" id="myTab">
			        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Comments</a></li>
			        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Private Comments</a></li>
			        <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Note Comments</a></li>
			        <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Footer Comments</a></li>
			    </ul>
			
			    <!-- Tab panes -->
			    <div class="tab-content">
			        <div role="tabpanel" class="tab-pane active" id="home">Content Home</div>
			        <div role="tabpanel" class="tab-pane" id="profile">Content Profile</div>
			        <div role="tabpanel" class="tab-pane" id="messages">Content Messages</div>
			        <div role="tabpanel" class="tab-pane" id="settings">Content Settings</div>
			    </div>

            
            </div>
            <div class="col-md-12"><hr></div>
            <!-- <input type="hidden" > -->
         	<div class="col-md-12">
         		<div class="col-md-10"></div>
			<div class="col-md-2"><button class="btn" style="background-color:#23133a;color:#fff">Add Raw Received</button></div>
		</div>
           
            </form> 
          </div>
        
         </div>
         
         
       
         <div class="col-md-1" ></div>
		
	</div>
			
<script>

//New Jquery Code for add product
var productList = [];
//Next ID for adding a new Product
var _nextId = 1;
// ID of Product currently editing
var _activeId = 0;

function formClear() {
	$("#product_name").val('Select Product Name');
    $("#product_size").val('');
    $("#batch_no").val('');   
   	$("#quantity").val('0');
    $("#prate").val('0');
    $("#discount1").val('0');
    $("#disc_per1").val('0')
    $("#disc_per2").val('0')
    $("#discount2").val('0'); 
    $("#gstper").val('0');
    $("#gst-rate").val('0');
    $("#amount").val('0');
}


function productAddToTable() {
  // Does tbody tag exist ? add one if not
  if ($("#productTable tbody").length == 0) {
    $("#productTable")
      .append("<tbody></tbody>");
  }
  // Append product to table
  $("#productTable tbody").append(
    productBuildTableRow(_nextId));
  // Increment next ID to use
  
  var productName=$("#product_name").val();
  var productSize=$("#product_size").val();
  var batchNo=$("#batch_no").val();   
  var quantity=$("#quantity").val();
  var rate=$("#prate").val();
  var discount1=parseFloat($("#discount1").val()).toFixed(2);
  var discount2=parseFloat($("#discount2").val()).toFixed(2);
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
	
	 productList.push({
 		productName: productName,
 		productSize: productSize,
 		batchNo: batchNo,
 		quantity: quantity,
 		unit: unit,
 		rate: rate,
 		gstPer: gstPer,
 		gstRate: gstRate,
 		totalDiscount: totalDiscount,
 		amount: amount,
	}); 
  
  //alert(list.length);
  _nextId += 1;
  calSubTotal();
  calAllCgst();
  calAllSgst();
  calGrandTotal();
}

function productDelete(ctl) {
 $(ctl).parents("tr").remove();
}

function productDisplay(ctl) {
  var row = $(ctl).parents("tr");
  var cols = row.children("td");
 
  $("#product_name").val($(cols[0]).text());
  $("#product_size").val($(cols[1]).text());
  $("#batch_no").val($(cols[2]).text());   
  $("#quantity").val($(cols[3]).text());
  $("#measurement_unit").val($(cols[4]).text());
  $("#prate").val($(cols[5]).text());
  $("#gstper").val($(cols[6]).text());
  $("#gst-rate").val($(cols[7]).text());
  //$("#discount1").val($(this).closest('tr').find('td.discount1').text()); 
  _activeId = $($(cols[10]).
              children("button")[0]).data("id");
  // Change Update Button Text
  $("#updateButton").text("Update");
}

function productUpdate() {
  if ($("#updateButton").text() == "Update") {
    productUpdateInTable(_activeId);
  }
  else {
    productAddToTable();
  }
  // Clear form fields
  formClear();
  // Focus to product name field
  $("#product_name").focus();
}


function productUpdateInTable(id) {
  // Find Product in <table>
  var row =
     $("#productTable button[data-id='"+ id + "']").parents("tr")[0];
  //alert(id);
  // Add changed product to table
  $(row).after(productBuildTableRow(id));

  /* var row2 = $(ctl).parents("tr");
  var cols = row2.children("td");  
//var cols = row.children("td");
  
  var productName=$(cols[0]).text();
  var productSize=$(cols[1]).text();
  var batchNo=$(cols[2]).text();   
  var quantity=$(cols[3]).text();
  var unit=$(cols[4]).text();
  var rate=$(cols[5]).text();
  var gstPer=$(cols[6]).text();
  var gstRate=$(cols[7]).text();
  var totalDiscount=$(cols[8]).text();
  var amount=$(cols[9]).text();
  
  productList.push({
		productName: productName,
		productSize: productSize,
		batchNo: batchNo,
		quantity: quantity,
		unit: unit,
		rate: rate,
		gstPer: gstPer,
		gstRate: gstRate,
		totalDiscount: totalDiscount,
		amount: amount,
	});  */
  alert(productList.length);
  // Remove original product
  $(row).remove();
  
  
  calSubTotal();
  calAllCgst();
  calAllSgst();
  calGrandTotal();
  

  
  $("#updateButton").text("Add");
 
}

function productBuildTableRow(id) {
	
	var productName=$("#product_name").val();
    var productSize=$("#product_size").val();
    var batchNo=$("#batch_no").val();   
    var quantity=$("#quantity").val();
    var rate=$("#prate").val();
    var discount1=parseFloat($("#discount1").val()).toFixed(2);
    var discount2=parseFloat($("#discount2").val()).toFixed(2);
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
	
  var ret =
  "<tr>" +
    "<td>" + productName + "</td>" +
    "<td>" + productSize + "</td>" +
    "<td>" + batchNo + "</td>" +
    "<td>" + quantity + "</td>" +
    "<td>" + unit + "</td>" +
    "<td>" + rate + "</td>" +
    "<td>" + gstPer + "</td>" +
    "<td>" + gstRate + "</td>" +
    "<td>" + totalDiscount + "</td>" +
    "<td>" + amount + "</td>" +
    "<td>" +
    "<button type='button' " +
            "onclick='productDisplay(this);' " +
            "class='btn btn-default' " +
            "data-id='" + id + "'>" +
            "<span class='glyphicon glyphicon-edit' />" +
    "</button>" +
  "</td>" +
    "<td>" +
      "<button type='button' " +
              "onclick='productDelete(this);' " +
              "class='btn btn-default' " +
              "data-id='" + id + "'>" +
              "<span class='glyphicon glyphicon-remove' />" +
      "</button>" +
    "</td>" +
  "</tr>"
  
  //alert(ret);
      
  return ret;
}





/* var i=0;
currentRow = null;
var subTotal=0;
var totalGst=0;
var productList=[];
function addProduct(){
	
    var productName=$("#product_name").val();
    var productSize=$("#product_size").val();
    var batchNo=$("#batch_no").val();   
    var quantity=$("#quantity").val();
    var rate=$("#prate").val();
    var discount1=parseFloat($("#discount1").val()).toFixed(2);
    var discount2=parseFloat($("#discount2").val()).toFixed(2);
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
    var unit=$("#measurement_unit").val(); */
   	//var amountdbl = parseFloat(amount).toFixed(2);
   
   	/* productList.push({
   		productName: productName,
   		productSize: productSize,
   		batchNo: batchNo,
   		quantity: quantity,
   		rate: rate,
   		gstPer: gstPer,
   		gstRate: gstRate,
   		totalDiscount: totalDiscount,
   		amount: amount,
   		gstPer: gstPer
	}); */
   	
   
 	/* var new_row = "<tr class='dynamic' class='info'><td>"+i+"</td><td class='productName'>" + productName + "</td><td class='productSize'>" + productSize + "</td><td class='batchNo'>" + batchNo + "</td><td class='quantity'>" + quantity + "</td><td class='rate'>" + rate + "</td><td class='gstPer'>" + gstPer + "</td><td class='gstRate'>" + gstRate + "</td><td class='totalDiscount'>" + totalDiscount + "</td><td class='amount'>" + amount + "</td><td><span class='editrow'><a class='fa fa-edit' href='javascript: void(0);'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href='javascript: void(0);'></a></span></td></tr>"; */
   //var sno;
 	//if(currentRow){
 		//productList.splice(i,1);
 		/* productList.push({
       		productName: productName,
       		productSize: productSize,
       		batchNo: batchNo,
       		quantity: quantity,
       		rate: rate,
       		gstPer: gstPer,
       		gstRate: gstRate,
       		totalDiscount: totalDiscount,
       		amount: amount,
       		gstPer: gstPer,
       		unit: unit
       		
    	}); */
 		//sno = productList.length;
 	   	// var new_row = "<tr class='dynamic' class='info'><td class='sNo'>"+ sno +"</td><td class='productName'>" + productName + "</td><td class='productSize'>" + productSize + "</td><td class='batchNo'>" + batchNo + "</td><td class='quantity'>" + quantity + "</td><td class='unit'>" + unit + "</td><td class='rate'>" + rate + "</td><td class='gstPer'>" + gstPer + "</td><td class='gstRate'>" + gstRate + "</td><td class='totalDiscount'>" + totalDiscount + "</td><td class='amount'>" + amount + "</td><td><span class='editrow'><a class='fa fa-edit' href='javascript: void(0);'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href='javascript: void(0);'></a></span></td></tr>";
		
 	   	
   	 /* $("table tbody").find($(currentRow)).replaceWith(new_row);
        currentRow = null;
    	
   		var subTotal = calSubTotal();
   	 	calAllCgst();
     	calAllSgst();
   		calGrandTotal();
        $("#product_name").val('Select Product Name');
	    $("#product_size").val('');
	    $("#batch_no").val('');   
	   	$("#quantity").val('0');
	    $("#prate").val('0');
	    $("#discount1").val('0');
	    $("#disc_per1").val('0')
	    $("#disc_per2").val('0')
	    $("#discount2").val('0'); 
	    $("#gstper").val('0');
	    $("#gst-rate").val('0');
	    $("#amount").val('0');
    } */
   /*  else{
    	productList.push({
       		productName: productName,
       		productSize: productSize,
       		batchNo: batchNo,
       		quantity: quantity,
       		rate: rate,
       		gstPer: gstPer,
       		gstRate: gstRate,
       		totalDiscount: totalDiscount,
       		amount: amount,
       		gstPer: gstPer,
       		unit: unit
    	});
    	 */
   /*  sno = productList.length;
   	 var new_row = "<tr class='dynamic' class='info'><td class='sNo'>"+ sno +"</td><td class='productName'>" + productName + "</td><td class='productSize'>" + productSize + "</td><td class='batchNo'>" + batchNo + "</td><td class='quantity'>" + quantity + "</td><td class='unit'>" + unit + "</td><td class='rate'>" + rate + "</td><td class='gstPer'>" + gstPer + "</td><td class='gstRate'>" + gstRate + "</td><td class='totalDiscount'>" + totalDiscount + "</td><td class='amount'>" + amount + "</td><td><span class='editrow'><a class='fa fa-edit' href='javascript: void(0);'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href='javascript: void(0);'></a></span></td></tr>";
    	$("table tbody").append(new_row);
    
        var subTotal = calSubTotal();
        calAllCgst();
        calAllSgst();
	    calGrandTotal();
    	 $("#product_name").val('Select Product Name');
    	    $("#product_size").val('');
    	    $("#batch_no").val('');   
    	   	$("#quantity").val('0');
    	    $("#prate").val('0');
    	    $("#discount1").val('0');
    	    $("#disc_per1").val('0')
    	    $("#disc_per2").val('0')
    	    $("#discount2").val('0'); 
    	    $("#gstper").val('0');
    	    $("#gst-rate").val('0');
    	    $("#amount").val('0');
    	   
    } 

}
 */
  /* $(document).on('click', 'span.deleterow', function () {
    $(this).parents('tr').remove();
    var currentRowAmount = $(this).closest('tr').find('td.amount').text();
    var subtotal = $("#sub-total").val();
   	subTotal = Math.abs(parseFloat(subTotal).toFixed(2)-parseFloat(currentRowAmount).toFixed(2));
   	$("#sub-total").val(subTotal.toFixed(2));
   /* 	var currentRowGstRate = $(this).closest('tr').find('td.gstRate').text();
   	var currentRowrate = $(this).closest('tr').find('td.rate').text();
   	var currentRowQty = $(this).closest('tr').find('td.quantity').text();
   	var CurrentRowTotlalGst = (parseFloat(currentRowGstRate)-parseFloat(currentRowrate))*parseFloat(currentRowQty);
    var totalSgst = $(".total-sgst").val();
    var totalCgst = $(".total-cgst").val();
    //var totalSgst = calTotalGst()/2;
    //var totalCgst = calTotalGst()/2;
    totalSgst = parseFloat(totalSgst).toFixed(2)-(parseFloat(CurrentRowTotlalGst)/2).toFixed(2);
    totalCgst = parseFloat(totalCgst).toFixed(2)-(parseFloat(CurrentRowTotlalGst)/2).toFixed(2);
    
   	$(".total-sgst").val(totalSgst.toFixed(2));
   	$(".total-cgst").val(totalCgst.toFixed(2)); */
   	//calTotalGst();
   	//calAllCgst();
   	//calAllSgst();
    //calGrandTotal();
   //return false;
//});  */
//alert(i);
/*  $(document).on('click', 'span.deleterow', function () {
	var j = $(this).closest('tr').find('td.sNo').text();
	j = parseInt(j)-1;
	$(this).parents('tr').remove();
   productList.splice(j,1);

   calSubTotal();
   calAllCgst();
   calAllSgst();
   calGrandTotal();
});  */
 //var currentRowAmt=0;
 /* $(document).on('click', 'span.editrow', function () {
	currentRow= $(this).parents('tr');  


$("#product_name").val($(this).closest('tr').find('td.productName').text());
$("#product_size").val($(this).closest('tr').find('td.productSize').text());
$("#batch_no").val($(this).closest('tr').find('td.batchNo').text());   
$("#quantity").val($(this).closest('tr').find('td.quantity').text());
$("#measurement_unit").val($(this).closest('tr').find('td.unit').text());
$("#prate").val($(this).closest('tr').find('td.rate').text());
$("#gstper").val($(this).closest('tr').find('td.gstPer').text());
$("#gst-rate").val($(this).closest('tr').find('td.gstRate').text());
//$("#discount1").val($(this).closest('tr').find('td.discount1').text()); 
currentRowAmt = $(this).closest('tr').find('td.amount').text();

});   
  */
 
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
		
		$('.disc-per1').val('');
		$('.disc-rs1').val('');
		$('.disc-per2').val('');
		$('.disc-rs2').val('');
		return gstRate;
	}

	function getRate(){
		var quantity = parseInt($('.qty').val());
		var rate = parseFloat($('.rate').val());
		var gstRate = parseFloat($('#gst-rate').val());
		var gstper = parseFloat($('.gst').val());
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
		
		var afterCalRate = (gstRate*gst).toFixed(2);
		//alert(afterCalRate);
		$('.rate').val(afterCalRate);
	    var newrate = parseFloat($('.rate').val());
		var amount = ((quantity*newrate));
		$('.amount').val(amount.toFixed(2)); 
		$('.disc-per1').val('');
		$('.disc-rs1').val('');
		$('.disc-per2').val('');
		$('.disc-rs2').val('');
		
	}

	function discountRs1(){
		var rate = parseFloat($('.rate').val());
		var quantity = parseInt($('.qty').val());
		
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
		
		var total = rate*quantity;
		var discRs1 = total*(discPer1/100);
		
		$('.disc-rs1').val(discRs1);
		total -= discRs1;
		$('.amount').val(total.toFixed(2));
		return discRs1;
	}

	function discountPer1(){
		var rate = parseFloat($('.rate').val());
		var quantity = parseInt($('.qty').val());
		var discPer1 = parseFloat($('.disc-per1').val());
		var discRs1 = parseFloat($('.disc-rs1').val());
		var amount = parseFloat($('.amount').val());
		
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
		
		var total = rate*quantity;
		var discPer1 = (discRs1*100)/total;
		var total = total-discRs1;
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
		var discPer2 = parseFloat($('.disc-per2').val());
		var discRs2 = parseFloat($('.disc-rs2').val());
		
		if(isNaN(quantity)){
			quantity=0;
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
		
		var total = rate*quantity;
		var discPer2 = (discRs2*100)/total;
		$('.disc-per2').val(discPer2);
		total = total-discPer2;
		$('.amount').val(total.toFixed(2));
	}

	function calTotal(){
		var rate = parseFloat($('.rate').val());
		var quantity = parseInt($('.qty').val());
		var amount = parseFloat($('.amount').val());
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
	
		var gst = rate*gstper;
		var gstRate= (rate + gst).toFixed(2);
		$('#gst-rate').val(gstRate);
		
		var amount = parseFloat($('.amount').val());
		
		var total = (rate*quantity).toFixed(2);
		
		$('.amount').val(total);
		$('.disc-per1').val('');
		$('.disc-rs1').val('');
		$('.disc-per2').val('');
		$('.disc-rs2').val('');
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
			rate[i] = parseFloat(productList[i].rate).toFixed(2);
			quantity[i] = parseInt( productList[i].quantity);
			gstper[i] = parseInt(productList[i].gstPer);
			gst[i] = rate[i]*(gstper[i]/100);
			subtotGst[i]= gst[i]*quantity[i];
			totalGst +=  subtotGst[i];
		}
		/* var totalSgst = $('.total-sgst').val();
		var totalCgst = $('.total-cgst').val(); */
		var totalSgst = totalGst/2;
		
		$('.total-sgst').val(totalSgst.toFixed(2));
		//$('.total-cgst').val((totalGst/2).toFixed(2));
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
			quantity[i] = parseInt( productList[i].quantity);
			gstper[i] = parseInt(productList[i].gstPer);
			gst[i] = rate[i]*(gstper[i]/100);
			subtotGst[i]= gst[i]*quantity[i];
			totalGst +=  subtotGst[i];
		}
		/* var totalSgst = $('.total-sgst').val();
		var totalCgst = $('.total-cgst').val(); */
		var totalCgst = totalGst/2;
		
		//$('.total-sgst').val((totalGst/2).toFixed(2));
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
	
	$(function() {
	    $('a[data-toggle="tab"]').on('click', function(e) {
	        window.localStorage.setItem('activeTab', $(e.target).attr('href'));
	    });
	    var activeTab = window.localStorage.getItem('activeTab');
	    if (activeTab) {
	        $('#myTab a[href="' + activeTab + '"]').tab('show');
	        window.localStorage.removeItem("activeTab");
	    }
	});
	
	
	function getSupplerAddress(){
		var supplierName = $("#supplier_name").val();

		$.ajax({
			type: 'GET',
			url: 'get-supplier-address/'+supplierName+'',
			dataType: 'json', 
			
			success: function(data){
				
				$("textarea[name='shipAddress']").html(data.shipAddress); 
			},
			error: function(){
				alert("something is wrong");
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
				alert("something is wrong");
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
	//$("#submit").on("click",function(){
		
		
		
		var rawReceivedForm = $("#raw-received-form");
		rawReceivedForm.submit(function(e){
			e.preventDefault(); 
		
		
	    //alert(rawReceivedForm);
	    //console.log(rawReceivedForm);
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
	    var totalDiscount=td.eq(9).text(); 
	    var amount=td.eq(10).text();
	    var discountRat1=td.eq(11).text();

	    jsonObj.push({
	    	productName: productName,
	    	productSize: productSize,
	    	batchNo: batchNo,
	        quantity: quantity,
	        unit: unit,
	        rate: rate,
	        gstPer: gstPer,
	        gstRate: gstRate,
	        totalDiscount: totalDiscount,
	        amount: amount,
	        discountRat1: discountRat1
	    });
	    i++
	});

	var dataString = JSON.stringify(jsonObj);
	var rawReceivedForm = JSON.stringify($('form').serializeObject());
	//alert(rawReceivedForm);
	console.log(dataString);
	      $.ajax({
	     type: "POST",
	     url: "submit-raw-received", 
	     
	      data:{
	    	  rawReceivedForm: rawReceivedForm, 
	    	  dataString: dataString
	    	 }, 
	   	 
	     success: function(response){
	         alert("Successfully submitted !!");
	         $('#raw-received-form')[0].reset();
	      }
	    });  
	 
	});

	});
	
	
</script>
 </body>
</html>
