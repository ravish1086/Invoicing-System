package com.first.DAO;
import com.first.bean.*;
import java.sql.*;

public class ItemPurchaseInfoContr {
	
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
		 ps=con.prepareStatement("insert into itempurchasereport values(?,?,?,?,?,?,?,?,?)");
		 ps.setInt(1, info.getInvoiceno());
		 ps.setString(2,info.getDate());
		 ps.setString(3, info.getName());
		 ps.setString(4, info.getHsn());
		 ps.setFloat(5, info.getQuantity());
		 ps.setFloat(6, info.getTaxablevalue());
		 ps.setFloat(7, info.getTaxamount());
		 ps.setFloat(8, info.getTaxrate());
		 ps.setFloat(9, info.getNetamount());
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
    
	
}
