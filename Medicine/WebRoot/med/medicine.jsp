<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<script type="text/javascript">
	function medicine() {
		$(".content h4").html("药品管理");
		TABLE.datagrid("medicineAction/medicine.action", {},"medicine_manager");
		window.medicine_manager = {};
		medicine_manager.reload = TABLE.reload;
		medicine_manager.remove = function() {
			TABLE.remove("medicineAction/remove.action", function(data) {
				if(data){
					TABLE.reload();
				}
			});
		}
		//添加药品
		medicine_manager.add = function(){
			$('.addmedicine').css('display','block');
			getCategory();
		}
		//修改药品
		medicine_manager.modify=function(){
			//获取修改药品的ID
			var id = null;
			var index = 0;
			var checks = $(".medicine .table td.checkbox input[type='checkbox']");
			for(var i =0;i<checks.length;i++){
				if(checks[i].checked){
					index++;
					id=$(checks[i]).val();
				}
			}
			if(index==0){
				alert("必须选中修改项")
			}else if(index>1){
				alert("一次只能修改一条数据")
			}else if(index==1){
				$.getJSON('medicineAction/getUpdateEntity.action',{"tbMedicine.id":id},function(data){
					if(data){
						$('.updatemedicine input[name="tbMedicine.id"]').val(data.id);
						$('.updatemedicine input[name="tbMedicine.medno"]').val(data.medno);
						$('.updatemedicine input[name="tbMedicine.name"]').val(data.name);
						$('.updatemedicine input[name="tbMedicine.factoryadd"]').val(data.factoryadd);
						$('.updatemedicine input[name="tbMedicine.description"]').val(data.description);
						$('.updatemedicine input[name="tbMedicine.price"]').val(data.price);
						$('.updatemedicine select[name="tbMedicine.categoryid"]').val(data.categoryid);
						$('.updatemedicine').css('display','block');
					}
				});
			}
		}
	}
</script>

<div class="medicine tabs">
<div class="btns">
	<a class="btn icon-remove" href="javascript:medicine_manager.remove()">删除</a> 
	<a class="btn icon-edit" href="javascript:medicine_manager.modify()">修改</a> 
	<a class="btn icon-add" href="javascript:medicine_manager.add()">添加</a> 
	<a class="btn icon-reload" href="javascript:medicine_manager.reload()">刷新</a>
</div>
<div class="iframe ">
	<table class="table" id="medicine_manager">
		<thead>
			<tr>
				<th class="checkbox" col="id"><input type="checkbox" /></th>
				<th col="medno">药品编码</th>
				<th col="name">药品名称</th>
				<th col="price">单价</th>
				<%--<th col="medcount">库存数量</th>--%>
				<th col="factoryadd">出厂地址</th>
				<th col="description">功效描述</th>
			</tr>
		</thead>
	</table>
</div>
<div class="pagenation">
	<div class="left">
		<a href="javascript:TABLE.first()" class="first">首页</a> 
		<a href="javascript:TABLE.last()" class="last">上一页</a> 
		<a href="javascript:TABLE.next()" class="next">下一页</a> 
		<a href="javascript:TABLE.end()" class="end">尾页</a>
	</div>
	<div class="right">
		<span>第<strong id="medicine_managerpage">1</strong>页
		</span> <span>共<strong id="medicine_managerpages">1</strong>页
		</span> <span>共<strong id="medicine_managercounts">1</strong>条
		</span>
	</div>
</div>
</div>
