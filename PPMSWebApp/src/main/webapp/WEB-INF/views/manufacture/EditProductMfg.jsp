<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Product Manufacture</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script>


</script>
</head>
<body>

	<div class="col-md-12">
		<div class="row" style="border-bottom:2px solid #23133a;padding-bottom:10px;">
			<div class="col-md-5"><h3>Edit Product Manufacture</h3></div>
			<div class="col-md-6"></div>
			<div class="col-md-1"><a href="view-product-mfg"><i class="fa fa-angle-left" style="font-size:20px;"></i> Back</a></div>
		</div>
	
		<div style="margin-top:20px;"><h4>Product Manufacture details</h4></div><hr>
 	 <form id="update-product-mfg-form">
 	 <input type="hidden" name="id" value="${productMfgData.id}">
	<div class="col-md-6">
          <div class="form-group">
            <div class="col-md-4 inp-field">Mfg Date*</div>
           <div class="col-md-8 inp-field"><input type="date" class="form-control ship-charge" name="productMfgdate" value="${productMfgData.productMfgdate}"></div>
          </div>
         
          <div class="form-group">
            <div class="col-md-4 inp-field">Start Time*</div>
            <div class="col-md-8 inp-field"><input type="time" class="form-control" name="startTime" value="${productMfgData.startTime}"></div>
          </div>
          
          <div class="form-group">
            <div class="col-md-4 inp-field">End Time*</div>
            <div class="col-md-8 inp-field"><input type="time" class="form-control" name="endTime" value="${productMfgData.endTime}"></div>
          </div>
          
          </div>
          
		
	<div class="col-md-4"></div>
	<div class="col-md-12"><hr></div>	
	  
          
          <div class="col-md-12">
          	<h4>Sheet Manufacturing Details</h4><hr>
          </div>
          
          <div class="col-md-6">
          <div class="form-group">
            <div class="col-md-4 inp-field">Sheet Name*</div>
            <div class="col-md-8 inp-field">
            	<select class="form-control" name="sheetName" id="sheet-name" onchange="getSheetMfgSize();">
            		<option>${productMfgData.sheetName}</option>
            		<c:forEach items="${sheetMfgSheetName}" var="sheetName">
            		<option>${sheetName}</option>
            		</c:forEach>
            	</select>
            </div>
          </div>
          <div class="form-group">
          	<!-- <input type="text" id="sheet-mfg-id" name="seetMfgId">  -->
            <div class="col-md-4 inp-field">Sheet Size*</div>
            <div class="col-md-8 inp-field">
            	<select class="form-control" name="sheetSize" id="sheet-size" onchange="getSheetMfgGage();">
            		<option>${productMfgData.sheetSize}</option>
            	</select>
            </div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Sheet Gage*</div>
            <div class="col-md-8 inp-field">
            	<select class="form-control" name="sheetGage" id="sheet-gage" onchange="getSheetMfgAvlQty();">
            		<option>${productMfgData.sheetGage}</option>
            	</select>
            </div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Available Qty*</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" id="available-qty" readonly name="availableQty" placeholder="" value="${productMfgData.availableQty}"></div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Used Qty*</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="usedQty" placeholder="Used Quantity" value="${productMfgData.usedQty}"></div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Batch No</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="batchNo" placeholder="Batch No." value="${productMfgData.batchNo}"></div>
          </div>
          </div>
          
	<div class="col-md-6">         
       	
          <div class="form-group">
            <div class="col-md-4 inp-field">Product Name*</div>
            <div class="col-md-8 inp-field">
            	<select class="form-control" name="productName" id="product-name" onchange="getMfgProductSize()">
            	<option>${productMfgData.productName}</option>
            	<c:forEach items="${mfgProductName}" var="productName">
            		<option>${productName}</option>
            	</c:forEach>
            	</select>
            </div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Product Size*</div>
		<div class="col-md-8 inp-field">
            	<select class="form-control" name="productSize" id="product-size" onchange="getMfgProductGage()">
            		<option>${productMfgData.productSize}</option>
            	</select>
            </div>           
            </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Product Gage*</div>
		 <div class="col-md-8 inp-field">
            	<select class="form-control" name="productGage" id="product-gage">
            		<option>${productMfgData.productGage}</option>
            	</select>
            </div>           
            </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Manufacture Qty*</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="mfgQtyPiece" placeholder="Pices" value="${productMfgData.mfgQtyPiece}"></div>
          </div>
	    <div class="form-group">
            <div class="col-md-4 inp-field">Manufacture Unit*</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="mfgQtyKg" placeholder="Kg" value="${productMfgData.mfgQtyKg}"></div>
          </div>
	   </div>
	   <div class="col-md-12"><hr></div>
	   <div class="col-md-12">
	    	<div class="col-md-9"></div>
			<div class="col-md-3"><button class="btn" style="background-color:#23133a;color:#fff">Update Product Mfg Details</button></div>
	   </div>
         </form> 
  	</div>
        
        
			
