
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.DAO.ProDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import=" com.entity.ProDtls"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>




<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home page here</title>
<%@ include file="all_comp/allcss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/bagr.jpg");
	height: 450px;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #fcf7f7;

}
/* toast */
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}

/* toast */


</style>
</head>



<body style="background-color: #f7f7f7;">

	<%
	User u = (User) session.getAttribute("userobj");
	%>
	


	
	<%@ include file="all_comp/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h1 class="text-center text-custom"><b>AGRIASSIST</b></h1>
	</div>

	<!-- seeds -->

	<div class="container">
		<h3 class="text-center">Seeds</h3>

		<div class="row">

			<%
			ProDAOImpl dao = new ProDAOImpl(DBConnect.getConn());
			List<ProDtls> list = dao.getSeeds();
			for (ProDtls p : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="img" src="allimg/<%=p.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumbline">
						<p><%=p.getProName()%></p>

						<p>
							Categories:<%=p.getProCat()%></p>
						<div class="row ">

							<%
							if (u == null) {
							%>


							<a href="login.jsp" class="btn btn-danger btn-sm ml-0"><i
								class="fas fa-cart-plus"></i>Add Cart</a>

							<%
							} else {
							%>
							

							<a href="cart?pid=<%=p.getProId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-0" ><i
								class="fas fa-cart-plus"></i>Add Cart</a>
							<%
							}
							%>


							<a href="view_pro.jsp?pid=<%=p.getProId()%>"
								class="btn btn-success btn-sm ml-1">view Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fas fa-rupee-sign"></i><%=p.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>

		<div class="text-center mt-1">
			<a href="all_Seeds.jsp" class="btn btn-danger btn-sm text-white ">View
				All</a>
		</div>
	</div>

	<!-- End of Seeds-->



	<hr>


	<!-- Machines -->

	<div class="container">
		<h3 class="text-center">Machines</h3>
		<div class="row">
			<%
			ProDAOImpl dao2 = new ProDAOImpl(DBConnect.getConn());
			List<ProDtls> list2 = dao2.getMachines();
			for (ProDtls p : list2) {
			%>


			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center ">
						<img alt="img" src="allimg/<%=p.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumbline">
						<p><%=p.getProName()%></p>
						<p>
							Categories:<%=p.getProCat()%></p>
						<div class="row ">
						
							<%
							if (u == null) {
							%>


							<a href="login.jsp" class="btn btn-danger btn-sm ml-0"><i
								class="fas fa-cart-plus"></i>Add Cart</a>

							<%
							} else {
							%>

							<a href="cart?pid=<%=p.getProId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-0"><i
								class="fas fa-cart-plus"></i>Add Cart</a>
							<%
							}
							%>


							<a href="view_pro.jsp?pid=<%=p.getProId()%>"
								class="btn btn-success btn-sm ml-0">view Details</a> <a href=""
								class="btn btn-danger btn-sm ml-0"><i
								class="fas fa-rupee-sign"></i><%=p.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>



			<%
			}
			%>


		</div>
		<div class="text-center mt-1">
			<a href="all_Machines.jsp" class="btn btn-danger btn-sm text-white ">View
				All</a>
		</div>
	</div>

	<!-- End of Machines -->



	<hr>



	<!-- Fertilizers -->



	<div class="container">
		<h3 class="text-center">Fertilizers</h3>
		<div class="row">
			<%
			ProDAOImpl dao3 = new ProDAOImpl(DBConnect.getConn());
			List<ProDtls> list3 = dao3.getFertilizers();
			for (ProDtls p : list3) {
			%>


			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center ">
						<img alt="img" src="allimg/<%=p.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumbline">
						<p><%=p.getProName()%></p>
						<p>
							Categories:<%=p.getProCat()%></p>
						<div class="row ">
							<%
							if (u == null) {
							%>


							<a href="login.jsp" class="btn btn-danger btn-sm ml-0"><i
								class="fas fa-cart-plus"></i>Add Cart</a>

							<%
							} else {
							%>

							<a href="cart?pid=<%=p.getProId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-0"><i
								class="fas fa-cart-plus"></i>Add Cart</a>
							<%
							}
							%>


							<a href="view_pro.jsp?pid=<%=p.getProId()%>"
								class="btn btn-success btn-sm ml-0">view Details</a> <a href=""
								class="btn btn-danger btn-sm ml-0"><i
								class="fas fa-rupee-sign"></i><%=p.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>



			<%
			}
			%>


		</div>
		<div class="text-center mt-1">
			<a href="all_Fertilizers.jsp"
				class="btn btn-danger btn-sm text-white ">View All</a>
		</div>
	</div>


	<!-- End of Fertilizers -->
	<hr>

	<!-- Pesticides-->



	<div class="container">
		<h3 class="text-center">Pesticides</h3>
		<div class="row">
			<%
			ProDAOImpl dao4 = new ProDAOImpl(DBConnect.getConn());
			List<ProDtls> list4 = dao4.getPesticides();
			for (ProDtls p : list4) {
			%>


			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center ">
						<img alt="img" src="allimg/<%=p.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumbline">
						<p><%=p.getProName()%></p>
						<p>
							Categories:<%=p.getProCat()%></p>
						<div class="row ">
							<%
							if (u == null) {
							%>


							<a href="login.jsp" class="btn btn-danger btn-sm ml-0"><i
								class="fas fa-cart-plus"></i>Add Cart</a>

							<%
							} else {
							%>

							<a href="cart?pid=<%=p.getProId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-0"><i
								class="fas fa-cart-plus"></i>Add Cart</a>
							<%
							}
							%>

							<a href="view_pro.jsp?pid=<%=p.getProId()%>"
								class="btn btn-success btn-sm ml-0">view Details</a> <a href=""
								class="btn btn-danger btn-sm ml-0"><i
								class="fas fa-rupee-sign"></i><%=p.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>



			<%
			}
			%>


		</div>
		<div class="text-center mt-1">
			<a href="all_Pesticides.jsp"
				class="btn btn-danger btn-sm text-white ">View All</a>
		</div>
	</div>


	<!-- End of Pesticides -->

	<%@include file="all_comp/footer.jsp"%>

</body>
</html>