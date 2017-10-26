<%@page import="java.sql.SQLException"%>
<%@ page pageEncoding="UTF-8" import="com.orilore.dao.*"%>
<% 
	String sid = request.getParameter("id");
	int n = 0;
	if(sid!=null && !"".equals(sid)){
		int id = Integer.parseInt(sid);
		IStudentDAO dao = new StudentDAO();
		try{
			dao.delete(id);
			n = 1;
		}catch(SQLException ex){
			n = 0;
		}
	}
	response.sendRedirect("students.jsp?n="+n);
%>
