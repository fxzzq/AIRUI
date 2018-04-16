<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script type="text/javascript">

function infoReload(){
	$('#cpgl_cpxx_tab').datagrid('reload');
}
function infoLoad(){
	$('#cpgl_cpxx_tab').datagrid('load');
}
/**
添加商品
*/
function addinfo(){
	$('#cpgl_cpxx_addinfo').dialog({
		title:'添加商品',
		modal:true,
		onBeforeOpen:function(){
			$('#cpgl_cpxx_addinfo_type_combobox').combobox({
				url:'merchandiseController/queryInfoType',
				valueField:'ptid',
				textField:'ptype',
				width:'180px',
				required:true,
			})
		},
		buttons:[{
			text:'ok',
			iconCls:'icon-ok',
			handler:function(){
				var f = $('#cpgl_cpxx_addinfo_form');
				if(!f.form('validate')){
					return ;
				}
				var o = serializeObject(f);
				$.post('merchandiseController/insertInfo',o,function(data){
					if(data.result){
						$('#cpgl_cpxx_tab').datagrid('insertRow',{index:0,row:data.object})
					}
					$('#cpgl_cpxx_addinfo').dialog('close');
					f.form('clear');
					$.messager.show({
						title:'提示',
						msg:data.msg,
					})
				},'json')
				
			}
		}],
	})
}
/**
删除商品
*/
function deleteInfos(){
	var t = $('#cpgl_cpxx_tab');
	var rows = t.datagrid('getSelections');
	if(rows.length==0){
		$.messager.show({
			title:'提示',
			msg:'请选择删除商品',
		})
		return;
	}
	$.messager.confirm('确认', '您是否要删除当前选中的项目？',function(fals){
		if(!fals){
			return;
		}
		var ids=[];
		for(var i=0;i<rows.length;i++){
			ids.push(rows[i].pid);
		}
		$.getJSON('merchandiseController/deleteInfos',{ids:ids},function(data){
			if(data.result){
				infoReload();
			}
			t.datagrid('unselectAll');
			$.messager.show({
				title:'提示',
				msg:data.msg,
			})
		})
	});

}
/**

清除选中
*/
function clearinfo(){
	$('#cpgl_cpxx_tab').datagrid('unselectAll');
}
/**
编辑行
*/
function editInfo(){
	var t = $('#cpgl_cpxx_tab');
	var row = t.datagrid('getSelected');
	if(row==null){
		$.messager.show({
			title:'提示',
			msg:'请选择商品',
		})
		return;
	}
	
	$('#cpgl_cpxx_editinfo').dialog({
		title:'修改商品信息',
		modal:true,
		onBeforeOpen:function(){
			$('#cpgl_cpxx_editinfo_type_combobox').combobox({
				url:'merchandiseController/queryInfoType',
				valueField:'ptid',
				textField:'ptype',
				width:'180px',
				required:true,
			})			
		},
		onOpen:function(){
			$('#cpgl_cpxx_editinfo_form').form('load',row);
		},
		buttons:[{
			text:'ok',
			iconCls:'icon-ok',
			handler:function(){
				var obj = serializeObject($('#cpgl_cpxx_editinfo_form'));
				$.post('merchandiseController/saveEditInfo',obj,function(data){
					infoReload();
					$('#cpgl_cpxx_editinfo').dialog('close');
					$('#cpgl_cpxx_editinfo_form').form('clear');
					$.messager.show({
						title:'提示',
						msg:data.msg,
					})
				},'json')
			}
		}]
	})
}
</script>
<style>
#cpgl_cpxx_addinfo_table th{
	text-align: right;
	padding: 10px 0px 10px 0px;
}
#cpgl_cpxx_addinfo_table td{
	text-align: left;
	padding: 10px 0px 10px 0px;
	text-indent: 5px;
}
</style>
<!-- ***********表格数据************** -->

<table id="cpgl_cpxx_tab" class="easyui-datagrid"  
		data-options="
			singleSelect:false,
			url:'merchandiseController/queryInfos',
			method:'get',
			fit:true,
			fitColumns:true,
			sortName:'pid',
			sortOrder:'asc',
			pagination:true,
			pageSize:10,
			idField: 'pid',
			toolbar:'#cpgl_cpxx_toobar',
