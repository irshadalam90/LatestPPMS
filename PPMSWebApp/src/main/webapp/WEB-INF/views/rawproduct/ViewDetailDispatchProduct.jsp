<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Detail Dispatch Raw Product</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<body>

	<div class="col-md-12">
		<div class="row" style="margin-top:10px;border-bottom:2px solid #23133a;padding-bottom:10px;">
			<div class="col-md-6"><h3>Raw Product (Product)</h3></div>
			<div class="col-md-5"></div>
			<div class="col-md-1"><a href="view-dispatch-product"><i class="fa fa-angle-left" style="font-size:20px;"></i> Back</a></div>
		</div>
		<div style="margin-top:20px;"><h4>View Detail Dispatch Raw Product</h4></div><hr>
	<form role="form" action="dispatch-raw-product" method="post">
		
	   <div class="form-group">
           <div class="col-md-1 inp-field">Date</div>
            <div class="col-md-3 inp-field"><input type="date" name="dispatchDate" class="form-control" value="${dispatchRawProduct.dispatchDate}" readonly></div>
          </div>
          <div class="form-group">
           <div class="col-md-1 inp-field">Time</div>
            <div class="col-md-3 inp-field"><input type="time" class="form-control" name="diapatchTime" value="${dispatchRawProduct.diapatchTime}" readonly></div>
          </div>
          <div class="form-group">
           <div class="col-md-1 inp-field">Dispatch By</div>
            <div class="col-md-3 inp-field"><input type="text" class="form-control" name="dispatchBy" value="${dispatchRawProduct.dispatchBy}" readonly></div>
          </div>
          <div class="col-md-12"><hr></div>
	   <div class="form-group">
           <div class="col-md-3 inp-field">Product Group*</div>
            <div class="col-md-9 inp-field">
            <input type="text" class="form-control" name="productGroup" value="${dispatchRawProduct.productGroup}" readonly>
            </div>
          </div>
          <div class="form-group">
           <div class="col-md-3 inp-field">Product Name*</div>
            <div class="col-md-9 inp-field"><input type="text" class="form-control" name="productName" value="${dispatchRawProduct.productName}" readonly></div>
          </div>
          <div class="form-group">
            <div class="col-md-3 inp-field">Product Size*</div>
            <div class="col-md-9  inp-field"><input type="text" class="form-control" name="productSize" value="${dispatchRawProduct.productSize}" readonly></div>
          </div>
          <div class="form-group">
            <div class="col-md-3 inp-field">Unit Weight*</div>
            <div class="col-md-9 inp-field"><input type="text" class="form-control" name="measurmentUnit" value="${dispatchRawProduct.measurmentUnit}" readonly ></div>
          </div>
         <div class="form-group">
            <div class="col-md-3 inp-field">Inventory Qty*</div>
            <div class="col-md-9 inp-field"><input type="text" class="form-control" name="inventoryQty" value="${dispatchRawProduct.inventoryQty}" readonly></div>
          </div>
     		<div class="form-group">
            <div class="col-md-3 inp-field">Dispatch Qty*</div>
            <div class="col-md-9 inp-field"><input type="text" class="form-control" name="dispatchQty"  value="${dispatchRawProduct.dispatchQty}" readonly></div>
          </div>
          <input type="hidden" name="rawProductId" value="${rawProduct.id}"> 
          
        </form>
	</div>
		
		

 </body>
</html>
