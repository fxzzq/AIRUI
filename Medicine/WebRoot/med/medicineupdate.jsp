<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">
	.updatemedicine{
		width: 500px;
		height: 400px;
		margin: 20px auto 0 auto;
		border: 1px solid green;
		border-radius: 10px;
		box-shadow: 0 0 5px;
		text-align: center;
		display: none;
	}
	.updatemedicine h1{
		margin: 10px 0 20px 0;
	}
	.updatemedicine .item{
		width: 350px;
		height: 30px;
		line-height: 30px;
		font-size: 18px;
		margin: 3px auto;
	}
	.updatemedicine .inputname{
		float: left;
		margin: 0 0 0 70px;
	}
	.updatemedicine .inputText{
		float: right;
		margin: 0 30px 0 0 ;
	}
	.updatemedicine .button{
		margin: 20px 0 0 0;
		width: 150px;
		height: 30px;
		font-size: 18px;
	}
</style>

<div class="dialog updatemedicine">
<h1>添加药品</h1>
	<form>
		<div class="item"><p class="inputname">药品ID</p><input class="inputText" type="text" name="tbMedicine.id" readonly="readonly"/></div>
		<div class="item"><p class="inputname">药品编码</p><input class="inputText" type="text" name="tbMedicine.medno" readonly="readonly"/></div>
		<div class="item"><p class="inputname">药品名称</p><input class="inputText" type="text" name="tbMedicine.name" readonly="readonly"/></div>
		<div class="item"><p class="inputname">厂家</p><input class="inputText" type="text" name="tbMedicine.factoryadd" readonly="readonly"/></div>
		<div class="item"><p class="inputname">描述</p><input class="inputText" type="text" name="tbMedicine.description"/></div>
		<div class="item"><p class="inputname">价格</p><input class="inputText" type="text" name="tbMedicine.price"/></div>
		<input class="button save" type="button" value="修改药品" onclick="updatemedicine()" />
		<input class="button close" type="button" value="取消修改" />
	</form>
</div>

<script type="text/javascript">
function updatemedicine(){
	$.post("medicineAction/updatemedicine.action",serializeObject($(".updatemedicine form")),function(data){
		$(".updatemedicine").css("display","none");
		if(data){
			TABLE.reload();
		}else{
			alert("更新失败")
		}
	});
}
</script>