<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">
	.updatemanager{
		width: 500px;
		height: 300px;
		margin: 20px auto 0 auto;
		border: 1px solid green;
		border-radius: 10px;
		box-shadow: 0 0 5px;
		text-align: center;
		display: none;
	}
	.updatemanager h1{
		margin: 10px 0 20px 0;
	}
	.updatemanager .item{
		width: 350px;
		height: 30px;
		line-height: 30px;
		font-size: 18px;
		margin: 3px auto;
	}
	.updatemanager .inputname{
		float: left;
		margin: 0 0 0 70px;
	}
	.updatemanager .inputText{
		float: right;
		margin: 0 30px 0 0 ;
	}
	.updatemanager .button{
		margin: 20px 0 0 0;
		width: 150px;
		height: 30px;
		font-size: 18px;
	}
</style>

<div class="dialog updatemanager">
<h1>添加管理员</h1>
	<form>
		<div class="item"><p class="inputname">用户ID</p><input class="inputText" type="text" name="tbUser.id" readonly="readonly"/></div>
		<div class="item"><p class="inputname">用户账号</p><input class="inputText" type="text" name="tbUser.username" readonly="readonly"/></div>
		<div class="item"><p class="inputname">账号密码</p><input class="inputText" type="password" name="tbUser.password"/></div>
		<button class="button save" type="button" onclick="updatemanager()" >修改密码</button>
		<input class="button close" type="button" value="取消修改" />
	</form>
</div>

<script type="text/javascript">

$(function(){
	$(".updatemanager .close").on("click",function(){
		$(".updatemanager").css("display","none");
	});
});

function  updatemanager(){
	$.post("systemAction/updatemanager.action",serializeObject($(".updatemanager form")),function(data){
		$(".updatemanager").css("display","none");
		if(data){
			TABLE.reload();
		}else{
			alert("修改密码失败");
		}
	},"json");
}

</script>