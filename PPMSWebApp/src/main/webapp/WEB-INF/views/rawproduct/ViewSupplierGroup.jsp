
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Detail Supplier Group</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
	<div class="col-md-12">
		<div class="row" style="margin-top:10px;border-bottom:2px solid #23133a;padding-bottom:10px;">
			<div class="col-md-6"><h3>Raw Material Supplier Group</h3></div>
			<div class="col-md-5"></div>
			<div class="col-md-1"><a href="supplier-group-list"><i class="fa fa-angle-left" style="font-size:20px;"></i> Back</a></div>
		</div>
		<!-- <div style="border-bottom:2px solid #23133a;padding-bottom:10px;"><h3>Raw Material Supplier Group</h3></div> -->
		<div style="margin-top:20px;"><h4>View Detail Supplier Group</h4></div><hr>
	<form id="supplier-group-form">
	<input type="hidden" name="id" value="${supplierGroup.id}">
          <div class="form-group">
           <div class="col-md-3 inp-field">Supplier Group Name*</div>
            <div class="col-md-9 inp-field"><input type="text" class="form-control" readonly name="supplierGroup" placeholder="Supplier Group Name" value="${supplierGroup.supplierGroup}"></div>
          </div>
          <div class="form-group">
            <div class="col-md-3 inp-field">Description</div>
            <div class="col-md-9  inp-field"><textarea class="form-control" rows="5" readonly name="description" placeholder="Write Description">${supplierGroup.description}</textarea></div>
          </div>
          
          <input type="hidden" name="status" value="active">
          <div class="row">
          	<div class="col-md-9"></div>
          	<div class="col-md-3">
            		<button type="submit" class="btn" style="margin-top:20px;margin-bottom:20px; background-color:#23133a;color:#fff">Update Supplier Group</button>
            	</div>
          </div>
             
        
        </form>
	</div>
			
		

 </body>
</html>
