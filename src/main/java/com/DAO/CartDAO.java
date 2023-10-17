package com.DAO;

import java.util.List;

import com.entity.Cart;


public interface CartDAO {

public boolean addCart(Cart c);

public boolean search(int pid, int uid);	
public boolean clear(int id);
public List<Cart> getProductByUser(int userId );

public boolean deleteProduct(int pid,int uid);

public boolean  inc(int id,int uid);
public boolean  dec(int id,int uid);
}
