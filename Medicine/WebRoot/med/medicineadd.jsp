<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">
	.addmedicine{
		width: 500px;
		height: 400px;
		margin: 20px auto 0 auto;
		border: 1px solid green;
		border-radius: 10px;
		box-shadow: 0 0 5px;
		text-align: center;
		display: none;
		z-index: 9998;
	}
	.addmedicine h1{
		margin: 10px 0 20px 0;
	}
	.addmedicine .item{
		width: 350px;
		height: 30px;
		line-height: 30px;
		font-size: 18px;
		margin: 3px auto;
	}
	.addmedicine .inputname{
		float: left;
		margin: 0 0 0 70px;
	}
	.addmedicine .inputText{
		float: right;
		margin: 0 30px 0 0 ;
	}
	.addmedicine .button{
		margin: 20px 0 0 0;
		width: 150px;
		height: 30px;
		font-size: 18px;
	}
</style>

<div class="dialog addmedicine">
<h1>添加药品</h1>
	<form>
		<div class="item"><p class="inputname">药品编码</p><input class="inputText isNull" type="text" name="tbMedicine.medno"/></div>
		<div class="item"><p class="inputname">药品名称</p><input class="inputText isNull" type="text" name="tbMedicine.name"/></div>
		<div class="item"><p class="inputname">厂家</p><input class="inputText isNull" type="text" name="tbMedicine.factoryadd"/></div>
		<div class="item"><p class="inputname">描述</p><input class="inputText isNull" type="text" name="tbMedicine.description"/></div>
		<div class="item"><p class="inputname">价格</p><input onkeyup="this.value=this.value.replace(/[^0-9\.]/g,'')" class="inputText isNull" type="text" name="tbMedicine.price"/></div>
		<%--<div class="item"><p class="inputname">数量</p><input onkeyup="this.value=this.value.replace(/[^\d]/g,'')" class="inputText isNull" type="text" name="tbMedicine.medcount"/></div>--%>
		<div class="item">
			<p class="inputname">类别名称</p>
			<select class="inputText" name="tbMedicine.categoryid">
				<!-- <optgroup>
					<option value="">儿童用药</option>
					<option>感冒用药</option>
				</optgroup> --> 
			</select>
		</div>
		<button class="button save" type="button" onclick="addmedicine()" >添加药品</button>
		<input class="button close" type="button" value="取消保存" />
	</form>
</div>

<script type="text/javascript">
function getCategory(){
	$.post('medicineAction/getCategory.action',function(data){
		var html = "<optgroup>";
		for(var i =0;i<data.length;i++){
			html+='<option value="'+data[i].id+'">'+data[i].name+'</option>';
		}
		html += "</optgroup>";
		$('.addmedicine select.inputText').html(html);
		$('.updatemedicine select.inputText').html(html);
	},"json");
}
function addmedicine(){
	if(isCheck($(".addmedicine .isNull"))){
		$.post("medicineAction/addmedicine.action",serializeObject($(".addmedicine form")),function(data){
			$(".addmedicine").css("display","none");
			if(data){
				TABLE.reload();
			}else{
				alert("添加失败")
			}
		},"json");
	}
}
</script>