<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Packaging</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script>


</script>
</head>
<body>

		<div class="col-md-12">
			<div class="row" style="border-bottom:2px solid #23133a;padding-bottom:10px;">
				<div class="col-md-5"><h3>Product Packaging</h3></div>
				<div class="col-md-6"></div>
				<div class="col-md-1"><a href="view-packaging-details"><i class="fa fa-angle-left" style="font-size:20px;"></i> Back</a></div>
			</div>
		
			<div style="margin-top:20px;"><h4>View Detail Product Packaging </h4></div><hr>
	 	 <form id="product-packaging-form">
	 	 <input type="hidden" id="productmfg-id" name="productMfgId">
		
		<div class="col-md-6">
		   <div class="form-group">
             <div class="col-md-4 inp-field">Packaging Date*</div>
             <div class="col-md-8 inp-field"><input type="date" class="form-control" name="packagingDate" required value="${packaging.packagingDate}"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Product Name*</div>
             <div class="col-md-8 inp-field">
             	<select class="form-control" name="productName" id="productmfg-name" onchange="getProductSize();" required>
             		<option>${packaging.productName}</option>
             	<c:forEach items="${productNames}" var="productName">
             		<option>${productName}</option>
             	</c:forEach>
             	</select>
             </div>
           </div>
          <div class="form-group">
             <div class="col-md-4 inp-field">Product Size*</div>
             <div class="col-md-5 inp-field">
             	<select class="form-control" id="productmfg-size" name="productSize" placeholder="Product Size" onchange="getProductGage();" required>
             		<option>${packaging.productSize}</option>
             	</select>
             </div>
             <div class="col-md-3 inp-field">ml</div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Product Gage*</div>
             <div class="col-md-8 inp-field">
             	<select class="form-control" id="productmfg-gage" name="productGage" placeholder="Product Gage" onchange="getProductMfgQty()" required>
             		<option>${packaging.productGage}</option>
             	</select>
             </div>
           </div>
           
           <div class="form-group">
             <div class="col-md-4 inp-field">Batch No.</div>
             <div class="col-md-8 inp-field"><input type="text" readonly class="form-control" name="batchNumber" value="${packaging.batchNo}" id="productmfg-batchno"></div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Manufacture Qty</div>
             <div class="col-md-4 inp-field"><input type="text" readonly class="form-control" name="availablePacketweight" value="${packaging.availablePacketweight}" id="productmfg-qty"></div>
           <div class="col-md-1">Kg</div>
           <div class="col-md-3"><a href="#" class="btn btn-danger">Add To Scrap</a></div>
           </div>
           </div>
           
			
		<!-- <div class="col-md-4"></div> -->
		<div class="col-md-12"><hr></div>	
		  <input type="hidden" id="raw-product-id" name="rawProductId">
           <div class="col-md-6">
           <div class="form-group">
             <div class="col-md-4 inp-field">Plastic Bag*</div>
             <div class="col-md-8 inp-field">
             	<select class="form-control" name="plasticBag" id="plasticbag-prod-name" onchange="getPlasticBagProdSize()" required>
             	<option disabled selected>${packaging.plasticBag}</option>
             	<%-- <c:forEach items="${dispatchedprodNames}" var="dispatchedprodName">
             		<option>${dispatchedprodName}</option>
             	</c:forEach> --%>
             	</select>
             </div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Bag Size*</div>
             <div class="col-md-5 inp-field">
             	<select id="plasticbag-prod-size" class="form-control" name="bagSize" onchange="getPlasticBagProdAvlQty();" required>
             		<option disabled selected>${packaging.bagSize}</option>
             		<%-- <c:forEach items="${pbProductSize}" var="productSize">
             		<option>${productSize}</option>
             		</c:forEach> --%>
             	</select>
             </div>
             <div class="col-md-3 inp-field">ml</div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Qty/Packet*</div>
             <div class="col-md-5 inp-field"><input type="text" class="form-control" id="qty-per-pkt" name="qtyPerPacket" value="${packaging.qtyPerPacket}" placeholder="Enter qty per packet" onkeyup="calPktWeight();" required></div>
           	 <div class="col-md-3 inp-field">Pices</div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Bag Weight*</div>
             <div class="col-md-5 inp-field"><input type="text" class="form-control" id="bagwt" name="bagweight" value="${packaging.bagweight}" placeholder="Enter bag weight" onkeyup="calPktWtWithBag()" required></div>
         	<div class="col-md-3 inp-field">gm</div>
			 </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">No. of Packet*</div>
             <div class="col-md-5 inp-field"><input type="text" id="no-ofpkts" class="form-control" name="noOfPacketsCreated" value="${packaging.noOfPacketsCreated}" placeholder="Enter number of packets" onkeyup="calTotalPackaging();" required></div>
           	 <div class="col-md-3 inp-field">Pices</div>
           </div>
           </div>
           
		<div class="col-md-6">         
        	<input type="hidden" id="productmfg-pktwth">
          <div class="col-md-12"></div>
           <div class="form-group" style="margin-top:50px;">
             <div class="col-md-4 inp-field">Available Bag</div>
             <div class="col-md-5 inp-field"><input type="text" class="form-control" readonly name="availableBagQty" value="${packaging.availableBagQty}" placeholder="" id="plasticbag-prod-avlqty"></div>
             <div class="col-md-3 inp-field">Kg</div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Packet Weight</div>
             <div class="col-md-5 inp-field"><input type="text" id="total-pktwt" readonly class="form-control" value="${packaging.packetWeight}" name="packetWeight" placeholder=""></div>
           	 <div class="col-md-3 inp-field">gm</div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Wt. with Bag</div>
             <div class="col-md-5 inp-field"><input type="text" class="form-control" readonly id="total-pktwt-withbag" value="${packaging.weightWithBag}" name="weightWithBag" placeholder=""></div>
          	 <div class="col-md-3 inp-field">gm</div>
           </div>
           <div class="form-group">
             <div class="col-md-4 inp-field">Total Packaging*</div>
             <div class="col-md-5 inp-field"><input type="text" id="total-packaging" readonly class="form-control" name="totalPacketing" value="${packaging.totalPacketing}" placeholder=""></div>
             <div class="col-md-3 inp-field">kg</div>
           </div>
		</div>
		<div class="col-md-12"><hr></div>
         	<!-- <div class="col-md-12">
         		<div class="col-md-9"></div>
			<div class="col-md-3"><button class="btn" style="background-color:#23133a;color:#fff">Add Packaging Details</button></div>
           </div> -->
            </form> 
          </div>
        
