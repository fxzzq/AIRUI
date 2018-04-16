<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">
	.addmanager{
		width: 500px;
		height: 300px;
		margin: 20px auto 0 auto;
		border: 1px solid green;
		border-radius: 10px;
		box-shadow: 0 0 5px;
		text-align: center;
		display: none;
	}
	.addmanager h1{
		margin: 10px 0 20px 0;
	}
	.addmanager .item{
		width: 350px;
		height: 30px;
		line-height: 30px;
		font-size: 18px;
		margin: 3px auto;
	}
	.addmanager .inputname{
		float: left;
		margin: 0 0 0 70px;
	}
	.addmanager .inputText{
		float: right;
		margin: 0 30px 0 0 ;
	}
	.addmanager .button{
		margin: 20px 0 0 0;
		width: 150px;
		height: 30px;
		font-size: 18px;
	}
</style>

<div class="dialog addmanager">
<h1>添加管理员</h1>
	<form>
		<div class="item"><p class="inputname">用户账号</p><input class="inputText" type="text" name="tbUser.username"/></div>
		<div class="item"><p class="inputname">账号密码</p><input class="inputText" type="password" name="tbUser.password"/></div>
		<button class="button save" type="button" onclick="addmanager()" >添加管理员</button>
		<input class="button close" type="button" value="取消保存" />
	</form>
</div>

<script type="text/javascript">

$(function(){
	$(".addmanager .close").on("click",function(){
		$(".addmanager").css("display","none");
	});
	$(".addmanager input[name='tbUser.username']").on("blur",function(){
		var this_=this;
		$.post("systemAction/checkUsername.action",{"tbUser.username":$(this_).val()},function(data){
			if(!data){
				console.log(this_)
				warning({
					element:this_,
					text:"用户名已存在!"
				});
			}
		},"json");
		
	});
});

function  addmanager(){
	$.post("systemAction/addmanager.action",serializeObject($(".addmanager form")),function(data){
		$(".addmanager").css("display","none");
		if(data){
			TABLE.reload();
		}else{
			alert("添加管理员失败");
		}
	},"json");
}

</script>