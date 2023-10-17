<%@page import="com.entity.ProDtls"%>
<%@page import="com.DAO.ProDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>

<%@include file="all_comp/allcss.jsp"%>

</head>
<body style="background-color: #f0f1f2;">

<%
User u = (User) session.getAttribute("userobj");
%>
	<%@include file="all_comp/navbar.jsp"%>

	<c:if test="${ empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty succMsg}">
		<div class="alert alert-success" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />

	</c:if>

	<c:if test="${not empty failedMsg}">
		<div class="alert alert-danger text-center" role="alert">${failedMsg}</div>
		<c:remove var="failedMsg" scope="session" />

	</c:if>



<div class="container p-2">


	 	<div class="row-p-2">
	 	
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details for Order</h3>
						<form action="order" method="post">
						
						
					
<input type="hidden" value="${userobj.id}"name="id">


							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										class="form-control" id="inputEmail4"  name="username"value="${userobj.name}">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email_Id</label> <input
										type="email" class="form-control" id="inputPassword4" name="email" value="${userobj.email}">
								</div>
							</div>



							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Mobile Number</label> <input
										type="number" class="form-control" id="inputEmail4" name="phno"value="${userobj.phno}">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4" required="required" name="address" >
								</div>
							</div>




							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" id="inputEmail4" required="required" name="landmark">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text"
										class="form-control" id="inputPassword4"  required="required"name="city" >
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4" required="required" name="state">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Pincode</label> <input type="text"
										class="form-control" id="inputPassword4"  required="required" name="pincode" >
								</div>
							</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label>Payment Mode</label> <select class="form-control text-center" name="payment" >
									<option value="noselect">---Select---</option>
									<option value="cod">Cash on Delivery</option>
								</select>
							</div>
</div>

							<div class="text-center">
								<a href="" ><button class="btn btn-warning">Order Now</button></a>
								<a href="mycart.jsp" class="btn btn-primary">Go Back</a>
							</div>


						</form>


					</div> 
				</div>
			</div>




		
	</div>
</body>
</html>