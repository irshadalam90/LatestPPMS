<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Boxing</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script>


</script>
</head>
<body>

	<div class="col-md-12">
		<div class="row" style="border-bottom:2px solid #23133a;padding-bottom:10px;">
			<div class="col-md-5"><h3>Product Boxing</h3></div>
			<div class="col-md-6"></div>
			<div class="col-md-1"><a href="view-boxing-details"><i class="fa fa-angle-left" style="font-size:20px;"></i> Back</a></div>
		</div>
		
		<div style="margin-top:20px;"><h4>Edit Boxing</h4></div><hr>
 	 <form id="boxing-form">
	<div class="col-md-6">
          <!-- <div class="form-group">
            <div class="col-md-4 inp-field">Packing Product*</div>
            <div class="col-md-8 inp-field">
            	<select class="form-control" name="pkgProduct">
            		<option></option>
            
            	</select>
            </div>
          </div> -->
          <div class="form-group">
            <div class="col-md-4 inp-field">Boxing Date*</div>
            <div class="col-md-8 inp-field"><input type="date" class="form-control" name="boxingDate" value="${boxingData.boxingDate}" required></div>
          </div>
          <input type="hidden" id="plasticbag-id">
         <div class="form-group">
            <div class="col-md-4 inp-field">Plastic Bag*</div>
		 <div class="col-md-8 inp-field">
            	<select class="form-control" id="plasticbag-name" disabled onchange="getPlasticBagSize();">
            		<option>Plastic Bag</option>
            		<%-- <c:forEach items="${plasticBagList}" var="plasticBag">
            		<option>${plasticBag}</option>
            		</c:forEach> --%>
            	</select>
            </div>           
           </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Bag Size*</div>
            <div class="col-md-8 inp-field">
            	<select class="form-control" id="plasticbag-size" disabled onchange="getMfgProductName();">
            		<option>Bag Size</option>
            	</select>
            </div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Product Name*</div>
            <div class="col-md-8 inp-field">
            	<select class="form-control" name="" id="productmfg-name" disabled onchange="getProductSize();">
            		<option>Product Name</option>
            	</select>
            </div>
          </div>
          
          <div class="form-group">
            <div class="col-md-4 inp-field">Product Size*</div>
            <div class="col-md-5 inp-field">
            	<select class="form-control" id="productmfg-size" disabled onchange="getProductGage();">
            		<option>Product Size</option>      
            	</select>
            </div>
          	 <div class="col-md-3 inp-field">ml</div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Product Gage*</div>
            <div class="col-md-8 inp-field">
            	<select class="form-control" id="productmfg-gage" disabled onchange="getPackettingQty();">
            		<option>Product Gage</option>
            	</select>
            </div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Qty Per Packets*</div>
            <div class="col-md-5 inp-field"><input type="text" readonly class="form-control" id="qty-per-pkt"></div>
          	 <div class="col-md-3 inp-field">Pieces</div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">No. Of Packets*</div>
            <div class="col-md-5 inp-field"><input type="text" class="form-control" id="noofPkt-per-box" onkeyup="calBoxWeight()"></div>
          	 <div class="col-md-3 inp-field">Per Box</div>
          </div>
          
          <div class="form-group">
            <div class="col-md-4 inp-field">Total Weight*</div>
            <div class="col-md-5 inp-field"><input type="text" readonly class="form-control" id="box-weight"></div>
          	 <div class="col-md-3 inp-field">Kg/Box</div>
          </div>
          </div>
          
          <input type="hidden" id="productmfg-id">  
          <input type="hidden" id="sigle-pkt-wt">
           <input type="hidden" id="total-pkg-wt">
       	
       <div class="col-md-10"></div>
          <div class="col-md-2"><a href="javascript:void(0);" class="btn btn-success" onclick="return addProductToTable();" style="display:none;" id="savebutton">Update</a></div>
        <div class="col-md-12" style="margin-top:10px;border-top:2px solid #23133a;padding-bottom:10px;"></div>
         
          <div class="col-md-12" id="display-product" style="margin-top:20px;">
          	<table class="table table-striped">
          		<thead>
			<tr>
				<!-- <th>#</th>  -->
				<th>Plastic Bag</th>
				<th>Bag Size</th>
				<th>Product Name</th>
				<th>Size</th>
				<th>Gage</th>
				<th>Qty Per Packet</th>
				<th>No. Of Packets</th>
				<th>Total Weight</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			</thead>
				<tbody>	
					<c:forEach items="${boxingProducts}" var="boxingProduct" varStatus="i">
					<tr class='dynamic' class='info'><td style='display:none'class='sNo'>"+ i +"</td><td style='display:none'class='rawProductId'>${boxingProduct.productId}</td><td class='plasticBag'>${boxingProduct.plasticBag}</td><td class='bagSize'>${boxingProduct.bagSize}</td><td class='productName'>${boxingProduct.productName}</td><td class='productSize'>${boxingProduct.productSize}</td><td class='productGage'>${boxingProduct.productGage}</td><td class='qtyPerPkt'>${boxingProduct.qtyPerPkt}</td><td class='noOfPkts'>${boxingProduct.noOfPkts}</td><td class='boxWeight'>${boxingProduct.boxWeight}</td><td style='display:none 'class='avlPkgWeight'>${boxingProduct.avlPkgWeight}</td><td style='display:none' class='singlePktWt'>${boxingProduct.singlePktWt}</td><td><span class='editrow'><a class='fa fa-edit' href='javascript: void(0);' onclick='editProduct("+i+",this)'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href='javascript: void(0);' onclick='deleteProduct("+i+",this)'></a></span></td></tr>
					</c:forEach>
				</tbody>
		</table>
          </div>   
	
	<div class="col-md-12"><hr></div>	
	  
          <div class="col-md-6">
          <div class="form-group">
            <div class="col-md-4 inp-field">Box Name*</div>
            <div class="col-md-8 inp-field">
            	<select class="form-control" name="boxName"  id="box-name" onchange='getBoxSize();'>
            		<option>${boxingData.boxName}</option>
            		<c:forEach items="${boxList}" var="box">
            		<option>${box}</option>
            		</c:forEach>
            	</select>
            </div>
          </div>
          <input type="hidden" name="rawProductId" id="raw-product-id">
          <div class="form-group">
            <div class="col-md-4 inp-field">Box Size*</div>
            <div class="col-md-8 inp-field">
            	<select class="form-control" name="boxSize" id="box-size" onchange="getBoxAvlQty();">
            		<option>${boxingData.boxSize}</option>
            	</select>
            </div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Available Box Qty*</div>
            <div class="col-md-8 inp-field"><input type="text" id="box-avl-qty" readonly class="form-control" name="availableBoxQty" value="${boxingData.availableBoxQty}"></div>
          </div>
          <div class="col-md-12 inp-field"></div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Total Box*</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="createdBoxQty" id="total-box" placeholder="Total Box" onkeyup="calTotalWeight();" value="${boxingData.createdBoxQty}"></div>
          </div>
          <div class="form-group">
            <div class="col-md-4 inp-field">Total Weight*</div>
            <div class="col-md-8 inp-field"><input type="text" class="form-control" name="totalWeight" id="total-weight" placeholder="Total Weight" value="${boxingData.totalWeight}"></div>
      
          </div>
          </div>
          
	<div class="col-md-12"><hr></div>
        	<div class="col-md-12">
        		<div class="col-md-9"></div>
		<div class="col-md-3"><button class="btn" style="background-color:#23133a;color:#fff">Update Boxing Details</button></div>
          </div>
           </form> 
         </div>
        
         