<script>

	function getSheetMfgSize(){
		var sheetName = $("#sheet-name").val();
		
		$.ajax({
				type: 'GET',
				url: 'get-sheetmfg-size?sheetName='+sheetName+'',
				dataType: 'json', 
				
				success: function(data){
				var options = "";
				options += '<option></option>'
				$('#sheet-size').html('');
				 for(var i=0; i<data.length; i++){ 
					options +=  '<option>'+data[i]+'</option>';
				 } 
				$('#sheet-size').append(options);
				},
				error: function(){
					alert("something is wrong");
				}
		});

	}
	
	function getSheetMfgGage(){
		var sheetName = $("#sheet-name").val();
		var sheetSize = $("#sheet-size").val();
		$.ajax({
				type: 'GET',
				url: 'get-sheetmfg-gage?sheetName='+sheetName+'&sheetSize='+sheetSize+'',
				dataType: 'json', 
				
				success: function(data){
				var options = "";
				options += '<option></option>'
				$('#sheet-gage').html('');
				
				for(var i=0; i<data.length; i++){ 
					options +=  '<option>'+data[i]+'</option>';
				} 
				$('#sheet-gage').append(options);
				
				},
				error: function(){
					alert("something is wrong");
				}
		});

	}
	
	function getSheetMfgAvlQty(){
		var sheetName = $("#sheet-name").val();
		var sheetSize = $("#sheet-size").val();
		var sheetGage = $("#sheet-gage").val();
		$.ajax({
			type: 'GET',
			url: 'get-sheetmfg-available-qty?sheetName='+sheetName+'&sheetSize='+sheetSize+'&sheetGage='+sheetGage+'',
			dataType: 'json', 
			
			success: function(data){
				$("#available-qty").val(data); 
				//$("#sheet-mfg-id").val(data[1]);
			},
			error: function(){
				alert("something is wrong");
			}
		});
	}

	function getMfgProductSize(){
		var productName = $("#product-name").val();
		
		$.ajax({
				type: 'GET',
				url: 'get-mfgproduct-size?productName='+productName+'',
				dataType: 'json', 
				
				success: function(data){
				var options = "";
				options += '<option></option>';
				$('#product-size').html('');
				 for(var i=0; i<data.length; i++){ 
					options +=  '<option>'+data[i]+'</option>';
				 } 
				$('#product-size').append(options);
				
				},
				error: function(){
					alert("something is wrong");
				}
		});

	}
	
	function getMfgProductGage(){
		var productName = $("#product-name").val();
		var productSize = $("#product-size").val();
		$.ajax({
				type: 'GET',
				url: 'get-mfgproduct-gage?productName='+productName+'&productSize='+productSize+'',
				dataType: 'json', 
				
				success: function(data){
				var options = "";
				options += '<option></option>';
				$('#product-gage').html('');
				 for(var i=0; i<data.length; i++){ 
					options +=  '<option>'+data[i]+'</option>';
				 } 
				$('#product-gage').append(options);
				
				},
				error: function(){
					alert("something is wrong");
				}
		});

	}

	$(document).ready(function(){
	
		var updateProductMfgForm = $("#update-product-mfg-form");
		updateProductMfgForm.submit(function(e){
			e.preventDefault(); 
	     $.ajax({
	     type: "POST",
	     url: "update-product-mfg-details", 
	     data: updateProductMfgForm.serialize(),
	   	 success: function(response){
	   		 if(response == "success"){
		         alert("Successfully Updated !!");
				 window.location = "view-product-mfg";	
	   		 }
	     },
	     error: function(){
	         alert("Successfully submitted !!");
	      }
	    });  
	 
	});
	});
</script>
 </body>
</html>
