<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>	
	 
    <%@page import="com.entity.ProDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ProDAOImpl"%>
<%@page import="com.DAO.ProDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import=" com.entity.ProDtls"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
    
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>all Pesticides here</title>
<%@ include file="all_comp/allcss.jsp"%>

<style type="text/css">

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
<body>
<%
	User u = (User) session.getAttribute("userobj");
	%>


<c:if test="${not empty addCart }">

<div id="toast">${addCart}</div>

<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>

<c:remove var="addCart" scope="session"/>
</c:if>


	<%@ include file="all_comp/navbar.jsp"%>
<div class="container-fluid">
		<div class="row">
			<%
			ProDAOImpl dao4 = new ProDAOImpl(DBConnect.getConn());
			List<ProDtls> list4 = dao4.getAllPesticides();
			for (ProDtls p : list4) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="img" src="allimg/<%=p.getPhotoName()%>"
							style="width: 200px; height: 250px" class="img-thumbline">
						<p><%=p.getProName()%></p>

						<p>
							Categories:<%=p.getProCat()%></p>
						<div class="row ">
						<%
							if (u == null) {
							%>


							<a href="login.jsp" class="btn btn-danger btn-sm ml-4"><i
								class="fas fa-cart-plus"></i>Add Cart</a>

							<%
							} else {
							%>

							<a href="cart?pid=<%=p.getProId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-4"><i
								class="fas fa-cart-plus"></i>Add Cart</a>
							<%
							}
							%>
						 <a href="view_pro.jsp?pid=<%=p.getProId()%>"class="btn btn-success btn-sm ml-2">view Details</a>
						  <a href=""class="btn btn-danger btn-sm ml-2"><i class="fas fa-rupee-sign"></i><%=p.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

				
		</div>
	</div>

		



</body>
</html>