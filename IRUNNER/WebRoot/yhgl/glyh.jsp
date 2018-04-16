<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">

	/**
	 刷新用户
	 */
	function reload() {
		$('#yhgl_glyh_tab').datagrid('reload');
	}
	function load() {
		$('#yhgl_glyh_tab').datagrid('load');
	}
	/**
	 添加用户弹窗
	 */
	function addUserDialog() {

		$("#yhgl_glyh_adduser_dialog").dialog({
			title : "添加管理员用户",
			modal:true,
			buttons : [{
				text:'Ok',
				iconCls:'icon-ok',
				handler:function(){
					if($('#yhgl_glyh_adduser_dialog_form').form("validate")){
						var o = serializeObject($('#yhgl_glyh_adduser_dialog_form'));
						$.post("userController/register",o,function(data){
							if(data.result){
								$('#yhgl_glyh_tab').datagrid('insertRow',{
									index:0,
									row:data.object
								});
							}
							$("#yhgl_glyh_adduser_dialog").dialog("close");
							$('#yhgl_glyh_adduser_dialog_form').form("reset");
							$.messager.show({
								title : '提示',
								msg : data.msg
							});
						},"json")
					}
				}
			}]
		});
	}
	/**
	 删除用户
	 */
	function deleteUser() {
		//获取需要删除的用户ID
		var ids = "";
		var indexs = [];
		var rows=$('#yhgl_glyh_tab').datagrid("getChecked");
		$.messager.confirm('确认', '您是否要删除当前选中的项目？',function(fals){
			if(fals){
				if(rows.length>0){
					for(var i = 0;i<rows.length;i++){
						if(rows[i].usid!="1"&&rows[i].usid!=null){//判断选择的是表格的内容
							ids+=rows[i].usid+",";
							indexs.push(i);
						}else{
							$.messager.show({
								title : '提示',
								msg : 'admin不能删除'
							});
						}
					}
				}
				
				//判断是否选中删除的ID
				if(ids==""){
					$.messager.show({
						title : '提示',
						msg : '请选择需要删除的数据'
					});
					return;
				}
				//删除数据
				$.getJSON("userController/deleteSelected",{ids:ids},function(data){
					$.messager.show({
						title : '提示',
						msg : data.msg
					});	
				})
			}
		})
		

	}
	/**
	 更新用户
	 1.通过JS获取需要修改的用户信息(验证是否选择正确的用户数量)
	 2.将从表格获取的数据放入到表单,修改用户的数据信息
	 3.提交修改
	 */
	function updateUser() {
		var id = "";
		var rows=$('#yhgl_glyh_tab').datagrid("getChecked");
		var count = 0;
		var row = null;
		if(rows.length>0){
			for(var i = 0;i<rows.length;i++){
				if(rows[i].usid!=null){
					id=rows[i].usid;
					row = rows[i];
					count++;
				}
			}
			
			if(count==1){
				//将从表格获取的数据放入到表单
				var rowindex = $('#yhgl_glyh_tab').datagrid("getSelected");
				$("#yhgl_glyh_updateuser_dialog_form").form("load",row);
				$("#yhgl_glyh_updateuser_dialog").dialog({
					title : "修改管理员用户信息",
					modal:true,
					buttons : [{
						text:'Ok',
						iconCls:'icon-ok',
						handler:function(){
							if(!$("#yhgl_glyh_updateuser_dialog_form").form("validate")){
								$.messager.show({
									title : '提示',
									msg : "检查数据合法性"
								});	
								return;
							}
							var o = serializeObject($('#yhgl_glyh_updateuser_dialog_form'));
							$.post("userController/updateUser",o,function(data){
								reload();
								$("#yhgl_glyh_updateuser_dialog").dialog("close");
								$.messager.show({
									title : '提示',
									msg : data.msg
								});	
							},'json')
						}
					}]
				});
			
			}else{
				$.messager.show({
					title : '提示',
					msg : "每次修改的用户只能是一条数据"
				});	
			}
		}else{
			$.messager.show({
				title : '提示',
				msg : "请选择数据"
			});	
		}
		
	}
	
	/**
	设置管理员权限：
	1.获取管理员原始权限数据(使用JS完成)
	2.改变权限后提交
	3.刷新当前页数据更新页面数据
	*/
	function setManagerRole(){
	
		var id = "";
		var rows=$('#yhgl_glyh_tab').datagrid("getChecked");
		var count = 0;
		var row = null;
		if(rows.length>0){
			for(var i = 0;i<rows.length;i++){
				if(rows[i].usid!=null){
					id=rows[i].usid;
					row = rows[i];
					count++;
				}
			}
			
			if(count==1){
				//将从表格获取的数据放入到表单
				$("#yhgl_glyh_setManagerRole_dialog").dialog({
					title:"变更管理员权限",
					modal:true,
					//打开面板前触发
					onBeforeOpen:function(){
						//初始化下拉选择框
						$("#yhgl_glyh_setManagerRole_dialog_form_role").combobox({
						    url:"userController/getRoleCombobox",    
						    valueField:"rid",    
						    textField:"rname",
						    width:"100px",
						    mode:"remote"	
						})
					},
					//打开面板后触发
					onOpen:function(){
						$("#yhgl_glyh_setManagerRole_dialog_form").form("load",row);
						if(row.role)
						$("#yhgl_glyh_setManagerRole_dialog_form_role").combobox("select",row.role.rid);
					},
					buttons:[{
						text:"ok",
						iconCls:"icon-ok",
						handler:function(){
							var o = serializeObject($("#yhgl_glyh_setManagerRole_dialog_form"));
							$.post("userController/setManagerRole",o,function(data){
								$("#yhgl_glyh_setManagerRole_dialog").dialog("close")
								reload();
								$.messager.show({
									title : '提示',
									msg : data.msg
								});				
							},"json");
						}
					}],
				})
			}else{
				$.messager.show({
					title : '提示',
					msg : "每次修改的用户只能是一条数据"
				});	
			}
		}else{
			$.messager.show({
				title : '提示',
				msg : "请选择数据"
			});	
		}		
		
	}
	
