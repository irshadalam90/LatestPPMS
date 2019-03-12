<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manufacture Product List</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script>
	/* function deleteRawProduct(){
		if(confirm("Are you sure to delete this product?")){
			
		}
	} */
</script>
</head>
<body>

		<div class="col-md-12">
		
		<div class="row" style="margin-top:10px;">
			<div style="border-bottom:2px solid #23133a;padding-bottom:10px;"><h3>Manufacture Product (Product)</h3></div>
			<div class="row" style="margin-top:20px;">
				<div class="col-md-3" ><h4>Manufacture Product List</h4></div>
				<div class="col-md-7"></div>
				<div class="col-md-2"><a href="add-mfg-product"><i class="fa fa-plus"></i> Add New Product</a></div>
			</div>
			<hr>
		
		
		<table class="table table-striped" id="example">
			<thead>
				<tr>
					<th>#</th>
					<th>Product Name</th>
					<th>Size</th>
					<th>Gage</th>
					<th>Unit Wt.</th>
					<th>HSN Code</th>
					<th>View</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${manufactureProductList}" var="mfgProduct" varStatus="i">
		
				<tr>
					<td>${i.count}</td>
					<td>${mfgProduct.productName}</td>
					<td>${mfgProduct.productSize}</td>
					<td>${mfgProduct.productGage}</td>
					<td>${mfgProduct.unitWeight}</td>
					<td>${mfgProduct.hsnCode}</td>
					<td><a href="view-detail-mfgproduct?id=${mfgProduct.id}"><i class="fa fa-eye"></i></a></td>
					<td><a href="edit-mfgproduct?id=${mfgProduct.id}"><i class="fa fa-edit"></i></a></td>
					<td><a href="delete-mfgproduct?id=${mfgProduct.id}" onclick="return confirm('Are you sure you want to delete?');"><i class="fa fa-trash"></i></a></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>

	</div>
		
		</div>
		<!-- <div class="col-md-1" ></div> -->
	
<script>
$(document).ready(function() {
    $('#example').DataTable( {
        "pagingType": "full_numbers"
    } );
});
</script>
 </body>
</html>

	
				

				
			