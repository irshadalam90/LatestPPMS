<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<table class="table table-striped">
           		<thead>
				<tr>
					 <th>#</th> 
					<th>Product Name</th>
					<th>Product Size</th>
					<th>Batch No.</th>
					<th>Quantity</th>
					<th>Rate</th>
					<th>Gst(%)</th>
					<th>GstRate</th>
					<th>Discount</th>
					<th>Amount</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
				</thead>
				<tbody>	
					<c:forEach items="${updatedData}" var="rrp" varStatus="i">
						<tr>
							<td>${i.count}</td>
							<td>${rrp.productName}</td>
							<td>${rrp.productSize}</td>
						    <td>${rrp.batchNo}</td>
							<td>${rrp.quantity}</td>
							<td>${rrp.rate}</td>
							<td>${rrp.gstPer}</td>
							<td>${rrp.gstRate}</td>
							<td><%-- ${rrp.totalDiscount} --%></td>
							<td>${rrp.amount}</td> 
							<td><a href="javascript:void(0);" onclick="editRawReceivedProduct(${rrp.id})"><i class="fa fa-edit"></i></a></td>
							<td><a href="#"><i class="fa fa-trash"></i></a></td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>