</script>
<table id="yhgl_glyh_tab" class="easyui-datagrid" toolbar="#yhgl_glyh_tab_toolbar"
	url="userController/query" method="get" sortName="usid" sortOrder="asc"
	data-options="pagination:true,pageSize:5,fit:true,border : false,pageList : [ 5, 10 ],fitColumns:true,">
	<thead>
		<tr>
			<th data-options="field:'usid',width:20,checkbox:true">用户编码</th>
			<th data-options="field:'usname',width:80,align:'center'">用户账号</th>
			<th
				data-options="field:'passwd',width:80,align:'center',formatter:function(value, row, index) {return '<span title='+value+'>******</span>'}">用户密码</th>
			<th data-options="field:'ussex',width:40,align:'center'">性别</th>
			<th data-options="field:'birthday',width:150,align:'center'">出生年月</th>
			<th data-options="field:'address',width:200,align:'center'">联系地址</th>
			<th data-options="field:'cellphone',width:150,align:'center'">联系方法</th>
			<th data-options="field:'joindate',width:150,align:'center'">创建日期</th>
			<th data-options="field:'rname',formatter:function(value,row,index){
														if(row.role) return row.role.rname;
													},width:80,align:'center'">角色名称</th>
			<th data-options="field:'rid',formatter:function(value,row,index){
														if(row.role) return row.role.rid;
													},width:80,align:'center'">角色ID</th>
		</tr>
	</thead>
</table>
<div id="yhgl_glyh_tab_toolbar">
	<a href="javascript:addUserDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加用户</a>
	<a href="javascript:deleteUser()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除用户</a>
	<a href="javascript:updateUser()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改用户</a>
	<a href="javascript:setManagerRole()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">设置管理员权限</a>
	<a href="javascript:load()" class="easyui-linkbutton" iconCls="icon-reload" plain="true">刷新</a>
</div>