<script>

var i=0;
currentRow = null;
var productList=[];
var sno;
var j;
/* function updateProduct(){
	
	var bool = $("#savebutton").text() == "Update";
	if(bool){
		updateProductToTable();
	}
	else{
		addProductToTable();
	}
} */
 	
 	
function addProductToTable(){
	var productId=$("#productmfg-id").val();
	var plasticBag=$("#plasticbag-name").val();
	var bagSize=$("#plasticbag-size").val();
    var productName=$("#productmfg-name").val();
    var productSize=$("#productmfg-size").val();
    var productGage=$("#productmfg-gage").val();
    var qtyPerPkt=$("#qty-per-pkt").val();
    var noOfPkts=$("#noofPkt-per-box").val();
    var boxWeight=$("#box-weight").val();
    var avlPkgWeight=$("#total-pkg-wt").val();
    var singlePktWt=$("#sigle-pkt-wt").val();
 	if($("#savebutton").text() == "Update")	{
 		productList.splice(j,1);
		productList.push({
			productId: productId,
			plasticBag: plasticBag,
			bagSize: bagSize,
			productName: productName,
			productSize: productSize,
			productGage: productGage,
			qtyPerPkt: qtyPerPkt,
			noOfPkts : noOfPkts,
			boxWeight : boxWeight,
			avlPkgWeight: avlPkgWeight,
			singlePktWt: singlePktWt
	  	});
		var new_row = "<tr class='dynamic' class='info'><td style='display:none' class='sNo'>"+ i +"</td><td style='display:none' class=''>"+ productId +"</td><td class='plasticBag'>" + plasticBag + "</td><td class='bagSize'>" + bagSize + "</td><td class='productName'>" + productName + "</td><td class='productSize'>" + productSize + "</td><td class='productGage'>" + productGage + "</td><td class='qtyPerPkt'>" + qtyPerPkt + "</td><td class='noOfPkts'>" + noOfPkts + "</td><td class='boxWeight'>" + boxWeight + "</td><td style='display:none' class='avlPkgWeight'>"+ avlPkgWeight +"</td><td style='display:none' class='singlePktWt'>"+ singlePktWt +"</td><td><span class='editrow'><a class='fa fa-edit' href='javascript: void(0);' onclick='editProduct("+i+",this)'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href='javascript: void(0);' onclick='deleteProduct("+i+",this)'></a></span></td></tr>";
		 $("table tbody").find($(currentRow)).replaceWith(new_row);
	     currentRow = null;
	     $("#savebutton").hide();
	     calTotalWeight();
 	}
 	else{
 		productList.push({
			productId: productId,
			plasticBag: plasticBag,
			bagSize: bagSize,
			productName: productName,
			productSize: productSize,
			productGage: productGage,
			qtyPerPkt: qtyPerPkt,
			noOfPkts : noOfPkts,
			boxWeight : boxWeight,
			avlPkgWeight: avlPkgWeight,
			singlePktWt: singlePktWt
	  	});
 		var new_row="";
 	     for(i=0; i<productList.length; i++){
 	    	
 	   	new_row += "<tr class='dynamic' class='info'><td style='display:none'class='sNo'>"+ i +"</td><td style='display:none'class=''>"+ productList[i].productId +"</td><td class='plasticBag'>" + productList[i].plasticBag + "</td><td class='bagSize'>" + productList[i].bagSize + "</td><td class='productName'>" + productList[i].productName + "</td><td class='productSize'>" + productList[i].productSize + "</td><td class='productGage'>" + productList[i].productGage + "</td><td class='qtyPerPkt'>" + productList[i].qtyPerPkt + "</td><td class='noOfPkts'>" + productList[i].noOfPkts + "</td><td class='boxWeight'>" + productList[i].boxWeight + "</td><td style='display:none'class='avlPkgWeight'>"+ productList[i].avlPkgWeight +"</td><td style='display:none 'class='singlePktWt'>"+ productList[i].singlePktWt +"</td><td><span class='editrow'><a class='fa fa-edit' href='javascript: void(0);' onclick='editProduct("+i+",this)'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href='javascript: void(0);' onclick='deleteProduct("+i+",this)'></a></span></td></tr>";
 	    	$("table tbody").html(new_row);
 	    	
 	    } 
 	    calTotalWeight();
 	}
  
 	
    /* var new_row="";
     for(i=0; i<productList.length; i++){
    	
   	new_row += "<tr class='dynamic' class='info'><td style='display:none'class='sNo'>"+ i +"</td><td style='display:none'class=''>"+ productList[i].productId +"</td><td class='plasticBag'>" + productList[i].plasticBag + "</td><td class='bagSize'>" + productList[i].bagSize + "</td><td class='productName'>" + productList[i].productName + "</td><td class='productSize'>" + productList[i].productSize + "</td><td class='productGage'>" + productList[i].productGage + "</td><td class='qtyPerPkt'>" + productList[i].qtyPerPkt + "</td><td class='noOfPkts'>" + productList[i].noOfPkts + "</td><td class='boxWeight'>" + productList[i].boxWeight + "</td><td style='display:none'class='avlPkgWeight'>"+ productList[i].avlPkgWeight +"</td><td><span class='editrow'><a class='fa fa-edit' href='javascript: void(0);' onclick='editProduct("+i+",this)'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href='javascript: void(0);' onclick='deleteProduct("+i+",this)'></a></span></td></tr>";
    	$("table tbody").html(new_row);
    }  */
     $("#plasticbag-name").val('Select Plastic Bag');
	 $("#plasticbag-size").val('Select Plastic Bag Size');
	 $("#productmfg-name").val('Select Product Name');   
	 $("#productmfg-size").val('Select Product Size');
	 $("#productmfg-gage").val('Select Product Gage');
	 $("#qty-per-pkt").val('');
	 $("#noofPkt-per-box").val('');
	 $("#box-weight").val('');
	    
} 	
 	
 /* function updateProductToTable(){
	    var productId=$("#productmfg-id").val();
	    var plasticBag=$("#plasticbag-name").val();
		var bagSize=$("#plasticbag-size").val();
	    var productName=$("#productmfg-name").val();
	    var productSize=$("#productmfg-size").val();
	    var productGage=$("#productmfg-gage").val();
	    var qtyPerPkt=$("#qty-per-pkt").val();
	    var noOfPkts=$("#noofPkt-per-box").val();
	    var boxWeight=$("#box-weight").val();
	    var avlPkgWeight=$("#total-pkg-wt").val();
    
 	if(currentRow){
 		productList.push({
 			productId: productId,
 			plasticBag: plasticBag,
 			bagSize: bagSize,
 			productName: productName,
 			productSize: productSize,
 			productGage: productGage,
 			qtyPerPkt: qtyPerPkt,
 			noOfPkts : noOfPkts,
 			boxWeight : boxWeight,
 			avlPkgWeight: avlPkgWeight
 	  	});
   	
  
 		productList.splice(j,1);
 	   	var new_row = "<tr class='dynamic' class='info'><td style='display:none' class='sNo'>"+ i +"</td><td style='display:none' class=''>"+ productId +"</td><td class='plasticBag'>" + plasticBag + "</td><td class='bagSize'>" + bagSize + "</td><td class='productName'>" + productName + "</td><td class='productSize'>" + productSize + "</td><td class='productGage'>" + productGage + "</td><td class='qtyPerPkt'>" + qtyPerPkt + "</td><td class='noOfPkts'>" + noOfPkts + "</td><td class='boxWeight'>" + boxWeight + "</td><td style='display:none' class='avlPkgWeight'>"+ avlPkgWeight +"</td><td><span class='editrow'><a class='fa fa-edit' href='javascript: void(0);' onclick='editProduct("+i+",this)'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href='javascript: void(0);' onclick='deleteProduct("+i+",this)'></a></span></td></tr>";
		
   	   $("table tbody").find($(currentRow)).replaceWith(new_row);
        currentRow = null;
        
	     $("#savebutton").text('Add To List');
	     $("#plasticbag-name").val('Select Plastic Bag');
	   	 $("#plasticbag-size").val('Select Plastic Bag Size');
	   	 $("#productmfg-name").val('Select Product Name');   
	   	 $("#productmfg-size").val('Select Product Size');
	   	 $("#productmfg-gage").val('Select Product Gage');
	   	 $("#qty-per-pkt").val('');
	   	 $("#noofPkt-per-box").val('');
	   	 $("#box-weight").val('');
    }
   
} 	  */
 	
