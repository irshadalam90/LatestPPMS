<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Electric Uses</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<body>

		<div class="col-md-12">
		<div class="row">
			<div style="border-bottom:2px solid #23133a;padding-bottom:10px;"><h3>Manufacture Electric Uses</h3></div>
			<div class="row" style="margin-top:20px;">
				<div class="col-md-3" ><h4>Electric Uses</h4></div>
				<div class="col-md-7"></div>
				<div class="col-md-2"><a href="add-electric-uses"><i class="fa fa-plus"></i> Add Electric Uses</a></div>
			</div>
			<hr>
		
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th>#</th>
					<th>Reading Date</th>
					<th>Reading Time</th>
					<th>Unit Cunt</th>
					<th>View</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${rawProductList}" var="rawProduct" varStatus="i">
		
				<tr>
					<td>${i.count}</td>
					<td>${rawProduct.productName}</td>
					<td>${rawProduct.productGroup}</td>
					<td>${rawProduct.productSize}</td>
					<td><a href="view-detail-rawproduct?id=${rawProduct.id}"><i class="fa fa-eye"></a></td>
					<td><a href="edit-rawproduct?id=${rawProduct.id}"><i class="fa fa-edit"></a></td>
					<td><a href="delete-rawproduct?id=${rawProduct.id}" onclick="return confirm('Are you sure you want to delete?');"><i class="fa fa-trash"></a></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>

	</div>
		
		</div>
		
 </body>
</html>

	
				

				
			