<%@ page import="glory.entity.User" %>
<%@ page import="glory.entity.Group" %>
<%@ page import="java.util.List" %>
<%@include file="/views/public.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" %>


    <section id="content_wrapper">
        <div id="topbar">
            <div class="topbar-left">
                <ol class="breadcrumb">
                    <li class="crumb-active"><a href="#">组列表</a></li>
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
                                class="glyphicon glyphicon-file"></span> 组列表 </span></div>
                        <div class="panel-body">
                            <table class="table table-hover">
                                <thead>
                                <th style="width:0.1%" nowrap=""></th>
                                <%--<th style="width:1%" nowrap="">ID</th>--%>
                                <th style="width:1%" nowrap="">组名</th>
                                <th style="text-align: left;width:1%" nowrap="">组长/成员</th>
                                <%--<th style="width:1%" nowrap="">成员</th>--%>
                                <%--<th style="width:1%" nowrap=""></th>--%>
                                <%--<th style="width:1%" nowrap="">审批项目管理员账号</th>--%>
                                <th style="width:1%" nowrap="">创建时间</th>
                                <th style="width:1%" nowrap="">操作</th>
                                </thead>

                                <tbody>
                                <%
                                    List<User> userList = (List<User>) request.getAttribute("users");
                                    List<Group> groupList = (List<Group>) request.getAttribute("groups");

                                    if (groupList != null) {
                                        for (int i = 0; i < groupList.size(); i++) {
                                            Group groupItem = groupList.get(i);

                                %>

                                <tr>
                                    <td nowrap="" class="small"><%= i + 1%><img src="" width="50"/></td>
                                    <%--<td nowrap="" class="small"><%= groupItem.getId() %><img src="" width="50"/></td>--%>
                                    <td class="small"><%= groupItem.getGroupName() %>
                                    </td>
                                    <%--<td class="small"><%= userItem.getEamil()%>--%>
                                    </td>
                                    <td nowrap="">
                                        <select class="multiselect" id="group_{{i['mp_user_wx_openid']}}">
                                            <option value="" selected="selected"> <%= groupItem.getLeaderId() %></option>
                                        <% if (userList != null) {
                                                for (int j = 0; j < userList.size(); j++) {
                                                    User userItem = userList.get(i);
                                                if (userItem.getGroupId()== groupItem.getId()){  %>

                                            <option value="<%= userItem.getId() %>"><%= userItem.getName()%>   </option>

                                        <%
                                            } }}
                                        %>
                                        </select>
                                    </td>
                                    <%--<td nowrap>--%>
                                        <%--<select class="multiselect" id="status_{{i['mp_user_wx_openid']}}">--%>
                                            <%--<% if (roleList != null) {--%>
                                                <%--for (int j = 0; j < roleList.size(); j++) {--%>
                                                    <%--Role roleTtem = roleList.get(j); %>--%>

                                            <%--<option value="<%= roleTtem.getId()%>" <% if (userItem.getRoleId() == roleTtem.getId()) {%> selected="selected" <%}%> ><%= roleTtem.getRole() %></option>--%>

                                            <%--<%--%>
                                                    <%--}--%>
                                                <%--}--%>
                                            <%--%>--%>
                                        <%--</select>--%>
                                    <%--</td>--%>

                                    <td nowrap class="small"><%= groupItem.getCreateAt()%>
                                    </td>
                                    <td nowrap>
                                        <%--<button type="button" class="btn btn-default btn-xs editBtn" onclick="edit()"--%>
                                                <%--data-id="<%= groupItem.getId()%>">编辑--%>
                                        <%--</button>--%>
                                            <a href="/Group/Handler?id=<%= groupItem.getId()%>"><button type="button" class="btn btn-default btn-xs editBtn" data-id="<%= groupItem.getId()%>">编辑</button></a>
                                             <button type="button" class="btn btn-default btn-xs deleteBtn" data-id="<%= groupItem.getId()%>">删除</button>
                                    </td>
                                </tr>

                                <%
                                        }
                                    }
                                %>

                                </tbody>
                            </table>

                            <div>
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

            $.ajax('/Group/DeleteGroupForm', {
                data: {
                    id: id,
                },
                type: 'post',
                datype: 'json',
                success: function (data) {
                    if (data.code == 0) {

                        location.replace("/Group/List")
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

</body>

</html>