<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:Add products</title>

<%@include file="allcss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty userobj}">
	<c:redirect url="../login.jsp"></c:redirect>
	
	</c:if>



	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h4 class="text-center">Add Products</h4>
						
						
						<c:if test="${not empty succMsg}">
						<p class="text-center text-success">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty failedMsg }">
						<p class="text-center text-danger">${failedMsg}</p>
						<c:remove var="failedMsg" scope="session" />
						</c:if>
						
						
						
						
						<form action="../add_products" method="post"
							enctype="multipart/form-data">

							<div class="form-group">
								<label for="exampleInputEmail1">Product Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter name"
									required="required" name="Pname">
							</div>

							
							<div class="form-group">
								<label for="exampleInputEmail1">Description</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter description here"
									required="required" name="pdes">
							</div>
							
							
							<div class="form-group">
								<label for="exampleInputPrice">Price</label> <input
									type="number" class="form-control" id="exampleInputPassword1"
									placeholder="price" required="required" name="Price">
							</div>

							<div class="form-group">
								<label for="inputState">Product Categories</label> <select
									class="form-control" id="inputState" name="categories">
									<option selected>--Select--</option>
									<option>Seeds</option>
									<option>Machines</option>
									<option>Fertilizers</option>
									<option>Pesticides</option>
								</select>
							</div>


							<div class="form-group">
								<label for="inputState">Product Status</label> <select
									class="form-control" id="inputState" name="status">
									<option selected>--Select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile">Upload Photo</label> <input
									type="file" class="form-control-file"
									id="exampleFormControlFile" name="pimg">
							</div>

							<button type="submit" class="btn btn-primary">Add</button>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div style="margin-top: 10px;">
		<%@include file="footer.jsp"%>
	</div>



</body>
</html>