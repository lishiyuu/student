<%@ page pageEncoding="UTF-8" import="com.orilore.entitys.*,com.orilore.dao.*,java.util.*"%>
<% 
	IClassDAO dao = new ClassDAO();
	String cid = request.getParameter("id");
	String name = request.getParameter("name");
	if(name!=null && !"".equals(name)){
		Clazz zz = new Clazz();
		zz.setName(name);
		try{
			if(cid!=null && !"".equals(cid)){
				zz.setId(Integer.parseInt(cid));
				dao.update(zz);
			}else{
				dao.insert(zz);
			}
		}catch(Exception ex){
			
		}
	}
	
	List<Clazz> beans = dao.select();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
		<title>班级信息管理</title>
		<script type="text/javascript">
			function getclazz(id,name){
				document.getElementById("cid").value=id;
				document.getElementById("cname").value=name;
			}
			
			function resets(){
				document.getElementById("cid").value="";
				document.getElementById("cname").value="";
			}
		</script>
	</head>
	<body>
		<div class="container">
		<%@include file="menu.jsp"%>
			<div class="row">
				<div class="col-md-12">
					<h1>班级信息管理</h1>
					<hr/>
				</div>
			</div>
			
			<div class="row" style="margin-bottom:15px">
				<form action="class.jsp" method="post">
				<div class="col-md-10 col-xs-8">
					<input type="hidden" name="id" id="cid"/>
					<input type="text" name="name" id="cname" placeholder="请输入班级名称" class="form-control">
				</div>
				<div class="col-md-2 col-xs-4 text-right">
					<button type="button" onclick="resets()" class="btn btn-default"><i class="glyphicon glyphicon-refresh"></i> 取消</button>
					<button class="btn btn-primary"><i class="glyphicon glyphicon-floppy-disk"></i> 保存</button>
				</div>
				</form>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<table class="table table-bordered table-hover">
						<tr class="active">
							<th width="15%">序号</th>
							<th>班级名称</th>
							<th width="15%" class="text-center">编辑</th>	
							<th width="15%" class="text-center">删除</th>
						</tr>
						<% 
						for(int i=0;i<beans.size();i++){
							Clazz bean = beans.get(i);
						%>
						<tr>
							<td><%=(i+1)%></td>
							<td><%=bean.getName()%></td>
							<td class="text-center"><button onclick="getclazz(<%=bean.getId()%>,'<%=bean.getName()%>')" class="btn btn-default"><i class="glyphicon glyphicon-pencil"></i> 编辑</button></td>
							<td class="text-center"><a class="btn btn-default" href="remclass.jsp?id=<%=bean.getId()%>"><i class="glyphicon glyphicon-trash"></i> 删除</a></td>
						</tr>
					  <%}%>
					</table>
				</div>
			</div>	
		</div>
	</body>
</html>