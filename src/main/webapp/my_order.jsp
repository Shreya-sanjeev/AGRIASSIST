<%@page import="com.entity.Pro_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ProductOrderImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My orders here</title>
<%@include file="all_comp/allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">


<c:if test="${ empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@include file="all_comp/navbar.jsp"%>


	<div class="container p-1">
<h3 class="text-center text-success">Your Order</h3>
		<table class="table table-striped mt-3">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Product Name</th>
					<th scope="col">Description</th>
					<th scope="col">Price</th>
					<th scope="col">Quantity</th>
					<th scope="col">Payment Type</th>
					<th scope="col">Order Status</th>
					
				</tr>
			</thead>
			<tbody>
			
		<% 
			User u = (User)session.getAttribute("userobj");
			ProductOrderImpl dao=new ProductOrderImpl(DBConnect.getConn());
			List<Pro_Order> plist=dao.getProduct(u.getEmail());
			for(Pro_Order p:plist)
				{%>
				
				<tr>
					<th scope="row"><%=p.getOrderId() %></th>
					<td><%=p.getUsername()%></td>
					<td><%=p.getProName()%></td>
					<td><%=p.getDescription() %></td>
					<td><%=p.getPrice()%></td>
					<td><%=p.getQty()%></td>
					<td><%=p.getPaymentType()%></td>
					<td><%=p.getOrderStatus()%></td>
				</tr>
				
			<%
				}
			%>
			
			
			
				
			</tbody>
		</table>


	</div>

</body>
</html>