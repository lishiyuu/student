<%@ page pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="dao" class="com.orilore.dao.StudentDAO"/>
<jsp:useBean id="b" class="com.orilore.entitys.Student" scope="page"/>
<jsp:setProperty property="*" name="b"/>
<%
	int n = 0;
	try{
		if(b.getSid()>0){
			dao.update(b);
		}else{
			dao.insert(b);	
		}
		n=1;
	}catch(Exception ex){
		n = 0;
	}
	response.sendRedirect("students.jsp?n="+n);
%>
