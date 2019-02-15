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
  	<link rel="stylesheet" type="text/css" href="/contact/css/utilForm.css">
	<link rel="stylesheet" type="text/css" href="/contact/css/mainForm.css">
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
              <span class="sr-only">(current)</span>
              <a class="nav-link" href="/myalgos">My Algorithms</a>
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
    <div class="container background">
    
    <h1><c:out value="${algo.title}"/></h1>
     <h1><c:out value="${algo.language.name}"/></h1>
     	<c:choose>
     		<c:when test="${algo.updatedAt == null }">
     		 <fmt:formatDate value="${algo.createdAt}" pattern="MMMM / dd / yyyy" var="algoDate"/>
     		<h4>Created On: <c:out value="${algoDate}"/> </h4>
     		</c:when>
     		<c:otherwise>
     		<fmt:formatDate value="${algo.updatedAt}" pattern="MMMM / dd / yyyy" var="algoUpdate"/>
     		<h4>Updated On: <c:out value="${algoUpdate}"/> </h4>
     		</c:otherwise>
     	</c:choose>
     <hr>
     <c:if test = "${user.id != algo.user.id}">		
     <h3>By <c:out value="${algo.user.userName}"/></h3>
	 </c:if>
     <pre class="prettyprint"> <c:out value="${algo.algorithm}"/> </pre>
     <c:if test = "${user.id == algo.user.id}">				
     	<a href="/edit/${algo.id}">Edit Algorithm</a>  
     	</c:if>  
      
	<form:form action="/comments/create" method="post" modelAttribute="comment">
		<div class="wrap-input100 validate-input">
		<textarea id="message" class="input100" name="content" placeholder="Your comments..."></textarea>
		<span class="focus-input100"></span>
		<label class="label-input100 rs1" for="message">
		<span class="lnr lnr-bubble"></span>
		</label>
		</div>
		<form:hidden path="algorithm" value="${algo.id}"/>
		<form:hidden path="user" value="${user.id}"/>
		<input class="contact100-form-btn" type="submit" value="Submit"/>
	</form:form>	
   		
     	<c:forEach items="${comments}" var="comment">
     	<hr>
     	<p><c:out value="${comment.user.userName}"/> said:</p>
    	<p><c:out value="${comment.content}"/></p>
    	 <c:if test="${user.id == comment.user.id || user.id == 1 }">
	    <form action="/comments/${comment.id}" method="post">
			<input type="hidden" name="_method" value="delete">
			<input type="submit" value="Delete" class="btn btn-danger">
		</form>	
		</c:if>
		</c:forEach>
    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</div>
  </body>

</body>
</html>