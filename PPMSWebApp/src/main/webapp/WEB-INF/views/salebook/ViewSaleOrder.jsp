<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sale Orders</title>

</head>
<body>

	<div class="row">
		<div class="col-md-11 " style="margin-left:30px;">
			<div style="margin-top:10px;border-bottom:2px solid #23133a;padding-bottom:10px;"><h3>Sale Order</h3></div>
			
			<div style="margin-top:20px;">
				<div class="row">
				<div class="col-md-3"><h4>Sale Order List</h4></div>
				<div class="col-md-7"></div>
				<div class="col-md-2"><a href="add-sale-order"><span class="fa fa-plus"></span> Add Sale Order</a></div>
				</div>
			<hr>
			
			<div style="margin-top:20px;">
				<table class="table table-striped" id="example">
					<thead>
						<tr>
							<th>#</th>
							<th>Order No.</th>
							<th>Order Date</th>
							<th>Customer Name</th>
							<!-- <th>Contact No.</th> -->
							<th>Grand Total</th>
							<th>View</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
				 <c:forEach items="${saleOrders}" var="saleOrder" varStatus="i"> 
					<tr>
						<td>${i.count}</td>
						<td>${saleOrder.invoiceNo}</td>
						<td>${saleOrder.invoiceDate}</td>
						<td>${saleOrder.customerName}</td>
						<%-- <td>${saleOrder.contactNo}</td> --%>
						<td>${saleOrder.grandTotal}</td>
						
						
						<td><a href="#"><i class="fa fa-eye"></i></a></td>
						<td><a href="#"><i class="fa fa-edit"></i></a></td>
						<td><a href="#" onclick="return confirm('Are you sure you want to delete?');"><i class="fa fa-trash"></i></a></td>
					</tr>
				 </c:forEach> 
				 </tbody>
				</table>
				</div>
			</div>
         </div>
         
         <div class="col-md-1" ></div>
		
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
