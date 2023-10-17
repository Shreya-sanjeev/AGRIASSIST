<%@page import="com.entity.User"%>
<%@page import="com.entity.ProDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ProDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View product here</title>

<%@ include file="all_comp/allcss.jsp"%>

</head>
<body style="background-color: #f0f1f2">
	<%@ include file="all_comp/navbar.jsp"%>
	
	
	
	
	
	<%
	User u = (User) session.getAttribute("userobj");
	%>


	

	<%
	int pid = Integer.parseInt(request.getParameter("pid"));
	ProDAOImpl dao = new ProDAOImpl(DBConnect.getConn());
	ProDtls p = dao.getProductById(pid);
	%>








	<div class="container p-3">
		<div class="row ">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img alt="" src="allimg/<%=p.getPhotoName()%>"
					style="height: 150px; width: 100px;"><br>
				<h4 class="mt-3">
					Product Name:<span class="text-success"><%=p.getProName()%></span>
				</h4>

				<h4>
					Description:<span class="text-success"><%=p.getDescription()%></span>
				</h4>
				<h4>
					Categories:<span class="text-success"><%=p.getProCat()%></span>
				</h4>

			</div>

			<div class="col-md-6 text-center p-5 border bg-white">

				<h2><%=p.getProName()%></h2>




				<div class="row ">
					<div class="col-md-4 text-center text-danger p-2">

						<i class="fas fa-money-bill-wave fa-2x"></i>
						<p>Cash on Delivery</p>

					</div>
					<div class="col-md-4 text-center text-danger p-2">

						<i class="fas fa-undo-alt fa-2x"></i>
						<p>Return Available</p>

					</div>
					<div class="col-md-4 text-center text-danger p-2">

						<i class="fas fa-truck-moving fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>

				<div class="text-center p-3">
					<a href="cart?pid=<%=p.getProId()%>&&uid=<%=u.getId()%>" class="btn btn-primary"> <i class="fas fa-cart-plus"></i>Add
						Cart
					</a> <a href="" class="btn btn-danger"><i class="fas fa-rupee-sign"></i><%=p.getPrice()%></a>
				</div>




			</div>

		</div>





	</div>

</body>
</html>