package com.first.DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.first.bean.InvoiceBasicInfo;
import com.first.bean.InvoiceInfo;


public class InvoiceInterfaceImplementation implements InvoiceInterface{
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	PreparedStatement ps=null; 
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		  con =	DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	
	
	public boolean createInvoice(InvoiceInfo invoiceinfo)
	{   
		boolean b=false;
		try {
			ps=con.prepareStatement("insert into invoiceinfo values(?,?,?,?,?,to_date(?,'dd-mm-yyyy'),?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1,invoiceinfo.getInvoiceId());
			ps.setInt(2, invoiceinfo.getInvoiceNO());
			ps.setString(3, invoiceinfo.getPartyName());
			ps.setString(4, invoiceinfo.getPartyGstin());
			ps.setString(5, invoiceinfo.getSupplyState());
			ps.setString(6,invoiceinfo.getDate());
			ps.setFloat(7, invoiceinfo.getTaxableValue());
			ps.setFloat(8, invoiceinfo.getInvoiceValue());
			ps.setFloat(9, invoiceinfo.getSgstRate());
			ps.setFloat(10, invoiceinfo.getCgstRate());
			ps.setFloat(11, invoiceinfo.getSgstAmt());
			ps.setFloat(12, invoiceinfo.getSgstAmt());
			ps.setFloat(13, invoiceinfo.getIgstRate());
			ps.setFloat(14, invoiceinfo.getIgstamt());
			ps.setString(15, invoiceinfo.getInvoicestatus());
			ps.setString(16, invoiceinfo.getPartypan());
			ps.setString(17, invoiceinfo.getPartyphone());
			ps.setString(18, invoiceinfo.getPartyadd());
			int i1 = ps.executeUpdate();
			
			
			
		 if(i1>0)
			{
				b= true;
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
		
	}

	public boolean createInvoice2(InvoiceBasicInfo invoiceinfo)
	{   
		boolean b=false;
		try {
			ps=con.prepareStatement("insert into basicinvoiceinfo values(?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, invoiceinfo.getInvoiceNO());
			ps.setString(2, invoiceinfo.getPartyName());
			ps.setString(3, invoiceinfo.getPartyGstin());
			ps.setString(4, invoiceinfo.getSupplyState());
			ps.setString(5,invoiceinfo.getDate());
			ps.setFloat(6, invoiceinfo.getTaxableValue());
			ps.setFloat(7, invoiceinfo.getInvoiceValue());
			ps.setFloat(8, invoiceinfo.getSgstAmt());
			ps.setFloat(9, invoiceinfo.getSgstAmt());
			ps.setFloat(10, invoiceinfo.getIgstamt());
			ps.setString(11, invoiceinfo.getInvoicestatus());
		 int i1 = ps.executeUpdate();
		 if(i1>0)
			{
				b= true;
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
		
	}
	@Override
	public int getNextInvoiceNo() {
		int i=0;
		try {
			st=con.createStatement();
			rs=st.executeQuery("select invoiceno from invoiceinfo order by invoiceno desc");
			if(rs.next())
			{
				i=rs.getInt(1);
			}
		con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i+1;
	}

	@Override
	public boolean getInvoiceStatus() {
		// TODO Auto-generated method stub
		return false;
	}

	

	@Override
	public List<InvoiceBasicInfo> getallInvoiceInfo(String date1,String date2) {
		List<InvoiceBasicInfo> invoicelist=new ArrayList<>();
		InvoiceBasicInfo invoiceinfo=null;
		try{
		
		ps=con.prepareStatement("select * from basicinvoiceinfo where dated between to_date(?,'yyyy-mm-dd') And to_date(?,'yyyy-mm-dd') order by invoiceno");
		ps.setString(1, date1);
		ps.setString(2, date2);
		rs=ps.executeQuery();
		while(rs.next())
		{
			invoiceinfo=new InvoiceBasicInfo();
			
			invoiceinfo.setInvoiceNO(rs.getInt(1));
			invoiceinfo.setPartyName(rs.getString(2));
			invoiceinfo.setPartyGstin(rs.getString(3));
			invoiceinfo.setSupplyState(rs.getString(4));
			invoiceinfo.setDate(rs.getString(5));
			invoiceinfo.setTaxableValue(rs.getFloat(6));
			invoiceinfo.setInvoiceValue(rs.getFloat(7));
			invoiceinfo.setSgstAmt(rs.getFloat(8));
			invoiceinfo.setCgstAmt(rs.getFloat(9));
			
			invoiceinfo.setIgstamt(rs.getFloat(10));
			invoiceinfo.setInvoicestatus(rs.getString(11));
			invoicelist.add(invoiceinfo);
			
		}
		con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	 return invoicelist;
	}

	@Override
	public List<InvoiceInfo> getInvoiceSummary(String date1,String date2) {
		List<InvoiceInfo> invoicelist=new ArrayList<>();
		InvoiceInfo invoiceinfo=null;
		try{
		
		ps=con.prepareStatement("select * from invoiceinfo where dated between to_date(?,'yyyy-mm-dd') And to_date(?,'yyyy-mm-dd') order by invoiceno");
		
		ps.setString(1, date1);
		ps.setString(2, date2);
		 rs=ps.executeQuery();
		while(rs.next())
		{
			invoiceinfo=new InvoiceInfo();
			invoiceinfo.setInvoiceId(rs.getInt(1));
			invoiceinfo.setInvoiceNO(rs.getInt(2));
			invoiceinfo.setPartyName(rs.getString(3));
			invoiceinfo.setPartyGstin(rs.getString(4));
			invoiceinfo.setSupplyState(rs.getString(5));
			invoiceinfo.setDate(rs.getString(6));
			invoiceinfo.setInvoiceValue(rs.getFloat(8));
			invoiceinfo.setTaxableValue(rs.getFloat(7));
			invoiceinfo.setSgstRate(rs.getFloat(9));
			invoiceinfo.setCgstRate(rs.getFloat(10));
			invoiceinfo.setSgstAmt(rs.getFloat(11));
			invoiceinfo.setCgstAmt(rs.getFloat(12));
			invoiceinfo.setIgstRate(rs.getFloat(13));
			invoiceinfo.setIgstamt(rs.getFloat(14));
			invoiceinfo.setInvoicestatus(rs.getString(15));
			invoicelist.add(invoiceinfo);
		
		}
		con.close();	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	 return invoicelist;
	}

	@Override
	public float getSumInvoiceValue(String date1, String date2) {
		
		float sumInvoice=0;
		try
		{
		ps=con.prepareStatement(" select sum(invoicevalue) from basicinvoiceinfo where dated between to_date(?,'yyyy-mm-dd') And to_date(?,'yyyy-mm-dd')");
		ps.setString(1,date1);
		ps.setString(2,date2);
		rs=ps.executeQuery();
		if(rs.next())
		{
			sumInvoice=rs.getFloat(1);
		}
		con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return sumInvoice;
	}

	@Override
	public List<InvoiceInfo> getInvoiceInfo(int invoiceno) {
		
		List<InvoiceInfo> invoicelist=new ArrayList<>();
		InvoiceInfo invoiceinfo=null;
		try{
		
		ps=con.prepareStatement("select * from invoiceinfo where invoiceno=?");
		ps.setInt(1,invoiceno);
		
		 rs=ps.executeQuery();
		while(rs.next())
		{
			invoiceinfo=new InvoiceInfo();
			invoiceinfo.setInvoiceId(rs.getInt(1));
			invoiceinfo.setInvoiceNO(rs.getInt(2));
			invoiceinfo.setPartyName(rs.getString(3));
			invoiceinfo.setPartyGstin(rs.getString(4));
			invoiceinfo.setSupplyState(rs.getString(5));
			invoiceinfo.setDate(rs.getString(6));
			invoiceinfo.setInvoiceValue(rs.getFloat(8));
			invoiceinfo.setTaxableValue(rs.getFloat(7));
			invoiceinfo.setSgstRate(rs.getFloat(9));
			invoiceinfo.setCgstRate(rs.getFloat(10));
			invoiceinfo.setSgstAmt(rs.getFloat(11));
			invoiceinfo.setCgstAmt(rs.getFloat(12));
			invoiceinfo.setIgstRate(rs.getFloat(13));
			invoiceinfo.setIgstamt(rs.getFloat(14));
			invoiceinfo.setInvoicestatus(rs.getString(15));
			invoiceinfo.setPartypan(rs.getString(16));
			invoiceinfo.setPartyphone(rs.getString(17));
			invoiceinfo.setPartyadd(rs.getString(18));
			invoicelist.add(invoiceinfo);
		
		}
		con.close();	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	 return invoicelist;
	}
	

}
