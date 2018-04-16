<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/base.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<script src="jquery/jquery-2.1.1.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
	<div id="total">
		<div id="header">
			<h1>欢迎使用SSH医疗管理系统</h1>
		</div>
		<div id="title">
			<p class="username">
				欢迎<strong>${sessionScope.username }</strong>登陆管理系统
			</p>
			<a class="loginout" href="systemAction/loginout.action">退出系统</a>
		</div>
		<div id="body">
			<jsp:include page="layout/nav.jsp"></jsp:include>
			<div class="content">
				<h4 style="text-indent: 30px;">首页</h4>
				<div class="shouye tabs" style="display: block; text-align: center;">
					<h1 style="margin: 50px 0 0 0">欢迎登陆首页</h1>
				</div>
				<jsp:include page="med/medicine.jsp"></jsp:include>
				<jsp:include page="med/stock.jsp"></jsp:include>
				<jsp:include page="catagory/catefory.jsp"></jsp:include>
				<jsp:include page="manager/manager.jsp"></jsp:include>
				<jsp:include page="required/required.jsp"></jsp:include>
				<jsp:include page="selldetail/selldetail.jsp"></jsp:include>
				<jsp:include page="selldetail/querychose.jsp"></jsp:include>
				<jsp:include page="selldetail/querySelled.jsp"></jsp:include>
				<jsp:include page="selldetail/queryToday.jsp"></jsp:include>
				<jsp:include page="selldetail/queryDate.jsp"></jsp:include>
				<jsp:include page="selldetail/orderSell.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<jsp:include page="med/medicineadd.jsp"></jsp:include>
	<jsp:include page="med/medicineupdate.jsp"></jsp:include>
	<jsp:include page="med/stockmodify.jsp"></jsp:include>
	<jsp:include page="required/requiredmodify.jsp"></jsp:include>
	<jsp:include page="catagory/categoryadd.jsp"></jsp:include>
	<jsp:include page="manager/manageradd.jsp"></jsp:include>
	<jsp:include page="manager/managerupdate.jsp"></jsp:include>
	<script src="js/base.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		$(function() {
			//设置添加药品弹窗的位置,初始化取消按钮功能
			var addw = $(window).width()/2-250+'px';
			var addh = $(window).height()/2-200+'px';
			$('.dialog').css('top',addh).css('left',addw);
			$('.addmedicine input.close').on('click',function(){
				$('.addmedicine').css('display','none');
			});
			$('.updatemedicine input.close').on('click',function(){
				$('.updatemedicine').css('display','none');
			});
			
		});
	</script>
	
<div class="warning">
	<div class="text"></div>
	<div class="arrow"></div>
</div>
</body>
</html>