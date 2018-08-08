package com.first.DAO;
import com.first.bean.*;

import java.sql.SQLException;
import java.util.*;

public interface ItemInterface {
	public boolean insertItem(Item item) throws SQLException;
	public boolean updateItem(Item item) throws SQLException;
	public Item searchItem(int itemId) throws SQLException;
	public boolean deleteItem(int itemId) throws SQLException;
	public int generateId() throws SQLException;
	public List<Item> getAll() throws SQLException;
	

}
