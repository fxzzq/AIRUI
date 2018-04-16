<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="required tabs">
<div class="btns">
	<a class="btn icon-edit" href="javascript:required_manager.modify()">进货</a> 
	<a class="btn icon-edit" href="javascript:required_manager.edit()">确认进货</a> 
	<a class="btn icon-reload" href="javascript:required_manager.reload()">刷新</a>
</div>
<div class="iframe ">
	<table class="table" id="required_manager">
		<thead>
			<tr>
				<th class="checkbox" col="id"><input type="checkbox" /></th>
				<th col="medno">药品编码</th>
				<th col="name">药品名称</th>
				<th col="price">单价</th>
				<th col="medcount">库存数量</th>
				<th col="reqcount">需求数量</th>
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
		<span>第<strong id="required_managerpage">1</strong>页
		</span> <span>共<strong id="required_managerpages">1</strong>页
		</span> <span>共<strong id="required_managercounts">1</strong>条
		</span>
	</div>
</div>
</div>

<script type="text/javascript">
	function required() {
		$(".content h4").html("药品管理");
		TABLE.datagrid("medicineAction/medicine.action", {},"required_manager");
		window.required_manager = {};
		required_manager.reload = TABLE.reload;
		required_manager.modify=function(){
			var id = null;
			var index = 0;
			var checks = $(".required .table td.checkbox input[type='checkbox']");
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
						$('.requiredmodify input[name="tbMedicine.id"]').val(data.id);
						$('.requiredmodify input[name="tbMedicine.medno"]').val(data.medno);
						$('.requiredmodify input[name="tbMedicine.name"]').val(data.name);
						$('.requiredmodify input[name="tbMedicine.reqcount"]').val(data.reqcount);
						$('.requiredmodify').css('display','block');
					}
				});
			}
		}
		required_manager.edit=function(){
			var ids = [];
			var index = 0;
			var checks = $(".required .table td.checkbox input[type='checkbox']");
			for(var i =0;i<checks.length;i++){
				if(checks[i].checked){
					index++;
					ids+=$(checks[i]).val()+",";
				}
			}
			if(index==0){
				alert("至少选中一项")
			}else{
				$.post("requireAction/editRequired.action",{ids:ids},function(data){
					TABLE.reload();
				});
			}
		}
	}
</script>
