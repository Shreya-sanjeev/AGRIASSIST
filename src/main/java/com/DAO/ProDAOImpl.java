package com.DAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.ProDtls;

public class ProDAOImpl implements ProDAO {

	private Connection conn;

	public ProDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addProducts(ProDtls p) {

		boolean f = false;
		try {
			String sql = "insert into pro_dtls(pro_Name,description,price,pro_cat,status,photo,user_email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getProName());
			ps.setString(2, p.getDescription());
			ps.setString(3, p.getPrice());
		
			ps.setString(4, p.getProCat());
			ps.setString(5, p.getStatus());
			ps.setString(6, p.getPhotoName());
			ps.setString(7, p.getEmail());

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
	public List<ProDtls> getAllProducts() {
		List<ProDtls> list = new ArrayList<ProDtls>();
		ProDtls p = null;

		try {
			String sql = "select * from pro_dtls";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new ProDtls();
				p.setProId(rs.getInt(1));
				p.setProName(rs.getString(2));
				p.setDescription(rs.getString(3));
				p.setPrice(rs.getString(4));
				p.setProCat(rs.getString(5));
				p.setStatus(rs.getString(6));
				p.setPhotoName(rs.getString(7));
				p.setEmail(rs.getString(8));
				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public ProDtls getProductById(int id) {
		ProDtls p = null;

		try {
			String sql = "select * from pro_dtls where pro_Id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new ProDtls();
				p.setProId(rs.getInt(1));
				p.setProName(rs.getString(2));
				p.setDescription(rs.getString(3));
				p.setPrice(rs.getString(4));
				p.setProCat(rs.getString(5));
				p.setStatus(rs.getString(6));
				p.setPhotoName(rs.getString(7));
				p.setEmail(rs.getString(8));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return p;
	}

	@Override
	public boolean updateEditPro(ProDtls p) {
		boolean f = false;
		try {
			String sql = "update pro_dtls set pro_Name=?,description=?,price=?,status=? where pro_Id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getProName());
			ps.setString(2, p.getDescription());
			ps.setString(3, p.getPrice());
			ps.setString(4, p.getStatus());

			ps.setInt(5, p.getProId());

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
	public boolean deleteProducts(int id) {
		boolean f = false;
		try {
			String sql = "delete from pro_dtls where pro_Id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

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
	public List<ProDtls> getSeeds() {
		List<ProDtls> list = new ArrayList<ProDtls>();
		ProDtls p = null;
		try {

			String sql = "select * from pro_dtls  where pro_cat=? and status=? order by pro_Id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Seeds");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				p = new ProDtls();
				p.setProId(rs.getInt(1));
				p.setProName(rs.getString(2));
				p.setDescription(rs.getString(3));
				p.setPrice(rs.getString(4));
				p.setProCat(rs.getString(5));
				p.setStatus(rs.getString(6));
				p.setPhotoName(rs.getString(7));
				p.setEmail(rs.getString(8));
				list.add(p);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ProDtls> getMachines() {
		List<ProDtls> list = new ArrayList<ProDtls>();
		ProDtls p = null;
		try {

			String sql = "select * from pro_dtls  where pro_cat=? and status=? order by pro_Id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Machines");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				p = new ProDtls();
				p.setProId(rs.getInt(1));
				p.setProName(rs.getString(2));
				p.setDescription(rs.getString(3));
				p.setPrice(rs.getString(4));
				p.setProCat(rs.getString(5));
				p.setStatus(rs.getString(6));
				p.setPhotoName(rs.getString(7));
				p.setEmail(rs.getString(8));
				list.add(p);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	@Override
	public List<ProDtls> getFertilizers() {
		List<ProDtls> list = new ArrayList<ProDtls>();
		ProDtls p = null;
		try {

			String sql = "select * from pro_dtls  where pro_cat=? and status=? order by pro_Id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Fertilizers");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				p = new ProDtls();
				p.setProId(rs.getInt(1));
				p.setProName(rs.getString(2));
				p.setDescription(rs.getString(3));
				p.setPrice(rs.getString(4));
				p.setProCat(rs.getString(5));
				p.setStatus(rs.getString(6));
				p.setPhotoName(rs.getString(7));
				p.setEmail(rs.getString(8));
				list.add(p);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	@Override
	public List<ProDtls> getPesticides() {
		List<ProDtls> list = new ArrayList<ProDtls>();
		ProDtls p = null;
		try {

			String sql = "select * from pro_dtls  where pro_cat=? and status=? order by pro_Id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Pesticides");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				p = new ProDtls();
				p.setProId(rs.getInt(1));
				p.setProName(rs.getString(2));
				p.setDescription(rs.getString(3));
				p.setPrice(rs.getString(4));
				p.setProCat(rs.getString(5));
				p.setStatus(rs.getString(6));
				p.setPhotoName(rs.getString(7));
				p.setEmail(rs.getString(8));
				list.add(p);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ProDtls> getAllSeeds() {

		List<ProDtls> list = new ArrayList<ProDtls>();
		ProDtls p = null;
		try {

			String sql = "select * from pro_dtls  where pro_cat=? and status=? order by pro_Id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Seeds");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new ProDtls();
				p.setProId(rs.getInt(1));
				p.setProName(rs.getString(2));
				p.setDescription(rs.getString(3));
				p.setPrice(rs.getString(4));
				p.setProCat(rs.getString(5));
				p.setStatus(rs.getString(6));
				p.setPhotoName(rs.getString(7));
				p.setEmail(rs.getString(8));
				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	@Override
	public List<ProDtls> getAllMachines() {
		List<ProDtls> list = new ArrayList<ProDtls>();
		ProDtls p = null;
		try {

			String sql = "select * from pro_dtls  where pro_cat=? and status=? order by pro_Id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Machines");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new ProDtls();
				p.setProId(rs.getInt(1));
				p.setProName(rs.getString(2));
				p.setDescription(rs.getString(3));
				p.setPrice(rs.getString(4));
				p.setProCat(rs.getString(5));
				p.setStatus(rs.getString(6));
				p.setPhotoName(rs.getString(7));
				p.setEmail(rs.getString(8));
				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	@Override
	public List<ProDtls> getAllFertilizers() {

		List<ProDtls> list = new ArrayList<ProDtls>();
		ProDtls p = null;
		try {

			String sql = "select * from pro_dtls  where pro_cat=? and status=? order by pro_Id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Fertilizers");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			
			while (rs.next())
			{
				p = new ProDtls();
				p.setProId(rs.getInt(1));
				p.setProName(rs.getString(2));
				p.setDescription(rs.getString(3));
				p.setPrice(rs.getString(4));
				p.setProCat(rs.getString(5));
				p.setStatus(rs.getString(6));
				p.setPhotoName(rs.getString(7));
				p.setEmail(rs.getString(8));
				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ProDtls> getAllPesticides() {
		
		List<ProDtls> list = new ArrayList<ProDtls>();
		ProDtls p = null;
		try {

			String sql = "select * from pro_dtls  where pro_cat=? and status=? order by pro_Id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Pesticides");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			
			while (rs.next())
			{
				p = new ProDtls();
				p.setProId(rs.getInt(1));
				p.setProName(rs.getString(2));
				p.setDescription(rs.getString(3));
				p.setPrice(rs.getString(4));
				p.setProCat(rs.getString(5));
				p.setStatus(rs.getString(6));
				p.setPhotoName(rs.getString(7));
				p.setEmail(rs.getString(8));
				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ProDtls> getProductBySearch(String ch) {

		List<ProDtls> list=new ArrayList<ProDtls>();
		ProDtls p=null;
		
		try {
			
			
			String sql="select * from pro_dtls where pro_Name like ? or description like ? or pro_cat like ? and status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				p=new ProDtls();
				p.setProId(rs.getInt(1));
				p.setProName(rs.getString(2));
				p.setDescription(rs.getString(3));
				p.setPrice(rs.getString(4));
				p.setProCat(rs.getString(5));
				p.setDescription(rs.getString(6));
				p.setPhotoName(rs.getString(7));
				p.setEmail(rs.getString(8));
				list.add(p);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
		return list;
	}

	
	
	
	
}
