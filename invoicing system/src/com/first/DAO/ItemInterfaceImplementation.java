package com.first.DAO;
import com.first.bean.Item;



import java.util.*;
import java.util.List;
import java.sql.*;




public class ItemInterfaceImplementation implements ItemInterface {
	Connection con=null;
	Statement st=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
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

	@Override
	public boolean insertItem(Item item) throws SQLException {
		boolean b=false;
		
			try {
				ps= con.prepareStatement("insert into Item values(?,?,?,?,?,?,?)");
				ps.setInt(1,item.getItemId());
				ps.setString(2,item.getItemName());
				ps.setString(3, item.getItemHsn());
				ps.setInt(4, item.getItemTaxRate());
				ps.setFloat(5,item.getItemUnitPrice());
				ps.setString(6, item.getItemUoM());
				ps.setFloat(7,item.getItemPurchasePrice());
			int i=ps.executeUpdate();
				if(i>0)
				{
					b=true;
				}
				
					
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally
			{
				con.close();
			}
			return b;
	}

	@Override
	public boolean updateItem(Item item) throws SQLException {
		boolean b=false;
		try
		{
			ps=con.prepareStatement("update Item set itemname=?,itemhsn=?,itemtaxrate=?,itemunitprice=?,itemuom=?,itempurchaseprice=? where itemid=?");
			ps.setString(1, item.getItemName());
			ps.setString(2, item.getItemHsn());
			ps.setInt(3, item.getItemTaxRate());
			ps.setFloat(4, item.getItemUnitPrice());
			ps.setString(5, item.getItemUoM());
			ps.setFloat(6, item.getItemPurchasePrice());
			ps.setInt(7, item.getItemId());
			
			int i=ps.executeUpdate();
			if(i>0){
			b= true;
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
	public Item searchItem(int itemId) throws SQLException {
		Item item=new Item();
		
		try{
				ps=con.prepareStatement("select * from item where itemid=?");
				ps.setInt(1,itemId);
				rs=ps.executeQuery();
				if(rs.next()){
//					Item item=new Item();
				item.setItemId(rs.getInt(1));
				item.setItemName(rs.getString(2));
				item.setItemHsn(rs.getString(3));
				item.setItemTaxRate(rs.getInt(4));
				item.setItemUnitPrice(rs.getFloat(5));
				item.setItemUoM(rs.getString(6));
				item.setItemPurchasePrice(rs.getFloat(7));
				
				return item;
				}
				//con.close();
				}catch(Exception e){e.printStackTrace();}
				//return null;
		finally
		{
			con.close();
		}
				return item;
	}

	@Override
	public boolean deleteItem(int itemId) throws SQLException {
		boolean b=false;
		try
		{
			ps=con.prepareStatement("delete from item where Itemid=?");
			
			ps.setInt(1, itemId);
			int i=ps.executeUpdate();
			if(i>0)
			{
			System.out.print("item successfully deleted");
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
	public int generateId() throws SQLException {
		int id=0;
		try
		{
			st=con.createStatement();
			rs=st.executeQuery("select * from item order by itemid desc");
			if(rs.next())
			{
			id=rs.getInt(1);
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
		return id+1;
	}

	@Override
	public List<Item> getAll() throws SQLException {
	List<Item> list=new ArrayList<>();
		try{
			
			st=con.createStatement();
			rs=st.executeQuery("select * from item order by itemid ");
			while(rs.next())
			{
				Item item=new Item();
				item.setItemId(rs.getInt(1));
				item.setItemName(rs.getString(2));
				item.setItemHsn(rs.getString(3));
				item.setItemTaxRate(rs.getInt(4));
				item.setItemUnitPrice(rs.getFloat(5));
				item.setItemUoM(rs.getString(6));
				item.setItemPurchasePrice(rs.getFloat(7));
				list.add(item);
		        	
			}
			//return list;
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
		
	  //return null;
	
		return list;	
	}

}
	

