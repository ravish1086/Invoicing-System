package com.first.DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.first.DAO.PartyInterface;
import com.first.bean.Party;


public class PartyInterfaceImplementation implements PartyInterface {

Connection con=null;
PreparedStatement ps=null;
Statement st=null;
ResultSet rs=null;
{
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
	
		} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
			}
		}
	
	

	
	@Override
	public boolean insertParty(Party party) throws SQLException {
		boolean b=false;
		try{
		ps=con.prepareStatement("insert into party values(?,?,?,?,?,?,?,?)");
		ps.setInt(1, party.getPartyId());
		ps.setString(2,party.getPartyGstin());
		ps.setString(3, party.getPartyName());
		ps.setString(4, party.getPartyPhone());
		ps.setString(5, party.getPartyAdd());
		ps.setString(6, party.getPartyPan());
		ps.setString(7, party.getEmailId());
		ps.setString(8, party.getSupplyState());
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

	@Override
	public boolean deleteParty(int pid) throws SQLException {
		boolean b=false;
		try{
		ps=con.prepareStatement("delete from party where partyid=?");
		ps.setInt(1,pid);
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

	@Override
	public boolean updateParty(Party party) throws SQLException {
		boolean b=false;
		
		try{
		
        ps=con.prepareStatement("update party set partygstin=?,partyname=?,partyphone=?,partyadd=?,partypan=?,emailid=?,supplystate=? WHERE PARTYid=?"); 		
        
		ps.setString(1, party.getPartyGstin());
		ps.setString(2, party.getPartyName());
		ps.setString(3, party.getPartyPhone());
		ps.setString(4, party.getPartyAdd());
		ps.setString(5, party.getPartyPan());
		ps.setString(6, party.getEmailId());
		ps.setString(7, party.getSupplyState());
		ps.setInt(8, party.getPartyId());
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

	@Override
	public List<Party> getAll() throws SQLException {
		List<Party> list=new ArrayList<>();
		try
		{
			//List<Party> list=new ArrayList<>();
		st=con.createStatement();
		 rs=st.executeQuery("select * from party order by Partyid");
			while(rs.next())
			{   
				Party party=new Party();
				party.setPartyId(rs.getInt(1));
				party.setPartyGstin(rs.getString(2));
				party.setPartyName(rs.getString(3));
				party.setPartyPhone(rs.getString(4));
				party.setPartyAdd(rs.getString(5));
				party.setPartyPan(rs.getString(6));
				party.setEmailId(rs.getString(7));
				party.setSupplyState(rs.getString(8));
				list.add(party);
			}
			//return list;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally 
		{
			con.close();
		}
	   
		//return null;
		return list;
	}

	@Override
	public Party searchParty(int pid) throws SQLException {
		Party party=new Party();
		try
		{
			ps=con.prepareStatement("select * from party where partyid=?");
		    ps.setInt(1, pid);
		    rs=ps.executeQuery();
		    if(rs.next())
		    {	
		    	//Party party=new Party();
		    	party.setPartyId(rs.getInt(1));
				party.setPartyGstin(rs.getString(2));
				party.setPartyName(rs.getString(3));
				party.setPartyPhone(rs.getString(4));
				party.setPartyAdd(rs.getString(5));
				party.setPartyPan(rs.getString(6));
				party.setEmailId(rs.getString(7));
				party.setSupplyState(rs.getString(8));
				//return party;
		    }
		    
		    //con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally 
		{
			con.close();
		}
		
		return party;
	}

	@Override
	public int generateId() throws SQLException {
	
		int i=0;
		try{
		st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from party order by partyid desc");
		if(rs.next())
		{
			i=rs.getInt(1);
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
		return i+1;
		
	}


	
}
