<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="easyui-panel" data-options="title:'功能导航',border:false,fit:true">
	<div class="easyui-accordion" data-options="fit:true,border:false">
		<div title="系统菜单" data-options="iconCls:'icon-save'">
			<ul id="layout_west_tree" class="easyui-tree"></ul>
		</div>
		<div title="其他菜单" data-options="iconCls:'icon-reload'"></div>
	</div>
</div>

<script type="text/javascript">
$("#layout_west_tree").tree({
	url:"${basePath}systemController/getTree",
	lines:true,
	onClick:function(node){
		if(node.url){
			addTab({title:node.text,href:'${basePath}'+node.url,closable:true});
		}
	},
	onLoadSuccess:function(node,data){
		if(data.msg){
			$.messager.show({
				title:'提示',
				msg:data.msg
			})
		}
	}
});
</script>
