
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Product</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
	<div class="col-md-12">
		<div class="row" style="border-bottom:2px solid #23133a;padding-bottom:10px;">
			<div class="col-md-5"><h3>Manufacture Product (Product)</h3></div>
			<div class="col-md-6"></div>
			<div class="col-md-1"><a href="manufacture-products"><i class="fa fa-angle-left" style="font-size:20px;"></i> Back</a></div>
		</div>
		<div style="margin-top:20px;"><h4>Edit Manufacture Product</h4></div><hr>
		<form id='mfg-prodct-form'>
		
           <div class="form-group">
           <div class="col-md-3 inp-field">Product Name*</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="productName" required placeholder="Enter product name" value="${mfgProduct.productName}"></div>
         	  <div class="col-md-1 inp-field"></div>
          </div>
          <div class="form-group">
            <div class="col-md-3 inp-field">Product Size*</div>
            <div class="col-md-8  inp-field"><input type="text" class="form-control" name="productSize" required placeholder="Enter product size" value="${mfgProduct.productSize}"></div>
            <div class="col-md-1  inp-field">ml</div>
          </div>
          <div class="form-group">
            <div class="col-md-3 inp-field">Product Gage*</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="productGage" required placeholder="Product Gage" value="${mfgProduct.productGage}"></div>
            <div class="col-md-1 inp-field"></div>
          </div>
          <div class="form-group">
            <div class="col-md-3 inp-field">Unit Weight*</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="unitWeight" required placeholder="Enter unit weight" value="${mfgProduct.unitWeight}"></div>
            <div class="col-md-1 inp-field">gm</div>
          </div>
          <div class="form-group">
            <div class="col-md-3 inp-field">HSN/SAC Code</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="hsnCode" required placeholder="Enter HSN/SAC code" value="${mfgProduct.hsnCode}"></div>
         	  <div class="col-md-1 inp-field"></div>
          </div>
           
           
           <%-- <div class="form-group">
            <div class="col-md-3 inp-field">Product Name*</div>
             <div class="col-md-9 inp-field"><input type="text" class="form-control" name="productName" required placeholder="Enter product name" value="${mfgProduct.productName}"></div>
           </div>
           <div class="form-group">
             <div class="col-md-3 inp-field">Product Size*</div>
             <div class="col-md-9  inp-field"><input type="text" class="form-control" name="productSize" required placeholder="Enter product size" value="${mfgProduct.productSize}"></div>
           </div>
           <div class="form-group">
             <div class="col-md-3 inp-field">Product Gage*</div>
             <div class="col-md-9 inp-field"><input type="text" class="form-control" name="productGage" required placeholder="Product Gage" value="${mfgProduct.productGage}"></div>
           </div>
           <div class="form-group">
             <div class="col-md-3 inp-field">Unit Weight*</div>
             <div class="col-md-9 inp-field"><input type="text" class="form-control" name="unitWeight" required placeholder="Enter unit weight" value="${mfgProduct.unitWeight}"></div>
           </div>
           <div class="form-group">
             <div class="col-md-3 inp-field">HSN/SAC Code*</div>
             <div class="col-md-9 inp-field"><input type="text" class="form-control" name="hsnCode" required placeholder="Enter HSN/SAC code" value="${mfgProduct.hsnCode}"></div>
           </div> --%>
           <input type="hidden" name="id" value="${mfgProduct.id}">
           <!-- <input type="hidden" name="status" value="active"> -->
           <div class="row">
           	<div class="col-md-10"></div>
           	<div class="col-md-2">
             		<button class="btn" style="margin-top:20px;margin-bottom:20px; background-color:#23133a;color:#fff">Update Product</button>
             	</div>
           </div>
           
         </form>
	</div>
		
		
		
	<script>
	
	$(document).ready(function(){
		$('#mfg-prodct-form').submit(function(e){
		e.preventDefault();
		 $.ajax({
		     type: "POST",
		     url: "update-mfgproduct", 
		     data: $('#mfg-prodct-form').serialize(),
		   	 
		     success: function(response){
		    	 if(response==true){
			         alert("Successfully updated !!");
			         window.location="manufacture-products";
		    	 }
		      },
		      error: function(response){
		    	  alert("Something is wrong");
		      }
		    });  
		});
	});
	</script>	
 </body>
</html>
