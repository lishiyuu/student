package com.orilore.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.orilore.entitys.Student;

public class StudentDAO extends ParentDAO implements IStudentDAO {
	@Override
	public void insert(Student bean) throws SQLException {
		try {
			String sql = "insert into student(name,sex,birthday,age,cid) values(?,?,?,?,?)";
			this.conn = DB.getConnection();
			this.ps = this.conn.prepareStatement(sql);
			this.ps.setString(1, bean.getName());
			this.ps.setString(2, bean.getSex());
			this.ps.setString(3, bean.getBirthday()); 
			this.ps.setInt(4, bean.getAge());
			this.ps.setInt(5, bean.getCid());
			this.ps.executeUpdate();
		} finally {
			this.close();
		}
	}

	@Override
	public void update(Student bean) throws SQLException {
		try {
			String sql = "update student set name=?,sex=?,birthday=?,age=?,cid=? where sid=?";
			this.conn = DB.getConnection();
			this.ps = this.conn.prepareStatement(sql);
			this.ps.setString(1, bean.getName());
			this.ps.setString(2, bean.getSex());
			this.ps.setString(3, bean.getBirthday());
			this.ps.setInt(4, bean.getAge());
			this.ps.setInt(5, bean.getCid());
			this.ps.setInt(6, bean.getSid());
			this.ps.executeUpdate();
		} finally {
			this.close();
		}
	}

	@Override
	public void delete(int id) throws SQLException {
		try {
			String sql = "delete from student where sid=?";
			this.conn = DB.getConnection();
			this.ps = this.conn.prepareStatement(sql);
			this.ps.setInt(1, id);
			this.ps.executeUpdate();
		} finally {
			this.close();
		}
	}

	@Override
	public Student selectOne(int id) throws SQLException {
		Student bean = null;
		try {
			String sql = "select * from student where sid=?";
			this.conn = DB.getConnection();
			this.ps = this.conn.prepareStatement(sql);
			this.ps.setInt(1, id);
			this.rs = this.ps.executeQuery();
			if(this.rs.next()){
				bean = new Student();
				bean.setSid(this.rs.getInt("sid"));
				bean.setName(this.rs.getString("name"));
				bean.setAge(this.rs.getInt("age"));
				bean.setSex(this.rs.getString("sex"));
				bean.setBirthday(this.rs.getString("birthday"));
				bean.setCid(this.rs.getInt("cid"));
			}
		} finally {
			this.close();
		}
		return bean;
	}

	@Override
	public List<Student> select() throws SQLException {
		List<Student> beans = new ArrayList<Student>();
		try {
			String sql = "select * from student";
			this.conn = DB.getConnection();
			this.ps = this.conn.prepareStatement(sql);
			this.rs = this.ps.executeQuery();
			while(this.rs.next()){
				Student bean = new Student();
				bean.setSid(this.rs.getInt("sid"));
				bean.setName(this.rs.getString("name"));
				bean.setAge(this.rs.getInt("age"));
				bean.setSex(this.rs.getString("sex"));
				bean.setBirthday(this.rs.getString("birthday"));
				bean.setCid(this.rs.getInt("cid"));
				beans.add(bean);
			}
		} finally {
			this.close();
		}
		return beans;
	}

}
