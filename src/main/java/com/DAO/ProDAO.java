package com.DAO;

import java.util.List;

import com.entity.ProDtls;

public interface ProDAO {

	public boolean addProducts(ProDtls p);
	
	
	public List<ProDtls> getAllProducts();
	
	
	public ProDtls getProductById(int id);
	
	public boolean updateEditPro(ProDtls p);
	
	public boolean deleteProducts(int id);
	
	public List<ProDtls> getSeeds();
	
	public List<ProDtls> getMachines();
	
	public List<ProDtls> getFertilizers();
	
	public List<ProDtls> getPesticides();
	

	public List<ProDtls> getAllSeeds();
	
	public List<ProDtls> getAllMachines();
	
	public List<ProDtls> getAllFertilizers();
	
	public List<ProDtls> getAllPesticides();
	
	public List<ProDtls> getProductBySearch(String ch);
}
