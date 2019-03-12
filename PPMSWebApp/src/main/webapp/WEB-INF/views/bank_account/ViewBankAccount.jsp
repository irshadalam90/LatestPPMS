<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Bank Account</title>

</head>
<body>

	<div class="row">
		<div class="col-md-11 " style="margin-left:30px;">
			<div style="margin-top:10px;border-bottom:2px solid #23133a;padding-bottom:10px;"><h3>Bank Account</h3></div>
			
			<div style="margin-top:20px;">
				<div class="row">
				<div class="col-md-3"><h4>Bank Account List</h4></div>
				<div class="col-md-6"></div>
				<div class="col-md-3"><a href="create-bank-account"><span class="fa fa-plus"></span> Create New Bank Account</a></div>
				</div>
			<hr>
			
			<div style="margin-top:20px;">
				<table class="table table-striped" id="example">
					<thead>
						<tr>
							<th>#</th>
							<th>Bank Name</th>
							<th>A/C Holder's Name</th>
							<th>A/C Number</th>
							<th>Branch</th>
							<th>View</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
				 <c:forEach items="${bankAccountList}" var="bankAccount" varStatus="i"> 
					<tr>
						<td>${i.count}</td>
						<td>${bankAccount.bankName}</td>
						<td>${bankAccount.accHolderName}</td>
						<td>${bankAccount.accNumber}</td>
						<td>${bankAccount.branch}</td>
						<td><a href="view-bank-account?id=${bankAccount.id}"><i class="fa fa-eye"></i></a></td>
						<td><a href="edit-bank-account?id=${bankAccount.id}"><i class="fa fa-edit"></i></a></td>
						<td><a href="delete-bank-account?id=${bankAccount.id}" onclick="return confirm('Are you sure you want to delete?');"><i class="fa fa-trash"></i></a></td>
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
