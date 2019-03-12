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

	<div class="col-md-12">
		<div class="row" style="border-bottom:2px solid #23133a;padding-bottom:10px;">
			<div class="col-md-5"><h3>View Details Sheet Manufacture</h3></div>
			<div class="col-md-6"></div>
			<div class="col-md-1"><a href="view-sheet-mfg"><i class="fa fa-angle-left" style="font-size:20px;"></i> Back</a></div>
		</div>	
		
		<div style="margin-top:20px;"><h4>Select Raw Material To manufacture sheet</h4></div><hr>
 	 <form id="sheet-mfg-form">
	<div class="col-md-6">
          <div class="form-group">
            <div class="col-md-4 inp-field">Product Name*</div>
            <div class="col-md-8 inp-field">
            	<select class="form-control" name="productName" id="product-name" disabled>
            		<option>Select Product Name</option>
            		<option>hexa</option>
            		<%-- <c:forEach items="${rawSuppliers}" var="suppliers">
            		<option>${suppliers}</option>
            		</c:forEach> --%>
            	</select>
            </div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Used Qty*</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" id="used-qty" name="usedQty" placeholder="Enter used quantity" readonly></div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Scrap used Qty*</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" id="scrap-used-qty" name="scrapUsedQty" placeholder="Enter scrap used quantity" readonly></div>
          </div>
          
          </div>
         
	<div class="col-md-6">         
       	
          <div class="form-group">
            <div class="col-md-4 inp-field"></div>
            <div class="col-md-8 inp-field" >Available Quantity</div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Available Qty*</div>
            <div class="col-md-8 inp-field"><input type="text" readonly class="form-control" id="avalable-qty" name="avlQty" placeholder="Available quantity"></div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Scrap Available Qty*</div>
            <div class="col-md-8 inp-field"><input type="text" readonly class="form-control" id ="scrap-avl-Qty" name="scrapAvlQty" placeholder="Scrap Available quantity"></div>
          </div>
          
          </div>
		
	 <div class="col-md-10"></div>
          <div class="col-md-2"><a href="javascript:void(0);" class="btn btn-success" onclick="return updateProduct();" disabled id="savebutton">Add</a></div>
        <div class="col-md-12" style="margin-top:10px;border-top:2px solid #23133a;padding-bottom:10px;"></div>
         
          <div class="col-md-12" id="display-product" style="margin-top:20px;">
          	<table class="table table-striped">
          		<thead>
			<tr>
				<!-- <th>#</th>  -->
				<!-- <th>Product Id</th> -->
				<th>Product Name</th>
				<th>Used Qty</th>
				<th>Scrap Used Qty</th>
				<th>Avail. Qty</th>
				<th>Scrap Avail. Qty</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			</thead>
			<tbody>	
			<c:forEach items="${sheetMfgProductList}" var="sheetMfgProduct" varStatus="i">
				<tr class='dynamic' class='info'><!-- <td style='display:none'class='sNo'>"+ i +"</td> --><td class='productName'>${sheetMfgProduct.productName}</td><td class='usedQty'>${sheetMfgProduct.usedQty}</td><td class='scrapUsedQty'>${sheetMfgProduct.scrapUsedQty}</td><td class='avlQty'>${sheetMfgProduct.avlQty}</td><td class='scrapAvlQty'>${sheetMfgProduct.scrapAvlQty}</td><td><span class='editrow'><a class='fa fa-edit' href='javascript: void(0);' onclick='editProduct(${i.count},this)'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href='javascript: void(0);' onclick='deleteProduct(${i.count},this)'></a></span></td></tr>
			</c:forEach>
			</tbody>
		</table>
          </div>
          </div>
          
          <div class="col-md-12">
          	<h4>Sheet Manufacturing Details</h4><hr>
          </div>
          
          <div class="col-md-6">
          <div class="form-group">
            <div class="col-md-4 inp-field">Mfg Date*</div>
           <div class="col-md-8 inp-field"><input type="date" class="form-control ship-charge" name="sheetMfgdate" value="${sheetMfgData.sheetMfgdate}" readonly></div>
          </div>
         
          <div class="form-group">
            <div class="col-md-4 inp-field">Start Time*</div>
            <div class="col-md-8 inp-field"><input type="time" class="form-control" name="startTime" value="${sheetMfgData.endTime}" readonly></div>
          </div>
          
          <div class="form-group">
            <div class="col-md-4 inp-field">End Time*</div>
            <div class="col-md-8 inp-field"><input type="time" class="form-control" name="endTime" value="${sheetMfgData.endTime}" readonly></div>
          </div>
          </div>
          
	<div class="col-md-6">         
       	
          <div class="form-group">
            <div class="col-md-4 inp-field">Sheet Name*</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="sheetName" placeholder="Sheet Name" value="${sheetMfgData.sheetName}" readonly></div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Sheet Size*</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="sheetSize" placeholder="Sheet Size" value="${sheetMfgData.sheetSize}" readonly></div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Sheet Gage*</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="sheetGage" placeholder="Sheet Gage" value="${sheetMfgData.sheetGage}" readonly></div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Manufacture Qty*</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="mfgQty" placeholder="Manufacture Quantity" value="${sheetMfgData.mfgQty}" readonly></div>
          </div>
	</div>
	
         </form>    
     
      	
<script>

