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
</head>
<body>

		<div class="col-md-12">
			<div class="row" style="border-bottom:2px solid #23133a;padding-bottom:10px;">
				<div class="col-md-5"><h3>Product Manufacture</h3></div>
				<div class="col-md-6"></div>
				<div class="col-md-1"><a href="view-product-mfg"><i class="fa fa-angle-left" style="font-size:20px;"></i> Back</a></div>
			</div>
		
			<div class="col-md-12" style="margin-top:20px;"><h4>Product Manufacture details</h4><hr></div>
	 	 <form id="product-mfg-form">
		<div class="col-md-6">
           <div class="form-group">
             <div class="col-md-4 inp-field">Mfg Date*</div>
            <div class="col-md-8 inp-field"><input type="date" class="form-control ship-charge" name="productMfgdate" required></div>
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
           
			
		<div class="col-md-4"></div>
		<div class="col-md-12"><hr></div>	
		  
           
           <div class="col-md-12">
           	<h4>Sheet Manufacturing Details</h4><hr>
           </div>
           
           <div class="col-md-6">
           <div class="form-group">
             <div class="col-md-4 inp-field">Sheet Name*</div>
             <div class="col-md-8 inp-field">
             	<select class="form-control" name="sheetName" id="sheet-name" onchange="getSheetMfgSize();" required>
             		<option selected disabled>Select Sheet Name</option>
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
             	<select class="form-control" name="sheetSize" id="sheet-size" onchange="getSheetMfgGage();" required>
             		<option selected disabled>Select Sheet Size</option>
             	</select>
             </div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Sheet Gage*</div>
             <div class="col-md-8 inp-field">
             	<select class="form-control" name="sheetGage" id="sheet-gage" onchange="getSheetMfgAvlQty();" required>
             		<option selected disabled>Select Sheet Gage</option>
             	</select>
             </div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Available Qty*</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" id="available-qty" readonly name="availableQty" placeholder=""></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Used Qty*</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="usedQty" placeholder="Used Quantity" required></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Batch No</div>
             <div class="col-md-8 inp-field"><input type="text" class="form-control" name="batchNo" placeholder="Batch No."></div>
           </div>
           </div>
           
		<div class="col-md-6">         
        	
           <div class="form-group">
             <div class="col-md-4 inp-field">Product Name*</div>
             <div class="col-md-8 inp-field">
             	<select class="form-control" name="productName" id="product-name" onchange="getMfgProductSize()" required>
             	<option selected disabled>Select Product Name</option>
             	<c:forEach items="${mfgProductName}" var="productName">
             		<option>${productName}</option>
             	</c:forEach>
             	</select>
             </div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Product Size*</div>
			<div class="col-md-8 inp-field">
             	<select class="form-control" name="productSize" id="product-size" onchange="getMfgProductGage()" required>
             		<option selected disabled>Select Product Size</option>
             	</select>
             </div>           
             </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Product Gage*</div>
			 <div class="col-md-8 inp-field">
             	<select class="form-control" name="productGage" id="product-gage" onchange="getMfgProductunitWt()" required>
             		<option selected disabled>Select Product Gage</option>
             	</select>
             </div>           
             </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Manufacture Qty*</div>
             <div class="col-md-6 inp-field"><input type="text" class="form-control" name="mfgQtyPiece" id="mfg-qty-piece" placeholder="Pieces" onkeyup="calMfgQtyKg();" required></div>
           	<div class="col-md-2 inp-field">Pieces</div>
           </div>
		   <div class="form-group">
             <div class="col-md-4 inp-field">Manufacture Unit*</div>
             <div class="col-md-6 inp-field"><input type="text" class="form-control" name="mfgQtyKg" id="mfg-qty-kg" placeholder="Kg" onkeyup="calMfgQtyPiece();" required></div>
          	<div class="col-md-2 inp-field">Kg</div>
           </div>
           <input type="hidden" id="unit-weight" name="unitWeight" >
		</div>
		<div class="col-md-12"><hr></div>
         	<div class="col-md-12">
         		<div class="col-md-9"></div>
			<div class="col-md-3"><button class="btn" style="background-color:#23133a;color:#fff">Add Product Mfg Details</button></div>
           </div>
            </form> 
          </div>
        
         </div>
         
         
       
         <div class="col-md-1" ></div>
		
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
				options += '<option selected disabled>Select Sheet Size</option>'
				$('#sheet-size').html('');
				 for(var i=0; i<data.length; i++){ 
					options +=  '<option>'+data[i]+'</option>';
				 } 
				$('#sheet-size').append(options);
				},
				error: function(){
					alert(arguments[2]);
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
				options += '<option selected disabled>Select Sheet Gage</option>'
				$('#sheet-gage').html('');
				
				for(var i=0; i<data.length; i++){ 
					options +=  '<option>'+data[i]+'</option>';
				} 
				$('#sheet-gage').append(options);
				
				},
				error: function(){
					alert(arguments[2]);
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
				if(data>0){
					$("#available-qty").val(data); 
				}
				else{
					alert("Quantity for this sheet is 0. Please select another sheet.")
					$("#available-qty").val('');
				}
				//$("#sheet-mfg-id").val(data[1]);
			},
			error: function(){
				alert(arguments[2]);
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
				options += '<option selected disabled>Select Product Size</option>';
				$('#product-size').html('');
				 for(var i=0; i<data.length; i++){ 
					options +=  '<option>'+data[i]+'</option>';
				 } 
				$('#product-size').append(options);
				
				},
				error: function(){
					alert(arguments[2]);
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
				options += '<option selected disabled>Select Product Gage</option>';
				$('#product-gage').html('');
				 for(var i=0; i<data.length; i++){ 
					options +=  '<option>'+data[i]+'</option>';
				 } 
				$('#product-gage').append(options);
				
				},
				error: function(){
					alert(arguments[2]);
				}
		});

	}
	
	function getMfgProductunitWt(){
		var productName = $("#product-name").val();
		var productSize = $("#product-size").val();
		var productGage = $("#product-gage").val();
		$.ajax({
				type: 'GET',
				url: 'get-mfgproduct-unitwt?productName='+productName+'&productSize='+productSize+'&productGage='+productGage+'',
				dataType: 'json', 
				
				success: function(data){
					$('#unit-weight').val(data);
				},
				error: function(){
					alert(arguments[2]);
				}
		});

	}
	
	function calMfgQtyKg(){
		var mfgQtyPiece = parseFloat($('#mfg-qty-piece').val());
		var unitWeight = parseFloat($('#unit-weight').val());
		if(isNaN(mfgQtyPiece)){
			mfgQtyPiece=0;
		}
		if(isNaN(unitWeight)){
			unitWeight=0;
		}
		var mfgQtyKg = mfgQtyPiece*unitWeight;
		$('#mfg-qty-kg').val(mfgQtyKg.toFixed(2));
	}
	
	function calMfgQtyPiece(){
		var mfgQtyKg = parseFloat($('#mfg-qty-kg').val());
		var unitWeight = parseFloat($('#unit-weight').val());
		
	    if(isNaN(mfgQtyKg)){
			mfgQtyKg=0;
		} 
		if(isNaN(unitWeight)){
			unitWeight=0;
		}
		var mfgQtyPiece = mfgQtyKg/unitWeight;
		$('#mfg-qty-piece').val(mfgQtyPiece.toFixed(2));
	}

	$(document).ready(function(){
	
		var productMfgForm = $("#product-mfg-form");
		productMfgForm.submit(function(e){
			e.preventDefault(); 
	     $.ajax({
	     type: "POST",
	     url: "submit-product-mfg-details", 
	     data: productMfgForm.serialize(),
	   	 success: function(response){
	   		 if(response == "success"){
		         alert("Successfully submitted !!");
				 window.location = "view-product-mfg";	
	   		 }
	     },
	     error: function(){
	         alert(arguments[2]);
	      }
	    });  
	});
	});
</script>
 </body>
</html>
