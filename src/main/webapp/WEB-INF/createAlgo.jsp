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
    <!-- Custom styles for this template --><script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="codemirror-5.43.0/lib/codemirror.js"></script>
<link rel="stylesheet" href="codemirror-5.43.0/lib/codemirror.css">
<script src="codemirror-5.43.0/mode/javascript/javascript.js"></script>
 <script src="codemirror-5.43.0/mode/python/python.js"></script>
<link href="codemirror-5.43.0/theme/dracula.css" rel="stylesheet"/>
<link href="css/4-col-portfolio.css" rel="stylesheet">
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
            <li class="nav-item active">
              <a class="nav-link" href="/createAlgo">Add Algorithm</a>
               <span class="sr-only">(current)</span>
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
    <div class="container">
    	<div class="container-contact100">

		<div class="wrap-contact100">
			<form:form action="/myalgos/add" class="contact100-form validate-form" modelAttribute="algo">
				<span class="contact100-form-title">
					Add Algorithm
				</span>

				<div class="wrap-input100 validate-input" data-validate="Title cannot be empty">
					<input class="input100" type="text" name="title" placeholder="Title">
					<span class="focus-input100"></span>
				</div>
			<p>
				<form:select path="language">
					<c:forEach items="${languages}" var="language">
						<form:option value="${language.id}"><c:out value="${language.name }"/></form:option>
					</c:forEach>
				</form:select>
			</p>
		<form:textarea id="editor2" path="algorithm" rows="40" cols="100" placeholder="var x = 1;"></form:textarea>
		<script type="text/javascript">
        var editor2 = CodeMirror.fromTextArea
            (document.getElementById('editor2'), {
                mode: "javascript",
                theme: "dracula",
                lineNumbers: true
        });
        </script>

				
				<form:hidden path="user" value="${userId}"/>
				
				<div class="container-contact100-form-btn">
					<button class="contact100-form-btn">
						<span>
							<i class="fa m-r-6" aria-hidden="true"></i>
							Add Algorithm 
						</span>
					</button>
				</div>
			</form:form>
		</div>
	</div>


<!--===============================================================================================-->
	<script src="/contact/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/contact/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/contact/vendor/bootstrap/js/popper.js"></script>
	<script src="/contact/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/contact/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/contact/vendor/daterangepicker/moment.min.js"></script>
	<script src="/contact/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="/contact/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="/contact/js/main.js"></script>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>
    </div>
    <!-- /.container -->
      <footer class="py-5 bg-dark">

      <!-- /.container -->
    </footer>
    
	
    </div>
    <!-- /.container -->

  </body>

</body>
</html>