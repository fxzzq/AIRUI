<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="nav" style="overflow: scroll;">
	<h4>导航栏</h4>
	<ul class="nav-tree">
	</ul>
</div>

<script type="text/javascript" charset="utf-8">
	$(function() {
		TREE.getTree({
			url : "loginAction/getTree.action",
			obj : $(".nav .nav-tree"),
		});
	});
</script>






