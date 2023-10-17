<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@page import="java.sql.Connection"%>



<%@page import="com.DAO.ProDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import=" com.entity.ProDtls"%>




<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All products</title>
<%@include file="allcss.jsp"%>
</head>
<body>

	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty userobj}">
	<c:redirect url="../login.jsp"></c:redirect>
	
	</c:if>
	
	
	
	<h3 class="text-center">Hello Admin</h3>


	<c:if test="${not empty succMsg}">
		<h5 class="text-center text-success">${succMsg}</h5>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<h5 class="text-center text-danger">${failedMsg}
			</h5>
	<c:remove var="failedMsg" scope="session" />
		</c:if>
	
	
	
	
	
	
	<table class="table table-striped">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Image</th>
				<th scope="col">Product Name</th>
				<th scope="col">Description</th>
				<th scope="col">Price</th>
				<th scope="col">Product Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
		<%
		ProDAOImpl dao = new ProDAOImpl(DBConnect.getConn());
		List<ProDtls> list = dao.getAllProducts();
		for (ProDtls p : list) {
		%>
		<tr>
				<td><%=p.getProId()%></td>
				<td><img src="../allimg/<%=p.getPhotoName()%>"
					style="width:50px; height:50px;"></td>
				<td><%=p.getProName()%></td>
				<td><%=p.getDescription()%></td>
				<td><%=p.getPrice()%></td>
				<td><%=p.getProCat()%></td>
				<td><%=p.getStatus()%></td>
				

				<td><a href="edit_pro.jsp?id=<%=p.getProId()%>"class="btn btn-small btn-primary"><i class="far fa-edit"></i>Edit</a> 
					<a href="../delete?id=<%=p.getProId()%>"class="btn btn-small btn-danger"><i class="fas fa-trash-alt"></i>Delete</a></td>
			</tr>
		<%
		}
		%>
			
			

		</tbody>
	</table>



	<div style="margin-top:270px;">
		<%@include file="footer.jsp"%>
	</div>



</body>
</html>