<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>



<script>
	function loadorder(){
		$('#cpgl_qrdd_tab').datagrid('load');
	}
	
	function reloadOrder(){
		$('#cpgl_qrdd_tab').datagrid('reload');
	}
	/**
	 * 删除订单
	 */
	function deleteOrder(){
		var rows = $('#cpgl_qrdd_tab').datagrid('getSelections');
		if(rows.length==0){
			$.messager.show({
				title:'提示',
				msg:'请选择需要操作的内容',
			});
			return;
		}
		var ids = [];
		for (var i =0;i<rows.length;i++) {
			if(rows[i].orderstatu=='N'){
				ids.push(rows[i].id);
			}
		}
		if(ids.length>0){
			$.getJSON('merchandiseController/deleteOrders',{ids:ids},function(data){
				reloadOrder();
				$.messager.show({
					title:'提示',
					msg:data.msg,
				});
			})			
		}else{
			$.messager.show({
				title:'提示',
				msg:'已经完成订单不可删除',
			});
			return;
		}

	}
	
	/**
	 * 完成订单
	 */
	function confirmOrder(){
		var row = $('#cpgl_qrdd_tab').datagrid('getSelected');
		if(row==null){
			$.messager.show({
				title:'提示',
				msg:'请选择需要操作的内容',
			});
			return;
		}
		
		if(row!=null){
			var proorder ={
				id:row.id,
				pid:row.pid,
				quantity:row.quantity,
				orderstatu:row.orderstatu,
			}
			$.getJSON('merchandiseController/updateOrders',proorder,function(data){
				reloadOrder();
				$.messager.show({
					title:'提示',
					msg:data.msg,
				});
			})			
		}else{
			$.messager.show({
				title:'提示',
				msg:'已经完成订单不可修改',
			});
			return;
		}
	}
	/**
	 * 设置订单样式
	 * @param {Object} value
	 * @param {Object} row
	 * @param {Object} index
	 */
	function cellorderstatu(value,row,index){
		if(value=='N'){
			return 'background-color:#ffee00;color:red;';
		}
	}
	
</script>
<!-- ***********************订单管理**************************** -->

<table id="cpgl_qrdd_tab" class="easyui-datagrid"  
		data-options="
			url:'merchandiseController/queryOrders',
			method:'get',
			fit:true,
			fitColumns:true,
			singleSelect:true,
			sortName:'orderstatu',
			sortOrder:'asc',
			pagination:true,
			pageSize:10,
			idField: 'id',
			toolbar:'#cpgl_qrdd_toobar',
			onBeforeSelect:function(index,row){
				if(row.orderstatu=='Y')
				return false;
			},
">
	<thead>
		<tr>
			<th data-options="field:'id',hidden:true">订单ID</th>
			<th data-options="field:'proid'">订单编号</th>
			<th data-options="field:'usname',formatter:function(value,row){
				return row.user.usname;
			}">下单人</th>
			<th data-options="field:'placetime',sortable:true">下单时间</th>
			<th data-options="field:'closingtime'">完成时间</th>
			<th data-options="field:'pname',formatter:function(value,row){
				return row.info.pname;
			}">商品名称</th>
			<th data-options="field:'orderstatu',sortable:true,formatter:function(value,row){
				return value=='N'?'未完成':'已完成';
			},styler:cellorderstatu">订单状态</th>
			<th data-options="field:'price',formatter:function(value,row){
				return row.info.price;
			}">商品价格</th>
			<th data-options="field:'quantity'">订单数量</th>
			<th data-options="field:'total'">订单总价</th>
		</tr>
	</thead>
</table>

<!-- ************表格工具栏************* -->
<div id="cpgl_qrdd_toobar" style="padding:10px 0 10px 10px;">
		<a href="javascript:deleteOrder()" class="easyui-linkbutton" iconCls="icon-add">删除订单</a>
		<a href="javascript:confirmOrder()" class="easyui-linkbutton" iconCls="icon-add">确认完成</a>
		<a href="javascript:loadorder()" class="easyui-linkbutton" iconCls="icon-reload">刷新</a>
</div>

