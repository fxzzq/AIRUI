<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">

function queryToday(){
	$(".content h4").html("今日明细");
	TABLE.datagrid("sellDetailAction/queryToday.action", {},"queryToday_manager");
	window.queryToday_manager={
			reload:TABLE.reload
	};
}

</script>
<div class="queryToday tabs">
<div class="btns">
	<a class="btn icon-reload" href="javascript:queryToday_manager.reload()">刷新</a>
</div>
<div class="iframe ">
	<table class="table" id="queryToday_manager">
		<thead>
			<tr>
				<th class="checkbox" col="id"><input type="checkbox" /></th>
				<th col="medicine.medno">药品编码</th>
				<th col="medicine.name">药品名称</th>
				<th col="medicine.price">单价</th>
				<th col="sellcount">销售数量</th>
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
		<span>第<strong id="queryToday_managerpage">1</strong>页
		</span> <span>共<strong id="queryToday_managerpages">1</strong>页
		</span> <span>共<strong id="queryToday_managercounts">1</strong>条
		</span>
	</div>
</div>
</div>