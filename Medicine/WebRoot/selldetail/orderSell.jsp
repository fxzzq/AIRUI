<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">

function orderSell(){
	$(".content h4").html("销售排行");
	TABLE.datagrid("sellDetailAction/orderSell.action", {},"orderSell_manager");
	window.orderSell_manager={
			reload:TABLE.reload
	};
}

</script>
<div class="orderSell tabs">
<div class="btns">
	<a class="btn icon-reload" href="javascript:orderSell_manager.reload()">刷新</a>
</div>
<div class="iframe ">
	<table class="table" id="orderSell_manager">
		<thead>
			<tr>
				<th col="id.medicine.medno">药品编码</th>
				<th col="id.medicine.name">药品名称</th>
				<th col="id.medicine.price">单价</th>
				<th col="id.medicine.medcount">库存数量</th>
				<th col="id.sellcount">销售总数量</th>
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
		<span>第<strong id="orderSell_managerpage">1</strong>页
		</span> <span>共<strong id="orderSell_managerpages">1</strong>页
		</span> <span>共<strong id="orderSell_managercounts">1</strong>条
		</span>
	</div>
</div>
</div>