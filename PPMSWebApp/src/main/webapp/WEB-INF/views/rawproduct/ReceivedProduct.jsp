<div>	
	<%-- <table class="table table-striped">
		<tr>
			<th>#</th>
			<th>Product Name</th>
			<th>Product Size</th>
			<th>Batch No.</th>
			<th>Quantity</th>
			<th>Rate</th>
			<th>Discount</th>
			<th>Amount</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<c:forEach items="${rawProductList}" var="rawProduct" varStatus="i">
		<tr>
			<td>${i.count}</td>
			<td>${rawProduct.productName}</td>
			<td>${rawProduct.productGroup}</td>
			<td>${rawProduct.productSize}</td>
			<td>${rawProduct.inventoryQty}</td>
			<td>${rawProduct.warningQty}</td>
			<td><a href="view-detail-rawproduct?id=${rawProduct.id}"><i class="fa fa-eye"></a></td>
			<td><a href="edit-rawproduct?id=${rawProduct.id}"><i class="fa fa-edit"></a></td>
			<td><a href="delete-rawproduct?id=${rawProduct.id}" onclick="return confirm('Are you sure you want to delete?');"><i class="fa fa-trash"></a></td>
		</tr>
		</c:forEach>
	</table> --%>
</div>	