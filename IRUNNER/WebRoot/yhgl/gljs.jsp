<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function(){
	
})

function  roleReload(){
	$("#yhgl_gljs_tab").datagrid("reload");
}

function  roleload(){
	$("#yhgl_gljs_tab").datagrid("load");
}
/**
添加新角色
*/
function addRole(){
	
	$("#yhgl_gljs_addRole_dialog").dialog({
		title:"添加新角色",
		modal:true,
		width:"400px",
		onBeforeOpen:function(){
			$("#yhgl_gljs_addRole_form_desc").combotree({
				url:"userController/queryMenus",
				method:"get",
				multiple:true,
				width:'200px',
				required:true,
			})
		},
		buttons:[{
			text:'ok',
			iconCls:'icon-ok',
			handler:function(){
				var o = serializeObject($("#yhgl_gljs_addRole_form"))
				$.post("userController/addRole",o,function(data){
					roleReload();
					$("#yhgl_gljs_addRole_dialog").dialog("close");
					$.messager.show({
						title:'提示',
						msg : data.msg
					})
				},'json')
			},
		}],
	})
	
}

/**
删除角色
*/
function deleteRole(){
	var ids = [];
	var rows=$('#yhgl_gljs_tab').datagrid("getChecked");
	if(rows.length>0){
		for(var i =0;i<rows.length;i++){
			if(rows[i].rid!=null){
				ids.push(rows[i].rid);
			}
		}
	}
	if(ids.length>0){
		$.getJSON('userController/deleteRole',{ids:ids},function(data){
			roleReload();
			$.messager.show({
				title:'提示',
				msg:data.msg,
			})
		})
	}
	
}
/**
修改角色权限
*/
function updateRole(){
	
	var rows = $('#yhgl_gljs_tab').datagrid('getChecked');
	
	var row = null;
	if(rows.length==1){
		row = rows[0];
		
		$('#yhgl_gljs_updateRole_dialog').dialog({
			title:'修改角色权限',
			modal:true,
			onBeforeOpen:function(){
				$('#yhgl_gljs_updateRole_form').form('load',row);
				var menus = row.menus;
				var val = [];
				for(var i =0;i<menus.length;i++){
					val.push(menus[i].meid);
				}
				$("#yhgl_gljs_updateRole_form_desc").combotree({
					url:"userController/queryMenus",
					method:"get",
					multiple:true,
					width:'200px',
					required:true,
					onLoadSuccess:function(){
						$('#yhgl_gljs_updateRole_form_desc').combotree('setValue',val);
					},
				})
			},
			buttons:[{
				text:'ok',
				iconCls:'icon-ok',
				handler:function(){
					var o = serializeObject($("#yhgl_gljs_updateRole_form"))
					$.post("userController/updateRole",o,function(data){
						roleReload();
						$("#yhgl_gljs_updateRole_dialog").dialog("close");
						$.messager.show({
							title:'提示',
							msg : data.msg
						})
					},'json')
				},
			}]
		})
	}else{
		$.messager.show({
			title:'提示',
			msg:'参数异常，请重新选择数据'
		})
		$('#yhgl_gljs_tab').datagrid('unselectAll');
	}
}

</script>
<table id="yhgl_gljs_tab" class="easyui-datagrid" toolbar="#yhgl_gljs_tab_toolbar"
	url="userController/querygljs" method="get" sortName="rid" sortOrder="asc"
	data-options="pagination:true,pageSize:5,fit:true,border : false,pageList : [ 5, 10 ],fitColumns:true,">
	<thead>
		<tr>
			<th data-options="field:'rid',width:20,checkbox:true">角色编码</th>
			<th data-options="field:'rname',width:80,align:'center'">角色名称</th>
			<th data-options="field:'description',width:350,align:'left'">角色描述</th>
		</tr>
	</thead>
</table>
<div id="yhgl_gljs_tab_toolbar">
	<a href="javascript:addRole()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加角色</a>
	<a href="javascript:deleteRole()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除角色</a>
	<a href="javascript:updateRole()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改角色</a>
	<a href="javascript:roleload()" class="easyui-linkbutton" iconCls="icon-reload" plain="true">刷新</a>
</div>

<div id="yhgl_gljs_addRole_dialog">
	<form id="yhgl_gljs_addRole_form">
		<table>
			<tr>
				<th>角色名称</th>
				<td>
					<input class="easyui-textbox easyui-validatebox" data-options="required:true,width:'200px'" name="rname">
				</td>
			</tr>
			<tr>
				<th>角色描述</th>
				<td>
					<select id="yhgl_gljs_addRole_form_desc" name="description"></select>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="yhgl_gljs_updateRole_dialog">
	<form id="yhgl_gljs_updateRole_form">
		<table>
			<tr style="display: none;">
				<th>角色ID</th>
				<td>
					<input class="easyui-textbox easyui-validatebox" data-options="width:'200px'" readonly name="rid">
				</td>
			</tr>
			<tr>
				<th>角色名称</th>
				<td>
					<input class="easyui-textbox easyui-validatebox" data-options="width:'200px'" readonly name="rname">
				</td>
			</tr>
			<tr>
				<th>角色描述</th>
				<td>
					<select id="yhgl_gljs_updateRole_form_desc" name="description"></select>
				</td>
			</tr>
		</table>
	</form>
</div>




