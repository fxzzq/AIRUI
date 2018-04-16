<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'login.jsp' starting page</title>

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
<script type="text/javascript">
	$(function(){
		//设置居中
		var t = ($(window).width()-$('#login_panel').width())/2;
		$('#login_panel').css('left',t+'px');
		$('#login_panel').animate({
			opacity:1,
		},1000)
	})
	
	function submitForm(){
		var f = $('#login_form');
		if(!f.form('validate')){
			$.messager.show({
				title:'提示',
				msg:'请输入用户名和密码',
			})
		}
		var parm = serializeObject(f);
		
		$.getJSON('systemController/login',parm,function(data){
			if(data.result){
				window.location.href='manager.jsp';
			}
			$.messager.show({
				title:'提示',
				msg:data.msg,
			})
		})
	}
</script>
<style type="text/css">
body{
	margin: 0;
	padding: 0;
}
#login_panel{
	width:400px;
	text-align: center;
	position: absolute;
	margin-top: 100px;
	opacity:0.1;
}
#login_tab td{
		text-align: center;
}
</style>
</head>
<body style="background: url('static/imgs/bg.jpg' ) no-repeat;">
	<div id="login_panel" >
	<div class="easyui-panel" title="登陆系统">
		<div style="padding:30px;">
			<form id="login_form">
				<table id="login_tab" cellpadding="10" style="width: 100%;">
					<tr>
						<td>
							<input class="easyui-textbox easyui-validatebox" name="usname" data-options="iconCls:'icon-man',prompt:'username',type:'text',iconAlign:'left',required:true" style="width:200px;height: 30px;"/> 
						</td>
					</tr>
					<tr>
						<td>
							<input class="easyui-textbox easyui-validatebox" name="passwd" data-options="iconCls:'icon-lock',prompt:'********',type:'password',iconAlign:'left',required:true" style="width:200px;height: 30px;"/> 
						</td>
					</tr>
				</table>
			</form>
			<div style="text-align:center;padding:5px">
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()"><span style="font-size: 16px;padding: 10px;">登陆系统</span></a> 
			</div>
		</div>
	</div>
	</div>
</body>
</html>
