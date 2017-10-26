<%@ page pageEncoding="UTF-8" import="java.util.*,com.orilore.entitys.*"%>
<jsp:useBean id="dao" class="com.orilore.dao.StudentDAO"/>
<%
	List<Student> students = dao.select();
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>学员信息列表</title>
<script type="text/javascript">
	setTimeout(function(){
		document.getElementById("msg").innerHTML = "";
	},3000);
</script>
</head>
<body>
	<div class="container">
		<%@include file="menu.jsp"%>
	
		<div class="row">
			<div class="col-md-12">
				<h1>学员信息列表</h1>
				<hr/>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12" id="msg">
				<% 
				String n = request.getParameter("n");
				if(n!=null && n.equals("0")){
				%>
				<div class="alert alert-danger">
				学员信息操作失败！
				</div>
				<%	
				}else if(n!=null && n.equals("1")){
				%>	
				<div class="alert alert-success">
				学员信息操作成功！
				</div>
				<%	
				}
				%>
			</div>
		</div>	
		<div class="row">
			<div class="col-md-12">
				<div class="table-responsive">
				<table class="table table-bordered table-hover">
					<tr class="active">
						<th width="10%">序号</th>
						<th>班级</th>
						<th>姓名</th>
						<th>性别</th>
						<th>生日</th>
						<th>年龄</th>
						<th width="10%" class="text-center">编辑</th>
						<th width="10%" class="text-center">删除</th>
					</tr>
					<% 
					for(int i=0;i<students.size();i++){
					Student s = students.get(i);
					%>
					<tr>
						<td><%=(i+1)%></td>
						<td><%=s.getCid()%></td>
						<td><%=s.getName()%></td>
						<td><%=s.getSex()%></td>
						<td><%=s.getBirthday()%></td>
						<td><%=s.getAge()%></td>
						<td class="text-center">
							<a class="btn btn-default" href="student.jsp?id=<%=s.getSid()%>"><i class="glyphicon glyphicon-pencil"></i> 编辑</a>
						</td>
						<td class="text-center">
							<a class="btn btn-default" href="remstudent.jsp?id=<%=s.getSid()%>"><i class="glyphicon glyphicon-trash"></i> 删除</a>
						</td>
					</tr>
					<% 
					}
					%>
				</table>
				</div>
			</div>
		</div>
	</div>	
</body>
</html>