function deleteProduct(index,cr){	 
	//j = $(this).closest('tr').find('td.sNo').text();
	$(cr).parents('tr').remove();
	//j=index;
    productList.splice(index,1);
    calTotalWeight();
 } 
 
function editProduct(index,cr){
	currentRow= $(cr).parents('tr');  
	j = index;
    
	var plasticbag = $(cr).closest('tr').find('td.plasticBag').text();
    var pbOption = '<option>'+plasticbag+'</option>';
    $("#plasticbag-name").html(pbOption);
    var plasticbagsize = $(cr).closest('tr').find('td.bagSize').text();
    var pbSizeOption = '<option>'+plasticbagsize+'</option>';
	$("#plasticbag-size").html(pbSizeOption);
	var productName = $(cr).closest('tr').find('td.productName').text();
    var productNameOption = '<option>'+productName+'</option>';
	$("#productmfg-name").html(productNameOption);
	var productSize = $(cr).closest('tr').find('td.productSize').text();
    var productSizeOption = '<option>'+productSize+'</option>';
	$("#productmfg-size").html(productSizeOption);
	var productGage = $(cr).closest('tr').find('td.productGage').text();
    var productGageOption = '<option>'+productGage+'</option>';
	$("#productmfg-gage").html(productGageOption);
	$("#qty-per-pkt").val($(cr).closest('tr').find('td.qtyPerPkt').text());
	$("#noofPkt-per-box").val($(cr).closest('tr').find('td.noOfPkts').text());
	$("#box-weight").val($(cr).closest('tr').find('td.boxWeight').text());
	$("#sigle-pkt-wt").val($(cr).closest('tr').find('td.singlePktWt').text());
	$("#savebutton").show();
	$("#savebutton").text('Update');

}
/* Submit Packaging form */
 
 $.fn.serializeObject = function()
{
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
} 

