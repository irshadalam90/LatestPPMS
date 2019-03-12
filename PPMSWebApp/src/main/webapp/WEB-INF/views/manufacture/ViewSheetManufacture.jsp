<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sheet Manufacture List</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>

		<div class="col-md-12">
			<div style="border-bottom:2px solid #23133a;padding-bottom:10px;"><h3>Sheet Manufacture</h3></div>
			<div class="row" style="margin-top:20px;">
				<div class="col-md-3" ><h4>Sheet Manufacture List</h4></div>
				<div class="col-md-6"></div>
				<div class="col-md-3"><a href="add-sheet-mfg-details"><i class="fa fa-plus"></i> Add Sheet Manufacture</a></div>
			</div>
			<hr>
		
		
		<table class="table table-striped" id="example">
			<thead>
				<tr>
					<th>#</th>
					<th>Sheet Name</th>
					<th>Sheet Size</th>
					<th>Sheet Gage</th>
					<th>Mfg Qty</th>
					<th>Mfg Date</th>
					<th>View</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${sheetMfgDetailsList}" var="sheetMfgDetail" varStatus="i">
		
				<tr>
					<td>${i.count}</td>
					<td>${sheetMfgDetail.sheetName}</td>
					<td>${sheetMfgDetail.sheetSize}</td>
					<td>${sheetMfgDetail.sheetGage}</td>
					<td>${sheetMfgDetail.mfgQty}</td>
					<td>${sheetMfgDetail.sheetMfgdate}</td>
					<td><a href="view-detail-sheetMfg?id=${sheetMfgDetail.id}"><i class="fa fa-eye"></i></a></td>
					<td><a href="edit-sheetMfg?id=${sheetMfgDetail.id}"><i class="fa fa-edit"></i></a></td>
					<td><a href="delete-sheetMfg?id=${sheetMfgDetail.id}" onclick="return confirm('Are you sure you want to delete?');"><i class="fa fa-trash"></i></a></td>
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

	
				

				
			