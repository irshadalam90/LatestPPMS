<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Detail Raw Product</title>
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
		<div style="margin-top:20px;"><h4>View Detail Raw Product</h4></div><hr>
	<form role="form" action="submit-raw-product" method="post">
	
	<div class="form-group">
           <div class="col-md-3 inp-field">Product Group*</div>
            <div class="col-md-9 inp-field">
            <select class="form-control" name="productGroup" readonly>
            	<option value="${rawProduct.productGroup}">${rawProduct.productGroup}</option>
            </select>
            </div>
          </div>
          <div class="form-group">
           <div class="col-md-3 inp-field">Product Name*</div>
            <div class="col-md-9 inp-field"><input type="text" class="form-control" name="productName" placeholder="Enter product name" value="${rawProduct.productName}" readonly></div>
          </div>
          <div class="form-group">
            <div class="col-md-3 inp-field">Product Size*</div>
            <div class="col-md-9  inp-field"><input type="text" class="form-control" name="productSize" placeholder="Enter product size" value="${rawProduct.productSize}" readonly></div>
          </div>
          <div class="form-group">
            <div class="col-md-3 inp-field">Unit Weight*</div>
            <div class="col-md-9 inp-field"><input type="text" class="form-control" name="measurmentUnit" placeholder="Enter unit weight" value="${rawProduct.measurmentUnit}" readonly></div>
          </div>
          <div class="form-group">
            <div class="col-md-3 inp-field">HSN/SAC Code*</div>
            <div class="col-md-9 inp-field"><input type="text" class="form-control" name="hsnCode" placeholder="Enter HSN/SAC code" value="${rawProduct.hsnCode}" readonly></div>
          </div>
         <div class="form-group">
            <div class="col-md-3 inp-field">Inventory Qty*</div>
            <div class="col-md-9 inp-field"><input type="text" class="form-control" name="inventoryQty" placeholder="Enter inventry quantity" value="${rawProduct.inventoryQty}" readonly></div>
          </div>
          <div class="form-group">
            <div class="col-md-3 inp-field">Warning Qty*</div>
            <div class="col-md-9 inp-field"><input type="text" class="form-control" name="warningQty" placeholder="Enter warning quantity" value="${rawProduct.warningQty}" readonly></div>
          </div>
          
        
        </form>
	</div>
		
 </body>
</html>