<div id="yhgl_glyh_adduser_dialog">
	<form id="yhgl_glyh_adduser_dialog_form">   
	    <table>
	    	<tr>
	    		<th>管理员姓名</th>
	    		<td><input class="easyui-textbox easyui-validatebox" name="usname" type="text" data-options="required:true"></td>
	    	</tr>
	    	<tr>
	    		<th>管理员密码</th>
	    		<td><input class="easyui-textbox easyui-validatebox" name="passwd" type="password" data-options="required:true"></td>
	    	</tr>
	    	<tr>
	    		<th>性别</th>
	    		<td>
	    			<input type="radio" name="ussex" checked="checked" value="男"><span>男</span>
	    			<input type="radio" name="ussex" value="女"><span>女</span>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>出生年月</th>
	    		<td><input class="easyui-textbox easyui-datetimebox" name="birthday" data-options="required:true,showSeconds:true">  </td>
	    	</tr>
	    	<tr>
	    		<th>联系地址</th>
	    		<td><input class="easyui-textbox easyui-validatebox" name="address" type="text" data-options="required:true"></td>
	    	</tr>
	    	<tr>
	    		<th>联系方法</th>
	    		<td><input class="easyui-textbox easyui-validatebox" name="cellphone" type="text" data-options="required:true,validType:'phone'"></td>
	    	</tr>
	    </table>
	</form> 
</div>

<div id="yhgl_glyh_updateuser_dialog">
	<form id="yhgl_glyh_updateuser_dialog_form">   
	    <table>
	    	<tr style="display: none;">
	    		<th>ID</th>
	    		<td><input class="easyui-textbox easyui-validatebox" name="usid" type="text" data-options="required:true"></td>
	    	</tr>
	    	<tr>
	    		<th>管理员姓名</th>
	    		<td><input class="easyui-textbox easyui-validatebox" name="usname" type="text" readonly="readonly" data-options="required:true"></td>
	    	</tr>
	    	<tr>
	    		<th>管理员密码</th>
	    		<td><input class="easyui-textbox easyui-validatebox" name="passwd" type="password" data-options="required:true"></td>
	    	</tr>
	    	<tr>
	    		<th>性别</th>
	    		<td>
	    			<input type="radio" name="ussex" checked="checked" value="男"><span>男</span>
	    			<input type="radio" name="ussex" value="女"><span>女</span>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>出生年月</th>
	    		<td><input class="easyui-textbox easyui-datetimebox" name="birthday" readonly="readonly" data-options="required:true,showSeconds:true">  </td>
	    	</tr>
	    	<tr>
	    		<th>联系地址</th>
	    		<td><input class="easyui-textbox easyui-validatebox" name="address" type="text" data-options="required:true"></td>
	    	</tr>
	    	<tr>
	    		<th>联系方法</th>
	    		<td><input class="easyui-textbox easyui-validatebox" name="cellphone" type="text" data-options="required:true,validType:'phone'"></td>
	    	</tr>
	    	<tr>
	    		<th>入职日期</th>
	    		<td><input class="easyui-textbox easyui-datetimebox" name="joindate" readonly="readonly" data-options="required:true,showSeconds:true">  </td>
	    	</tr>
	    </table>
	</form> 
</div>
<div id="yhgl_glyh_setManagerRole_dialog">
	<form id="yhgl_glyh_setManagerRole_dialog_form">   
	    <table>
	    	<tr style="display: none;">
	    		<th>ID</th>
	    		<td><input class="easyui-textbox easyui-validatebox" name="usid" type="text" data-options="required:true"></td>
	    	</tr>
	    	<tr>
	    		<th>管理员姓名</th>
	    		<td><input class="easyui-textbox easyui-validatebox" name="usname" type="text" readonly="readonly" data-options="required:true"></td>
	    	</tr>
	    	<tr>
	    		<th>管理员角色名</th>
	    		<td>
					<select id="yhgl_glyh_setManagerRole_dialog_form_role" name="rid"></select>  	    			
	    		</td>
	    	</tr>
	    </table>
	</form> 
</div>


