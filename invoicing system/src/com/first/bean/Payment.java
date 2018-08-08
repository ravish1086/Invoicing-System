package com.first.bean;

public class Payment {

	private String customername;
	private String date;
	private String paymentmode;
	private String details;
	private float amount;
	
	
	public Payment() {
		super();
	}
	public Payment(String customername, String date, String paymentmode, String details, float amount) {
		super();
		this.customername = customername;
		this.date = date;
		this.paymentmode = paymentmode;
		this.details = details;
		this.amount = amount;
	}
	public String getCustomername() {
		return customername;
	}
	public void setCustomername(String customername) {
		this.customername = customername;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getPaymentmode() {
		return paymentmode;
	}
	public void setPaymentmode(String paymentmode) {
		this.paymentmode = paymentmode;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	
	
	
}
