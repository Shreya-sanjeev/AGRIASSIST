package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.ProDAOImpl;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.User;

@WebServlet("/incdec")
public class QtyIncDecServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String action = (req.getParameter("action"));

			int id = Integer.parseInt(req.getParameter("id"));
			int qty = Integer.parseInt(req.getParameter("qty"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			HttpSession session = req.getSession();

			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());

			if(action.equals("inc")) {
				if(qty>=1 && qty<10){

					boolean f=dao.inc(id,uid);
					if(f){
						session.setAttribute("succMsg", "product increment Successfully..");
						resp.sendRedirect("mycart.jsp");
					}else {
						session.setAttribute("failedMsg", "Something went wrong..");
						resp.sendRedirect("mycart.jsp");
					}

				}else {
					session.setAttribute("failedMsg", "Quantity Must Be 1 and less then 10");
					resp.sendRedirect("mycart.jsp");
				}
				
			}else if (action.equals("dec")) {
				if (qty>=2 && qty<=10){

					boolean f = dao.dec(id,uid);
					if(f){
						session.setAttribute("succMsg", "Product decremented successfully..");
						resp.sendRedirect("mycart.jsp");
					}else {
						session.setAttribute("failedMsg", "Something wrong on server..");
						resp.sendRedirect("mycart.jsp");
					}

				} else {
					session.setAttribute("failedMsg", "Quantity Must Be 1 and less then 10");
					resp.sendRedirect("mycart.jsp");
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
