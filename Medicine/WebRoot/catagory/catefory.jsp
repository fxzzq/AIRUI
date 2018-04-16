<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="category tabs">
<div class="btns">
	<a class="btn icon-remove" href="javascript:category_manager.remove()">删除</a> 
	<a class="btn icon-add" href="javascript:category_manager.add()">添加</a> 
	<a class="btn icon-reload" href="javascript:category_manager.reload()">刷新</a>
</div>
<div class="iframe ">
	<table class="table" id="category_manager">
		<thead>
			<tr>
				<th class="checkbox" col="id"><input type="checkbox" /></th>
				<th col="name">类别名称</th>
				<th col="description">类别描述</th>
				<th col="createtime">创建时间</th>
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
		<span>第<strong id="category_managerpage">1</strong>页
		</span> <span>共<strong id="category_managerpages">1</strong>页
		</span> <span>共<strong id="category_managercounts">1</strong>条
		</span>
	</div>
</div>
</div>
<script type="text/javascript" charset="utf-8">
	function category(){
		$(".content h4").html("查看类别");
		TABLE.datagrid("categoryAction/category.action", {},"category_manager");
		
		window.category_manager={
			add:function(){
				$('.addcategory').css('display','block');
			},
			reload:function(){
				TABLE.reload();
			},
			remove:function(){
				TABLE.remove("categoryAction/remove.action", function(data) {
					TABLE.reload();
					alert(data);
				});
			}
		};
		
	}

</script>

