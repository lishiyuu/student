<%@ page pageEncoding="UTF-8" import="com.orilore.entitys.*,com.orilore.dao.*,java.util.*"%>
<%
	String sid = request.getParameter("id");	
	if(sid!=null && !"".equals(sid)){
		IStudentDAO sdao = new StudentDAO();
		Student student = sdao.selectOne(Integer.parseInt(sid));
		pageContext.setAttribute("s",student);
	}

	IClassDAO dao = new ClassDAO();
	List<Clazz> cs = dao.select();
%>
<!DOCTYPE html>
<html>
<head>
	<title>学员注册</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
	<script type="text/javascript">
		window.onload = function(){
			var select = document.getElementById("cid");
			var cid = '${s.cid}';
			if(cid!=''){
				select.value = cid;
			}
			
			var sex = '${s.sex}';
			if(sex!=''){
				if(sex=='女'){
					document.getElementById("m").checked = false;
					document.getElementById("w").checked = true;
				}else{
					document.getElementById("m").checked = true;
					document.getElementById("w").checked = false;
				}
			}
		}
	</script>
</head>
<body>
	<div class="container">
		<%@include file="menu.jsp"%>
		<div class="row">
			<div class="col-md-12">
				<h1>学员注册</h1>
				<hr/>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
			<form action="savestudent.jsp" method="post">
			<input type="hidden" name="sid" value="${s.sid}">
			<div class="form-group">
				<label class="control-label">班级</label>
				<select class="form-control" name="cid" id="cid">
					<option value="0">请选择班级</option>
					<% 
					for(Clazz c : cs){
					%>
					<option value="<%=c.getId()%>"><%=c.getName()%></option>
					<%
					}
					%>
				</select>
			</div>
			<div class="form-group">
				<label class="control-label">姓名</label>
				<input placeholder="请输入姓名" value="${s.name}" class="form-control" name="name">
			</div>
			<div class="form-group">
				<label class="control-label">性别</label>
				<input id="m" name="sex" value="男" type="radio" checked>男
				<input id="w" name="sex" value="女" type="radio">女
			</div>
			<div class="form-group">
				<label class="control-label">生日</label>
				<input type="date" name="birthday" value="${s.birthday}" class="form-control">
			</div>
			<div class="form-group">
				<label class="control-label">年龄</label>
				<input type="number" name="age" value="${s.age}" class="form-control">
			</div>
			<div class="form-group">
				<button class="btn btn-primary pull-right">保存</button>
			</div>
			</form>
			</div>
		</div>
	</div>
</body>
</html>