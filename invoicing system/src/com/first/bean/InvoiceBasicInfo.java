package com.first.bean;

public class InvoiceBasicInfo {
	
	private int invoiceNO;
	private String partyName;
	private String partyGstin;
	private String supplyState;
	private String date; 
	private float invoiceValue;
	private float taxableValue;
	private float cgstAmt;
	private float sgstAmt;
	private float igstamt;
	private String invoicestatus;
	
	public InvoiceBasicInfo()
	{
		
	}
	public InvoiceBasicInfo(int invoiceNO, String partyName, String partyGstin, String supplyState, String date,float taxableValue,
			float invoiceValue,  float cgstAmt, float sgstAmt, float igstamt, String invoicestatus) {
		super();
		this.invoiceNO = invoiceNO;
		this.partyName = partyName;
		this.partyGstin = partyGstin;
		this.supplyState = supplyState;
		this.date = date;
		this.invoiceValue = invoiceValue;
		this.taxableValue = taxableValue;
		this.cgstAmt = cgstAmt;
		this.sgstAmt = sgstAmt;
		this.igstamt = igstamt;
		this.invoicestatus = invoicestatus;
	}
	public int getInvoiceNO() {
		return invoiceNO;
	}
	public void setInvoiceNO(int invoiceNO) {
		this.invoiceNO = invoiceNO;
	}
	public String getPartyName() {
		return partyName;
	}
	public void setPartyName(String partyName) {
		this.partyName = partyName;
	}
	public String getPartyGstin() {
		return partyGstin;
	}
	public void setPartyGstin(String partyGstin) {
		this.partyGstin = partyGstin;
	}
	public String getSupplyState() {
		return supplyState;
	}
	public void setSupplyState(String supplyState) {
		this.supplyState = supplyState;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public float getInvoiceValue() {
		return invoiceValue;
	}
	public void setInvoiceValue(float invoiceValue) {
		this.invoiceValue = invoiceValue;
	}
	public float getTaxableValue() {
		return taxableValue;
	}
	public void setTaxableValue(float taxableValue) {
		this.taxableValue = taxableValue;
	}
	public float getCgstAmt() {
		return cgstAmt;
	}
	public void setCgstAmt(float cgstAmt) {
		this.cgstAmt = cgstAmt;
	}
	public float getSgstAmt() {
		return sgstAmt;
	}
	public void setSgstAmt(float sgstAmt) {
		this.sgstAmt = sgstAmt;
	}
	public float getIgstamt() {
		return igstamt;
	}
	public void setIgstamt(float igstamt) {
		this.igstamt = igstamt;
	}
	public String getInvoicestatus() {
		return invoicestatus;
	}
	public void setInvoicestatus(String invoicestatus) {
		this.invoicestatus = invoicestatus;
	}
	
}
