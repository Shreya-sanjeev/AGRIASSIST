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


	<%@include file="all_comp/navbar.jsp"%>

	<c:if test="${ empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
<c:if test="${not empty succMsg}">
		<div class="alert alert-success text-center" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />

	</c:if>
	

	<c:if test="${not empty failedMsg}">
		<div class="alert alert-danger text-center" role="alert" style="font-weight:900">${failedMsg}</div>
		<c:remove var="failedMsg" scope="session" />

	</c:if>




	<div class="container">
		<div class="row p-2">
			
<div class="col">
				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Item</h3>

						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Product Name</th>
									<th scope="col">Description</th>
									<th scope="col">Price</th>
									<th scope="col">Quantity</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								User u = (User) session.getAttribute("userobj");
								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
								List<Cart> cart = dao.getProductByUser(u.getId());

								Double totalPrice = 0.00;
								for (Cart c : cart) {
									totalPrice = c.getTotalPrice();
								%>

								<tr>
								
									<th scope="row"><%=c.getProName()%></th>
									<td><%=c.getDescription()%></td>
									<td><%=c.getPrice()%></td>

									<td>
									<form action=""method="post">
									
									<a class="btn btn-sm btn-primary btn-decre" href="incdec?action=dec&&id=<%=c.getPid()%>&&qty=<%=c.getQty()%>&&uid=<%=u.getId()%>"><i class="fas fa-minus-square"></i></a>
									<input type="number" min="1" max="10" value="<%=c.getQty()%>" readonly="readonly">
									<a class="btn btn-sm btn-danger btn-incre" href="incdec?action=inc&&id=<%=c.getPid()%>&&qty=<%=c.getQty()%>&&uid=<%=u.getId()%>"><i class="fas fa-plus-square"></i></a>
									
									</form>
									
									<td>
									<a href="remove_pro?pid=<%=c.getPid()%>&&uid=<%=c.getUserid()%>"
										class="btn btn-sm btn-danger"> Remove</a> </td>
								</tr>

<%
} 
%>

								
								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>

							
							</tbody>
							
						</table>
						
						<div class="text-center">
								<a href="checkout.jsp" class="btn btn-success">Proceed to order</a>
								<a href="index.jsp" class="btn btn-primary">Continue
									Shopping</a>
							</div>
					</div>
				</div>
			</div>


</div>

</div>


		
	
</body>
</html>