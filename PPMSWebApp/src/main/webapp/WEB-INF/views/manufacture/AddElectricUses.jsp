
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Electric Uses</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
		<div class="col-md-12">
			<div class="row" style="border-bottom:2px solid #23133a;padding-bottom:10px;">
				<div class="col-md-5"><h3>Manufacture Electric Uses</h3></div>
				<div class="col-md-6"></div>
				<div class="col-md-1"><a href="view-electric-uses"><i class="fa fa-angle-left" style="font-size:20px;"></i> Back</a></div>
			</div>
			
			<div style="margin-top:20px;"><h4>Add Electric Uses</h4></div><hr>
			<form role="form" action="submit-raw-product" method="post">
			
	           <div class="form-group">
	            <div class="col-md-3 inp-field">Reading Date*</div>
	             <div class="col-md-9 inp-field"><input type="date" class="form-control" name="readingDate" required></div>
	           </div>
	           <div class="form-group">
	             <div class="col-md-3 inp-field">Current Reading Date*</div>
	             <div class="col-md-9  inp-field"><input type="date" class="form-control" name="currReadingDate" required></div>
	           </div>
	           <div class="form-group">
	             <div class="col-md-3 inp-field">Current Reading Time*</div>
	             <div class="col-md-9 inp-field"><input type="time" class="form-control" name="currReadingTime" required></div>
	           </div>
	           <div class="form-group">
	             <div class="col-md-3 inp-field">Pre Reading Date*</div>
	             <div class="col-md-9  inp-field"><input type="date" class="form-control" name="preReadingDate" required></div>
	           </div>
	           <div class="form-group">
	             <div class="col-md-3 inp-field">Pre Reading Time*</div>
	             <div class="col-md-9 inp-field"><input type="time" class="form-control" name="preReadingTime" required></div>
	           </div>
	           <div class="form-group">
	             <div class="col-md-3 inp-field">Pre Reading*</div>
	             <div class="col-md-9 inp-field"><input type="text" class="form-control" name="preReading" required placeholder=""></div>
	           </div>
	           <div class="form-group">
	             <div class="col-md-3 inp-field">Current Reading*</div>
	             <div class="col-md-9 inp-field"><input type="text" class="form-control" name="currReading" required placeholder=""></div>
	           </div>
	           <input type="hidden" name="status" value="active">
	           <div class="col-md-12"><hr></div>
	           <div class="row" >
	           	<div class="col-md-9"></div>
	           	<div class="col-md-3">
	             		<button type="submit" class="btn" style="margin-top:20px;margin-bottom:20px; background-color:#23133a;color:#fff">Add Electric Uses</button>
	             	</div>
	           </div>
	              
	         
	         </form>
			</div>
		</div>
			
		
		
 </body>
</html>
