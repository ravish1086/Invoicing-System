package com.first.bean;

public class ItemSaleInfo {

	private int invoiceno;
	private String date;
	private String name;
	private String hsn;
	private float quantity;
	private float taxablevalue;
	private float taxamount;
	private float taxrate;
	private float netamount;
	private float itemunitprice;
	private String itemuom;
	public ItemSaleInfo() {
		super();
	}
	public ItemSaleInfo(int invoiceno, String date, String name, String hsn, float quantity, float taxablevalue,
			float taxamount, float taxrate, float netamount,float itemunitprice,String itemuom) {
		super();
		this.invoiceno = invoiceno;
		this.date = date;
		this.name = name;
		this.hsn = hsn;
		this.quantity = quantity;
		this.taxablevalue = taxablevalue;
		this.taxamount = taxamount;
		this.taxrate = taxrate;
		this.netamount = netamount;
		this.itemunitprice=itemunitprice;
		this.itemuom=itemuom;
	}
	public int getInvoiceno() {
		return invoiceno;
	}
	public void setInvoiceno(int invoiceno) {
		this.invoiceno = invoiceno;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHsn() {
		return hsn;
	}
	public void setHsn(String hsn) {
		this.hsn = hsn;
	}
	public float getQuantity() {
		return quantity;
	}
	public void setQuantity(float quantity) {
		this.quantity = quantity;
	}
	public float getTaxablevalue() {
		return taxablevalue;
	}
	public void setTaxablevalue(float taxablevalue) {
		this.taxablevalue = taxablevalue;
	}
	public float getTaxamount() {
		return taxamount;
	}
	public void setTaxamount(float taxamount) {
		this.taxamount = taxamount;
	}
	public float getTaxrate() {
		return taxrate;
	}
	public void setTaxrate(float taxrate) {
		this.taxrate = taxrate;
	}
	public float getNetamount() {
		return netamount;
	}
	public void setNetamount(float netamount) {
		this.netamount = netamount;
	}
	public float getItemunitprice() {
		return itemunitprice;
	}
	public void setItemunitprice(float itemunitprice) {
		this.itemunitprice = itemunitprice;
	}
	public String getItemuom() {
		return itemuom;
	}
	public void setItemuom(String itemuom) {
		this.itemuom = itemuom;
	}
	
	
}
