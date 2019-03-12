<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Manufacture List</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>

		<div class="col-md-12">
		
			<div style="border-bottom:2px solid #23133a;padding-bottom:10px;"><h3>Product Manufacture</h3></div>
			<div class="row" style="margin-top:20px;">
				<div class="col-md-3" ><h4>Product Manufacture List</h4></div>
				<div class="col-md-6"></div>
				<div class="col-md-3"><a href="add-product-mfg"><i class="fa fa-plus"></i> Add Product Manufacture</a></div>
			</div>
			<hr>
		
		
		<table class="table table-striped" id="example">
			<thead>
				<tr>
					<th>#</th>
					<th>Mfg. Date</th>
					<th>Prod. Name</th>
					<th>Size</th>
					<th>Gage</th>
					<th>Mfg. Qty(kg)</th>
					<th>Mfg. Qty(Pcs.)</th>
					<th>View</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${productMfgList}" var="productMfg" varStatus="i">
		
				<tr>
					<td>${i.count}</td>
					<td>${productMfg.productMfgdate}</td>
					<td>${productMfg.productName}</td>
					<td>${productMfg.productSize}</td>
					<td>${productMfg.productGage}</td>
					<td>${productMfg.mfgQtyKg}</td>
					<td>${productMfg.mfgQtyPiece}</td>
					<td><a href="view-detail-productmfg?id=${productMfg.id}"><i class="fa fa-eye"></i></a></td>
					<td><a href="edit-productmfg?id=${productMfg.id}"><i class="fa fa-edit"></i></a></td>
					<td><a href="delete-productmfg?id=${productMfg.id}" onclick="return confirm('Are you sure you want to delete?');"><i class="fa fa-trash"></i></a></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>

	</div>
		
<script>
$(document).ready(function() {
    $('#example').DataTable( {
        "pagingType": "full_numbers"
    });
});
</script>
 </body>
</html>

	
				

				
			