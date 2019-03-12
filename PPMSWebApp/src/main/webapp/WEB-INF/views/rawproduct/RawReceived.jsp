<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Raw Received</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script>

</script>
</head>
<body>
		<div class="col-md-12" >
			<div class="row" style="border-bottom:2px solid #23133a;padding-bottom:10px;">
			<div class="col-md-12"><h3>Purchase Order (PO) Received</h3></div></div>
			
			<!-- <div style="margin-top:20px;"> -->
				<div class="row" style="margin-top:20px;">
				<div class="col-md-4"><h4>Purchase Order (PO) Received List</h4></div>
				<div class="col-md-5"></div>
				<div class="col-md-3"><a href="add-raw-received"><i class="fa fa-plus"></i> Add New PO Received</a></div>
				</div>
			<hr>
			
			<div style="margin-top:20px;">
				<table class="table table-striped" id="example">
					<thead>
						<tr>
							<th>#</th>
							<th>Supplier Name</th>
							<th>Order No.</th>
							<th>Invoice Date</th>
							<th>Grand Total</th>
							<th>View</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					
					<tbody>
				 	<c:forEach items="${rawReceivedList}" var="rawReceived" varStatus="i"> 
					<tr>
						<td>${i.count}</td>
						<td>${rawReceived.supplierName}</td>
						<td>${rawReceived.invoiceNo}</td>
						<td>${rawReceived.invoiceDate}</td>
						<td>${rawReceived.grandTotal}</td>
						<td><a href="viewdetail-raw-received?id=${rawReceived.id}"><i class="fa fa-eye"></i></a></td>
						<td><a href="edit-raw-received?id=${rawReceived.id}"><i class="fa fa-edit"></i></a></td>
						<td><a href="#"><i class="fa fa-trash"></i></a></td>
					</tr>
					
					</c:forEach>
					</tbody>
				</table>
				</div>
			<!-- </div> -->
         <!-- </div>
         
         <div class="col-md-1" ></div> -->
		
	</div>

<script>
$(document).ready(function() {
    $('#example').DataTable( {
        "pagingType": "full_numbers"
    } );
} );
</script>
 </body>
</html>
