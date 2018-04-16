<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="stock tabs">
<div class="btns">
	<a class="btn icon-edit" href="javascript:stock_manager.modify()">修改</a> 
	<a class="btn icon-reload" href="javascript:stock_manager.reload()">刷新</a>
</div>
<div class="iframe ">
	<table class="table" id="stock_manager">
		<thead>
			<tr>
				<th class="checkbox" col="id"><input type="checkbox" /></th>
				<th col="medno">药品编码</th>
				<th col="name">药品名称</th>
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
		<span>第<strong id="stock_managerpage">1</strong>页
		</span> <span>共<strong id="stock_managerpages">1</strong>页
		</span> <span>共<strong id="stock_managercounts">1</strong>条
		</span>
	</div>
</div>
</div>
<script type="text/javascript" charset="utf-8">
	function stock(){
		$(".content h4").html("库存管理");
		TABLE.datagrid("medicineAction/medicine.action", {},"stock_manager");
		
		window.stock_manager={
			reload:function(){
				TABLE.reload();
			},
			modify:function(){
				//获取修改药品的ID
				var id = null;
				var index = 0;
				var checks = $(".stock .table td.checkbox input[type='checkbox']");
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
							$('.stockmodify  input[name="tbMedicine.id"]').val(data.id);
							$('.stockmodify  input[name="tbMedicine.medno"]').val(data.medno);
							$('.stockmodify  input[name="tbMedicine.name"]').val(data.name);
							$('.stockmodify  input[name="tbMedicine.medcount"]').val(data.medcount);
							$('.stockmodify').css('display','block');
						}
					});
				}
			}
		};
		
	}

</script>

