<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!-- ***********************采购管理**************************** -->

<script type="text/javascript">
	function orderReload(){
		
		$('#cpgl_cggl_tab').datagrid('load');
		
	}
	
	function addOrder(){
		var t = $('#cpgl_cggl_tab');
		var row = t.datagrid('getSelected');
		if(row==null){
			$.messager.show({
				title:'提示',
				msg:'请选择需要加入订单的商品',
			})
			return;
		}
		$('#cpgl_cggl_addinfo').dialog({
			title:'加入订单',
			modal:true,
			onBeforeOpen:function(){
				$('#cpgl_cggl_addinfo_form').form('load',row);
			},
			buttons:[{
				text:'ok',
				iconCls:'icon-ok',
				handler:function(){
					
					if(!$('#cpgl_cggl_addinfo_form').form('validate')){
						$.messager.show({
							title:'提示',
							msg:'参数异常'
						})
						return;
					}
					var f = $('#cpgl_cggl_addinfo_form');
					var obj = serializeObject(f);
					$.post('merchandiseController/addOrder',obj,function(data){
						$('#cpgl_cggl_addinfo').dialog('close');
						f.form('clear');
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
<table id="cpgl_cggl_tab" class="easyui-datagrid"  
		data-options="
			url:'merchandiseController/queryInfos',
			method:'get',
			fit:true,
			fitColumns:true,
			singleSelect:true,
			sortName:'pid',
			sortOrder:'asc',
			pagination:true,
			pageSize:10,
			idField: 'pid',
			toolbar:'#cpgl_cggl_toobar',
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
<div id="cpgl_cggl_toobar" style="padding:10px 0 10px 10px;">
		<a href="javascript:addOrder()" class="easyui-linkbutton" iconCls="icon-add">加入订单</a>
		<a href="javascript:orderReload()" class="easyui-linkbutton" iconCls="icon-reload">刷新</a>
</div>

<!-- ***********添加商品窗口************** -->
<div id="cpgl_cggl_addinfo">
	<form id="cpgl_cggl_addinfo_form">
		<table id="cpgl_cggl_addinfo_table" style="width: 400px;">
			<thead>
				<tr style="display: none;">
					<th>商品id：</th>
					<td>
						<input name="pid" readonly class="easyui-textbox easyui-validatebox" data-options="iconCls:'icon-edit',required:true" style="width:180px"> 
					</td>
				</tr>
				<tr>
					<th>商品编码：</th>
					<td>
						<input name="pcode" readonly class="easyui-textbox easyui-validatebox" data-options="iconCls:'icon-edit',required:true" style="width:180px"> 
					</td>
				</tr>
				<tr>
					<th>商品名称：</th>
					<td>
						<input name="pname" readonly class="easyui-textbox easyui-validatebox" data-options="iconCls:'icon-edit',required:true" style="width:180px">
					</td>
				</tr>
				<tr>
					<th>商品价格：</th>
					<td>
						<input name="price" readonly class="easyui-textbox easyui-validatebox" data-options="iconCls:'icon-edit',required:true" style="width:180px">
					</td>
				</tr>
				<tr>
					<th>订单数量：</th>
					<td>
						<input name="proorder.quantity" class="easyui-textbox easyui-validatebox" data-options="iconCls:'icon-edit',required:true" style="width:180px">
					</td>
				</tr>
			</thead>
		</table>
	</form>
</div>
