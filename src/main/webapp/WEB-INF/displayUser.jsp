<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <!-- Bootstrap core CSS -->
      <link rel="stylesheet" type="text/css" href="/contact/fonts/font-awesome-4.7.0/css/font-awesome.min.css"> 
  	<link rel="stylesheet" type="text/css" href="/contact/css/util.css">
	<link rel="stylesheet" type="text/css" href="/contact/css/main.css">
       <link rel="stylesheet" type="text/css" href="/contact/fonts/font-awesome-4.7.0/css/font-awesome.min.css"> 
  	<link rel="stylesheet" type="text/css" href="/contact/css/util.css">
	<link rel="stylesheet" type="text/css" href="/contact/css/main.css">
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js"></script>
    <!-- Custom styles for this template -->
    <link href="css/4-col-portfolio.css" rel="stylesheet">
     <!-- bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  
  <!-- codemirror -->

  <style type="text/css">
  body {
  padding-top: 54px;
}

@media (min-width: 992px) {
  body {
    padding-top: 56px;
  }
}

.portfolio-item {
  margin-bottom: 30px;
}

.pagination {
  margin-bottom: 30px;
}
    .col-sm {
    	display: inline-block;
    	width: 40%;
    	vertical-align:top;
    }
    form{
    display: inline-block;
    }
  
  </style>
<title><c:out value="${user.userName}"/>'s Profile</title>
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
            <li class="nav-item">
              <a class="nav-link" href="/myalgos">My Algorithms</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/createAlgo">Add Algorithm</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/">Articles
               
              </a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="/users">Users</a>
               <span class="sr-only">(current)</span>
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
    <div class="container background">
     <c:if test = "${user.id != loggedUser.id}">		
     	<h1>
     		<c:out value="${user.userName}"/>'s Profile 
	     	<c:if test="${not check}">
			 	<form action="/followUser" method="POST">
			 	<input type="hidden" name="userId" value="${user.id}">
			 	<input type="hidden" name="loggedUser" value="${loggedUser.id}">
					<input type="submit" value="+Follow" class="btn btn-primary">
				</form>
				</c:if>
				<c:if test="${check}">
			 	<form action="/unfollowUser" method="POST">
			 	<input type="hidden" name="userId" value="${user.id}">
			 	<input type="hidden" name="loggedUser" value="${loggedUser.id}">
					<input type="submit" value="Unfollow" class="btn btn-danger">
				</form>
			</c:if>
     	</h1>
	</c:if>
	 <c:if test = "${user.id == loggedUser.id}">		
     	<h1>My Profile</h1>
	 </c:if>
    <hr>
    <div class="col-sm">
    <h2>All <c:out value="${user.userName}"/>'s Algorithms</h2>
    <hr>
    <c:forEach items="${algos}" var="algo">
			<a href="/myalgos/${algo.id}"><p><c:out value="${algo.title}"/> - <c:out value="${algo.language.name}"/> </p></a>
	</c:forEach>
	</div>
	<div class="col-sm">
	<h2><c:out value="${user.userName }"/>'s Overview</h2>
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
         </c:forEach>
              <h5>Following: <c:out value="${usersFollowed.size()}"/></h5>
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

      <!-- Page Heading -->

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


  </body>

</body>
</html>