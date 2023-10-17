package com.DAO;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;

import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.ProDtls;
import com.mysql.cj.Session;

public class CartDAOImpl implements CartDAO {

	private Connection conn;

	public CartDAOImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean addCart(Cart c) {

		boolean f = false;

		try {
			
				
			
			String sql1="insert into cart(p_id,u_id,pro_Name,description,price,qty,total_price) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql1);
			ps.setInt(1, c.getPid());
			ps.setInt(2, c.getUserid());
			ps.setString(3, c.getProName());
			ps.setString(4, c.getDescription());
			ps.setDouble(5, c.getPrice());
			ps.setInt(6, c.getQty());
			ps.setDouble(7, c.getTotalPrice());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();

		}

		return f;
	}

	@Override
	public List<Cart> getProductByUser(int userId) {
		List<Cart> list = new ArrayList<Cart>();
		Cart c = null;
		double totalPrice = 0;
		
		try {
			String sql = "select * from cart where u_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				c = new Cart();
				c.setCid(rs.getInt(1));
				c.setPid(rs.getInt(2));
				c.setUserid(rs.getInt(3));
			
				c.setProName(rs.getString(4));
				c.setDescription(rs.getString(5));
				
				c.setPrice(rs.getDouble(6));
				
				
				
				c.setQty(rs.getInt(7));
				totalPrice = totalPrice +( rs.getDouble(8)*rs.getInt(7));
				c.setTotalPrice(totalPrice);
				list.add(c);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean deleteProduct(int pid, int uid) {
		boolean f = false;
		try {
			String sql = "delete from cart where p_id=? and u_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, pid);
			ps.setInt(2, uid);

			int i = ps.executeUpdate();
			if (i == 1)

			{
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	@Override
	public boolean inc(int id,int uid){
		
		boolean f = false;

		try {
			String sql ="update cart set qty=qty+1 where p_id=? and u_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			//ps.setInt(1,qty);
			ps.setInt(1,id);
			ps.setInt(2, uid);
			
	
			int i =ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		}catch (Exception e) {
			e.printStackTrace();
		}

		return f;
		
		
		
	}

	@Override
	public boolean dec(int id,int uid) {
	

		boolean f = false;

		try {
			String sql ="update cart set qty=qty-1 where p_id=? and u_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			//ps.setInt(1,qty);
			ps.setInt(1,id);
			ps.setInt(2,uid);
			
	
			int i =ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		}catch (Exception e) {
			e.printStackTrace();
		}

		return f;
		
	}

	@Override
	public boolean search(int pid, int uid) {
		
	boolean f=false;
		try {
			String sql ="select p_id  from cart left join pro_dtls on cart.p_id=pro_dtls.pro_Id where p_id=? and u_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, pid);
			ps.setInt(2, uid);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			System.out.println(rs);
			while (rs.next()){
			
					
			f=true;
					}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}

	@Override
	public boolean clear(int id) {
		boolean f = false;
		try {
			String sql = "delete from cart where  u_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, id);

			int i = ps.executeUpdate();
			if (i == 1)

			{
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	

	
	
	
}
