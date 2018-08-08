package com.first.bean;

public class Party {

	private int partyId;
	private String partyGstin;
	private String partyName;
	private String partyPhone;
	private String partyAdd;
	private String partyPan;
    private String emailId;
    private String supplyState;
    public Party()
    {
    	
    }
    
    
	public Party(int partyId, String partyGstin, String partyName, String partyPhone, String partyAdd,
			String partyPan, String emailId, String supplyState) {
		super();
		this.partyId = partyId;
		this.partyGstin = partyGstin;
		this.partyName = partyName;
		this.partyPhone = partyPhone;
		this.partyAdd = partyAdd;
		this.partyPan = partyPan;
		this.emailId = emailId;
		this.supplyState = supplyState;
	}
	public String getSupplyState() {
		return supplyState;
	}
	public void setSupplyState(String supplyState) {
		this.supplyState = supplyState;
	}
	public int getPartyId() {
		return partyId;
	}
	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}
	public String getPartyGstin() {
		return partyGstin;
	}
	public void setPartyGstin(String partyGstin) {
		this.partyGstin = partyGstin;
	}
	public String getPartyName() {
		return partyName;
	}
	public void setPartyName(String partyName) {
		this.partyName = partyName;
	}
	public String getPartyPhone() {
		return partyPhone;
	}
	public void setPartyPhone(String partyPhone) {
		this.partyPhone = partyPhone;
	}
	public String getPartyAdd() {
		return partyAdd;
	}
	public void setPartyAdd(String partyAdd) {
		this.partyAdd = partyAdd;
	}
	public String getPartyPan() {
		return partyPan;
	}
	public void setPartyPan(String partyPan) {
		this.partyPan = partyPan;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
    
}
