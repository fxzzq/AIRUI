<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String base = request.getScheme() + "://" + request.getLocalAddr() + ":" + request.getLocalPort()
			+ request.getContextPath() + "/";
%>
<html>
<head>
<base href="<%=base%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="static/JQuery1.8.3/jquery-1.8.3.min.js"></script>
</head>
<body>
	<h1>修改部门员工</h1>
	<div style="width: 400px; margin: auto; font-size: 20px;">
		<form action="empAction/update.action" method="post">
			<p><input name="empno" type="hidden" value="${emp.empno }"></p>
			<p>姓名：<input name="ename" readonly="readonly" value="${emp.ename }"></p>
			<p>工资：<input name="sal" value="${emp.sal }"></p>
			<p>奖金：<input name="comm" value="${emp.comm }"></p>
			<script type="text/javascript">
			
			$(function(){
				$.getJSON('empAction/getJobs.action',function(data){
					var val = $("#job").val();
					var html = "";
					for(var i = 0;i<data.length;i++){
						html+="<option value="+data[i]+">"+data[i]+"</option>";
					}
					$("#job").html(html);
					$("#job").val(val);
				})
			})
				
			</script>
			<p>职位：
				<select id="job" name="job">
					<option value="${emp.job }">${emp.job}</option>
				</select>
			</p>
			<script type="text/javascript">
			
			$(function(){
				$.getJSON('empAction/getMgrs.action',function(data){
					var val = $("#mgr").val();
					var html = "";
					for(var key in data){
						html+="<option value="+key+">"+data[key]+"</option>";
					}
					$("#mgr").html(html);
					$("#mgr").val(val);
				})
			})
			</script>
			<p>领导：
				<select id="mgr" name="mgr">
					<option value="${emp.mgr }">${emp.mgr}</option>
				</select>
			</p>
			<script type="text/javascript">
			
			$(function(){
				$.getJSON('deptAction/getDeptnos.action',function(data){
					var val = $("#deptno").val();
					var html = "";
					for(var index in data){
						html+="<option value="+data[index]["deptno"]+">"+data[index]["dname"]+"</option>";
					}
					$("#deptno").html(html);
					$("#deptno").val(val);
				})
			})
			</script>
			<p>部门：
				<select id="deptno" name="deptno">
					<option value="${emp.deptno }">${emp.deptno}</option>
				</select>
			</p>
			<p><input type="submit" value="提交"></p>
		</form>
	</div>
</body>
</html>