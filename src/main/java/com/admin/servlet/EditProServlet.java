package com.admin.servlet;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.ProDAOImpl;
import com.DB.DBConnect;
import com.entity.ProDtls;

@WebServlet("/edit_pro")
@MultipartConfig
public class EditProServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		int id=Integer.parseInt(req.getParameter("id"));
		String proName = req.getParameter("Pname");
		String description = req.getParameter("pdes");
		String price = req.getParameter("Price");
		String status = req.getParameter("status");
		
		ProDtls p=new ProDtls();
		p.setProId(id);
		p.setProName(proName);
		p.setDescription(description);
		p.setPrice(price);
		p.setStatus(status);
		
		
		ProDAOImpl dao=new ProDAOImpl(DBConnect.getConn());
		boolean f=dao.updateEditPro(p);
		
		HttpSession session=req.getSession();
		
		
		if(f)
		{
			session.setAttribute("succMsg", "Product Update Successfully..");
			resp.sendRedirect("admin/all_products.jsp");
		}else {
			session.setAttribute("failedMsg", "Something wrong on server..");
			resp.sendRedirect("admin/all_products.jsp");	
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}
	}
	

}