$(document).ready(function(){

	var boxingForm = $("#boxing-form");
	boxingForm.submit(function(e){
		e.preventDefault(); 
	
    var jsonObj = [];
    i=0;
$("tbody tr.dynamic").each(function(){

    var td = $(this).find('td');
    var productId=td.eq(1).text();
    var plasticBag=td.eq(2).text();
    var bagSize=td.eq(3).text();
    var productName=td.eq(4).text();
    var productSize=td.eq(5).text();
    var productGage=td.eq(6).text();
    var qtyPerPkt=td.eq(7).text();
    var noOfPkts=td.eq(8).text();
    var boxWeight=td.eq(9).text();
    var avlPkgWeight=td.eq(10).text();
    var singlePktWt=td.eq(11).text();
    /* if(scrapUsedQty==""){
    	scrapUsedQty=0.0;
    } */
   
    jsonObj.push({
    	productId: productId,
    	plasticBag: plasticBag,
		bagSize: bagSize,
		productName: productName,
		productSize: productSize,
		productGage: productGage,
		qtyPerPkt: qtyPerPkt,
		noOfPkts : noOfPkts,
		boxWeight : boxWeight,
		avlPkgWeight: avlPkgWeight,
		singlePktWt: singlePktWt
    });
    i++
});

var productData = JSON.stringify(jsonObj);
var boxingData = JSON.stringify($('form').serializeObject());

console.log(productData);
console.log(boxingData);
     $.ajax({
     type: "POST",
     url: "update-bxing-details", 
     
      data:{
    	  boxingData: boxingData, 
    	  productData: productData
      }, 
   	 
     success: function(response){
    	 if(response){
         	alert("Successfully Updated !!");
         	window.location	= "add-boxing-details";   
         }
      }
    });   
 
	 });

}); 