<script>
function getPlasticBagProdSize(){
	var plasticBagProdName = $("#plasticbag-prod-name").val();
	$.ajax({
			type: 'GET',
			url: 'get-plasticbag-prod-size?plasticBagProdName='+plasticBagProdName+'',
			dataType: 'json', 
			
			success: function(data){
			var options = "";
			options += '<option disabled selected>Select Bag Size</option>'
			$('#plasticbag-prod-size').html('');
			 for(var i=0; i<data.length; i++){ 
				options +=  '<option>'+data[i]+'</option>';
			 } 
			$('#plasticbag-prod-size').append(options);
			},
			error: function(){
				alert("something is wrong");
			}
	});
}

function getPlasticBagProdAvlQty(){
	var plasticBagProdName = $("#plasticbag-prod-name").val();
	var plasticBagProdSize = $("#plasticbag-prod-size").val();
	$.ajax({
			type: 'GET',
			url: 'get-plasticbag-prod-avlqty?plasticBagProdName='+plasticBagProdName+'&plasticBagProdSize='+plasticBagProdSize+'',
			dataType: 'json', 
			
			success: function(data){
			$('#raw-product-id').val(data[0]);	
			$('#plasticbag-prod-avlqty').val(data[1]);
			},
			error: function(){
				alert("something is wrong");
			}
	});
}

function getProductSize(){
	
	var productmfgName = $("#productmfg-name").val();
	
	$.ajax({
			type: 'GET',
			url: 'get-productmfg-size?productmfgName='+productmfgName+'',
			dataType: 'json', 
			
			success: function(data){
			var options = "";
			options += '<option selected disabled>Select Product Size</option>'
			$('#productmfg-size').html('');
			 for(var i=0; i<data.length; i++){ 
				options +=  '<option>'+data[i]+'</option>';
			 } 
			$('#productmfg-size').append(options);
			},
			error: function(){
				alert("something is wrong");
			}
	});

}

