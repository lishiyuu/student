package com.orilore.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.orilore.entitys.Clazz;

public class ClassDAO extends ParentDAO implements IClassDAO {
	@Override
	public void insert(Clazz bean) throws SQLException {
		try {
			String sql = "insert into class(name) values(?)";
			this.conn = DB.getConnection();
			this.ps = this.conn.prepareStatement(sql);
			this.ps.setString(1, bean.getName());
			this.ps.executeUpdate();
		} finally {
			this.close();
		}
	}

	@Override
	public void update(Clazz bean) throws SQLException {
		try {
			String sql = "update class set name=? where id=?";
			this.conn = DB.getConnection();
			this.ps = this.conn.prepareStatement(sql);
			this.ps.setString(1, bean.getName());
			this.ps.setInt(2, bean.getId());
			this.ps.executeUpdate();
		} finally {
			this.close();
		}
	}

	@Override
	public void delete(int id) throws SQLException {
		try {
			String sql = "delete from class where id=?";
			this.conn = DB.getConnection();
			this.ps = this.conn.prepareStatement(sql);
			this.ps.setInt(1, id);
			this.ps.executeUpdate();
		} finally {
			this.close();
		}
	}

	@Override
	public Clazz selectOne(int id) throws SQLException {
		Clazz bean = null;
		try {
			String sql = "select * from class where id=?";
			this.conn = DB.getConnection();
			this.ps = this.conn.prepareStatement(sql);
			this.ps.setInt(1, id);
			this.rs = this.ps.executeQuery();
			if(this.rs.next()){
				bean = new Clazz();
				bean.setId(this.rs.getInt("id"));
				bean.setName(this.rs.getString("name"));
			}
		} finally {
			this.close();
		}
		return bean;
	}

	@Override
	public List<Clazz> select() throws SQLException {
		List<Clazz> beans = new ArrayList<Clazz>();
		try {
			String sql = "select * from class order by id desc";
			this.conn = DB.getConnection();
			this.ps = this.conn.prepareStatement(sql);
			this.rs = this.ps.executeQuery();
			while(this.rs.next()){
				Clazz bean = new Clazz();
				bean.setId(this.rs.getInt("id"));
				bean.setName(this.rs.getString("name"));
				beans.add(bean);
			}
		} finally {
			this.close();
		}
		return beans;
	}
}
