package com.entity;

public class ProDtls {
	private int proId;
	private String proName;
	private String description;
	private String price;
	private String proCat;
	private String status;
	private String photoName;
	private String email;

	public ProDtls() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProDtls(String proName, String description, String price, String proCat, String status, String photoName,
			String email) {
		super();
		this.proName = proName;
		this.description = description;
		this.price = price;
		this.proCat = proCat;
		this.status = status;
		this.photoName = photoName;
		this.email = email;
	}

	public int getProId() {
		return proId;
	}

	public void setProId(int proId) {
		this.proId = proId;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getProCat() {
		return proCat;
	}

	public void setProCat(String proCat) {
		this.proCat = proCat;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "ProDtls [proId=" + proId + ", proName=" + proName + ", description=" + description + ", price=" + price
				+ ", proCat=" + proCat + ", status=" + status + ", photoName=" + photoName + ", email=" + email + "]";
	}

}
