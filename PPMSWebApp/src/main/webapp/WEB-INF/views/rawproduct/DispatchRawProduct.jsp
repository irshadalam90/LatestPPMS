<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dispatch Raw Product</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<body>
	<div class="col-md-12">	
		<div style="border-bottom:2px solid #23133a;padding-bottom:10px;"><h3>Raw Product (Product)</h3></div>
		<div style="margin-top:20px;"><h4>Dispatch Raw Product</h4></div><hr>
	<form id="dispatch-product-form">
		
	   <div class="form-group">
           <div class="col-md-1 inp-field">Date</div>
            <div class="col-md-3 inp-field"><input type="date" name="dispatchDate" class="form-control"></div>
          </div>
          <div class="form-group">
           <div class="col-md-1 inp-field">Time</div>
            <div class="col-md-3 inp-field"><input type="time" class="form-control" name="diapatchTime"></div>
          </div>
          <div class="form-group">
           <div class="col-md-1 inp-field">Dispatch By</div>
            <div class="col-md-3 inp-field"><input type="text" class="form-control" name="dispatchBy" placeholder="Dispatch By"></div>
          </div>
          <div class="col-md-12"><hr></div>
	   <div class="form-group">
           <div class="col-md-3 inp-field">Product Group*</div>
            <div class="col-md-9 inp-field">
            <input type="text" class="form-control" name="productGroup" value="${rawProduct.productGroup}" readonly>
            </div>
          </div>
          <div class="form-group">
           <div class="col-md-3 inp-field">Product Name*</div>
            <div class="col-md-9 inp-field"><input type="text" class="form-control" name="productName" value="${rawProduct.productName}" readonly placeholder="Enter product name"></div>
          </div>
          <div class="form-group">
            <div class="col-md-3 inp-field">Product Size*</div>
            <div class="col-md-9  inp-field"><input type="text" class="form-control" name="productSize" value="${rawProduct.productSize}" readonly placeholder="Enter product size"></div>
          </div>
          <div class="form-group">
            <div class="col-md-3 inp-field">Unit Weight*</div>
            <div class="col-md-9 inp-field"><input type="text" class="form-control" name="measurmentUnit" value="${rawProduct.measurmentUnit}" readonly placeholder="Enter unit weight"></div>
          </div>
         <div class="form-group">
            <div class="col-md-3 inp-field">Inventory Qty*</div>
            <div class="col-md-9 inp-field"><input type="text" class="form-control" name="inventoryQty" value="${rawProduct.inventoryQty}" readonly placeholder="Enter inventry quantity"></div>
          </div>
     		<div class="form-group">
            <div class="col-md-3 inp-field">Dispatch Qty*</div>
            <div class="col-md-9 inp-field"><input type="text" class="form-control" name="dispatchQty" placeholder="Enter dispatch quantity" required></div>
          </div>
          <input type="hidden" name="rawProductId" value="${rawProduct.id}"> 
          <div class="row" >
          	<div class="col-md-9"></div>
          	<div class="col-md-3">
            		<button type="submit" class="btn" style="margin-top:20px;margin-bottom:20px; background-color:#23133a;color:#fff">Dispatch Product</button>
            	</div>
          </div>
             
        
        </form>
	</div>
		
		
<script>
$(document).ready(function(){
	var dispatchProductForm = $("#dispatch-product-form");
	dispatchProductForm.submit(function(e){
		e.preventDefault();
		$.ajax({
			type: "POST",
			url: "dispatch-raw-product",
			data: dispatchProductForm.serialize(),
			success: function(res){
				if(res=="success"){
					alert("Product dispatched successfully !!");
					window.location = "dispatch-product";
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
