<%@ page import="glory.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="glory.entity.Task" %>

<%--
  Created by IntelliJ IDEA.
  User: Monster
  Date: 2017/12/17
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>

<%@include file="/views/public.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<section id="content_wrapper">
    <div id="topbar">
        <div class="topbar-left">
            <ol class="breadcrumb">
                <li class="crumb-active"><a href="#">任务列表</a></li>
                <li class="crumb-icon"><a href="/"><span class="glyphicon glyphicon-home"></span></a></li>
                <li class="crumb-link"><a href="/">首页</a></li>
            </ol>
        </div>
    </div>
    <div id="content">
        <div class="row">
            <div class="col-md-12">
                <div class="panel">
                    <div class="panel-heading"><span class="panel-title"> <span
                            class="glyphicon glyphicon-file"></span> 任务列表 </span></div>
                    <div class="panel-body">
                        <table class="table table-hover">
                            <thead>
                            <th style="width:0.1%" nowrap=""></th>
                            <%--<th style="width:1%" nowrap="">ID</th>--%>
                            <th style="width:1%" nowrap="">任务名</th>
                            <th style="text-align: left;width:1%" nowrap="">任务详情</th>
                            <th style="width:1%" nowrap="">发布者</th>
                            <th style="width:1%" nowrap="">接收者</th>
                            <th style="width:1%" nowrap="">完成情况</th>
                            <th style="width:1%" nowrap="">创建时间</th>
                            <th style="width:1%" nowrap="">操作</th>
                            </thead>

                            <tbody>
                            <%
                                List<User> userList = (List<User>) request.getAttribute("users");
                                List<Task> taskList = (List<Task>) request.getAttribute("tasks");

                                if (taskList != null && userList!=null) {
                                    for (int i = 0; i < taskList.size(); i++) {
                                        Task taskItem = taskList.get(i);

                            %>

                            <tr>
                                <td nowrap="" class="small"><%= i + 1%><img src="" width="50"/></td>
                                <td class="small"><%= taskItem.getName()%>
                                </td>
                                <td class="small">
                                    <a href="/Task/Details?id=<%= taskItem.getId()%>"><%if(taskItem.getDescription().length()>20){%> <%= taskItem.getDescription().substring(0,20)%>....<%}else {%> <%= taskItem.getDescription()%><%}%></a>
                                </td>

                                <%
                                    for (int j = 0; j < userList.size(); j++) {
                                        User userItem = userList.get(j);
                                        if (userItem.getId() == taskItem.getPostId()) {
                                %>
                                <td class="small"><%= userItem.getName()%>
                                        <%
                                        }
                                    }
                                %>

                                        <%
                                    for (int j = 0; j < userList.size(); j++) {
                                        User userItem = userList.get(j);
                                        if (userItem.getId() == taskItem.getReceiverId() ){
                                %>
                                <td class="small"><%= userItem.getName()%>
                                        <%
                                        }
                                    }
                                %>

                                <td class="small"><%= taskItem.getStatus()%></td>
                                <td class="small"><%= taskItem.getCreateAt()%></td>
                                <td nowrap>
                                    <a href="/Task/Edit?id=<%= taskItem.getId()%>">
                                        <button type="button" class="btn btn-default btn-xs">编辑</button>
                                    </a>
                                    <button type="button" class="btn btn-default btn-xs deleteBtn"
                                            data-id="<%= taskItem.getId()%>">删除
                                    </button>
                                </td>
                            </tr>


                            <%
                                    }
                                }
                            %>



                            </tbody>
                        </table>
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


<!-- Page Plugins -->
<script src="/resources/js/main.js"></script>

<script type="text/javascript">


    jQuery(document).ready(function () {


        $('.deleteBtn').click(function () {

            var id = $(this).attr("data-id");

            $.ajax('/Task/DeleteForm', {
                data: {
                    id: id,
                },
                type: 'post',
                datype: 'json',
                success: function (data) {
                    if (data.code == 0) {

                        location.reload();
                    } else {
                        alert("删除失败")
                    }
                },
                error: function () {
                    alert("删除失败")
                }

            });
        });
        Core.init();


    });
</script>