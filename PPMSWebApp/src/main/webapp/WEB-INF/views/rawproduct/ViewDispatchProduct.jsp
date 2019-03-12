<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Dispatch Product</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script>

</script>
</head>
<body>
		<div class="col-md-12">
			<div style="border-bottom:2px solid #23133a;padding-bottom:10px;"><h3>Dispatch Raw Product</h3></div>
			
			<div style="margin-top:20px;">
				<div class="row">
				<div class="col-md-3"><h4>Dispatch Product List</h4></div>
				<div class="col-md-7"></div>
				<div class="col-md-2"></div>
				</div>
			<hr>
			
			<div style="margin-top:20px;">
				<table class="table table-striped" id="example">
					<thead>
						<tr>
						<th>#</th>
						<th>Product Name</th>
						<th>Product Group</th>
						<th>Product Size</th>
						<th>Inventory Qty</th>
						<th>Warning Qty</th>
						<th>Dispatch</th>
						</tr>
					</thead>
						
					<tbody>
					<c:forEach items="${rawProductList}" var="rawProduct" varStatus="i"> 
					<tr>
						<td>${i.count}</td>
						<td>${rawProduct.productName}</td>
						<td>${rawProduct.productGroup}</td>
						<td>${rawProduct.productSize}</td>
						<td>${rawProduct.inventoryQty}</td>
						<td>${rawProduct.warningQty}</td>
						<td><a href="create-dispatch-product?id=${rawProduct.id}"><i class="fa fa-share" aria-hidden="true"></i></a></td>
					</tr>
				 	</c:forEach>
				 	</tbody> 
				</table>
				</div>
			</div>
			
         </div>
         
		
<script>
$(document).ready(function() {
    $('#example').DataTable( {
        "pagingType": "full_numbers"
    } );
});
</script>
 </body>
</html>
