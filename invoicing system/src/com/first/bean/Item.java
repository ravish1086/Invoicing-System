package com.first.bean;

public class Item {
	private int itemId;
	private String itemName;
	private String itemHsn;
	private int itemTaxRate;
	private float itemUnitPrice;
	private String itemUoM;
	private float itemPurchasePrice;
	

	public Item()
	{
		
	}
	
	public Item(int itemId, String itemName, String itemHsn, int itemTaxRate, float itemUnitPrice, String itemUoM,float itemPurchasePrice) {
		super();
		this.itemId = itemId;
		this.itemName = itemName;
		this.itemHsn = itemHsn;
		this.itemTaxRate = itemTaxRate;
		this.itemUnitPrice = itemUnitPrice;
		this.itemPurchasePrice = itemPurchasePrice;
		this.itemUoM = itemUoM;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemHsn() {
		return itemHsn;
	}
	public void setItemHsn(String itemHsn) {
		this.itemHsn = itemHsn;
	}
	public int getItemTaxRate() {
		return itemTaxRate;
	}
	public void setItemTaxRate(int itemTaxRate) {
		this.itemTaxRate = itemTaxRate;
	}
	public float getItemUnitPrice() {
		return itemUnitPrice;
	}
	public void setItemUnitPrice(float itemUnitPrice) {
		this.itemUnitPrice = itemUnitPrice;
	}
	public String getItemUoM() {
		return itemUoM;
	}
	public void setItemUoM(String itemUoM) {
		this.itemUoM = itemUoM;
	}
	public float getItemPurchasePrice() {
		return itemPurchasePrice;
	}

	public void setItemPurchasePrice(float itemPurchasePrice) {
		this.itemPurchasePrice = itemPurchasePrice;
	}
	
}
