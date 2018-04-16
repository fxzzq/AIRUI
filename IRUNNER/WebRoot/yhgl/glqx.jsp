<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script type="text/javascript">

function menuload(){
	$('#yhgl_glqx_tab').datagrid('load');
}

function menuReload(){
	$('#yhgl_glqx_tab').datagrid('reload');
}
/**
添加新的权限
*/
function addMenu(){
	if($('#yhgl_glqx_tab_mname').validatebox('isValid')){
		$.post('userController/addMenu',{
			'memethod':$('#yhgl_glqx_tab_memethod').val(),
			'mname':$('#yhgl_glqx_tab_mname').val(),
		},function(data){
			menuReload();
			$.messager.show({
				title:'提示',
				msg:data.msg,
			})
		},'json')
	}
}
/**
删除权限
*/

function deleteMenu(){
	var rows=$('#yhgl_glqx_tab').datagrid('getChecked');
	var ids = [];
	if(rows.length>0){
		for(var i =0;i<rows.length;i++){
			ids.push(rows[i].meid);
		}
	}else{
		$.messager.show({
			title:'提示',
			msg:'参数异常',
		})
	}
	if(ids.length>0){
		$.getJSON('userController/deleteMenus',{ids:ids},function(data){
			menuReload();
			$.messager.show({
				title:'提示',
				msg:data.msg,
			})
		})
	}
	
}
</script>


<table id="yhgl_glqx_tab" class="easyui-datagrid" toolbar="#yhgl_glqx_tab_toolbar"
	url="userController/queryglqx" method="get" sortName="meid" sortOrder="asc"
	data-options="pagination:true,pageSize:5,fit:true,border : false,pageList : [ 5, 10 ],">
	<thead>
		<tr>
			<th data-options="field:'meid',width:20,checkbox:true">权限编码</th>
			<th data-options="field:'mname',width:200,align:'center'">权限名称</th>
		</tr>
	</thead>
</table>
<div id="yhgl_glqx_tab_toolbar">
	<input id="yhgl_glqx_tab_memethod" class="easyui-textbox easyui-validatebox" data-options="prompt:'输入权限'" required>
	<input id="yhgl_glqx_tab_mname" class="easyui-textbox easyui-validatebox" data-options="prompt:'权限描述'" required>
	<a href="javascript:addMenu()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加权限</a>
	<a href="javascript:deleteMenu()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除权限</a>
	<a href="javascript:menuload()" class="easyui-linkbutton" iconCls="icon-reload" plain="true">刷新</a>
</div>



