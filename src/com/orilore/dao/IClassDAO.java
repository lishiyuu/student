package com.orilore.dao;

import java.sql.SQLException;
import java.util.List;

import com.orilore.entitys.Clazz;

public interface IClassDAO {
	public void close();
	public void insert(Clazz bean) throws SQLException;
	public void update(Clazz bean) throws SQLException;
	public void delete(int id) throws SQLException;
	public Clazz selectOne(int id) throws SQLException;
	public List<Clazz> select() throws SQLException;
}