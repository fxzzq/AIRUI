<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="selldetail tabs">
<div class="btns">
	<a class="btn icon-add" href="javascript:selldetail_manager.enter()">确认选购</a>
	<a class="btn icon-reload" href="javascript:selldetail_manager.reload()">刷新</a>
</div>
<div class="iframe ">
	<table class="table" id="selldetail_manager">
		<thead>
			<tr>
				<th class="checkbox" col="id"><input type="checkbox" /></th>
				<th col="medno">药品编码</th>
				<th col="name">药品名称</th>
				<th col="price">单价</th>
				<th col="medcount">库存数量</th>
				<th col="description">功效描述</th>
				<th col="caozuo">选购操作</th>
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
		<span>第<strong id="selldetail_managerpage">1</strong>页
		</span> <span>共<strong id="selldetail_managerpages">1</strong>页
		</span> <span>共<strong id="selldetail_managercounts">1</strong>条
		</span>
	</div>
</div>
</div>
<script type="text/javascript">
	function selldetail() {
		$(".content h4").html("购买药品");
		TABLE.datagrid("medicineAction/medicine.action", {},"selldetail_manager");
		window.medicine_manager = {};
		selldetail_manager.reload = TABLE.reload;
		selldetail_manager.enter=function(){
			var datas = {};
			var rows = $(".selldetail tbody tr");
			for(var i =0;i<rows.length;i++){
				var row = $(rows[i]).children("td").children("input");
				datas["shopcarts["+i+"].medicine.id"]= $(row[0]).val();
				datas["shopcarts["+i+"].sellcount"]= $(row[1]).val();
			}	
			$.post("sellDetailAction/enterBuy.action",datas,function(data){
				TABLE.reload();
			});
		}
		
	}
</script>