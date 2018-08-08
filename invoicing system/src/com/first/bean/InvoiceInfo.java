package com.first.bean;

public class InvoiceInfo {
	
	private int invoiceId;
	private int invoiceNO;
	private String partyName;
	private String partyGstin;
	private String supplyState;
	private String date; 
	private float invoiceValue;
	private float taxableValue;
	private float sgstRate;
	private float cgstRate;
	private float cgstAmt;
	private float sgstAmt;
	private float igstRate;
	private float igstamt;
	private String invoicestatus;
	private String partypan;
	private String partyphone;
	private String partyadd;
	public int getInvoiceId() {
		return invoiceId;
	}

	public InvoiceInfo()
	{
		
	}
	

	public InvoiceInfo(int invoiceId, int invoiceNO, String partyName, String partyGstin, String supplyState, String date,
		float  taxableValue, float invoiceValue,float sgstRate, float cgstRate, float cgstAmt, float sgstAmt,
		float igstRate, float igstamt, String invoicestatus,String partypan,String partyphone,String partyadd) {
	super();
	this.invoiceId = invoiceId;
	this.invoiceNO = invoiceNO;
	this.partyName = partyName;
	this.partyGstin = partyGstin;
	this.supplyState = supplyState;
	this.date = date;
	this.invoiceValue = invoiceValue;
	this.taxableValue = taxableValue;
	this.sgstRate = sgstRate;
	this.cgstRate = cgstRate;
	this.cgstAmt = cgstAmt;
	this.sgstAmt = sgstAmt;
	this.igstRate = igstRate;
	this.igstamt = igstamt;
	this.invoicestatus = invoicestatus;
	this.partyphone = partyphone;
	this.partyadd = partyadd;
	this.partypan = partypan;
	}

	public void setInvoiceId(int invoiceId) {
		this.invoiceId = invoiceId;
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


	public float getSgstRate() {
		return sgstRate;
	}


	public void setSgstRate(float sgstRate) {
		this.sgstRate = sgstRate;
	}


	public float getCgstRate() {
		return cgstRate;
	}


	public void setCgstRate(float cgstRate) {
		this.cgstRate = cgstRate;
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


	public float getIgstRate() {
		return igstRate;
	}


	public void setIgstRate(float igstRate) {
		this.igstRate = igstRate;
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

	public String getPartypan() {
		return partypan;
	}

	public void setPartypan(String partypan) {
		this.partypan = partypan;
	}

	public String getPartyphone() {
		return partyphone;
	}

	public void setPartyphone(String partyphone) {
		this.partyphone = partyphone;
	}

	public String getPartyadd() {
		return partyadd;
	}

	public void setPartyadd(String partyadd) {
		this.partyadd = partyadd;
	}	
}
