package com.orilore.dao;

import java.sql.SQLException;
import java.util.List;

import com.orilore.entitys.Student;

public interface IStudentDAO {
	public void close();
	public void insert(Student bean) throws SQLException;
	public void update(Student bean) throws SQLException;
	public void delete(int id) throws SQLException;
	public Student selectOne(int id) throws SQLException;
	public List<Student> select() throws SQLException;
}
