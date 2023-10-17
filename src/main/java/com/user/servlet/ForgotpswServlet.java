package com.user.servlet;
import org.apache.commons.codec.digest.DigestUtils;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/forgotpsw")
public class ForgotpswServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			
			String email = req.getParameter("email");
		
			String newpsw = req.getParameter("newpsw");
			String conpsw = req.getParameter("confirmpsw");
			
			User us=new User();
			
			us.setEmail(email);
			us.setPassword(conpsw);
			
			HttpSession session=req.getSession();
			
			
				
			
		
				UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
				
			
					boolean f=dao.forgotpsw(us);
					if(f && newpsw.equals(conpsw)) {
						
						session.setAttribute("succMsg","password Updated Successfully..");
						resp.sendRedirect("login.jsp");
					}else if(!newpsw.equals(conpsw) && f){
						session.setAttribute("failedMsg","password doesnt match..");
						resp.sendRedirect("forgotpsw.jsp");
					}else {
						session.setAttribute("failedMsg","Email doesnt Exists..");
						resp.sendRedirect("forgotpsw.jsp");
					}
				
			
		
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
		

	
	

}
