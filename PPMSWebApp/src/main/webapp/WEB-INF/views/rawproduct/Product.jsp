
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
			<div class="col-md-4"><h3>Raw Material (Product)</h3></div>
			<div class="col-md-7"></div>
			<div class="col-md-1"><a href="raw-product"><i class="fa fa-angle-left" style="font-size:20px;"></i> Back</a></div>
		</div>
		<div style="margin-top:20px;"><h4>Add New Product</h4></div><hr>
	<form role="form" action="submit-raw-product" method="post">
	
	<div class="form-group">
           <div class="col-md-3 inp-field">Product Group*</div>
            <div class="col-md-9 inp-field">
            <select class="form-control" name="productGroup">
            	<option selected disabled>Select Product Group</option>
            	<option>Polystyrene</option>
              <option>Plastic Bags</option>
              <option>Box</option>
              <option>Other</option>
            </select>
            </div>
          </div>
          <div class="form-group">
           <div class="col-md-3 inp-field">Product Name*</div>
            <div class="col-md-9 inp-field"><input type="text" class="form-control" name="productName" placeholder="Enter product name"></div>
          </div>
          <div class="form-group">
            <div class="col-md-3 inp-field">Product Size*</div>
            <div class="col-md-9  inp-field"><input type="text" class="form-control" name="productSize" placeholder="Enter product size"></div>
          </div>
          <div class="form-group">
            <div class="col-md-3 inp-field">Measurement Unit*</div>
            <div class="col-md-9 inp-field"><input type="text" class="form-control" name="measurmentUnit" placeholder="Enter unit weight"></div>
          </div>
          <div class="form-group">
            <div class="col-md-3 inp-field">HSN/SAC Code*</div>
            <div class="col-md-9 inp-field"><input type="text" class="form-control" name="hsnCode" placeholder="Enter HSN/SAC code"></div>
          </div>
         <div class="form-group">
            <div class="col-md-3 inp-field">Inventory Qty*</div>
            <div class="col-md-9 inp-field"><input type="text" class="form-control" name="inventoryQty" placeholder="Enter inventry quantity"></div>
          </div>
          <div class="form-group">
            <div class="col-md-3 inp-field">Warning Qty*</div>
            <div class="col-md-9 inp-field"><input type="text" class="form-control" name="warningQty" placeholder="Enter warning quantity"></div>
          </div>
          <input type="hidden" name="status" value="active">
          <div class="row" >
          	<div class="col-md-10"></div>
          	<div class="col-md-2">
            		<button type="submit" class="btn" style="margin-top:20px;margin-bottom:20px; background-color:#23133a;color:#fff">Add Product</button>
            	</div>
          </div>
             
        
        </form>
	</div>
			
 </body>
</html>
