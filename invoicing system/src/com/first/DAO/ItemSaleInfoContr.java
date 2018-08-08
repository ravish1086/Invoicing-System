package com.first.DAO;
import com.first.bean.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ItemSaleInfoContr {
	
	Connection con=null;
	ResultSet rs=null;
	Statement st=null;
	PreparedStatement ps=null;
	
	{
		 try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con =	DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
	
		  } catch (Exception e) {
			
			e.printStackTrace();
		}	
	}

	public boolean setInfo(ItemSaleInfo info) throws SQLException
	{
		boolean b=false;
		try{
		 ps=con.prepareStatement("insert into itemsalereport values(?,?,?,?,?,?,?,?,?,?,?)");
		 ps.setInt(1, info.getInvoiceno());
		 ps.setString(2,info.getDate());
		 ps.setString(3, info.getName());
		 ps.setString(4, info.getHsn());
		 ps.setFloat(5, info.getQuantity());
		 ps.setFloat(6, info.getTaxablevalue());
		 ps.setFloat(7, info.getTaxamount());
		 ps.setFloat(8, info.getTaxrate());
		 ps.setFloat(9, info.getNetamount());
		 ps.setFloat(10, info.getItemunitprice());
		 ps.setString(11, info.getItemuom());
		 int i=ps.executeUpdate();
		 if(i>0)
		 {
			 b=true;
		 }
		
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			con.close();
		}
		
		
		
		return b;
		
	}
    
	public float getsuminvoice(String date1, String date2)
	{
		float sum=0;
		try
		{
			ps=con.prepareStatement("select sum(netamount) from itemsalereport  where dated between to_date(?,'yyyy-mm-dd') And to_date(?,'yyyy-mm-dd')");
			ps.setString(1, date1);
			ps.setString(2, date2);
			rs=ps.executeQuery();
			if(rs.next())
			{
				sum=rs.getInt(1);
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return sum;
	}
	public List<ItemSaleInfo> getInfo(ItemSaleInfo info) throws SQLException
	{
		List<ItemSaleInfo> infolist=new ArrayList<>();
		try{
		 ps=con.prepareStatement("select * from itemsalereport where invoiceno=? order by cgstrate");
		 ps.setInt(1, info.getInvoiceno());
		rs=ps.executeQuery();
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			con.close();
		}
		
		
		
		return infolist;
		
	}
	
}
