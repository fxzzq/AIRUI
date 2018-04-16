<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script type="text/javascript">
function loadType(){
	$('#cpgl_cplb_tab').treegrid('load');
}

function addType(){
	$('#cpgl_cplb_addType_dialog').dialog({
		title:'添加产品类别' ,
		width:'500px',
		modal:true,
		onBeforeOpen:function(){
			$('#cpgl_cplb_add_parend').combobox({
				url:'merchandiseController/queryParentNodes',
		        valueField: 'ptid',    
        		textField: 'ptype',
				method:"get",
				width:'200px',
				required:true,
				value:'0',
			})
		},
		buttons:[{
			text:'ok',
			iconCls:'icon-ok',
			handler:function(){
				var parm = serializeObject($('#cpgl_cplb_addType_form'));
				$.post('merchandiseController/addType',parm,function(data){
					$('#cpgl_cplb_addType_dialog').dialog('close')
					loadType();
					$.messager.show({
						title:'提示',
						msg:data.msg
					})
				},'json');
			},
		}]
	})
}

function deleteType(){
	var rows = $('#cpgl_cplb_tab').treegrid('getChildren');
	var ids =[];
	$(rows).each(function(){
		if(this.checkState=='checked'){
			ids.push(this.ptid);
		}
	});
	if(ids.length>0){
		$.getJSON('merchandiseController/deleteSelectTypes',{ids:ids},function(data){
			loadType();
			$.messager.show({
				title:'提示',
				msg:data.msg
			})
		})
	}else{
		$.messager.show({
			title:'提示',
			msg:'请选中删除项',
		})
	}
	
}

/**
编辑行
*/
var editingId;
function editType(){
	if (editingId != undefined){
		$('#cpgl_cplb_tab').treegrid('select', editingId);
		return;
	}
	var row = $('#cpgl_cplb_tab').treegrid('getSelected');
	if (row){
		editingId = row.ptid
		$('#cpgl_cplb_tab').treegrid('beginEdit', editingId);
	}	
	
}
/**
退出行编辑
*/

function canceleditType(){
	if (editingId != undefined){
		$('#cpgl_cplb_tab').treegrid('cancelEdit', editingId);
		editingId = undefined;
	}
}

/**
更新编辑的内容
*/

function saveType(){
	if (editingId != undefined){
		var t = $('#cpgl_cplb_tab');
		t.treegrid('select', editingId);
		var row = t.treegrid('getSelected');
		t.treegrid('endEdit', editingId);
		editingId = undefined;
		console.info(row)
		$.post('merchandiseController/updateType',row,function(data){
			$.messager.show({
				title:'提示',
				msg:data.msg,
			})			
		},'json')
	}else{
		$.messager.show({
			title:'提示',
			msg:'请选中编辑行',
		})
		return ;
	}	
}
</script>
<!-- ************************* -->
<table id="cpgl_cplb_tab" toolbar="#cpgl_cplb_tab_toolbar"  class="easyui-treegrid"
data-options="
	fit:true,
	animate: true,
	collapsible: true,
	fitColumns: true,
	url: 'merchandiseController/queryTypeTree',
	method: 'get',
	idField: 'ptid',
	treeField: 'ptype',
	border:false,
	singleSelect:true,
	checkbox:true,
">
<thead>
	<tr>
		<th data-options="field:'ptype',width:180,editor:'text'">商品类别</th>
	</tr>
</thead>
</table>
<!-- ********************************************* -->
<div id="cpgl_cplb_tab_toolbar" style="padding:10px 0 10px 10px;">
	<a href="javascript:addType()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加类别</a>
	<a href="javascript:deleteType()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除类别</a>
	<a href="javascript:editType()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">编辑选中</a>
	<a href="javascript:saveType()" class="easyui-linkbutton" iconCls="icon-save" plain="true">保存编辑内容</a>
	<a href="javascript:canceleditType()" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">退出编辑</a>
	<a href="javascript:loadType()" class="easyui-linkbutton" iconCls="icon-reload" plain="true">刷新</a>
</div>

<!-- ****************************************** -->
<div id="cpgl_cplb_addType_dialog">
	<form id="cpgl_cplb_addType_form" >
		<table   style="padding: 20px;width:100%;">
			<tr>
				<th>选择父节点：</th>
				<td><select id="cpgl_cplb_add_parend" name="maintype"></select></td>
			</tr>
			<tr>
				<th>节点名称：</th>
				<td><input class="easyui-textbox easyui-validatebox" name="ptype" style="width:200px" data-options="required:true,validType:'chinese'"></td>
			</tr>
			<tr>
				<th>子节点状态：</th>
				<td>
					<select class="easyui-combobox" name="state" width="200px">
						<option value="closed">有子节点</option> 
						<option value="">没有子节点</option> 
					</select>
				</td>
			</tr>
		</table>
	</form>
	<p style="text-indent: 30px;font-size: 14px; padding: 20px;">说明:需要指定所添加类别的父节点和子节点，如果子节点为空则说明该节点类型没有子节点</p>
</div>
