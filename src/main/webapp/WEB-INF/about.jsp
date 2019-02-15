<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
  .portfolio-item{
  display: block;
  }
}

.portfolio-item {
  margin-top: 30px;
  margin-bottom: 30px;
  margin-left: 4%;
  margin-right: 4%;
}

.pagination {
  margin-bottom: 30px;
}
a{
color: black;
}
.textHeader{
text-align: center;
color: #827ffe;
}
.background{
background-color: #f2f2f2
}
.header{
	margin-top: 30px;
	margin-bottom: 30px;
}
span {
  content: "\00BB";
  color: #827ffe;
}
.about1{
	margin-top: 30px;
}
.about{
	text-align: center;
}
.register{
	color: #827ffe;
}
.quotes {
    padding: 15px 0;
    font-size: 16px;
    color: #757c81;
    line-height: 30px;
    letter-spacing: 0.01em;
}
  
  </style>
<title>Algorithms</title>
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
            <li class="nav-item ">
              <a class="nav-link" href="/">Articles
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/users">Users</a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="#">About</a>
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
      <!-- Page Heading -->
     <h1 class="header">Welcome to Algo-Hub!</h1>
      <div class="row">      
        <div class="col-lg-3  portfolio-item">
          <div class="card h-100">
            <img class="card-img-top" src="images/idea1.png" alt="">
            <div class="card-body">
              <h4 class="card-title">
                <p class="textHeader">Create and Store Algorithms</p>
              </h4>
              <p class="card-text"></p>
            </div>
          </div>
        </div>
        <div class="col-lg-3 portfolio-item">
          <div class="card h-100">
            <img class="card-img-top" src="images/modeling.png" alt="">
            <div class="card-body">
              <h4 class="card-title">
                <p class="textHeader">Read Articles About Data Structures, Computer Science Theories, and Algorithms</p>
              </h4>
              <p class="card-text"></p>
            </div>
          </div>
        </div>
        <div class="col-lg-3 portfolio-item">
          <div class="card h-100">
            <img class="card-img-top" src="images/cloud.png" alt="">
            <div class="card-body">
              <h4 class="card-title">
                <p class="textHeader">Follow other users. Leave comments and suggestions on others algorithms</p>
              </h4>
              <p class="card-text"></p>
            </div>
          </div>
        </div>
      </div>
      <p class="about1 about"><span>&#187;</span> I created Algo-Hub so that I could store and review all my daily algorithm challenges.</p>
    <p class="about"><span>&#187;</span> Please feel free to <a  class="register" href="/register">register</a> and keep track of your algorithms!</p>
     <p class="about"><span>&#187;</span> Please be respectful to other users and try to help them if possible.</p>
      <p class="quotes">
      
      </p>
      
      <!-- /.row -->
    </div>
    
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
<div>Icons made by <a href="https://www.flaticon.com/authors/eucalyp" title="Eucalyp">Eucalyp</a> from <a href="https://www.flaticon.com/" 			    title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" 			    title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</body>
</html>