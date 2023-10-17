package com.DAO;

import java.util.List;


import com.entity.Pro_Order;

public interface ProductOrderDAO {


	
	public boolean saveOrder(List<Pro_Order> p);
	
	public List<Pro_Order> getProduct(String email);
	

	public List<Pro_Order> getAllProduct();
	public boolean cancel(String pid, String uname);
	public boolean update(Pro_Order p);
}
