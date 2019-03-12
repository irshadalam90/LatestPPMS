<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
				
<div class="row" style="margin-top:20px;">
<div><h4>View Payment</h4></div><hr>
	<table class="table table-striped">
			<th>#</th>
			<th>Payment ID</th>
			<th>Supplier Name</th>
			<th>Payment Mode</th>
			<th>Amount</th>
			<th>Payment Date</th>
			<th>View</th>
			<th>Edit</th>
			<th>Delete</th>
		
		<%-- <c:forEach items="${teacherList}" var="teacher" varStatus="i"> --%>
		<tr>
			<td>1</td>
			<td>p11</td>
			<td>ABC</td>
			<td>Cash</td>
			<td>10000</td>
			<td>14/05/2018</td>
			<td><a href="#"><i class="fa fa-eye"></a></td>
			<td><a href="#"><i class="fa fa-edit"></a></td>
			<td><a href="#"><i class="fa fa-trash"></a></td>
			
		</tr>
		<tr>
			<td>2</td>
			<td>p12</td>
			<td>ABCD</td>
			<td>Cash</td>
			<td>10000</td>
			<td>14/05/2018</td>
			<td><a href="#"><i class="fa fa-eye"></a></td>
			<td><a href="#"><i class="fa fa-edit"></a></td>
			<td><a href="#"><i class="fa fa-trash"></a></td>
			
		</tr>
		<%-- </c:forEach> --%>
	</table>
</div>
				
			