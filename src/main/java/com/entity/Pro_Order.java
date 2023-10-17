package com.entity;

public class Pro_Order {

	private int id;
	private String orderId;
	private String username;
	private String email;
	private String phno;
	private String fullAdd;

	private String proName;
	private String description;
	private String price;
private int qty;
private String orderStatus;
	private String paymentType;

	public Pro_Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhno() {
		return phno;
	}

	public void setPhno(String phno) {
		this.phno = phno;
	}

	public String getFullAdd() {
		return fullAdd;
	}

	public void setFullAdd(String fullAdd) {
		this.fullAdd = fullAdd;
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
	
	
	
	

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	@Override
	public String toString() {
		return "Pro_Order [id=" + id + ", orderId=" + orderId + ", username=" + username + ", email=" + email
				+ ", phno=" + phno + ", fullAdd=" + fullAdd + ", proName=" + proName + ", description=" + description
				+ ", price=" + price + ", qty=" + qty + ", orderStatus=" + orderStatus + ", paymentType=" + paymentType
				+ "]";
	}

	
	
}