var i=0;
currentRow = null;
var productList=[];
var sno;
var j;
function updateProduct(){
	
	var bool = $("#savebutton").text() == "Update";
	if(bool){
		updateProductToTable();
	}
	else{
		addProductToTable();
	}
}
 	
 	
function addProductToTable(){
	
    var productName=$("#product-name").val();
    var usedQty=$("#used-qty").val();
    var scrapUsedQty=$("#scrap-used-qty").val();   
    var avlQty=$("#avalable-qty").val();
    var scrapAvlQty=$("#scrap-avl-Qty").val();
    
 		
	productList.push({
   		productName: productName,
   		usedQty: usedQty,
   		scrapUsedQty: scrapUsedQty,
   		avlQty: avlQty,
   		scrapAvlQty: scrapAvlQty,
     		
  	});
   	
  
    var new_row="";
     for(i=0; i<productList.length; i++){
    	
   	new_row += "<tr class='dynamic' class='info'><td style='display:none'class='sNo'>"+ i +"</td><td class='productName'>" + productList[i].productName + "</td><td class='usedQty'>" + productList[i].usedQty + "</td><td class='scrapUsedQty'>" + productList[i].scrapUsedQty + "</td><td class='avlQty'>" + productList[i].avlQty + "</td><td class='scrapAvlQty'>" + productList[i].scrapAvlQty + "</td><td><span class='editrow'><a class='fa fa-edit' href='javascript: void(0);' onclick='editProduct("+i+",this)'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href='javascript: void(0);' onclick='deleteProduct("+i+",this)'></a></span></td></tr>";
    	$("table tbody").html(new_row);
    } 
     $("#product-name").val('Select Product Name');
	    $("#used-qty").val('');
	    $("#scrap-used-qty").val('');   
	   	$("#avalable-qty").val('');
	    $("#scrap-avl-Qty").val('');
	    
} 	
 	
 function updateProductToTable(){
	
	var productName=$("#product-name").val();
    var usedQty=$("#used-qty").val();
    var scrapUsedQty=$("#scrap-used-qty").val();   
    var avlQty=$("#avalable-qty").val();
    var scrapAvlQty=$("#scrap-avl-Qty").val();
    
 	if(currentRow){
 		productList.splice(i,1);
 		productList.push({
       		productName: productName,
       		usedQty: usedQty,
       		scrapUsedQty: scrapUsedQty,
       		avlQty: avlQty,
       		scrapAvlQty: scrapAvlQty,
       		
    	});
   	
  
 		productList.splice(j,1);
 	   	var new_row = "<tr class='dynamic' class='info'><td style='display:none'class='sNo'>"+ i +"</td><td class='productName'>" + productName + "</td><td class='usedQty'>" + usedQty + "</td><td class='scrapUsedQty'>" + scrapUsedQty + "</td><td class='avlQty'>" + avlQty + "</td><td class='scrapAvlQty'>" + scrapAvlQty + "</td><td><span class='editrow'><a class='fa fa-edit' href='javascript: void(0);' onclick='editProduct("+i+",this)'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href='javascript: void(0);' onclick='deleteProduct("+i+",this)'></a></span></td></tr>";
		
   	   $("table tbody").find($(currentRow)).replaceWith(new_row);
        currentRow = null;
        
        $("#savebutton").text('Add');
        $("#product-name").val('Select Product Name');
	    $("#used-qty").val('');
	    $("#scrap-used-qty").val('');   
	   	$("#avalable-qty").val('');
	    $("#scrap-avl-Qty").val('');
    }
   
} 	 
 	
function deleteProduct(index,cr){	 
	j = $(this).closest('tr').find('td.sNo').text();
	$(cr).parents('tr').remove();
    productList.splice(index,1);

 } 
 
function editProduct(index,cr){
	currentRow= $(cr).parents('tr');  
	j = index;

	$("#product-name").val($(cr).closest('tr').find('td.productName').text());
	$("#used-qty").val($(cr).closest('tr').find('td.usedQty').text());
	$("#scrap-used-qty").val($(cr).closest('tr').find('td.scrapUsedQty').text());   
	$("#avalable-qty").val($(cr).closest('tr').find('td.avlQty').text());
	$("#scrap-avl-Qty").val($(cr).closest('tr').find('td.scrapAvlQty').text());
	$("#savebutton").text('Update');

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
} 

$(document).ready(function(){

		var sheetMfgForm = $("#sheet-mfg-form");
		sheetMfgForm.submit(function(e){
			e.preventDefault(); 
		
	    var jsonObj = [];
	    i=0;
	$("tbody tr.dynamic").each(function(){

	    var td = $(this).find('td');
		
	    var productName=td.eq(1).text();
	    var usedQty=td.eq(2).text();
	    var scrapUsedQty=td.eq(3).text();   
	    var avlQty=td.eq(4).text();
	    var scrapAvlQty=td.eq(5).text();

	    jsonObj.push({
	    	productName: productName,
       		usedQty: usedQty,
       		scrapUsedQty: scrapUsedQty,
       		avlQty: avlQty,
       		scrapAvlQty: scrapAvlQty,
	    });
	    i++
	});

	var productData = JSON.stringify(jsonObj);
	var sheetMfgData = JSON.stringify($('form').serializeObject());

	console.log(productData);
	console.log(sheetMfgData);
	     $.ajax({
	     type: "POST",
	     url: "submit-sheet-mfg-details", 
	     
	      data:{
	    	  sheetMfgData: sheetMfgData, 
	    	  productData: productData
	      }, 
	   	 
	     success: function(response){
	    	 if(response){
	         	alert("Successfully submitted !!");
	         	window.location	= "add-sheet-mfg-details";   
	         }
	      }
	    });   
	 
		 });

 }); 
</script>
 </body>
</html>
