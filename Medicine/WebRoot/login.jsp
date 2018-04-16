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
<link rel="stylesheet" type="text/css" href="css/login.css" />
<script src="jquery/jquery-2.1.1.js" type="text/javascript" charset="utf-8"></script>
<script src="js/base.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		
		//设置登陆
		var l = $(window).width()/2-225;
		var t = $(window).height()/2-140;
		$("#login").css('left',l+"px").css("top",t+"px");
		$("#sre").css('left',l+"px").css("top",t+"px");
		
		
		$(".text .checkpwd").on("click",function(){
			var c = $(".text input[type='checkbox']")[0];
			if(c.checked){
				c.checked=false;
			}else{
				c.checked=true;
			}
		});
	});
	
	
	function sub(){
		return isCheck($(".check"));
	}
	
	function initapp(){
		$.getJSON('systemAction/initapp.action',function(data){
			if(data){
				alert("初始化成功。。。")
			}
		});
	}
</script>
</head>
<body>
<div id="sre"></div>
<div id="login">
	<h1>登陆窗口</h1>
	<!-- loginAction/login.action -->
	<form action="loginAction/login.action" method="post" onsubmit="return sub()">
		<div class="text"><input class="check isNull isAccont textbox username" type="text" name="tbUser.username" placeholder="输入用户名" value="" /></div>
		<div class="text"><input class="check isNull isPassword textbox password" type="password" name="tbUser.password" placeholder="******" value=""/></div>
		<div class="text" style="text-align: right; color: red; font-size:12px; font-weight: 900; height: 12px;" >${message}</div>
		<div class="text"><input style="text-indent: 0px;" class="btn" type="submit" value="登陆系统" /></div>
		<div class="text">
			<input type="checkbox" /><span class="checkpwd">记住密码</span>
			<a class="fopwd" href="##">忘记密码？</a>
		</div>
		<div class="text" style="text-align: center;"><a href="javascript:initapp()">初始化</a></div>
	</form>
</div>
<div class="warning">
	<div class="text"></div>
	<div class="arrow"></div>
</div>
</body>
</html>