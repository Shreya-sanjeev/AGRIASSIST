package com.user.servlet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.io.IOException;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.ProDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.ProDtls;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		/*private Connection conn;
		public CartServlet(Connection conn) {
			this.conn = conn;
		}*/
		try {

			
			int pid = Integer.parseInt(req.getParameter("pid"));
			int uid = Integer.parseInt(req.getParameter("uid"));

			ProDAOImpl dao = new ProDAOImpl(DBConnect.getConn());
			ProDtls p = dao.getProductById(pid);
			List<Cart> cart = new ArrayList<Cart>();
			HttpSession session=req.getSession();
			
			Cart c=new Cart();
			CartDAOImpl dao2=new CartDAOImpl(DBConnect.getConn());
			
			c.setPid(pid);
			
			c.setUserid(uid);
			c.setProName(p.getProName());
			c.setDescription(p.getDescription());
			c.setQty(1);
			c.setPrice(Double.parseDouble(p.getPrice()));
			
			
			
			c.setTotalPrice(Double.parseDouble(p.getPrice()));
			
		
		
			boolean f2=dao2.search(pid,uid);
			System.out.println(f2);
			if(f2 && c.getPid()==pid) {
				session.setAttribute("failedMsg", "Product exists please increase the quantity");
				resp.sendRedirect("mycart.jsp");
			}else {
				
			
			boolean f=dao2.addCart(c);
			if(f){
					
				if( f && p.getProCat().equals("Seeds"))
				{
					
					session.setAttribute("addCart", "Product Added to cart");

						resp.sendRedirect("all_Seeds.jsp");
					
					
				}else if(f && p.getProCat().equals("Machines")) {
					session.setAttribute("addCart", "Product Added to cart");

					resp.sendRedirect("all_Machines.jsp");
					
				}else if(f && p.getProCat().equals("Fertilizers")) {
					session.setAttribute("addCart", "Product Added to cart");

					resp.sendRedirect("all_Fertilizers.jsp");
					
				}else if(f && p.getProCat().equals("Pesticides")) {
					session.setAttribute("addCart", "Product Added to cart");

					resp.sendRedirect("all_Pesticides.jsp");
					
				}else {
				
				session.setAttribute("failed", "Something wrong on server");
				resp.sendRedirect("all_Seeds.jsp");
				
				}	
				
	
			}	
			}
			
					
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
