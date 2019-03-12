<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<aside>
    <div id="sidebar" class="nav-collapse">
        <div class="leftside-navigation">
            <ul class="sidebar-menu parent-menu" id="nav-accordion">
                <li role="presentation">
                    <a href="dashboard">
                        <i class="fa fa-dashboard"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li class="sub-menu">
                	
                    <a href="#" ${raw eq '#' ? 'class="active"' : ''}> 
                        <i class="fa fa-pie-chart"></i>
                        <span>Raw Material</span>
                    </a>
                   
                    <ul class="sub child-menu">
                    	<li><a href="#"><i class="fa fa-circle-o"></i>Overview</a></li>
						<li><a href="raw-product" ${action eq 'raw-product' ? 'class="active"' : ''}><i class="fa fa-circle-o"></i>Products</a></li>
						<li><a href="#" ${supplier eq '#' ? 'class="active"' : ''}><i class="fa fa-circle-o"></i>Suppliers</a>
							<ul class="sub">
								<li><a style="padding-left:66px;" href="raw-supplier" ${action eq 'raw-supplier' ? 'class="active"' : ''}><i class="fa fa-circle-o"></i>Suppliers</a>
								<li><a style="padding-left:66px;" href="supplier-group-list" ${action eq 'supplier-group-list' ? 'class="active"' : ''}><i class="fa fa-circle-o"></i>Supplier Group</a></li>
							</ul>
						</li>
                        <li><a href="#" ${received eq '#' ? 'class="active"' : ''}><i class="fa fa-circle-o"></i>Received</a>
                        	<ul class="sub">
								<li><a style="padding-left:66px;" href="view-stock" ${action eq 'view-stock' ? 'class="active"' : ''}><i class="fa fa-circle-o"></i>Stock Overview</a></li>
								<!-- <li style="padding-left:20px;"><a href="add-raw-received"><i class="fa fa-circle-o"></i>Add PO Received</a></li> -->
								<li><a style="padding-left:66px;" href="view-raw-received" ${action eq 'view-raw-received' ? 'class="active"' : ''}><i class="fa fa-circle-o"></i>PO Received</a></li>
								<!-- <li style="padding-left:20px;"><a href="add-gst-received"><i class="fa fa-circle-o"></i>Add GST Received</a></li> -->
		                        <li><a style="padding-left:66px;" href="view-gst-received" ${action eq 'view-gst-received' ? 'class="active"' : ''}><i class="fa fa-circle-o"></i>GST Received</a></li>
		                     </ul> 
                        </li>
                        <li><a href="#" ${dispatch eq '#' ? 'class="active"' : ''}><i class="fa fa-circle-o"></i>Dispatch</a>
                        	<ul class="sub">
								<li><a style="padding-left:66px;" href="dispatch-product" ${action eq 'dispatch-product' ? 'class="active"' : ''}><i class="fa fa-circle-o"></i>Dispatches</a></li>
								<li><a style="padding-left:66px;" href="view-dispatch-product" ${action eq 'view-dispatch-product' ? 'class="active"' : ''}><i class="fa fa-circle-o"></i>View Dispatched</a></li>
							</ul>
                        </li>
                        <li><a href="#" ${payment eq '#' ? 'class="active"' : ''}><i class="fa fa-circle-o"></i>Payment</a>
                        	<ul class="sub">
								<li><a style="padding-left:66px;" href="#"><i class="fa fa-circle-o"></i>Outstanding</a></li>
								<li><a style="padding-left:66px;" href="payments-list" ${action eq 'payments-list' ? 'class="active"' : ''}><i class="fa fa-circle-o"></i>Payments</a></li>
								<!-- <li style="padding-left:20px;"><a href="#"><i class="fa fa-circle-o"></i>View Payments</a></li> -->
                        	</ul>
                        </li>
                        <li><a href="references" ${action eq 'references' ? 'class="active"' : ''}><i class="fa fa-circle-o"></i>References</a></li>
                    </ul> 
                </li>
                <li class="sub-menu">
                    <a href="#" ${manufacture eq '#' ? 'class="active"' : ''}>
                        <i class="fa fa-laptop"></i>
                        <span>Manufacture</span>
                    </a>
                    <ul class="sub">
                        <li><a href="manufacture-products" ${action eq 'manufacture-products' ? 'class="active"' : ''}><i class="fa fa-circle-o"></i>Product</a></li>
                        <!-- <li><a href="add-sheet-mfg-details"><i class="fa fa-circle-o"></i>Add Sheet Manufacture</a></li> -->
                        <li><a href="view-sheet-mfg" ${action eq 'view-sheet-mfg' ? 'class="active"' : ''}><i class="fa fa-circle-o"></i>Sheet Manufacture</a></li>
                        <!-- <li><a href="add-product-mfg"><i class="fa fa-circle-o"></i>Add Product Manufacture</a></li> -->
                        <li><a href="view-product-mfg" ${action eq 'view-product-mfg' ? 'class="active"' : ''}><i class="fa fa-circle-o"></i>Product Manufacture</a></li>
                        <li><a href="view-electric-uses" ${action eq 'view-electric-uses' ? 'class="active"' : ''}><i class="fa fa-circle-o"></i>Electric Use</a></li>
                    </ul>
                </li>
                <li class="sub-menu" role="presentation">
                    <a href="#" ${packaging eq '#' ? 'class="active"' : ''}>
                        <i class="fa fa-edit"></i>
                        <span>Packaging</span>
                    </a>
                    <ul class="sub">
                        <li><a href="view-packaging-details" ${action eq 'view-packaging-details' ? 'class="active"' : ''}><i class="fa fa-circle-o"></i>Packaging</a></li>
                        <li><a href="view-boxing-details" ${action eq 'view-boxing-details' ? 'class="active"' : ''}><i class="fa fa-circle-o"></i>Boxing</a></li>
                    </ul>
                </li>
                <li class="sub-menu" role="presentation">
                    <a href="#" ${sale eq '#' ? 'class="active"' : ''}>
                        <i class="fa fa-table"></i>
                        <span>Sale Book</span>
                    </a>
                    <ul class="sub">
                        <li><a href="view-customers" ${action eq 'view-customers' ? 'class="active"' : ''}><i class="fa fa-circle-o"></i>Customer</a></li>
                        <li><a href="references" ${action eq 'references' ? 'class="active"' : ''}><i class="fa fa-circle-o"></i>References</a></li>
                        <li><a href="sale-orders" ${action eq 'sale-orders' ? 'class="active"' : ''}><i class="fa fa-circle-o"></i>Sale Order</a></li>
                        <li><a href="gst-invoice" ${action eq 'gst-invoice' ? 'class="active"' : ''}><i class="fa fa-circle-o"></i>GST Invoice</a></li>
                        <li><a href="#"><i class="fa fa-circle-o"></i>Debtor A/C</a></li>
                    </ul>
                </li>
                <li class="sub-menu" role="presentation">
                    <a href="#" ${bankacc eq '#' ? 'class="active"' : ''}>
                        <i class="fa fa-table"></i>
                        <span>Bank Accounts/Cash Book</span>
                    </a>
                    <ul class="sub">
                        <!-- <li><a href="create-bank-account"><i class="fa fa-circle-o"></i>Create Bank Account</a></li> -->
                        <li><a href="bank-account-list" ${action eq 'bank-account-list' ? 'class="active"' : ''}><i class="fa fa-circle-o"></i>Bank Account</a></li>
                        <!-- <li><a href="add-bank-entry"><i class="fa fa-circle-o"></i>Add Bank Entry</a></li> -->
                        <li><a href="bank-entry-list" ${action eq 'bank-entry-list' ? 'class="active"' : ''}><i class="fa fa-circle-o"></i>Bank Entry</a></li>
                    </ul>
                </li>
                <li class="sub-menu" role="presentation">
                    <a href="#">
                        <i class="fa fa-table"></i>
                        <span>Ledger</span>
                    </a>
                    <ul class="sub">
                        <li><a href="#"><i class="fa fa-circle-o"></i>Create Ledger</a></li>
                        <li><a href="#"><i class="fa fa-circle-o"></i>Create Group</a></li>
                    </ul> 
                </li>
                <li class="sub-menu" role="presentation">
                    <a href="#">
                        <i class="fa fa-folder"></i>
                        <span>Letters</span>
                    </a>
                    <ul class="sub">
                        <li><a href="#"><i class="fa fa-circle-o"></i>Add Letter Format</a></li>
                    </ul>      
                </li>
                <li class="sub-menu" role="presentation">
                    <a href="#">
                        <i class="fa fa-folder"></i>
                        <span>Admin Access</span>
                    </a>
                    <ul class="sub">
                        <li><a href="#"><i class="fa fa-circle-o"></i>GST</a></li>
                        <li><a href="#"><i class="fa fa-circle-o"></i>Company Detail</a></li>
                        <li><a href="#"><i class="fa fa-circle-o"></i>Create User Role</a></li>
                        <li><a href="#"><i class="fa fa-circle-o"></i>Create User</a></li>
                        <li><a href="#"><i class="fa fa-circle-o"></i>View User</a></li>
                        <li><a href="#"><i class="fa fa-circle-o"></i>Setting</a></li>
                    </ul>
                </li>
                <li class="sub-menu" role="presentation">
                    <a href="#">
                        <i class="fa fa-th"></i>
                        <span>Master</span>
                    </a>
                    <ul class="sub">
                        <li><a href="#"><i class="fa fa-circle-o"></i>Add Employee</a></li>
                        <li><a href="#"><i class="fa fa-circle-o"></i>View Employee</a></li>
                        <li><a href="#"><i class="fa fa-circle-o"></i>Attendance</a></li>
                    </ul>
                </li>
                <li class="sub-menu" role="presentation">
                    <a href="#">
                        <i class="fa fa-th"></i>
                        <span>Expenses</span>
                    </a>
                    <ul class="sub">
                        <li><a href="#"><i class="fa fa-circle-o"></i>Expenses</a></li>
                    </ul>
                </li>
                <li class="sub-menu" role="presentation">
                    <a href="#">
                        <i class="fa fa-th"></i>
                        <span>Reports</span>
                    </a>
                    <ul class="sub">
                        <li><a href="#"><i class="fa fa-circle-o"></i>Invoice</a></li>
                        <li><a href="#"><i class="fa fa-circle-o"></i>Profile</a></li>
                    </ul>
                </li>
                <li class="sub-menu" role="presentation">
                    <a href="#">
                        <i class="fa fa-th"></i>
                        <span>Multilevel</span>
                    </a>
                    <ul class="sub">
                        <li><a href="#"><i class="fa fa-circle-o"></i>Level One</a></li>
                    </ul>
                </li>
                
                <li class="sub-menu" role="presentation">
                    <a href="#">
                        <i class=" fa fa-inr"></i>
                        <span>User Guideline</span>
                    </a>                 
                </li>
                
                </ul>        
               </div>
               </div>
