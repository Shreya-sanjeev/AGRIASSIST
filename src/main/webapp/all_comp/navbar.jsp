<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid"
		style=" background-color: #303f9f"></div>

	<div class="container-fluid p-3 bg-light">
		<div class="row">
			<div class="col-md-3 text-success">
				<h2>
					<i class="fab fa-phoenix-framework"></i>Agriassist
				</h2>
			</div>
			<div class="col-md-6">
				<form class="form-inline my-2 my-lg-0" action="search.jsp"
					method="post">
					<input class="form-control mr-sm-2" type="search" name="ch"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				</form>
			</div>

			<c:if test="${not empty  userobj}">
		
				<div class="col-md-3 " >
					<a href="mycart.jsp"> <i class="fas fa-cart-plus fa-2x "></i></a>
					<a href="login.jsp" class="btn btn-success"><i
						class="fas fa-user-plus"></i>${userobj.name }</a> <a href="logout"
						class="btn btn-primary text-white"><i
						class="fas fa-sign-in-alt"></i>Logout</a>
				</div>
			</c:if>
			<c:if test="${empty userobj }">

				<div class="col-md-3">
					<a href="login.jsp" class="btn btn-success"><i
						class="fas fa-sign-in-alt"></i>Login</a> <a href="register.jsp"
						class="btn btn-primary text-white"><i class="fas fa-user-plus"></i>Register</a>
				</div>
			</c:if>
		</div>
	</div>

	<!-- nav -->

	<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
		<a class="navbar-brand" href="#"><i class="fas fa-home"></i></a>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp">Home <span class="sr-only">(current)</span></a></li>


				<li class="nav-item active"><a class="nav-link"
					href="all_Seeds.jsp"><i class="fas fa-seedling"></i>Seeds</a></li>

				<li class="nav-item active"><a class="nav-link disabled"
					href="all_Machines.jsp"><i class="fas fa-tractor"></i>Machines</a></li>

				<li class="nav-item active"><a class="nav-link"
					href="all_Fertilizers.jsp"><i class="fas fa-pump-medical"></i>Fertilizers</a></li>

				<li class="nav-item active"><a class="nav-link disabled"
					href="all_Pesticides.jsp"><i class="fas fa-virus-slash"></i>Pesticides</a></li>


			</ul>


			<form class="form-inline my-2 my-lg-0">

				<a href="setting.jsp" class="btn btn-light my-2 my-sm-0"
					type="submit"><i class="fas fa-cog"></i>Settings</a> <a
					href="helpline.jsp" class="btn btn-light my-2 my-sm-0 ml-1"
					type="submit"><i class="fas fa-phone-square-alt"></i>Contact Us</a>
			</form>
		</div>
	</nav>
</body>
</html>