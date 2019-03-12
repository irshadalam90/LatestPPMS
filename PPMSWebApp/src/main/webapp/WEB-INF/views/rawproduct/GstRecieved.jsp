<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>GST Received</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<body>

		<div class="col-md-12">
			<div class="row" style="border-bottom:2px solid #23133a;padding-bottom:10px;">
				<div class="col-md-12"><h3>GST Received</h3></div>
			</div>
				<div class="row" style="margin-top:20px;">
					<div class="col-md-3"><h4>GST Received List</h4></div>
					<div class="col-md-6"></div>
					<div class="col-md-3"><a href="add-gst-received"><i class="fa fa-plus"></i> Add New GST Received</a></div>
				</div>
			<hr>
			
			<div style="margin-top:20px;">
				<table class="table table-striped" id="example">
					<thead>
						<tr>
							<th>#</th>
							<th>Supplier Name</th>
							<th>Invoice No.</th>
							<th>Invoice Date</th>
							<th>Grand Total</th>
							<th>View</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
				 	<c:forEach items="${gstReceivedList}" var="gstReceived" varStatus="i"> 
				 	
					<tr>
						<td>${i.count}</td>
						<td>${gstReceived.supplierName}</td>
						<td>${gstReceived.invoiceNo}</td>
						<td>${gstReceived.invoiceDate}</td>
						<td>${gstReceived.grandTotal}</td>
						<td><a href="viewdetail-gst-received?id=${gstReceived.id}"><i class="fa fa-eye"></i></a></td>
						<td><a href="edit-gst-received?id=${gstReceived.id}"><i class="fa fa-edit"></i></a></td>
						<td><a href="delete-gst-received?id=${gstReceived.id}"><i class="fa fa-trash"></i></a></td>
					</tr>
					
					</c:forEach>
					<tbody>
				</table>
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
