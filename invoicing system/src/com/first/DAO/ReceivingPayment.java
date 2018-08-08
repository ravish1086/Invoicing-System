package com.first.DAO;

import java.sql.*;
import com.first.bean.*;



public class ReceivingPayment {
    
	Connection con=null;
	ResultSet rs=null;
	Statement st=null;
	PreparedStatement ps=null;
	
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public boolean PaymentDetails(Payment payment)
	{
		boolean b=false;
		try{
		ps=con.prepareStatement("insert into payment values(?,?,?,?,?)");
		ps.setString(1, payment.getCustomername());
		ps.setString(2, payment.getDate());
		ps.setString(3, payment.getPaymentmode());
		ps.setString(4, payment.getDetails());
		ps.setFloat(5, payment.getAmount());
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
		
		return b;
	}
	
public float CustomerInvoiceAmount(String custName) throws SQLException{
		float invoicetotal = 0f;
		try{
		ps=con.prepareStatement("select sum(invoicevalue) from basicinvoiceinfo where partyname=? group by partyname");
		ps.setString(1, custName);
		rs=ps.executeQuery();
		if(rs.next())
		{
			invoicetotal=rs.getFloat(1);
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
		return invoicetotal;
}	

public float CustomerPaymentAmount(String custName)throws SQLException
{
	float paymenttotal=0f;
	
	try{
		ps=con.prepareStatement("select sum(amount) from payment where name=? group by name");
		ps.setString(1, custName);
		rs=ps.executeQuery();
		if(rs.next())
		{
			paymenttotal=rs.getFloat(1);
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		finally
		{
			System.out.println(paymenttotal);
			con.close();
		}
	
	
	return paymenttotal;
}

}
