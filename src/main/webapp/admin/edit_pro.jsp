<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@page import="com.DAO.ProDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import=" com.entity.ProDtls"%>




<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<%@include file="allcss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h4 class="text-center">Edit Products</h4>

						

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						ProDAOImpl dao = new ProDAOImpl(DBConnect.getConn());
						ProDtls p = dao.getProductById(id);
						%>

						<form action="../edit_pro" method="post" enctype="multipart/form-data">
							<input type="hidden" name="id" value="<%=p.getProId()%>">
							<div class="form-group">
								<label for="exampleInputEmail1">Product Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter name"
									required="required" name="Pname" value="<%=p.getProName()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Description</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Description here"
									required="required" name="pdes" value="<%=p.getDescription()%>">
							</div>


							<div class="form-group">
								<label for="exampleInputPrice">Price</label> <input
									type="number" class="form-control" id="exampleInputPassword1"
									placeholder="price" required="required" name="Price"
									value="<%=p.getPrice()%>">
							</div>





							<div class="form-group">
								<label for="inputState">Product Status</label> <select
									class="form-control" id="inputState" name="status">
									<%
									if ("Active".equals(p.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<%
									}
									%>

								</select>
							</div>



							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div style="margin-top: 50px;">
		<%@include file="footer.jsp"%>
	</div>






</body>
</html>