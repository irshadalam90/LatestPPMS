<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<c:if test="${user eq null }">
	<jsp:forward page="/login"></jsp:forward>
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><decorator:title default="PPMS Erp"/></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Visitors Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<!--formden.js communicates with FormDen server to validate fields and submit via AJAX -->
<script type="text/javascript" src="https://formden.com/static/cdn/formden.js"></script>

<!-- Special version of Bootstrap that is isolated to content wrapped in .bootstrap-iso -->
<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

<!--Font Awesome (added because you use icons in your prepend/append)-->
<link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />

<!-- Inline CSS based on choices in "Settings" tab -->
<style>.bootstrap-iso .formden_header h2, .bootstrap-iso .formden_header p, .bootstrap-iso form{font-family: Arial, Helvetica, sans-serif; color: black}.bootstrap-iso form button, .bootstrap-iso form button:hover{color: white !important;} .asteriskField{color: red;}</style>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/datatables.min.css">
<link href="<%=request.getContextPath()%>/css/style.css" rel='stylesheet' type='text/css' />
<link href="<%=request.getContextPath()%>/css/style-responsive.css" rel="stylesheet"/>
<!-- <link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'> -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/font.css" type="text/css"/>
<link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet"> 
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/morris.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/monthly.css">
<link href="<%=request.getContextPath()%>/css/jquery-ui.css" rel="stylesheet"/>
<script src="<%=request.getContextPath()%>/js/jquery2.0.3.min.js"></script>
<script src="<%=request.getContextPath()%>/js/datatables.min.js"></script>
<script src="<%=request.getContextPath()%>/js/raphael-min.js"></script>
<script src="<%=request.getContextPath()%>/js/morris.js"></script>

</head>
<body>
<section id="container">
<!--header start-->
<jsp:include page="../common/Header.jsp" />
<!--header End-->
<!--sidebar start-->
 <jsp:include page="../common/sidebar.jsp" /> -
<!--sidebar end-->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<decorator:body></decorator:body>
	</section>
	 <!-- footer -->
		 <!--  <div class="footer">
			<div class="wthree-copyright">
			  <p>© 2018 School Management. All rights reserved | Design by <a href="http://gntechno.com">G N Techo</a></p>
			</div>
		  </div> -->
  	<!-- / footer -->
</section>
<!--main content end-->
</section>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="<%=request.getContextPath()%>/js/scripts.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.slimscroll.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.nicescroll.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.scrollTo.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/js/adminlte.js"></script>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/> -->

<!-- <script>
	$(document).ready(function(){
		var date_input=$('#datepicker'); //our date input has the name "date"
		var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
		date_input.datepicker({
			//"setDate": new Date(),
			format: 'dd/mm/yyyy',
			container: container,
			todayHighlight: true,
			autoclose: true,
		}).datepicker("setDate",'now');
	})
</script> -->


<!-- <script>
$(function() {
    $('a[data-toggle="tab"]').on('click', function(e) {
        window.localStorage.setItem('activeTab', $(e.target).attr('href'));
    });
    var activeTab = window.localStorage.getItem('activeTab');
    if (activeTab) {
        $('#menu-tab a[href="' + activeTab + '"]').tab('show');
        window.localStorage.removeItem("activeTab");
    }
});
</script> -->
 </body>
</html>
