<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="querychose tabs">
<div class="btns">
	<a class="btn icon-add" href="javascript:querychose_manager.pay()">付款</a>
	<a class="btn icon-reload" href="javascript:querychose_manager.reload()">刷新</a>
</div>
<div class="iframe ">
	<table class="table" id="querychose_manager">
		<thead>
			<tr>
				<th class="checkbox" col="id"><input type="checkbox" /></th>
				<th col="medicine.medno">药品编码</th>
				<th col="medicine.name">药品名称</th>
				<th col="medicine.price">单价</th>
				<th col="sellcount">购买数量</th>
				<th col="selltime">购买时间</th>
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
		<span>第<strong id="querychose_managerpage">1</strong>页
		</span> <span>共<strong id="querychose_managerpages">1</strong>页
		</span> <span>共<strong id="querychose_managercounts">1</strong>条
		</span>
	</div>
</div>
</div>
<script type="text/javascript">
function querychose() {
	$(".content h4").html("查看选购");
	TABLE.datagrid("sellDetailAction/querychose.action", {},"querychose_manager");
	window.querychose_manager={
			reload:TABLE.reload,
			pay:function(){
				TABLE.remove("sellDetailAction/payMedicine.action", function(data){
					if(data){
						TABLE.reload();
					}
				});
			}
	};
	
}
</script>