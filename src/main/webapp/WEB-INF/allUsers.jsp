<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

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
  	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/contact/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/contact/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/contact/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/contact/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/contact/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/contact/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/contact/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/contact/css/util.css">
	<link rel="stylesheet" type="text/css" href="/contact/css/main.css">
<!--===============================================================================================-->    
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
.wrap-contact100 {
	padding: 50px 0px 571px 0px;
}

.portfolio-item {
  margin-bottom: 30px;
}

.pagination {
  margin-bottom: 30px;
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
    <div class="container-contact100">
    <div class="wrap-contact100">
			<form:form action="/users" class="contact100-form validate-form" method="get">
				<span class="contact100-form-title">
				</span>

				<div class="wrap-input100 validate-input" data-validate="You must enter a username">
					<input class="input100" type="text" name="q" placeholder="Search Username">
					<span class="focus-input100"></span>
				</div>
								<div class="container-contact100-form-btn">
					<button class="contact100-form-btn">
						<span>
							<i class="fa m-r-6" aria-hidden="true"></i>
							Search
						</span>
					</button>
				</div>
			</form:form>
			<% if (request.getParameter("q") !=null){ %>
			<h5>Search Results:</h5>
				<a href="/users/${usersId}"><c:out value="${users}"></c:out></a>
					<c:if test="${usersId == null}">
						<p>Could not find a user by that name!</p>
					</c:if>
					<% } else { %>
					<h5>All Users</h5>
    	<c:forEach items="${users}" var="user">
    	
			<a href="/users/${user.id}"><p><c:out value="${user.userName}"/></p></a>
		</c:forEach>
			<% } %>

		</div>

		</div>
    
	
      </div>

      <!-- Page Heading -->

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


  </body>

</body>
</html>