function getBoxSize(){
	var boxName = $("#box-name").val();
	$.ajax({
			type: 'GET',
			url: 'get-box-size?boxName='+boxName+'',
			dataType: 'json', 
			
			success: function(data){
			var options = "";
			options += '<option disabled selected>Select Plastic Bag Size</option>'
			$('#box-size').html('');
			 for(var i=0; i<data.length; i++){ 
				options +=  '<option>'+data[i]+'</option>';
			 } 
			$('#box-size').append(options);
			},
			error: function(){
				alert("something is wrong");
			}
	});
}

function getBoxAvlQty(){
	var boxName = $("#box-name").val();
	var boxSize = $("#box-size").val();
	$.ajax({
			type: 'GET',
			url: 'get-box-avlqty?boxName='+boxName+'&boxSize='+boxSize+'',
			dataType: 'json', 
			
			success: function(data){
				$('#raw-product-id').val(data[0]);
				$('#box-avl-qty').val(data[1]);
			},
			error: function(){
				alert("something is wrong");
			}
	});
}

function calBoxWeight(){
	var singlePktWt = parseFloat($('#sigle-pkt-wt').val());
	var noOfPktPerBox = parseInt($('#noofPkt-per-box').val());
	
	if(isNaN(singlePktWt)){
		singlePktWt=0;
	}
	if(isNaN(noOfPktPerBox)){
		noOfPktPerBox=0;
	}
	
	
	var singlePktWtKg = singlePktWt/1000;
	var boxWeight = noOfPktPerBox*singlePktWtKg;;
	$('#box-weight').val(boxWeight);
}

