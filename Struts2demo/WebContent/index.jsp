<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String base = request.getScheme() + "://" + request.getLocalAddr() + ":" + request.getLocalPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=base%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- index.action -->
	<h1>index</h1>
	<s:debug></s:debug>
	<s:property value="path"/>
	<hr>
	<s:property value="#request.data[1]"/>
	${data[1] }
	<hr>
	<a href="insert.jsp">添加数据</a>
	<table border="1" cellpadding="0" cellspacing="0" style="width: 100%;">

		<thead>
			<tr>
				<th>编码</th>
				<th>姓名</th>
				<th>工作</th>
				<th>领导编码</th>
				<th>入职的时间</th>
				<th>工资</th>
				<th>奖金</th>
				<th>部门编码</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="its">

				<tr>

					<td>${its.empno }</td>
					<td>${its.ename }</td>
					<td>${its.job }</td>
					<td>${its.mgr }</td>
					<td>${its.hiredate }</td>
					<td>${its.sal }</td>
					<td>${its.comm }</td>
					<td>${its.deptno }</td>
					<td><a href="empAction/getEmp.action?empno=${its.empno }">修改</a>|<a href="empAction/delete.action?empno=${its.empno }">删除</a></td>

				</tr>

			</c:forEach>
		</tbody>
	</table>
</body>
</html>