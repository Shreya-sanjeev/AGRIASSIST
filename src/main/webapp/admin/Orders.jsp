<%@page import="com.entity.User"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.Pro_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ProductOrderImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders</title>
<%@include file="allcss.jsp"%>

</head>

<body>

<c:if test="${empty userobj}">
	<c:redirect url="../login.jsp"></c:redirect>
	
	</c:if>
	

	
	



	<%@include file="navbar.jsp"%>
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
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone No</th>
				<th scope="col">Product Name</th>
				<th scope="col">Description</th>
				<th scope="col">Price</th>
				<th scope="col">Quantity</th>
				<th scope="col">Payment type</th>
				<th scope="col">Order Status</th>
				<th scope="col"></th>
					
			
			</tr>
		</thead>
		<tbody>
		<%
		

	
		User u = (User) session.getAttribute("userobj");
		Cart c=new Cart();
	
		
		ProductOrderImpl dao=new ProductOrderImpl(DBConnect.getConn());
		List<Pro_Order> plist=dao.getAllProduct();
		int idCounter=1;
		for(Pro_Order p:plist){%>
		
		
			<tr>
				<th scope="row"><%=p.getOrderId()%></th>
				<td><%=p.getUsername() %></td>
				<td><%=p.getEmail()%></td>
				<td><%=p.getFullAdd() %></td>
				<td><%=p.getPhno() %></td>
				<td><%=p.getProName()%></td>
				<td><%=p.getDescription() %></td>
				<td><%=p.getPrice() %></td>
				<td><%=p.getQty()%></td>
				<td><%=p.getPaymentType() %></td>
<td>
<%=p.getOrderStatus() %>
</td>
<td>
<a href="../cancel_ord?pid=<%=p.getOrderId()%>&&uname=<%=p.getUsername()%>&&ordstatus=<%=p.getOrderStatus()%>"><button class="btn btn-danger" id="<%=idCounter %>" onclick="return foo();"><i class="fas fa-times"></i>Cancel</button></a>			
	
</td>

			</tr>
	
		
		<%
		}%>
			
		</tbody>
	</table>
	<div style="margin-top: 320px; width:1640px">
		<%@include file="footer.jsp"%>
	</div>


</body>
</html>