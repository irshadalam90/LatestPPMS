<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Stock</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<body>

	
	<div class="col-md-12">
		<div style="border-bottom:2px solid #23133a;padding-bottom:10px;"><h3>Raw Material Stock Overview</h3></div>
		
		<div style="margin-top:20px;">
			<div class="row">
			<div class="col-md-3"><h4>In Stock</h4></div>
			<div class="col-md-7"></div>
			<div class="col-md-2"></div>
			</div>
		<hr>
		
		<div style="margin-top:20px;">
			<table class="table table-striped example" id="">
				<thead>
					<tr>
					<!-- <th>#</th> -->
					<th>Product Name</th>
					<th>Product Group</th>
					<th>Product Size</th>
					<th>Inventory Qty</th>
					<th>Dispatch Qty</th>
					</tr>
				</thead>	
			<tbody>
			 <c:forEach items="${rawProductList}" var="rawProduct" varStatus="i"> 
				<c:if test="${rawProduct.inventoryQty>0}">
				<tr>
					<%-- <td>${i.count}</td> --%>
					<td>${rawProduct.productName}</td>
					<td>${rawProduct.productGroup}</td>
					<td>${rawProduct.productSize}</td>
					<td>${rawProduct.inventoryQty}</td>
					<td>${rawProduct.dispatchQty}</td>
				</tr>
				</c:if>
			 </c:forEach>
			</tbody>
			</table>
		</div>
		</div>
		
		<!-- Out Stock -->
		
		<div style="margin-top:20px;" id="example">
			<div class="row">
			<div class="col-md-3"><h4>Out of Stock</h4></div>
			<div class="col-md-7"></div>
			<div class="col-md-2"></div>
			</div>
		<hr>
		
		<div style="margin-top:20px;">
			 <table class="table table-striped example" id="">
				 <thead>
					<tr>
					<!-- <th>#</th> -->
					<th>Product Name</th>
					<th>Product Group</th>
					<th>Product Size</th>
					<th>Inventory Qty</th>
					<th>Dispatch Qty</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${rawProductList}" var="rawProduct" varStatus="i"> 
				<c:if test="${rawProduct.inventoryQty<=0}">
				<tr>
					<td>${i.count}</td>
					<td>${rawProduct.productName}</td>
					<td>${rawProduct.productGroup}</td>
					<td>${rawProduct.productSize}</td>
					<td>${rawProduct.inventoryQty}</td>
					<td>${rawProduct.dispatchQty}</td>
				</tr>
				</c:if>
			 </c:forEach>
			 </tbody>
			</table> 
			</div>
		</div>
        </div>
         
		
<script>
$(document).ready(function() {
    $('.example').DataTable( {
        "pagingType": "full_numbers"
    } );
});
</script>
 </body>
</html>
