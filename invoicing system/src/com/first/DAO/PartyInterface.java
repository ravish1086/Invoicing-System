package com.first.DAO;
import com.first.bean.*;

import java.sql.SQLException;
import java.util.List;


public interface PartyInterface {
	
public boolean insertParty(Party party) throws SQLException;
public boolean deleteParty(int pid) throws SQLException;
public boolean updateParty(Party party) throws SQLException;
public List<Party> getAll() throws SQLException;
public Party searchParty(int pid) throws SQLException;
public int generateId() throws SQLException;
}
