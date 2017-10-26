package com.orilore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ParentDAO {
	protected Connection conn;
	protected PreparedStatement ps;
	protected ResultSet rs;
	
	public void close(){
		try {
			if(rs!=null) rs.close();
			if(ps!=null) ps.close();
			if(conn!=null && !conn.isClosed()) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
