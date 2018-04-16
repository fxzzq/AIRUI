<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	application.setAttribute("basePath", basePath);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>奔跑者体育商城后台管理</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="static/jquery-easyui-1.5.2/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="static/jquery-easyui-1.5.2/themes/icon.css">
<script type="text/javascript" src="static/jquery-easyui-1.5.2/jquery.min.js"></script>
<script type="text/javascript" src="static/jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
<script type="text/javascript" src="static/jsutils/base.js"></script>
<style type="text/css">
h1,p {
	margin: 0;
	padding: 0;
	color: #666;
}

#header h1 {
	height: 100px;
	line-height: 100px;
	text-align: center;
}
</style>
<script type="text/javascript">
	$(function() {
		numberInputPlaceholder();
	});
	/**
	 easyui number placeholder
	 */
	function numberInputPlaceholder() {
		$(".easyui-numberbox").each(
				function(i) {
					var span = $(this).siblings("span")[0];
					var targetInput = $(span).find("input:first");
					if (targetInput) {
						$(targetInput).attr("placeholder",
								$(this).attr("placeholder"));
					}

				});
	}
</script>
</head>

<body class="easyui-layout">

	<div id="header" data-options="region:'north'" style="height:100px; overflow: hidden;">
		<h1>欢迎使用springMVC-spring-MyBatis系统测试</h1>
	</div>
	<div data-options="region:'west'" style="width:200px;">
		<jsp:include page="layout/west.jsp"></jsp:include>
	</div>
	<!-- <div data-options="region:'east',title:'east',split:true" style="width:200px;"></div> -->
	<div data-options="region:'center',title:'欢迎使用SSHE示例系统'" style="overflow: hidden;">
		<jsp:include page="layout/center.jsp"></jsp:include>
	</div>
	<div id="footer" data-options="region:'south'" style="height:20px;">
		<p></p>
	</div>

</body>
</html>
