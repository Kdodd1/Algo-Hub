<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/4-col-portfolio.css" rel="stylesheet">
    
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
   <link rel="stylesheet" type="text/css" href="/contact/fonts/font-awesome-4.7.0/css/font-awesome.min.css"> 
  	<link rel="stylesheet" type="text/css" href="/contact/css/util.css">
	<link rel="stylesheet" type="text/css" href="/contact/css/main.css">
  <style type="text/css">
  body {
  padding-top: 54px;
}

@media (min-width: 992px) {
  body {
    padding-top: 56px;
  }
}
a{
color: #4F8DC2;
}
p{

color: #4F8DC2;

}
.nav-tabs>li{
    float: none;
}
.nav-tabs{
    border-bottom: 0;
}
.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover{
    margin: 0;
    border-radius: 0;
}
#wrapper {
    padding-left: 0;
    -webkit-transition: all 0.5s ease;
    -moz-transition: all 0.5s ease;
    -o-transition: all 0.5s ease;
    transition: all 0.5s ease;
}

#wrapper.toggled {
    padding-left: 250px;
}

#sidebar-wrapper {
    z-index: 1000;
    position: fixed;
    left: 250px;
    width: 0;
    height: 100%;
    margin-left: -250px;
    overflow-y: auto;
    background: #000;
    -webkit-transition: all 0.5s ease;
    -moz-transition: all 0.5s ease;
    -o-transition: all 0.5s ease;
    transition: all 0.5s ease;
}

#wrapper.toggled #sidebar-wrapper {
    width: 250px;
}

#page-content-wrapper {
    width: 100%;
    position: absolute;
    padding: 15px;
}

#wrapper.toggled #page-content-wrapper {
    position: absolute;
    margin-right: -250px;
}

/* Sidebar Styles */

.sidebar-nav {
    position: absolute;
    top: 0;
    width: 250px;
    margin: 0;
    padding: 0;
    list-style: none;
}

.sidebar-nav li {
    text-indent: 20px;
    line-height: 40px;
}

.sidebar-nav li a {
    display: block;
    text-decoration: none;
    color: #999999;
    width: 250px;
}

.sidebar-nav li a:hover {
    text-decoration: none;
    color: #fff;
    background: rgba(255,255,255,0.2);
}

.sidebar-nav li a:active,
.sidebar-nav li a:focus {
    text-decoration: none;
}

.sidebar-nav > .sidebar-brand {
    height: 65px;
    font-size: 18px;
    line-height: 60px;
}

.sidebar-nav > .sidebar-brand a {
    color: #999999;
}

.sidebar-nav > .sidebar-brand a:hover {
    color: #fff;
    background: none;
}

@media(min-width:768px) {
    #wrapper {
        padding-left: 250px;
    }

    #wrapper.toggled {
        padding-left: 0;
    }

    #sidebar-wrapper {
        width: 250px;
    }

    #wrapper.toggled #sidebar-wrapper {
        width: 0;
    }

    #page-content-wrapper {
        padding: 20px;
        position: relative;
    }

    #wrapper.toggled #page-content-wrapper {
        position: relative;
        margin-right: 0;
    }
    .col-sm {
    	display: inline-block;
    	width: 40%;
    	vertical-align:top;
    }
    h5{
    padding-top: 10px;
    }
    .btn{
    color: white;
    background: #827FFE;
    }
}
  
  </style>
<title>My Algorithms</title>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#">Algo-Hub</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="/myalgos">My Algorithms</a>
               <span class="sr-only">(current)</span>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/createAlgo">Add Algorithm</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/">Articles
               
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/users">Users</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/about">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/logout">Logout</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- Page Content -->
    <div class="container2">
    <div id="wrapper">
        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav nav nav-tabs" id="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#main">
                        Overview
                    </a>
                </li>
                <li class="active">
                    <a href="#dashboard">Programming Languages</a>
                </li>
               <c:forEach items="${languages}" var ="language">
                <li>
                    <a href="#<c:out value="${language.id}"/>"><c:out value="${language.name}"/> </a>
                </li>
                </c:forEach>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->
        <!-- Page Content -->
        <div class="tab-content">
        <div class="tab-pane active" id="main">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <c:if test= "${user.id == 1}">
                       	<p><a href="/languages/new">Add New Language</a> | <a href="/articles/create">Add Article</a> </p>
                       	</c:if>
                       <div class="col-sm">
                     	<h1>All my Algorithms</h1>
                       	<hr>
                   		<c:forEach items="${algos}" var="algo">
       						<a href="/myalgos/${algo.id }"> <p> <c:out value="${algo.title}"/> - <c:out value="${algo.language.name}"/> </p> </a>
						</c:forEach>
						<hr>
						<a href="#menu-toggle" class="btn" id="menu-toggle">Sidebar Toggle</a>
                       </div>
                       	<div class="col-sm">
                       		<h1>Overview</h1>
                       		<hr>
                       		<h5>Total Algorithm Count: <c:out value="${algos.size()}"></c:out></h5>
                       		<c:forEach items="${languages}" var ="language">
                       		<c:set var="count" value="0" scope="page"/>
                       		<c:forEach items="${algos}" var ="algo">
                       			<c:if test = "${algo.language.id == language.id}">
       								<c:set var = "count" value="${count + 1 }" scope="page"/>
      							</c:if>  
                       		</c:forEach>
                       			<h5><c:out value="${language.name }"/> Algorithm count: <c:out value="${count}"/> </h5>
                       		</c:forEach><h5>Following: <c:out value="${usersFollowed.size()}"/></h5>
                       		<h5>Followed By: <c:out value="${usersFollowing.size()}"/></h5>
                       		<fmt:formatDate value="${user.createdAt}" pattern="MMMM / dd / yyyy" var="userDate"/>
                       		<h5>Member Since: <c:out value="${userDate}"/></h5>
                       		<hr>
                       	  	<h1>Following</h1>
                       		<hr>
                       		<c:forEach items="${usersFollowed}" var="followed">
                       			<a href="/users/${followed.id}"><p><c:out value="${followed.userName}"/></p></a>
                       		</c:forEach>
                       		<hr>
                       	  	<h1>Followed By</h1>
                       		<hr>
                       		<c:forEach items="${usersFollowing}" var="following">
                       			<a href="/users/${following.id}"><p><c:out value="${following.userName}"/></p></a>
                       		</c:forEach>
                       		<hr>
                       		
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
		<c:forEach items="${languages}" var ="language">
        <div class="tab-pane" id="<c:out value="${language.id}"/>">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1><c:out value="${language.name}"/></h1>
                        <hr>
                       <c:forEach items="${algos}" var="algo">
				      <c:if test = "${algo.language.id == language.id}">
       				<a href="/myalgos/${algo.id }"> <p> <c:out value="${algo.title}"/></p> </a>
      				</c:if>  
				</c:forEach>
                    </div>
                </div>
            </div>
        </div>
        </c:forEach>
	</div>
	
    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="http://code.jquery.com/jquery-2.2.0.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
   <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    $('#sidebar-nav a').click(function (e) {
  		e.preventDefault()
  		$(this).tab('show')
	})
    </script>

</body>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
      <!-- Page Heading -->

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</body>
</html>