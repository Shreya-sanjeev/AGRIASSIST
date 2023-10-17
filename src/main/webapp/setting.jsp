<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Settings here</title>
<%@ include file="all_comp/allcss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}

.crd-ho:hover {
	background-color: #cfd8dc;
}
</style>



</head>
<body style="background-color: #f7f7f7;">
<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>



	<%@ include file="all_comp/navbar.jsp"%>
	<div class="container">
	

	<h3 class="text-center">Hello,${userobj.name}</h3>
	
	

		<div class="row p-5" style="justify-content: center;">
			<div class="col-md-6">
				<a href="Edit_profile.jsp">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-user-edit fa-3x"></i>
							</div>
							<h4>Login & security(Edit profile)</h4>
						</div>
					</div>
				</a>
			</div>
		</div>

		
<div class="row">
				<div class="col-md-4 offset-md-2">
					<a href="my_order.jsp">
						<div class="card crd-ho">
							<div class="card-body text-center ">
								<div class="text-danger">
									<i class="fas fa-box-open fa-3x"></i>
								</div>
								<h4>My Order</h4>
								<p>Track your order</p>
							</div>
						</div>
					</a>
				</div>


				<div class="col-md-4">
					<a href="helpline.jsp">
						<div class="card crd-ho">
							<div class="card-body text-center ">
								<div class="text-primary">
									<i class="fas fa-user-circle fa-3x"></i>
								</div>
								<h4>Help center</h4>
								<p>24*7 Service</p>
							</div>
						</div>
					</a>
				</div>
			</div>

		</div>
	
	<div style="margin-top: 80px">
		<%@include file="all_comp/footer.jsp"%>
	</div>

</body>
</html>