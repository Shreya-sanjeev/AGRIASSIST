package com.DAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Pro_Order;

public class ProductOrderImpl implements ProductOrderDAO {

	private Connection conn;

	public ProductOrderImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean saveOrder(List<Pro_Order> plist) {

		boolean f = false;

		try {

			String sql = "insert into pro_order(order_id,user_name,email,address,phone,pro_name,description,price,payment,qty,o_status) values(?,?,?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			for (Pro_Order p : plist) {

				ps.setString(1, p.getOrderId());
				ps.setString(2, p.getUsername());
				ps.setString(3, p.getEmail());
				ps.setString(4, p.getFullAdd());
				ps.setString(5, p.getPhno());
				ps.setString(6, p.getProName());
				ps.setString(7, p.getDescription());
				ps.setString(8, p.getPrice());
			
				ps.setString(9, p.getPaymentType());
				ps.setInt(10, p.getQty());
				ps.setString(11, p.getOrderStatus());
				ps.addBatch();

			}
			int[] count = ps.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public List<Pro_Order> getProduct(String email) {

		List<Pro_Order> list = new ArrayList<Pro_Order>();
		Pro_Order o = null;

		try {
			String sql = "select * from pro_order where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				o = new Pro_Order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUsername(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFullAdd(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setProName(rs.getString(7));
				o.setDescription(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymentType(rs.getString(10));
				o.setQty(rs.getInt(11));
			
				o.setOrderStatus(rs.getString(12));
				list.add(o);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Pro_Order> getAllProduct() {
		List<Pro_Order> list = new ArrayList<Pro_Order>();
		Pro_Order o = null;

		try {
			String sql = "select * from pro_order";
			PreparedStatement ps = conn.prepareStatement(sql);
		
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				o = new Pro_Order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUsername(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFullAdd(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setProName(rs.getString(7));
				o.setDescription(rs.getString(8));
				o.setPrice(rs.getString(9));
			
				o.setPaymentType(rs.getString(10));
				o.setQty(rs.getInt(11));
				o.setOrderStatus(rs.getString(12));
				list.add(o);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}   
	
		return list;
	}

	@Override
	public boolean cancel(String pid, String uname) {
		boolean f = false;
		try {
			String sql = "delete from pro_order where order_id=? and user_name=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, pid);
			ps.setString(2, uname);

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
	public boolean update(Pro_Order p) {
		boolean f = false;

		try {
			String sql ="update pro_order set o_status=? where order_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
		
			ps.setString(1, p.getOrderStatus());
			ps.setString(2,p.getOrderId());
			
	
			

			int i =ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		}catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	
	
	
	
}
