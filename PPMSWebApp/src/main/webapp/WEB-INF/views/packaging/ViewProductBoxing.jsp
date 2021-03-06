<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Product Boxing</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<body>

	<div class="col-md-12">
		<div style="border-bottom:2px solid #23133a;padding-bottom:10px;"><h3>Product Boxing</h3></div>
		<div class="row" style="margin-top:20px;">
			<div class="col-md-3" ><h4>View Product Boxing</h4></div>
			<div class="col-md-7"></div>
			<div class="col-md-2"><a href="add-boxing-details"><i class="fa fa-plus"></i> Add New Boxing</a></div>
		</div>
		<hr>
	
	
	<table class="table table-striped" id="example">
		<thead>
			<tr>
				<th>#</th>
				<th>Mfg Date</th>
				<th>Product Name</th>
				<th>Product Size</th>
				<th>Product Gage</th>
				<th>Plastic Bag</th>
				<th>View</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${boxingDataList}" var="boxingData" varStatus="i">
	
			<tr>
				<td>${i.count}</td>
				<td>${boxingData[1]}</td>
				<td>${boxingData[2]}</td>
				<td>${boxingData[3]}</td>
				<td>${boxingData[4]}</td>
				<td>${boxingData[5]}</td>
				<td><a href="view-detail-boxing?id=${boxingData[0]}"><i class="fa fa-eye"></i></a></td>
				<td><a href="edit-boxing?id=${boxingData[0]}"><i class="fa fa-edit"></i></a></td>
				<td><a href="delete-detail-boxing?id=${boxingData[0]}" onclick="return confirm('Are you sure you want to delete?');"><i class="fa fa-trash"></i></a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

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

	
				

				
			