">
	<thead>
		<tr>
			<th data-options="field:'pid',sortable:true,hidden:true">商品ID</th>
			<th data-options="field:'pcode',sortable:true,fixed:true">商品编码</th>
			<th data-options="field:'pname',sortable:true,fixed:true">商品名称</th>
			<th data-options="field:'price',sortable:true,editor:'numberbox'">商品价格</th>
			<th data-options="field:'pscript',editor:'text'">商品描述</th>
			<th data-options="field:'ptid',sortable:true,formatter:function(value,row,index){
				if(row.type){
					return row.type.ptype;
				}
			}">商品类别</th>
			<th data-options="field:'totalstock',sortable:true">总库存(可用库存+购物车)</th>
			<th data-options="field:'virtualstock',sortable:true">可用库存</th>
		</tr>
	</thead>
</table>
<!-- ************表格工具栏************* -->
<div id="cpgl_cpxx_toobar" style="padding:10px 0 10px 10px;">
		<a href="javascript:addinfo()" class="easyui-linkbutton" iconCls="icon-add">添加商品</a>
		<a href="javascript:deleteInfos()" class="easyui-linkbutton" iconCls="icon-remove">删除商品</a>
		<a href="javascript:clearinfo()" class="easyui-linkbutton" iconCls="icon-cancel">清除选中</a>
		<a href="javascript:editInfo()" class="easyui-linkbutton" iconCls="icon-edit">修改选中商品</a>
		<a href="javascript:infoLoad()" class="easyui-linkbutton" iconCls="icon-reload">刷新</a>
</div>

<!-- ***********添加商品窗口************** -->
<div id="cpgl_cpxx_addinfo">
	<form id="cpgl_cpxx_addinfo_form">
		<table id="cpgl_cpxx_addinfo_table" style="width: 400px;">
			<thead>
				<tr>
					<th>商品编码：</th>
					<td>
						<input name="pcode" class="easyui-textbox easyui-validatebox" data-options="iconCls:'icon-edit',required:true" style="width:180px"> 
					</td>
				</tr>
				<tr>
					<th>商品名称：</th>
					<td>
						<input name="pname" class="easyui-textbox easyui-validatebox" data-options="iconCls:'icon-edit',required:true" style="width:180px">
					</td>
				</tr>
				<tr>
					<th>商品价格：</th>
					<td>
						<input name="price" class="easyui-textbox easyui-validatebox" data-options="iconCls:'icon-edit',required:true" style="width:180px">
					</td>
				</tr>
				<tr>
					<th>商品商品描述：</th>
					<td>
						<textarea name="pscript" cols="18" class="easyui-textbox easyui-validatebox" data-options="multiline:true,required:true,iconCls:'icon-edit'" ></textarea>
					</td>
				</tr>
				<tr>
					<th>商品类别：</th>
					<td>
						<select name="ptid" id="cpgl_cpxx_addinfo_type_combobox"></select>
					</td>
				</tr>
			</thead>
		</table>
	</form>
</div>
<!-- ***********修改商品窗口************** -->
<div id="cpgl_cpxx_editinfo">
	<form id="cpgl_cpxx_editinfo_form">
		<table id="cpgl_cpxx_addinfo_table" style="width: 400px;">
			<thead>
				<tr style="display: none;">
					<th>商品id：</th>
					<td>
						<input name="pid" class="easyui-textbox" readonly style="width:180px"> 
					</td>
				</tr>
				<tr>
					<th>商品编码：</th>
					<td>
						<input name="pcode" class="easyui-textbox"  readonly style="width:180px"> 
					</td>
				</tr>
				<tr>
					<th>商品名称：</th>
					<td>
						<input name="pname" class="easyui-textbox easyui-validatebox" data-options="iconCls:'icon-edit',required:true" style="width:180px">
					</td>
				</tr>
				<tr>
					<th>商品价格：</th>
					<td>
						<input name="price" class="easyui-textbox easyui-validatebox" data-options="iconCls:'icon-edit',required:true" style="width:180px">
					</td>
				</tr>
				<tr>
					<th>商品商品描述：</th>
					<td>
						<textarea name="pscript" cols="18" class="easyui-textbox easyui-validatebox" data-options="multiline:true,required:true,iconCls:'icon-edit'" ></textarea>
					</td>
				</tr>
				<tr>
					<th>商品类别：</th>
					<td>
						<select name="ptid" id="cpgl_cpxx_editinfo_type_combobox"></select>
					</td>
				</tr>
			</thead>
		</table>
	</form>
</div>