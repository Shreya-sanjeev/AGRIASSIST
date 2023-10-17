package com.admin.servlet;

import java.io.File;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.ProDAOImpl;
import com.DB.DBConnect;
import com.entity.ProDtls;

@WebServlet("/add_products")
@MultipartConfig
public class ProAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String proName = req.getParameter("Pname");
			String description = req.getParameter("pdes");
			String price = req.getParameter("Price");
			String proCat = req.getParameter("categories");
			String status = req.getParameter("status");
			Part part = req.getPart("pimg");
			String fileName = part.getSubmittedFileName();

			ProDtls p = new ProDtls(proName, description, price, proCat, status, fileName, "admin");

			ProDAOImpl dao = new ProDAOImpl(DBConnect.getConn());


			boolean f = dao.addProducts(p);
			HttpSession session = req.getSession();
			if (f) {


				String path = getServletContext().getRealPath("")+"allimg";
				
				File file = new File(path);
				
				part.write(path + File.separator + fileName);

				session.setAttribute("succMsg", "Product Add Sucessfully");
				resp.sendRedirect("admin/add_products.jsp");
			} else {
				session.setAttribute("failedMsg", "Something wrong on server");
				resp.sendRedirect("admin/add_products.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
