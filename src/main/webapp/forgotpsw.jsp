<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>forgot password page</title>

<%@include file="all_comp/allcss.jsp"%>

</head>
<body style="background-color:#f0f1f2;">

	<%@include file="all_comp/navbar.jsp"%>

	<div class="container">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h5 class="text-center ">Forgot password </h5>
					
						<c:if test="${not empty failedMsg }">
						<h5 class="text-center text-danger">${failedMsg}</h5>
						<c:remove var="failedMsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty succMsg }">
						<h5 class="text-center text-success">${succMsg}</h5>
						<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						
						
						<form action="forgotpsw" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email" required="required" name="email">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter new password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" required="required" name="newpsw">
							</div>
							
							<div class="form-group">
								<label for="exampleInputPassword1">Confirm password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" required="required" name="confirmpsw">
							</div>
							
							<div class="text-center">
								<button type="submit" class="btn btn-primary">update password</button>
								<br>
								
							</div>

						</form>


					</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>