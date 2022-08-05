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

<title>Sign up</title>
</head>
<body class="h-100">
<div class="row">
<div>
<br>
</div>
</div>
<div class="login-form-bg h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-xl-6">
                    <div class="form-input-content">
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                                <a class="text-center" href="index.html"> <h4>Sign up</h4></a>
                                <f:form class="mt-5 mb-5 login-input" action="saveuser" modelAttribute="user" method="post">
									<div class="form-group">
									<f:input path="firstName" class="form-control" placeholder="First Name"/>
									<f:errors path="firstName"></f:errors>
									</div>
									<div class="form-group">
									<f:input path="lastName" class="form-control" placeholder="Last Name"/>
									<f:errors path="lastName"></f:errors>
									</div>
									<div class="form-group">
									Gender : <label class="radio-inline mr-3">
									<f:radiobutton path="gender" value="male" /> Male
									</label>
									<label class="radio-inline mr-3">
									<f:radiobutton path="gender" value="female" /> Female
									</label>
									</div>
									<div class="form-group">
									<f:input path="email" class="form-control" placeholder="email"/>
									<f:errors path="email"></f:errors>
									</div>
									<div class="form-group">
									<f:input path="password" class="form-control" placeholder="Password"/>
									<f:errors path="password"></f:errors>
									</div>
									<input class="btn login-form__btn submit w-100" type="submit" value="Sign Up">
								</f:form> 
                                <p class="mt-5 login-form__footer">Have account ? <a href="login" class="text-primary">Log In </a> now</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%-- <f:form action="saveuser" method="post" modelAttribute="user" class="mt-5 mb-5 signup-input">
		<div class="form-group">
		first name<f:input path="firstName" />
		<f:errors path="firstName" style="color:red" ></f:errors>
		</div>
		Last name<f:input path="LastName" />
		<f:errors path="lastName" style="color:red"></f:errors>
		<br>
		<br>
		
		Gender : Male<f:radiobutton path="gender" value="male" />
				Female<f:radiobutton path="gender" value="female" />
		<f:errors path="gender" style="color:red"></f:errors>
		<br>
		<br>
		
		Email <f:input path="email" />
		<f:errors path="email" style="color:red"></f:errors>
		<br>
		<br>
		
		Password <f:password path="password" />
		<f:errors path="password" style="color:red"></f:errors>
		<br>
		<br>
		<input type="submit" value="Signup">
		<a href="login">Login</a>
	</f:form> --%>
    <!--**********************************
        Scripts
    ***********************************-->
    <script src="https://demo.themefisher.com/quixlab/plugins/common/common.min.js"></script>
    <script src="js/custom.min.js"></script>
    <script src="js/settings.js"></script>
    <script src="js/gleek.js"></script>
    <script src="js/styleSwitcher.js"></script>	
</body>
</html>