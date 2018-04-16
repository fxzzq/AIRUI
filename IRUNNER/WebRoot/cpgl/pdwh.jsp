<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!-- ***********************产品基本数据**************************** -->
<script type="text/javascript">
/**
 * 刷新数据 
 */
function pandianLoad(){
	
	$('#cpgl_pdwh_tab').datagrid('load');
}

var infoId ;
function infoBeginEdit(){
	var t = $('#cpgl_pdwh_tab');
	if(infoId!=undefined){
		t.datagrid('unselectAll').datagrid('selectRow',infoId);
		return;
	}
	var row = t.datagrid('getSelected');
	if(row==null){
		$.messager.show({
			title:'提示',
			msg:'请选中数据',
		})	
		return;
	}
	
	infoId = t.datagrid('getRowIndex',row);
	t.datagrid('beginEdit',infoId);

}
/**
 * 退出编辑,返回编辑之前的状态
 */
function infoUndoEdit(){
	if(infoId==undefined){
		return;
	}
	var t = $('#cpgl_pdwh_tab');
	t.datagrid('unselectAll').datagrid('rejectChanges');
	infoId=undefined;
}
/**
 * 提交修改后的数据
 */
function infoSaveEdit(){
	if(infoId==undefined){
		return;
	}
	var t = $('#cpgl_pdwh_tab');
	var row=t.datagrid('unselectAll').datagrid('selectRow',infoId).datagrid('endEdit',infoId).datagrid('getSelected');
	console.info(row.shopping.orderCount)
	var count =row.shopping.orderCount==undefined?0:row.shopping.orderCount;
	var obj = {
		pid:row.pid,
		totalstock:row.totalstock,
		virtualstock:row.virtualstock,
		'shopping.orderCount':count,
	};
	$.post('merchandiseController/saveInfoStock',obj,function(data){
		if(data.result){
			t.datagrid('unselectAll');
		}else{
			t.datagrid('rejectChanges');
		}
		$.messager.show({
			title:'提示',
			msg:data.msg,
		})
		infoId=undefined;
	},'json');
}
</script>
<table id="cpgl_pdwh_tab" class="easyui-datagrid"  style="width:700px;height:250px"
		data-options="
			singleSelect:false,
			url:'merchandiseController/queryInfosStock',
			method:'get',
			fit:true,
			fitColumns:true,
			sortName:'pid',
			sortOrder:'asc',
			pagination:true,
			pageSize:10,
			idField: 'pid',
			singleSelect:true,
			toolbar:[{
				text:'修改选中库存',
				iconCls:'icon-edit',
				handler:'infoBeginEdit'
			},'-',{
				text:'提交修改',
				iconCls:'icon-save',
				handler:'infoSaveEdit'				
			},'-',{
				text:'返回编辑',
				iconCls:'icon-undo',
				handler:'infoUndoEdit'
			},'-',{
				text:'刷新',
				iconCls:'icon-reload',
				handler:'pandianLoad'				
			}]
">
	<thead>
		<tr>
			<th data-options="field:'pid',sortable:true,hidden:true">商品ID</th>
			<th data-options="field:'pcode',sortable:true,fixed:true">商品编码</th>
			<th data-options="field:'pname',sortable:true,fixed:true">商品名称</th>
			<th data-options="field:'price',sortable:true">商品价格</th>
			<th data-options="field:'totalstock',sortable:true,editor:'text'">总库存(可用库存+购物车)</th>
			<th data-options="field:'virtualstock',sortable:true,editor:'text'">可用库存</th>
			<th data-options="field:'shopping',formatter:function(value,row){
				return row.shopping.orderCount==undefined?0:row.shopping.orderCount;
			}">购物车数量</th>
		</tr>
	</thead>
</table>

