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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			String check = req.getParameter("check");

			// System.out.println(name+" "+email+" "+phno+" "+password+" "+check);

			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setphone(phno);
			us.setPassword(DigestUtils.md5Hex(password));

			HttpSession session = req.getSession();

			if (check != null) {

				UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
				boolean f2 = dao.checkUser(email);
				if (f2) {
					boolean f=dao.userRegister(us);
					if(f)
						{
							//System.out.println("user Register success...");
						session.setAttribute("succMsg","Registration successfull...");
						resp.sendRedirect("register.jsp");
						}else {
							//System.out.println("Something wrong on server..");
							session.setAttribute("failedMsg","Something wrong on server.....");
							resp.sendRedirect("register.jsp");
							}
					
					

				} else {
					//System.out.println("User Already exists..");
					session.setAttribute("failedMsg","User Already exists.....");
					resp.sendRedirect("register.jsp");
				}
			} else {
				// System.out.println("Please check agree & terms conditions..");
				session.setAttribute("failedMsg", "Please check agree & terms conditions.....");
				resp.sendRedirect("register.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
