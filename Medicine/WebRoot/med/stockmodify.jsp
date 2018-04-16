<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">
	.stockmodify{
		width: 500px;
		height: 300px;
		margin: 20px auto 0 auto;
		border: 1px solid green;
		border-radius: 10px;
		box-shadow: 0 0 5px;
		text-align: center;
		display: none;
	}
	.stockmodify h1{
		margin: 10px 0 20px 0;
	}
	.stockmodify .item{
		width: 350px;
		height: 30px;
		line-height: 30px;
		font-size: 18px;
		margin: 3px auto;
	}
	.stockmodify .inputname{
		float: left;
		margin: 0 0 0 70px;
	}
	.stockmodify .inputText{
		float: right;
		margin: 0 30px 0 0 ;
	}
	.stockmodify .button{
		margin: 20px 0 0 0;
		width: 150px;
		height: 30px;
		font-size: 18px;
	}
</style>

<div class="dialog stockmodify">
<h1>修改库存</h1>
	<form>
		<div class="item"><p class="inputname">药品ID</p><input class="inputText" type="text" name="tbMedicine.id" readonly="readonly"/></div>
		<div class="item"><p class="inputname">药品编码</p><input class="inputText" type="text" name="tbMedicine.medno" readonly="readonly"/></div>
		<div class="item"><p class="inputname">药品名称</p><input class="inputText" type="text" name="tbMedicine.name" readonly="readonly"/></div>
		<div class="item"><p class="inputname">库存数量</p><input class="inputText" type="text" name="tbMedicine.medcount"/></div>
		<input class="button save" type="button" value="修改库存" onclick="stockmodify()" />
		<input class="button close" type="button" value="取消修改" />
	</form>
</div>

<script type="text/javascript">
$(function(){
	$(".stockmodify .close").on("click",function(){
		$(".stockmodify").css("display","none");
	});
});
function stockmodify(){
	$.post("medicineAction/stockmodify.action",serializeObject($(".stockmodify form")),function(data){
		$(".stockmodify").css("display","none");
		if(data){
			TABLE.reload();
		}else{
			alert("修改失败")
		}
	},"json");
}
</script>