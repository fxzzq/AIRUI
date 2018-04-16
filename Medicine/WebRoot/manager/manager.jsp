<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="manager tabs">
<div class="btns">
	<a class="btn icon-remove" href="javascript:manager_manager.remove()">删除</a> 
	<a class="btn icon-edit" href="javascript:manager_manager.modify()">修改密码</a> 
	<a class="btn icon-add" href="javascript:manager_manager.add()">添加</a> 
	<a class="btn icon-reload" href="javascript:manager_manager.reload()">刷新</a>
</div>
<div class="iframe ">
	<table class="table" id="manager_manager">
		<thead>
			<tr>
				<th class="checkbox" col="id"><input type="checkbox" /></th>
				<th col="username">账号</th>
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
		<span>第<strong id="manager_managerpage">1</strong>页
		</span> <span>共<strong id="manager_managerpages">1</strong>页
		</span> <span>共<strong id="manager_managercounts">1</strong>条
		</span>
	</div>
</div>
</div>

<script type="text/javascript">
	function manager() {
		$(".content h4").html("管理员管理");
		TABLE.datagrid("systemAction/manager.action", {},"manager_manager");
		window.manager_manager = {};
		manager_manager.reload = TABLE.reload;
		manager_manager.remove = function() {
			TABLE.remove("systemAction/remove.action", function(message) {
				alert(message);
				TABLE.reload();
			});
		}
		//添加药品
		manager_manager.add = function(){
			$('.addmanager').css('display','block');
		}
		//修改药品
		manager_manager.modify=function(){
			//获取修改药品的ID
			var id = null;
			var index = 0;
			var checks = $(".manager .table td.checkbox input[type='checkbox']");
			for(var i =0;i<checks.length;i++){
				if(checks[i].checked){
					index++;
					id=$(checks[i]).val();
				}
			}
			if(index==0){
				alert("必须选中修改项")
			}else if(index>1){
				alert("一次只能修改一条数据")
			}else if(index==1){
				$.getJSON('systemAction/getManager.action',{"tbUser.id":id},function(data){
					if(data){
						$('.updatemanager input[name="tbUser.id"]').val(data.id);
						$('.updatemanager input[name="tbUser.username"]').val(data.username);
						$('.updatemanager').css('display','block');
					}else{
						alert("获取信息失败")
					}
				});
			}
		}
	}
</script>
