package com.first.DAO;
import com.first.bean.*;
import java.util.*;

public interface InvoiceInterface {
	
	public boolean createInvoice(InvoiceInfo invoiceinfo);
	public boolean createInvoice2(InvoiceBasicInfo invoiceinfo);
	public int getNextInvoiceNo();
	public boolean getInvoiceStatus();
	public List<InvoiceBasicInfo> getallInvoiceInfo(String date1,String date2);
	public List<InvoiceInfo> getInvoiceSummary(String date1,String date2);
	public float getSumInvoiceValue(String date1,String date2);
	public List<InvoiceInfo> getInvoiceInfo(int invoiceno);
}
