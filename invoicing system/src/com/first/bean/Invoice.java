package com.first.bean;

public class Invoice {
	
	private int invoiceid;
	private int invoiceno;
	private int invoicestatus;
	public Invoice() {
		super();
	}
	public Invoice(int invoiceid, int invoiceno, int invoicestatus) {
		super();
		this.invoiceid = invoiceid;
		this.invoiceno = invoiceno;
		this.invoicestatus = invoicestatus;
	}
	public int getInvoiceid() {
		return invoiceid;
	}
	public void setInvoiceid(int invoiceid) {
		this.invoiceid = invoiceid;
	}
	public int getInvoiceno() {
		return invoiceno;
	}
	public void setInvoiceno(int invoiceno) {
		this.invoiceno = invoiceno;
	}
	public int getInvoicestatus() {
		return invoicestatus;
	}
	public void setInvoicestatus(int invoicestatus) {
		this.invoicestatus = invoicestatus;
	}
	

}
