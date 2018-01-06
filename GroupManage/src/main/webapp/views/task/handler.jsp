<%--
  Created by IntelliJ IDEA.
  User: Monster
  Date: 2017/12/17
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page import="glory.entity.Article" %>
<%@ page import="glory.entity.Task" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="/views/public.jsp" %>

<link rel="stylesheet" type="text/css" href="/resources/simplemde/simplemde.min.css">

<section id="content_wrapper">
    <div id="topbar">
        <div class="topbar-left">
            <ol class="breadcrumb">
                <li class="crumb-active"><a href="#">新建任务</a></li>
                <li class="crumb-icon"><a href="/"><span class="glyphicon glyphicon-home"></span></a></li>
                <li class="crumb-link"><a href="/">首页</a></li>
            </ol>
        </div>
    </div>
    <div id="content">
        <div class="row">
            <div class="col-md-12">
                <div class="panel">
                    <div class="panel-heading"><span class="panel-title"> <span class="glyphicon glyphicon-file"></span> 新建任务 </span>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-3"></div>
                        <div class="col-md-6">
                            <div style="text-align: center;font-family: '微软雅黑 Light';font-size: large">新建任务</div>
                            <form action="javascript:void(null)">
                                <div class="form-notice"></div>

                                <%

                                    Task task = (Task) request.getAttribute("task");
                                    List<User> userList = (List<User>) request.getAttribute("users");

                                %>
                                <div class="form-group">
                                    <label class="control-label">任务名</label>
                                    <input id="name" name="name" type="text" class="form-control" autocomplete="off"
                                           value="<% if(task!=null){%><%=task.getName()%> <%}%>" required="">
                                </div>

                                <div class="form-group">
                                    <label class="article-content">任务描述</label>
                                    <textarea id="article-content" name="content"
                                              required=""><% if (task != null) {%><%=task.getDescription()%><%}%></textarea>

                                </div>

                                <div class="form-group">
                                    <label class="control-label">接收人</label>
                                    <select class="form-control" id="receiverId">
                                        <option value=""></option>
                                        <%
                                            for (int j = 0; j < userList.size(); j++) {
                                                User userItem = userList.get(j);
                                        %>
                                        <option value="<%=userItem.getId()%>" <% if (task != null && task.getPostId() == userItem.getId()) {%>
                                                selected="selected" <%}%>><%=userItem.getName()%>
                                        </option>
                                        <%}%>

                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">完成情况说明</label>
                                    <input id="status" name="status" type="text" class="form-control" autocomplete="off"
                                           value="<% if(task!=null){%><%=task.getStatus()%> <%}else {%>未完成<%}%>"
                                           required="">
                                </div>
                                <div class="form-group">
                                    <input class=" btn bg-purple pull-right" type="button" id="subBtn" value="发布任务">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


</div>
<!-- End #Main -->
<!-- jQuery -->
<script src="/resources/jquery/jquery-3.2.1.js"></script>
<script src="/resources/jquery/jquery_ui/jquery-ui.min.js"></script>
<script src="/resources/bootstrap-3.3.7/js/bootstrap.js"></script>
<script src="/resources/simplemde/simplemde.min.js"></script>


<!-- Page Plugins -->
<script src="/resources/js/main.js"></script>


<script type="text/javascript">

    var simplemde = new SimpleMDE({
        element: document.getElementById('article-content'),  //textarea的DOM对象
        autoDownloadFontAwesome: true,   //自动下载FontAwesome，设为false为不下载
        styleSelectedText: false,
        spellChecker: false,
        // status: false  //编辑器底部的状态栏
    });


    jQuery(document).ready(function () {

        $('#subBtn').click(function () {

            var name = $('#name').val();

            var text = simplemde.value(),

                describe = simplemde.options.previewRender(text);

            var id = <% if(task!=null){%><%=task.getId()%><%}else{%>null
            <%}%>


            var receiverId = $('#receiverId').val();

            var status = $('#status').val();

            if (name == '' || describe == '' || receiverId == '') {
                alert("请填写完整")
                return;
            } else {
                if (id == null) {
                    $.ajax('/Task/CreateForm', {
                        data: {
                            name: name,
                            describe: describe,
                            receiverId: receiverId
                        },
                        type: 'post',
                        dataType: 'json',
                        success: function (data) {
                            if (data.code == 0) {
                                alert("发布成功")
                                location.replace("/Task/List");
                            } else {
                                alert("发布失败")
                            }
                        },
                        error: function () {
                            alert("发布失败")
                        }
                    })
                } else {
                    $.ajax('/Task/EditForm', {
                        data: {
                            id: id,
                            name: name,
                            describe: describe,
                            receiverId: receiverId,
                            status: status,
                        },
                        type: 'post',
                        dataType: 'json',
                        success: function (data) {
                            if (data.code == 0) {
                                alert("编辑成功")
                                location.reload();
                            } else {
                                alert("编辑失败")
                            }
                        },
                        error: function () {
                            alert("失败")
                        }
                    })
                }


            }

            //
        });


        Core.init();


    });
</script>

</body>

</html>
