<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<!-- Trigger/Open The Modal -->
<!--  <button id="myBtn">Open Modal</button>  -->

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <p id="msg"></p>
    <br>
    	<center> <button class="btn btn-success ok" id="ok"></button>  </center>
  </div>

</div>

<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
//var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];
var span2 = document.getElementsByClassName("ok")[0];

// When the user clicks the button, open the modal 
/*  btn.onclick = function() {
    modal.style.display = "block";
}  */

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

span2.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

<style>
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 30%;
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
</style>


<div class="footer ">
	<div class="container">
    	<div class="col-md-2 col-sm-4 col-xs-6 footer-link">
        	<h3>Home</h3>
            <ul>
            	<li><a href="collections">Collection </a></li>
                <li><a href="featureProducts">Features</a></li>
                <li><a href="products">Jewelry</a></li>
                <li><a href="video">Video</a></li>
            </ul>
        </div>
        <div class="col-md-2 col-sm-4 col-xs-6 footer-link">
        	<h3>Collections</h3>
            <ul>
            	 <c:forEach items="${collectionList}" var="collection" begin="0" end="3">
            	<li><a href="collection?collectionName=${collection.collectioName}" style="text-transform: capitalize">${fn:toLowerCase(collection.collectioName)}</a></li>
                </c:forEach> 
            </ul>
        </div>
        <div class="col-md-2 col-sm-4 col-xs-6 footer-link">
        	<h3>Jewelry</h3>
            <ul>
            	<c:forEach items="${categoriesList}" var="cat" begin="0" end="3">
            		<li><a href="category?pc=${cat.category}" style="text-transform:capitalize">${fn:toLowerCase(cat.category)}</a></li>
               	</c:forEach>
            	<!-- <li><a href="rings">Rings</a></li>
                <li><a href="earings">Earrings</a></li>
                <li><a href="neckless">Neckless</a></li>
                <li><a href="bracelets">Bracelets</a></li> -->
            </ul>
        </div>
        <div class="col-md-2 col-sm-4 col-xs-6 footer-link">
        	<h3>Our Story</h3>
            <ul>
            	<li><a href="ourStory">Origin</a></li>
                <li><a href="ourStory">Philosophy</a></li>
            </ul>
        </div>
        <div class="col-md-2 col-sm-4 col-xs-6 footer-link">
        	<h3>Contact</h3>
            <ul>
            	<li><a href="contact">Contacts</a></li>
                <li><a href="contact">Location</a></li>
            </ul>
        </div>
        <div class="col-md-2 col-sm-4 col-xs-6 footer-link">
        	<h3>Sign-up/ Sign-in</h3>
            <ul>
            	<!-- <li><a href="#">Latest</a></li>
                <li><a href="#">Lookbook</a></li> -->
                <li><a href="video">Videos</a></li>
                <li><a href="#">Gallery</a></li>
            </ul>
        </div>
        <div class="clearfix"></div>
        <div class="footer-bot">
        	<a href="home"><img src="images/footer_logo.png" alt="logo" /></a>
            <p>©2017 Amazing Jewelry UAE. All rights reserved | Design By <a href="http://inforises.com/" style="color:#fff">Inforises Technologies</a></p>
        </div>
    </div>
</div>