function getProductGage(){
	var productmfgName = $("#productmfg-name").val();
	var productmfgSize = $("#productmfg-size").val();
	$.ajax({
			type: 'GET',
			url: 'get-productmfg-gage?productmfgName='+productmfgName+'&productmfgSize='+productmfgSize+'',
			dataType: 'json', 
			
			success: function(data){
			var options = "";
			options += '<option selected disabled>Select Product Gage</option>'
			$('#productmfg-gage').html('');
			
			for(var i=0; i<data.length; i++){ 
				options +=  '<option>'+data[i]+'</option>';
			} 
			$('#productmfg-gage').append(options);
			
			},
			error: function(){
				alert("something is wrong");
			}
	});
}

function getProductMfgQty(){
	var productmfgName = $("#productmfg-name").val();
	var productmfgSize = $("#productmfg-size").val();
	var productmfgGage = $("#productmfg-gage").val();
	$.ajax({
			type: 'GET',
			url: 'get-productmfg-qty?productmfgName='+productmfgName+'&productmfgSize='+productmfgSize+'&productmfgGage='+productmfgGage+'',
			dataType: 'json', 
			
			success: function(data){
			$('#productmfg-id').val(data[0]);
			$('#productmfg-qty').val(data[1]);
			$('#productmfg-batchno').val(data[2]);
			getProductMfgPktWt();
			},
			error: function(){
				alert("something is wrong");
			}
	});
}

function getProductMfgPktWt(){
	var productmfgName = $("#productmfg-name").val();
	var productmfgSize = $("#productmfg-size").val();
	var productmfgGage = $("#productmfg-gage").val();
	$.ajax({
			type: 'GET',
			url: 'get-productmfg-pktwt?productmfgName='+productmfgName+'&productmfgSize='+productmfgSize+'&productmfgGage='+productmfgGage+'',
			dataType: 'json', 
			
			success: function(data){
			$('#productmfg-pktwth').val(data);
			},
			error: function(){
				alert("something is wrong");
			}
	});
}

function calPktWeight(){
	var pktWt = parseFloat($('#productmfg-pktwth').val());
	var pktQty = parseInt($('#qty-per-pkt').val());
	
	if(isNaN(pktWt)){
		pktWt=0;
	}
	if(isNaN(pktQty)){
		pktQty=0;
	}
	var pktWtGm = pktWt*1000;
	var totalPktWt = pktQty*pktWtGm;;
	$('#total-pktwt').val(totalPktWt);
	$('#bagwt').val('');
	$('#total-pktwt-withbag').val('');
	$('#total-packaging').val('');
	return totalPktWt;
}

function calPktWtWithBag(){
	var bagWt = parseFloat($('#bagwt').val());
	if(isNaN(bagWt)){
		bagWt=0;
	}
	//var totalpktWeight = calPktWeight();
	var totalpktWeight = parseFloat($('#total-pktwt').val());
	var totalPktWtWithBag = totalpktWeight+bagWt;
	
	$('#total-pktwt-withbag').val(totalPktWtWithBag);
}

function calTotalPackaging(){
	var noOfPackets = parseFloat($('#no-ofpkts').val());
	var totalpktWeight = parseFloat($('#total-pktwt').val());
	if(isNaN(totalpktWeight)){
		totalpktWeight=0;
	}
	if(isNaN(noOfPackets)){
		noOfPackets=0;
	}
	
	var totalpktWeightKg = totalpktWeight/1000;
	var totalPackaging = noOfPackets*totalpktWeightKg;
	
	$('#total-packaging').val(totalPackaging);
}



$(document).ready(function(){
	
	var productPackagingForm = $("#product-packaging-form");
	productPackagingForm.submit(function(e){
		e.preventDefault(); 
     $.ajax({
     type: "POST",
     url: "submit-packaging-details", 
     data: productPackagingForm.serialize(),
   	 success: function(response){
   		 if(response == "success"){
	         alert("Successfully submitted !!");
			 window.location = "add-packging-details";	
   		 }
     },
     error: function(){
         alert("something error");
      }
    });  
});
});


</script>
 </body>
</html>
