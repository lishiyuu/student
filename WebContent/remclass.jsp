<%@page import="java.sql.SQLException"%>
<%@ page pageEncoding="UTF-8" import="com.orilore.dao.*"%>
<% 
	String cid = request.getParameter("id");
	if(cid!=null && !"".equals(cid)){
		int id = Integer.parseInt(cid);
		IClassDAO dao = new ClassDAO();
		try{
			dao.delete(id);
		}catch(SQLException ex){
			
		}
	}
	response.sendRedirect("class.jsp");
%>
