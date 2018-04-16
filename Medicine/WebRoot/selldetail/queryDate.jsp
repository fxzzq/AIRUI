<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">

function queryDate(){
	$(".content h4").html("日期查询");
	window.queryDate_manager={
			find:function(){
				alert(typeof $(".queryDate .starttime").val())
				var date = {
						startTime:$(".queryDate .starttime").val(),
						endTime:$(".queryDate .emdtime").val(),
				};
				TABLE.datagrid("sellDetailAction/queryDate.action", date,"queryDate_manager");
			}
	};
	
	
	
}

</script>
<div class="queryDate tabs">
<div class="btns">
	<b>开始时间</b><input class="starttime" type="date">
	<b>结束时间</b><input class="emdtime" type="date">
	<a class="btn icon-search" href="javascript:queryDate_manager.find()">查询</a>
</div>
<div class="iframe ">
	<table class="table" id="queryDate_manager">
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
		<span>第<strong id="queryDate_managerpage">1</strong>页
		</span> <span>共<strong id="queryDate_managerpages">1</strong>页
		</span> <span>共<strong id="queryDate_managercounts">1</strong>条
		</span>
	</div>
</div>
</div>