function calTotalWeight(){
var totalBox = parseFloat($('#total-box').val());
	
	if(isNaN(totalBox)){
		totalBox=0;
	}
	
	var singleBoxWt = 0;
	for(var i=0; i<productList.length; i++){
		singleBoxWt += parseFloat(productList[i].boxWeight);
	}
	var totalWeight = totalBox*singleBoxWt;
	
	$('#total-weight').val(totalWeight);
	return totalWeight;
}


function getPlasticBagSize(){
	var plasticBagName = $("#plasticbag-name").val();
	$.ajax({
			type: 'GET',
			url: 'get-plasticbag-size?plasticBagName='+plasticBagName+'',
			dataType: 'json', 
			
			success: function(data){
			var options = "";
			options += '<option disabled selected>Select Plastic Bag Size</option>'
			$('#plasticbag-size').html('');
			 for(var i=0; i<data.length; i++){ 
				options +=  '<option>'+data[i]+'</option>';
			 } 
			$('#plasticbag-size').append(options);
			},
			error: function(){
				alert("something is wrong");
			}
	});
}


function getPlasticBagId(){
	var plasticBagName = $("#plasticbag-name").val();
	var plasticBagSize = $("#plasticbag-size").val();
	$.ajax({
			type: 'GET',
			url: 'get-plasticbag-id?plasticBagName='+plasticBagName+'&plasticBagSize='+plasticBagSize+'',
			dataType: 'json', 
			
			success: function(data){
				$('#plasticbag-id').val(data);
				//getMfgProductName();
			},
			error: function(){
				alert("something is wrong");
			}
	});
}



function getMfgProductName(){
	
	//var plasticBagId = $('#plasticbag-id').val();
	
	var plasticBagName = $("#plasticbag-name").val();
	var plasticBagSize = $("#plasticbag-size").val();
	$.ajax({
			type: 'GET',
			//url: 'get-productmfgpkg-name?plasticBagName='+plasticBagName+'&plasticBagSize='+plasticBagSize+'',
			url: 'get-productmfgpkg-name?plasticBagName='+plasticBagName+'&plasticBagSize='+plasticBagSize+'',
			dataType: 'json', 
			
			success: function(data){
				var options = "";
				options += '<option disabled selected>Select Product Name</option>'
				$('#productmfg-name').html('');
				 for(var i=0; i<data.length; i++){ 
					options +=  '<option>'+data[i]+'</option>';
				 } 
				$('#productmfg-name').append(options);
			},
			error: function(){
				alert("something is wrong");
			}
	});
}


function getProductSize(){
	//var plasticBagId = $('#plasticbag-id').val();
	var plasticBagName = $("#plasticbag-name").val();
	var plasticBagSize = $("#plasticbag-size").val();
	var productmfgName = $("#productmfg-name").val();
	
	$.ajax({
			type: 'GET',
			url: 'get-productmfgpkg-size?productmfgName='+productmfgName+'&plasticBagName='+plasticBagName+'&plasticBagSize='+plasticBagSize+'',
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
	var plasticBagName = $("#plasticbag-name").val();
	var plasticBagSize = $("#plasticbag-size").val();
	var productmfgName = $("#productmfg-name").val();
	var productmfgSize = $("#productmfg-size").val();
	$.ajax({
			type: 'GET',
			url: 'get-productmfgpkg-gage?productmfgName='+productmfgName+'&productmfgSize='+productmfgSize+'&plasticBagName='+plasticBagName+'&plasticBagSize='+plasticBagSize+'',
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

function getPackettingQty(){
	//var plasticBagId = $('#plasticbag-id').val();
	var plasticBagName = $("#plasticbag-name").val();
	var plasticBagSize = $("#plasticbag-size").val();
	var productmfgName = $("#productmfg-name").val();
	var productmfgSize = $("#productmfg-size").val();
	var productmfgGage = $("#productmfg-gage").val();
	$.ajax({
			type: 'GET',
			url: 'get-productpkg-qty?productmfgName='+productmfgName+'&productmfgSize='+productmfgSize+'&productmfgGage='+productmfgGage+'&plasticBagName='+plasticBagName+'&plasticBagSize='+plasticBagSize+'',
			dataType: 'json', 
			
			success: function(data){
			$('#productmfg-id').val(data[0]);
			//$('#noofPkt-per-box').val(data[0]);
			$('#total-pkg-wt').val(data[1]);
			$('#sigle-pkt-wt').val(data[2]);
			$('#qty-per-pkt').val(data[3]);
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



</script>
 </body>
</html>
