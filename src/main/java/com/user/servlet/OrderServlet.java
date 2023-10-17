package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.ProductOrderImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.Pro_Order;
@WebServlet("/order")
public class OrderServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			
			HttpSession session=req.getSession();
			int id=Integer.parseInt(req.getParameter("id"));
			
			
			String name=req.getParameter("username");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String address=req.getParameter("address");
			String landmark=req.getParameter("landmark");
			String city=req.getParameter("city");
			String state=req.getParameter("state");
			String pincode=req.getParameter("pincode");
			String paymentType=req.getParameter("payment");
			
			String fullAdd=address+","+landmark+","+city+","+state+","+pincode;
			
		
			
			
			CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());
			List<Cart> plist=dao.getProductByUser(id);
			
			if(plist.isEmpty()) {

				session.setAttribute("failedMsg", "ADD PRODUCTS");
				resp.sendRedirect("checkout.jsp");
				
			}else {
				ProductOrderImpl dao2=new ProductOrderImpl(DBConnect.getConn());
				
				
				
				
				Pro_Order o=null;
				
				
				ArrayList<Pro_Order> orderList=new ArrayList<Pro_Order>();
				Random r=new Random();
				for(Cart c : plist)
				{
					o=new Pro_Order();
					o.setOrderId("PRODUCT-ORD-00" + r.nextInt(1000));
					o.setUsername(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFullAdd(fullAdd);
					o.setProName(c.getProName());
					o.setDescription(c.getDescription());
					o.setPrice(c.getPrice()+"");
					o.setQty(c.getQty());
					
					o.setPaymentType(paymentType);
					o.setOrderStatus("Accepted");
					orderList.add(o);
					
					
				}
				
				if("noselect".equals(paymentType))
				{
					session.setAttribute("failedMsg", "Please choose payment type");
					resp.sendRedirect("checkout.jsp");
				}else {
					
					boolean f=dao2.saveOrder(orderList);
					if(f)
					{ 
					
						dao.clear(id);
							resp.sendRedirect("order_success.jsp");
						
					}else {
						session.setAttribute("failedMsg", "Your order failed");
						resp.sendRedirect("checkout.jsp");
					}
				}
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
