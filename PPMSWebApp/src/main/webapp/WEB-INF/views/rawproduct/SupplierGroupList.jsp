<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Supplier Group</title>

</head>
<body>
	<div class="col-md-12">
		<div style="border-bottom:2px solid #23133a;padding-bottom:10px;"><h3>Raw Material Supplier Group</h3></div>
		
		<div style="margin-top:20px;">
			<div class="row">
			<div class="col-md-4"><h4>Raw Material Supplier Group List</h4></div>
			<div class="col-md-5"></div>
			<div class="col-md-3"><a href="add-supplier-group"><span class="fa fa-plus"></span> Add New Supplier Group</a></div>
			</div>
		<hr>
		
		<div style="margin-top:20px;">
			<table class="table table-striped" id="example">
				<thead>
					<tr>
						<th>#</th>
						<th>Supplier Group</th>
						<th>Description</th>
						<th>View</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
			 <c:forEach items="${supplierGroupList}" var="supplierGroup" varStatus="i"> 
				<tr>
					<td>${i.count}</td>
					<td>${supplierGroup.supplierGroup}</td>
					<td>${supplierGroup.description}</td>
					<td><a href="view-supplier-group?id=${supplierGroup.id}"><i class="fa fa-eye"></i></a></td>
					<td><a href="edit-supplier-group?id=${supplierGroup.id}"><i class="fa fa-edit"></i></a></td>
					<td><a href="delete-supplier-group?id=${supplierGroup.id}" onclick="return confirm('Are you sure you want to delete?');"><i class="fa fa-trash"></i></a></td>
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