</aside>
 <script>
/* $(document).ready(function() {
 	$('a').click(function(){
 		 var path = window.location.pathname;
    	var str = path.split('/');
    	if(str[2]=="#"){
    		$('ul.parent-menu>li a').removeClass("active");
    		$(this).addClass("active");
    	} 
	    //$('ul.parent-menu>li>a').removeClass("active");
	    $(this).addClass("active");
	});
 });  */
 //$(document).ready(function() {
	 	//$('a').click(function(){
	 		/* var path = window.location.pathname;
	    	var str = path.split('/');
	    	if(str[2]=="#"){
	    		$('ul.parent-menu>li a').removeClass("active");
	    		$(this).addClass("active");
	    	} */
		    //$('ul.parent-menu>li>a').removeClass("active");
		    //$(this).addClass("active");
		//})
	 	
	 //}); 

 /* window.onload = function() {
	 setDefaultActive();
	};
 
 var setDefaultActive = function() {
	    var path = window.location.pathname;

	    var element = $(".sidebar-menu a[href='" + path + "']");

	    element.addClass("active");
	}
 */
$(document).ready(function() {

	var path = window.location.pathname.split("/").pop();
	
 	if(path == "dashboard"){
 		
 		var target = $('a[href="'+path+'"]');
 		
 		target.addClass('active');
 	}

	
	
});	
  
 
 </script>