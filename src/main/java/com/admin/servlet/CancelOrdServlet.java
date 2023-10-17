package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.ProductOrderImpl;
import com.DB.DBConnect;
import com.entity.Pro_Order;
@WebServlet("/cancel_ord")
public class CancelOrdServlet extends HttpServlet {

	

		@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
		String pid=(req.getParameter("pid"));

	String uname=(req.getParameter("uname"));
	String ordStatus=(req.getParameter("ordstatus"));
	Pro_Order p=new Pro_Order();
	
	p.setOrderStatus("CANCELED");
	p.setOrderId(pid);
	ProductOrderImpl dao=new ProductOrderImpl(DBConnect.getConn());
	boolean f=dao.update(p);
	HttpSession session=req.getSession();
	if(f)
	{
		
		session.setAttribute("succMsg", "Product Order canceled");
		resp.sendRedirect("admin/Orders.jsp");
		
	}else {
		session.setAttribute("failedMsg", "Something wrong on server");
		resp.sendRedirect("admin/Orders.jsp");
				
		
	}
		
	}
}
