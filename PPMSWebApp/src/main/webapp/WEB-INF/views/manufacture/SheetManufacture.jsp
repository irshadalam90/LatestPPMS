<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Sheet Manufacture</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<body>

		<div class="col-md-12">
			<div class="row" style="border-bottom:2px solid #23133a;padding-bottom:10px;">
				<div class="col-md-5"><h3>Sheet Manufacture</h3></div>
				<div class="col-md-6"></div>
				<div class="col-md-1"><a href="view-sheet-mfg"><i class="fa fa-angle-left" style="font-size:20px;"></i> Back</a></div>
			</div>
		
			<!-- <div style="border-bottom:2px solid #23133a;padding-bottom:10px;"><h3>Sheet Manufacture</h3></div> -->
			
			<div style="margin-top:20px;"><h4>Select Raw Material To manufacture sheet</h4></div><hr>
	 	 
		<div class="col-md-6">
           <div class="form-group">
             <div class="col-md-4 inp-field">Product Name*</div>
             <div class="col-md-8 inp-field">
             	<select class="form-control" name="id" id="product-name" onchange="getProductAvlQty()">
             		<option>Select Product Name</option>
             		<c:forEach items="${productData}" var="product">
             		<option>${product[1]}</option>
             		</c:forEach>
             		<%-- <c:forEach items="${rawSuppliers}" var="suppliers">
             		<option>${suppliers}</option>
             		</c:forEach> --%>
             	</select>
             </div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Used Qty*</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" id="used-qty" name="usedQty" placeholder="Enter used quantity"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Scrap used Qty*</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" id="scrap-used-qty" name="scrapUsedQty" placeholder="Enter scrap used quantity"></div>
           </div>
           
           </div>
          
		<div class="col-md-6">         
        	<input type="hidden" id="product-id">
           <div class="form-group">
             <div class="col-md-4 inp-field"></div>
             <div class="col-md-8 inp-field">Available Quantity</div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Available Qty*</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" id="avalable-qty" name="avlQty" placeholder="Available quantity"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Scrap Available Qty*</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" id ="scrap-avl-Qty" name="scrapAvlQty" placeholder="Scrap Available quantity"></div>
           </div>
           
           </div>
			
		 <div class="col-md-10"></div>
           <div class="col-md-2"><a href="javascript:void(0);" class="btn btn-success" onclick="return updateProduct();" id="savebutton">Add</a></div>
         <div class="col-md-12" style="margin-top:10px;border-top:2px solid #23133a;padding-bottom:10px;"></div>
          
           <div class="col-md-12" id="display-product" style="margin-top:20px;">
           	<table class="table table-striped">
           		<thead>
				<tr>
					<!-- <th>#</th> -->
					<th>Product Name</th>
					<th>Product Id</th>
					<th>Used Qty</th>
					<th>Scrap Used Qty</th>
					<th>Avail. Qty</th>
					<th>Scrap Avail. Qty</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
				</thead>
				<tbody>	
				</tbody>
			</table>
           </div>
           </div>
           
           <div class="col-md-12">
           	<h4>Sheet Manufacturing Details</h4><hr>
           </div>
           <form id="sheet-mfg-form">
           <div class="col-md-6">
           <div class="form-group">
             <div class="col-md-4 inp-field">Mfg Date*</div>
            <div class="col-md-8 inp-field"><input type="date" class="form-control ship-charge" name="sheetMfgdate" required></div>
           </div>
          
           <div class="form-group">
             <div class="col-md-4 inp-field">Start Time*</div>
             <div class="col-md-8 inp-field"><input type="time" class="form-control" name="startTime" required></div>
           </div>
           
           <div class="form-group">
             <div class="col-md-4 inp-field">End Time*</div>
             <div class="col-md-8 inp-field"><input type="time" class="form-control" name="endTime" required></div>
           </div>
           </div>
           
		<div class="col-md-6">         
        	
           <div class="form-group">
             <div class="col-md-4 inp-field">Sheet Name*</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="sheetName" placeholder="Sheet Name" required></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Sheet Size*</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="sheetSize" placeholder="Sheet Size" required></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Sheet Gage*</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="sheetGage" placeholder="Sheet Gage" required></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Manufacture Qty*</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="mfgQty" placeholder="Manufacture Quantity" required></div>
           </div>
		</div>
		<div class="col-md-12"><hr></div>
         	<div class="col-md-12">
         	<div class="col-md-9"></div>
			<div class="col-md-3"><button class="btn" style="background-color:#23133a;color:#fff">Add Sheet Manufacture Details</button></div>
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
    var productId=$("#product-id").val();
    var usedQty=$("#used-qty").val();
    var scrapUsedQty=$("#scrap-used-qty").val();   
    var avlQty=$("#avalable-qty").val();
    var scrapAvlQty=$("#scrap-avl-Qty").val();
    
 		
	productList.push({
   		productName: productName,
   		productId: productId,
   		usedQty: usedQty,
   		scrapUsedQty: scrapUsedQty,
   		avlQty: avlQty,
   		scrapAvlQty: scrapAvlQty,
     		
  	});
   	
  
    var new_row="";
     for(i=0; i<productList.length; i++){
    	
   	new_row += "<tr class='dynamic' class='info'><td style='display:none'class='sNo'>"+ i +"</td><td class='productName'>" + productList[i].productName + "</td><td class='productId'>" + productList[i].productId + "</td><td class='usedQty'>" + productList[i].usedQty + "</td><td class='scrapUsedQty'>" + productList[i].scrapUsedQty + "</td><td class='avlQty'>" + productList[i].avlQty + "</td><td class='scrapAvlQty'>" + productList[i].scrapAvlQty + "</td><td><span class='editrow'><a class='fa fa-edit' href='javascript: void(0);' onclick='editProduct("+i+",this)'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href='javascript: void(0);' onclick='deleteProduct("+i+",this)'></a></span></td></tr>";
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
	var productId=$("#product-id").val();
    var usedQty=$("#used-qty").val();
    var scrapUsedQty=$("#scrap-used-qty").val();   
    var avlQty=$("#avalable-qty").val();
    var scrapAvlQty=$("#scrap-avl-Qty").val();
    
 	if(currentRow){
 		productList.splice(i,1);
 		productList.push({
       		productName: productName,
       		productId: productId,
       		usedQty: usedQty,
       		scrapUsedQty: scrapUsedQty,
       		avlQty: avlQty,
       		scrapAvlQty: scrapAvlQty,
       		
    	});
   	
  
 		productList.splice(j,1);
 	   	var new_row = "<tr class='dynamic' class='info'><td style='display:none'class='sNo'>"+ i +"</td><td class='productName'>" + productName + "</td><td class='productId'>" + productId + "</td><td class='usedQty'>" + usedQty + "</td><td class='scrapUsedQty'>" + scrapUsedQty + "</td><td class='avlQty'>" + avlQty + "</td><td class='scrapAvlQty'>" + scrapAvlQty + "</td><td><span class='editrow'><a class='fa fa-edit' href='javascript: void(0);' onclick='editProduct("+i+",this)'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href='javascript: void(0);' onclick='deleteProduct("+i+",this)'></a></span></td></tr>";
		
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
   
   
function getProductAvlQty(){	
	var productName=$("#product-name").val();
     $.ajax({
     type: "POST",
     url: "get-product-avlqty?productName="+productName+"", 
     
     success: function(data){
    	 $("#product-id").val(data[0]);
    	 $("#avalable-qty").val(data[1]);
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
	    var productId=td.eq(2).text();
	    var usedQty=td.eq(3).text();
	    var scrapUsedQty=td.eq(4).text();
	    if(scrapUsedQty==""){
	    	scrapUsedQty=0.0;
	    }
	    var avlQty=td.eq(5).text();
	    var scrapAvlQty=td.eq(6).text();
	    if(scrapAvlQty==""){
	    	scrapAvlQty=0.0;
	    }

	    jsonObj.push({
	    	productName: productName,
	    	productId: productId,
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
	         	window.location	= "view-sheet-mfg";   
	         }
	      }
	    });   
	 
		 });

 }); 
</script>
 </body>
</html>
