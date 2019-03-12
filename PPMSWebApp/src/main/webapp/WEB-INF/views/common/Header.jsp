<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header class="header fixed-top clearfix">
<!--logo start-->
<div class="brand">
    <a href="index.html" class="logo">
       <%-- <img alt="avatar" src="<%=request.getContextPath()%>/images/school-logo2.png" height="75px" style="padding-left:60px;"> --%>
    	<strong>PPMSErp</strong>
    </a>
    <div class="sidebar-toggle-box">
        <div class="fa fa-bars"></div>
    </div>
</div>
<!--logo end-->

 <div class="top-nav clearfix">
 
    <!--search & user info start-->
    <ul class="nav pull-right top-menu">
        <li>
            <!-- <input type="text" class="form-control search" placeholder=" Search"> -->
           <%--  <strong>Session: ${userData.branchPojo.sessionYear}</strong> --%>
        </li>
        <!-- user login dropdown start-->
        <li class="dropdown">
        <c:if test="${not empty user}">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
            
                <img alt="" src="<%=request.getContextPath()%>/images/mypic.jpg">
                
                <span class="username">${user.name}</span>
                <b class="caret"></b>
            </a>
            </c:if>
            <ul class="dropdown-menu extended logout">
                <li><a href="#"><i class=" fa fa-suitcase"></i>Profile</a></li>
                <li><a href="#"><i class="fa fa-cog"></i> Settings</a></li>
                <li><a href="logout"><i class="fa fa-key"></i> Log Out</a></li>
            </ul>
        </li>
        <!-- user login dropdown end -->
       
    </ul>
    <div style="color:#23133a;"><h2><center>Polymer Plant Management System</center></h2></div>
    <!--search & user info end-->
    <%-- <% UserPojo user =  (UserPojo)request.getSession().getAttribute("user");
    	String userType = user.getUserType();
    	if(userType.equals("branchadmin")){%>
    		 <div><h2>${userData.branchPojo.branchName} ${userData.branchPojo.branchLocation}</h2></div>
    	<% }
    	else if(userType.equals("admin")){%>
    		<div><h2>${branchData.branchName} ${branchData.branchLocation}</h32></div>
    	<%}
     %> --%>
   
</div>

</header>
<!--header end-->
