<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">
	.requiredmodify{
		width: 500px;
		height: 300px;
		margin: 20px auto 0 auto;
		border: 1px solid green;
		border-radius: 10px;
		box-shadow: 0 0 5px;
		text-align: center;
		display: none;
	}
	.requiredmodify h1{
		margin: 10px 0 20px 0;
	}
	.requiredmodify .item{
		width: 350px;
		height: 30px;
		line-height: 30px;
		font-size: 18px;
		margin: 3px auto;
	}
	.requiredmodify .inputname{
		float: left;
		margin: 0 0 0 70px;
	}
	.requiredmodify .inputText{
		float: right;
		margin: 0 30px 0 0 ;
	}
	.requiredmodify .button{
		margin: 20px 0 0 0;
		width: 150px;
		height: 30px;
		font-size: 18px;
	}
</style>

<div class="dialog requiredmodify">
<h1>修改库存</h1>
	<form>
		<div class="item"><p class="inputname">药品ID</p><input class="inputText" type="text" name="tbMedicine.id" readonly="readonly"/></div>
		<div class="item"><p class="inputname">药品编码</p><input class="inputText" type="text" name="tbMedicine.medno" readonly="readonly"/></div>
		<div class="item"><p class="inputname">药品名称</p><input class="inputText" type="text" name="tbMedicine.name" readonly="readonly"/></div>
		<div class="item"><p class="inputname">进货数量</p><input class="inputText" type="text" name="tbMedicine.reqcount"/></div>
		<input class="button save" type="button" value="确认进货" onclick="requiredmodify()" />
		<input class="button close" type="button" value="取消进货" />
	</form>
</div>

<script type="text/javascript">
$(function(){
	$(".requiredmodify .close").on("click",function(){
		$(".requiredmodify").css("display","none");
	});
});
function requiredmodify(){
	$.post("requireAction/requiredmodify.action",serializeObject($(".requiredmodify form")),function(data){
		$(".requiredmodify").css("display","none");
		if(data){
			TABLE.reload();
		}else{
			alert("修改失败,必须填入数量")
		}
	},"json");
}
</script>