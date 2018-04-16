<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">
	.addcategory{
		width: 500px;
		height: 250px;
		margin: 20px auto 0 auto;
		border: 1px solid green;
		border-radius: 10px;
		box-shadow: 0 0 5px;
		text-align: center;
		display: none;
	}
	.addcategory h1{
		margin: 10px 0 20px 0;
	}
	.addcategory .item{
		width: 350px;
		height: 30px;
		line-height: 30px;
		font-size: 18px;
		margin: 3px auto;
	}
	.addcategory .inputname{
		float: left;
		margin: 0 0 0 70px;
	}
	.addcategory .inputText{
		float: right;
		margin: 0 30px 0 0 ;
	}
	.addcategory .button{
		margin: 20px 0 0 0;
		width: 150px;
		height: 30px;
		font-size: 18px;
	}
</style>

<div class="dialog addcategory">
<h1>添加类别</h1>
	<form>
		<div class="item"><p class="inputname">类别名称</p><input class="inputText" type="text" name="tbCategory.name"/></div>
		<div class="item"><p class="inputname">描述</p><input class="inputText" type="text" name="tbCategory.description"/></div>
		<input class="button save" type="button" value="添加类别" onclick="addcategory()" />
		<input class="button close" type="button" value="取消保存" />
	</form>
</div>

<script type="text/javascript">

$(function(){
	$(".addcategory .close").on("click",function(){
		$(".addcategory").css("display","none");
	});
});
function  addcategory(){
	$.post("categoryAction/addcategory.action",serializeObject($(".addcategory form")),function(data){
		$(".addcategory").css("display","none");
		if(data){
			TABLE.reload();
		}else{
			alert("添加失败");
		}
	});
}



</script>