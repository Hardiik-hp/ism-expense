<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link href="https://demo.themefisher.com/quixlab/css/style.css" rel="stylesheet">
    
<title>Login</title>
</head>
<body class="h-100">
<div class="row">
<div>
<br> <br>
</div>
</div>
<div class="login-form-bg h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-xl-6">
                    <div class="form-input-content">
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                                <a class="text-center" href="index.html"> <h4>Login</h4></a>
                                <f:form action="authenticate" method="post" modelAttribute="login" class="mt-5 mb-5 login-input">
									<div class="form-group">
									<f:input path="email" class="form-control" placeholder="Email"/>
									<f:errors path="email" style="color:red"></f:errors>
									</div>
									<div class="form-group">
									<f:input path="password" class="form-control" placeholder="Password"/>
									<f:errors path="password" style="color:red"></f:errors>
									</div>
									<input class="btn login-form__btn submit w-100" type="submit" value="Login">
									<div class="form-group">
									<span style="color:red ">${msg}</span>
									</div>
								</f:form> 
                                <p class="mt-5 login-form__footer">Dont have account? <a href="signup" class="text-primary">Sign Up</a> now</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--**********************************
        Scripts
    ***********************************-->
    <script src="https://demo.themefisher.com/quixlab/plugins/common/common.min.js"></script>
    <script src="js/custom.min.js"></script>
    <script src="js/settings.js"></script>
    <script src="js/gleek.js"></script>
    <script src="js/styleSwitcher.js"></script>
<%-- 	<form action="login"  method="post">
	email <input type="text" name="email"> <br><br>
	password <input type="text" name="password"><br><br>
	<input type="submit" value="Login"> </form> --%>
</body>
</html>





